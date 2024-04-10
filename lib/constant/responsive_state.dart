import 'package:flutter/material.dart';

import 'view_state.dart';

class ResponsiveState extends StatelessWidget {
  final ViewState state;
  final Widget idleWidget;
  final Widget? busyWidget;
  final Widget? dataFetchedWidget;
  final Widget? noDataAvailableWidget;
  final Widget? errorWidget;
  final Widget? successWidget;
  final Widget? waitingForInputWidget;

  // returns a widget based on the provided ViewState
  const ResponsiveState({
    Key? key,
    required this.state,
    required this.idleWidget,
    this.busyWidget,
    this.errorWidget,
    this.dataFetchedWidget,
    this.noDataAvailableWidget,
    this.successWidget,
    this.waitingForInputWidget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ViewState.Idle:
        return idleWidget;
      case ViewState.Busy:
        return busyWidget ?? idleWidget;
      case ViewState.DataFetched:
        return dataFetchedWidget ?? idleWidget;
      case ViewState.NoDataAvailable:
        return noDataAvailableWidget ?? idleWidget;
      case ViewState.Error:
        return errorWidget ?? idleWidget;
      case ViewState.Success:
        return successWidget ?? idleWidget;
      default:
        return idleWidget;
    }
  }
}

class ResponsiveStateFunction extends StatelessWidget {
  final ViewState state;
  final Widget Function() onIdle;
  final Widget Function()? onBusy;
  final Widget Function()? onDataFetched;
  final Widget Function()? onNoDataAvailable;
  final Widget Function()? onError;
  final Widget Function()? onSuccess;
  final Widget Function()? onWaitingForInput;

  const ResponsiveStateFunction({
    Key? key,
    required this.state,
    required this.onIdle,
    this.onBusy,
    this.onDataFetched,
    this.onNoDataAvailable,
    this.onError,
    this.onSuccess,
    this.onWaitingForInput,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ViewState.Idle:
        return onIdle();
      case ViewState.Busy:
        return onBusy?.call() ?? onIdle();
      case ViewState.DataFetched:
        return onDataFetched?.call() ?? onIdle();
      case ViewState.NoDataAvailable:
        return onNoDataAvailable?.call() ?? onIdle();
      case ViewState.Error:
        return onError?.call() ?? onIdle();
      case ViewState.Success:
        return onSuccess?.call() ?? onIdle();
      case ViewState.WaitingForInput:
        return onWaitingForInput?.call() ?? onIdle();
      default:
        return onIdle();
    }
  }
}
