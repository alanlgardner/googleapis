library googleapis_beta.dataflow.v1b3.test;

import "dart:core" as core;
import "dart:collection" as collection;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as http_testing;
import 'package:unittest/unittest.dart' as unittest;

import 'package:googleapis_beta/dataflow/v1b3.dart' as api;

class HttpServerMock extends http.BaseClient {
  core.Function _callback;
  core.bool _expectJson;

  void register(core.Function callback, core.bool expectJson) {
    _callback = callback;
    _expectJson = expectJson;
  }

  async.Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (_expectJson) {
      return request.finalize()
          .transform(convert.UTF8.decoder)
          .join('')
          .then((core.String jsonString) {
        if (jsonString.isEmpty) {
          return _callback(request, null);
        } else {
          return _callback(request, convert.JSON.decode(jsonString));
        }
      });
    } else {
      var stream = request.finalize();
      if (stream == null) {
        return _callback(request, []);
      } else {
        return stream.toBytes().then((data) {
          return _callback(request, data);
        });
      }
    }
  }
}

http.StreamedResponse stringResponse(
    core.int status, core.Map headers, core.String body) {
  var stream = new async.Stream.fromIterable([convert.UTF8.encode(body)]);
  return new http.StreamedResponse(stream, status, headers: headers);
}

core.int buildCounterApproximateProgress = 0;
buildApproximateProgress() {
  var o = new api.ApproximateProgress();
  buildCounterApproximateProgress++;
  if (buildCounterApproximateProgress < 3) {
    o.percentComplete = 42.0;
    o.position = buildPosition();
    o.remainingTime = "foo";
  }
  buildCounterApproximateProgress--;
  return o;
}

checkApproximateProgress(api.ApproximateProgress o) {
  buildCounterApproximateProgress++;
  if (buildCounterApproximateProgress < 3) {
    unittest.expect(o.percentComplete, unittest.equals(42.0));
    checkPosition(o.position);
    unittest.expect(o.remainingTime, unittest.equals('foo'));
  }
  buildCounterApproximateProgress--;
}

core.int buildCounterApproximateReportedProgress = 0;
buildApproximateReportedProgress() {
  var o = new api.ApproximateReportedProgress();
  buildCounterApproximateReportedProgress++;
  if (buildCounterApproximateReportedProgress < 3) {
    o.consumedParallelism = buildReportedParallelism();
    o.fractionConsumed = 42.0;
    o.position = buildPosition();
    o.remainingParallelism = buildReportedParallelism();
  }
  buildCounterApproximateReportedProgress--;
  return o;
}

checkApproximateReportedProgress(api.ApproximateReportedProgress o) {
  buildCounterApproximateReportedProgress++;
  if (buildCounterApproximateReportedProgress < 3) {
    checkReportedParallelism(o.consumedParallelism);
    unittest.expect(o.fractionConsumed, unittest.equals(42.0));
    checkPosition(o.position);
    checkReportedParallelism(o.remainingParallelism);
  }
  buildCounterApproximateReportedProgress--;
}

core.int buildCounterApproximateSplitRequest = 0;
buildApproximateSplitRequest() {
  var o = new api.ApproximateSplitRequest();
  buildCounterApproximateSplitRequest++;
  if (buildCounterApproximateSplitRequest < 3) {
    o.fractionConsumed = 42.0;
    o.position = buildPosition();
  }
  buildCounterApproximateSplitRequest--;
  return o;
}

checkApproximateSplitRequest(api.ApproximateSplitRequest o) {
  buildCounterApproximateSplitRequest++;
  if (buildCounterApproximateSplitRequest < 3) {
    unittest.expect(o.fractionConsumed, unittest.equals(42.0));
    checkPosition(o.position);
  }
  buildCounterApproximateSplitRequest--;
}

core.int buildCounterAutoscalingSettings = 0;
buildAutoscalingSettings() {
  var o = new api.AutoscalingSettings();
  buildCounterAutoscalingSettings++;
  if (buildCounterAutoscalingSettings < 3) {
    o.algorithm = "foo";
    o.maxNumWorkers = 42;
  }
  buildCounterAutoscalingSettings--;
  return o;
}

checkAutoscalingSettings(api.AutoscalingSettings o) {
  buildCounterAutoscalingSettings++;
  if (buildCounterAutoscalingSettings < 3) {
    unittest.expect(o.algorithm, unittest.equals('foo'));
    unittest.expect(o.maxNumWorkers, unittest.equals(42));
  }
  buildCounterAutoscalingSettings--;
}

buildUnnamed3354() {
  var o = new core.List<api.StreamLocation>();
  o.add(buildStreamLocation());
  o.add(buildStreamLocation());
  return o;
}

checkUnnamed3354(core.List<api.StreamLocation> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkStreamLocation(o[0]);
  checkStreamLocation(o[1]);
}

buildUnnamed3355() {
  var o = new core.List<api.KeyRangeLocation>();
  o.add(buildKeyRangeLocation());
  o.add(buildKeyRangeLocation());
  return o;
}

checkUnnamed3355(core.List<api.KeyRangeLocation> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkKeyRangeLocation(o[0]);
  checkKeyRangeLocation(o[1]);
}

buildUnnamed3356() {
  var o = new core.List<api.StreamLocation>();
  o.add(buildStreamLocation());
  o.add(buildStreamLocation());
  return o;
}

checkUnnamed3356(core.List<api.StreamLocation> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkStreamLocation(o[0]);
  checkStreamLocation(o[1]);
}

buildUnnamed3357() {
  var o = new core.List<api.StateFamilyConfig>();
  o.add(buildStateFamilyConfig());
  o.add(buildStateFamilyConfig());
  return o;
}

checkUnnamed3357(core.List<api.StateFamilyConfig> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkStateFamilyConfig(o[0]);
  checkStateFamilyConfig(o[1]);
}

core.int buildCounterComputationTopology = 0;
buildComputationTopology() {
  var o = new api.ComputationTopology();
  buildCounterComputationTopology++;
  if (buildCounterComputationTopology < 3) {
    o.computationId = "foo";
    o.inputs = buildUnnamed3354();
    o.keyRanges = buildUnnamed3355();
    o.outputs = buildUnnamed3356();
    o.stateFamilies = buildUnnamed3357();
    o.systemStageName = "foo";
    o.userStageName = "foo";
  }
  buildCounterComputationTopology--;
  return o;
}

checkComputationTopology(api.ComputationTopology o) {
  buildCounterComputationTopology++;
  if (buildCounterComputationTopology < 3) {
    unittest.expect(o.computationId, unittest.equals('foo'));
    checkUnnamed3354(o.inputs);
    checkUnnamed3355(o.keyRanges);
    checkUnnamed3356(o.outputs);
    checkUnnamed3357(o.stateFamilies);
    unittest.expect(o.systemStageName, unittest.equals('foo'));
    unittest.expect(o.userStageName, unittest.equals('foo'));
  }
  buildCounterComputationTopology--;
}

core.int buildCounterConcatPosition = 0;
buildConcatPosition() {
  var o = new api.ConcatPosition();
  buildCounterConcatPosition++;
  if (buildCounterConcatPosition < 3) {
    o.index = 42;
    o.position = buildPosition();
  }
  buildCounterConcatPosition--;
  return o;
}

checkConcatPosition(api.ConcatPosition o) {
  buildCounterConcatPosition++;
  if (buildCounterConcatPosition < 3) {
    unittest.expect(o.index, unittest.equals(42));
    checkPosition(o.position);
  }
  buildCounterConcatPosition--;
}

core.int buildCounterCounterMetadata = 0;
buildCounterMetadata() {
  var o = new api.CounterMetadata();
  buildCounterCounterMetadata++;
  if (buildCounterCounterMetadata < 3) {
    o.description = "foo";
    o.kind = "foo";
    o.otherUnits = "foo";
    o.standardUnits = "foo";
  }
  buildCounterCounterMetadata--;
  return o;
}

checkCounterMetadata(api.CounterMetadata o) {
  buildCounterCounterMetadata++;
  if (buildCounterCounterMetadata < 3) {
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.otherUnits, unittest.equals('foo'));
    unittest.expect(o.standardUnits, unittest.equals('foo'));
  }
  buildCounterCounterMetadata--;
}

core.int buildCounterCounterStructuredName = 0;
buildCounterStructuredName() {
  var o = new api.CounterStructuredName();
  buildCounterCounterStructuredName++;
  if (buildCounterCounterStructuredName < 3) {
    o.componentStepName = "foo";
    o.executionStepName = "foo";
    o.name = "foo";
    o.originalStepName = "foo";
    o.otherOrigin = "foo";
    o.portion = "foo";
    o.standardOrigin = "foo";
    o.workerId = "foo";
  }
  buildCounterCounterStructuredName--;
  return o;
}

checkCounterStructuredName(api.CounterStructuredName o) {
  buildCounterCounterStructuredName++;
  if (buildCounterCounterStructuredName < 3) {
    unittest.expect(o.componentStepName, unittest.equals('foo'));
    unittest.expect(o.executionStepName, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.originalStepName, unittest.equals('foo'));
    unittest.expect(o.otherOrigin, unittest.equals('foo'));
    unittest.expect(o.portion, unittest.equals('foo'));
    unittest.expect(o.standardOrigin, unittest.equals('foo'));
    unittest.expect(o.workerId, unittest.equals('foo'));
  }
  buildCounterCounterStructuredName--;
}

core.int buildCounterCounterStructuredNameAndMetadata = 0;
buildCounterStructuredNameAndMetadata() {
  var o = new api.CounterStructuredNameAndMetadata();
  buildCounterCounterStructuredNameAndMetadata++;
  if (buildCounterCounterStructuredNameAndMetadata < 3) {
    o.metadata = buildCounterMetadata();
    o.name = buildCounterStructuredName();
  }
  buildCounterCounterStructuredNameAndMetadata--;
  return o;
}

checkCounterStructuredNameAndMetadata(api.CounterStructuredNameAndMetadata o) {
  buildCounterCounterStructuredNameAndMetadata++;
  if (buildCounterCounterStructuredNameAndMetadata < 3) {
    checkCounterMetadata(o.metadata);
    checkCounterStructuredName(o.name);
  }
  buildCounterCounterStructuredNameAndMetadata--;
}

core.int buildCounterCounterUpdate = 0;
buildCounterUpdate() {
  var o = new api.CounterUpdate();
  buildCounterCounterUpdate++;
  if (buildCounterCounterUpdate < 3) {
    o.boolean = true;
    o.cumulative = true;
    o.floatingPoint = 42.0;
    o.floatingPointList = buildFloatingPointList();
    o.floatingPointMean = buildFloatingPointMean();
    o.integer = buildSplitInt64();
    o.integerList = buildIntegerList();
    o.integerMean = buildIntegerMean();
    o.internal = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
    o.nameAndKind = buildNameAndKind();
    o.shortId = "foo";
    o.stringList = buildStringList();
    o.structuredNameAndMetadata = buildCounterStructuredNameAndMetadata();
  }
  buildCounterCounterUpdate--;
  return o;
}

checkCounterUpdate(api.CounterUpdate o) {
  buildCounterCounterUpdate++;
  if (buildCounterCounterUpdate < 3) {
    unittest.expect(o.boolean, unittest.isTrue);
    unittest.expect(o.cumulative, unittest.isTrue);
    unittest.expect(o.floatingPoint, unittest.equals(42.0));
    checkFloatingPointList(o.floatingPointList);
    checkFloatingPointMean(o.floatingPointMean);
    checkSplitInt64(o.integer);
    checkIntegerList(o.integerList);
    checkIntegerMean(o.integerMean);
    var casted1 = (o.internal) as core.Map; unittest.expect(casted1, unittest.hasLength(3)); unittest.expect(casted1["list"], unittest.equals([1, 2, 3])); unittest.expect(casted1["bool"], unittest.equals(true)); unittest.expect(casted1["string"], unittest.equals('foo')); 
    checkNameAndKind(o.nameAndKind);
    unittest.expect(o.shortId, unittest.equals('foo'));
    checkStringList(o.stringList);
    checkCounterStructuredNameAndMetadata(o.structuredNameAndMetadata);
  }
  buildCounterCounterUpdate--;
}

buildUnnamed3358() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed3358(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

core.int buildCounterCreateJobFromTemplateRequest = 0;
buildCreateJobFromTemplateRequest() {
  var o = new api.CreateJobFromTemplateRequest();
  buildCounterCreateJobFromTemplateRequest++;
  if (buildCounterCreateJobFromTemplateRequest < 3) {
    o.gcsPath = "foo";
    o.parameters = buildUnnamed3358();
  }
  buildCounterCreateJobFromTemplateRequest--;
  return o;
}

checkCreateJobFromTemplateRequest(api.CreateJobFromTemplateRequest o) {
  buildCounterCreateJobFromTemplateRequest++;
  if (buildCounterCreateJobFromTemplateRequest < 3) {
    unittest.expect(o.gcsPath, unittest.equals('foo'));
    checkUnnamed3358(o.parameters);
  }
  buildCounterCreateJobFromTemplateRequest--;
}

core.int buildCounterCustomSourceLocation = 0;
buildCustomSourceLocation() {
  var o = new api.CustomSourceLocation();
  buildCounterCustomSourceLocation++;
  if (buildCounterCustomSourceLocation < 3) {
    o.stateful = true;
  }
  buildCounterCustomSourceLocation--;
  return o;
}

checkCustomSourceLocation(api.CustomSourceLocation o) {
  buildCounterCustomSourceLocation++;
  if (buildCounterCustomSourceLocation < 3) {
    unittest.expect(o.stateful, unittest.isTrue);
  }
  buildCounterCustomSourceLocation--;
}

buildUnnamed3359() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3359(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterDataDiskAssignment = 0;
buildDataDiskAssignment() {
  var o = new api.DataDiskAssignment();
  buildCounterDataDiskAssignment++;
  if (buildCounterDataDiskAssignment < 3) {
    o.dataDisks = buildUnnamed3359();
    o.vmInstance = "foo";
  }
  buildCounterDataDiskAssignment--;
  return o;
}

checkDataDiskAssignment(api.DataDiskAssignment o) {
  buildCounterDataDiskAssignment++;
  if (buildCounterDataDiskAssignment < 3) {
    checkUnnamed3359(o.dataDisks);
    unittest.expect(o.vmInstance, unittest.equals('foo'));
  }
  buildCounterDataDiskAssignment--;
}

core.int buildCounterDerivedSource = 0;
buildDerivedSource() {
  var o = new api.DerivedSource();
  buildCounterDerivedSource++;
  if (buildCounterDerivedSource < 3) {
    o.derivationMode = "foo";
    o.source = buildSource();
  }
  buildCounterDerivedSource--;
  return o;
}

checkDerivedSource(api.DerivedSource o) {
  buildCounterDerivedSource++;
  if (buildCounterDerivedSource < 3) {
    unittest.expect(o.derivationMode, unittest.equals('foo'));
    checkSource(o.source);
  }
  buildCounterDerivedSource--;
}

core.int buildCounterDisk = 0;
buildDisk() {
  var o = new api.Disk();
  buildCounterDisk++;
  if (buildCounterDisk < 3) {
    o.diskType = "foo";
    o.mountPoint = "foo";
    o.sizeGb = 42;
  }
  buildCounterDisk--;
  return o;
}

checkDisk(api.Disk o) {
  buildCounterDisk++;
  if (buildCounterDisk < 3) {
    unittest.expect(o.diskType, unittest.equals('foo'));
    unittest.expect(o.mountPoint, unittest.equals('foo'));
    unittest.expect(o.sizeGb, unittest.equals(42));
  }
  buildCounterDisk--;
}

core.int buildCounterDynamicSourceSplit = 0;
buildDynamicSourceSplit() {
  var o = new api.DynamicSourceSplit();
  buildCounterDynamicSourceSplit++;
  if (buildCounterDynamicSourceSplit < 3) {
    o.primary = buildDerivedSource();
    o.residual = buildDerivedSource();
  }
  buildCounterDynamicSourceSplit--;
  return o;
}

checkDynamicSourceSplit(api.DynamicSourceSplit o) {
  buildCounterDynamicSourceSplit++;
  if (buildCounterDynamicSourceSplit < 3) {
    checkDerivedSource(o.primary);
    checkDerivedSource(o.residual);
  }
  buildCounterDynamicSourceSplit--;
}

buildUnnamed3360() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3360(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3361() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed3361(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted2 = (o["x"]) as core.Map; unittest.expect(casted2, unittest.hasLength(3)); unittest.expect(casted2["list"], unittest.equals([1, 2, 3])); unittest.expect(casted2["bool"], unittest.equals(true)); unittest.expect(casted2["string"], unittest.equals('foo')); 
  var casted3 = (o["y"]) as core.Map; unittest.expect(casted3, unittest.hasLength(3)); unittest.expect(casted3["list"], unittest.equals([1, 2, 3])); unittest.expect(casted3["bool"], unittest.equals(true)); unittest.expect(casted3["string"], unittest.equals('foo')); 
}

buildUnnamed3362() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed3362(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted4 = (o["x"]) as core.Map; unittest.expect(casted4, unittest.hasLength(3)); unittest.expect(casted4["list"], unittest.equals([1, 2, 3])); unittest.expect(casted4["bool"], unittest.equals(true)); unittest.expect(casted4["string"], unittest.equals('foo')); 
  var casted5 = (o["y"]) as core.Map; unittest.expect(casted5, unittest.hasLength(3)); unittest.expect(casted5["list"], unittest.equals([1, 2, 3])); unittest.expect(casted5["bool"], unittest.equals(true)); unittest.expect(casted5["string"], unittest.equals('foo')); 
}

buildUnnamed3363() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed3363(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted6 = (o["x"]) as core.Map; unittest.expect(casted6, unittest.hasLength(3)); unittest.expect(casted6["list"], unittest.equals([1, 2, 3])); unittest.expect(casted6["bool"], unittest.equals(true)); unittest.expect(casted6["string"], unittest.equals('foo')); 
  var casted7 = (o["y"]) as core.Map; unittest.expect(casted7, unittest.hasLength(3)); unittest.expect(casted7["list"], unittest.equals([1, 2, 3])); unittest.expect(casted7["bool"], unittest.equals(true)); unittest.expect(casted7["string"], unittest.equals('foo')); 
}

buildUnnamed3364() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed3364(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted8 = (o["x"]) as core.Map; unittest.expect(casted8, unittest.hasLength(3)); unittest.expect(casted8["list"], unittest.equals([1, 2, 3])); unittest.expect(casted8["bool"], unittest.equals(true)); unittest.expect(casted8["string"], unittest.equals('foo')); 
  var casted9 = (o["y"]) as core.Map; unittest.expect(casted9, unittest.hasLength(3)); unittest.expect(casted9["list"], unittest.equals([1, 2, 3])); unittest.expect(casted9["bool"], unittest.equals(true)); unittest.expect(casted9["string"], unittest.equals('foo')); 
}

buildUnnamed3365() {
  var o = new core.List<api.WorkerPool>();
  o.add(buildWorkerPool());
  o.add(buildWorkerPool());
  return o;
}

checkUnnamed3365(core.List<api.WorkerPool> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkWorkerPool(o[0]);
  checkWorkerPool(o[1]);
}

core.int buildCounterEnvironment = 0;
buildEnvironment() {
  var o = new api.Environment();
  buildCounterEnvironment++;
  if (buildCounterEnvironment < 3) {
    o.clusterManagerApiService = "foo";
    o.dataset = "foo";
    o.experiments = buildUnnamed3360();
    o.internalExperiments = buildUnnamed3361();
    o.sdkPipelineOptions = buildUnnamed3362();
    o.serviceAccountEmail = "foo";
    o.tempStoragePrefix = "foo";
    o.userAgent = buildUnnamed3363();
    o.version = buildUnnamed3364();
    o.workerPools = buildUnnamed3365();
  }
  buildCounterEnvironment--;
  return o;
}

checkEnvironment(api.Environment o) {
  buildCounterEnvironment++;
  if (buildCounterEnvironment < 3) {
    unittest.expect(o.clusterManagerApiService, unittest.equals('foo'));
    unittest.expect(o.dataset, unittest.equals('foo'));
    checkUnnamed3360(o.experiments);
    checkUnnamed3361(o.internalExperiments);
    checkUnnamed3362(o.sdkPipelineOptions);
    unittest.expect(o.serviceAccountEmail, unittest.equals('foo'));
    unittest.expect(o.tempStoragePrefix, unittest.equals('foo'));
    checkUnnamed3363(o.userAgent);
    checkUnnamed3364(o.version);
    checkUnnamed3365(o.workerPools);
  }
  buildCounterEnvironment--;
}

core.int buildCounterFailedLocation = 0;
buildFailedLocation() {
  var o = new api.FailedLocation();
  buildCounterFailedLocation++;
  if (buildCounterFailedLocation < 3) {
    o.name = "foo";
  }
  buildCounterFailedLocation--;
  return o;
}

checkFailedLocation(api.FailedLocation o) {
  buildCounterFailedLocation++;
  if (buildCounterFailedLocation < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterFailedLocation--;
}

buildUnnamed3366() {
  var o = new core.List<api.InstructionInput>();
  o.add(buildInstructionInput());
  o.add(buildInstructionInput());
  return o;
}

checkUnnamed3366(core.List<api.InstructionInput> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInstructionInput(o[0]);
  checkInstructionInput(o[1]);
}

core.int buildCounterFlattenInstruction = 0;
buildFlattenInstruction() {
  var o = new api.FlattenInstruction();
  buildCounterFlattenInstruction++;
  if (buildCounterFlattenInstruction < 3) {
    o.inputs = buildUnnamed3366();
  }
  buildCounterFlattenInstruction--;
  return o;
}

checkFlattenInstruction(api.FlattenInstruction o) {
  buildCounterFlattenInstruction++;
  if (buildCounterFlattenInstruction < 3) {
    checkUnnamed3366(o.inputs);
  }
  buildCounterFlattenInstruction--;
}

buildUnnamed3367() {
  var o = new core.List<core.double>();
  o.add(42.0);
  o.add(42.0);
  return o;
}

checkUnnamed3367(core.List<core.double> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals(42.0));
  unittest.expect(o[1], unittest.equals(42.0));
}

core.int buildCounterFloatingPointList = 0;
buildFloatingPointList() {
  var o = new api.FloatingPointList();
  buildCounterFloatingPointList++;
  if (buildCounterFloatingPointList < 3) {
    o.elements = buildUnnamed3367();
  }
  buildCounterFloatingPointList--;
  return o;
}

checkFloatingPointList(api.FloatingPointList o) {
  buildCounterFloatingPointList++;
  if (buildCounterFloatingPointList < 3) {
    checkUnnamed3367(o.elements);
  }
  buildCounterFloatingPointList--;
}

core.int buildCounterFloatingPointMean = 0;
buildFloatingPointMean() {
  var o = new api.FloatingPointMean();
  buildCounterFloatingPointMean++;
  if (buildCounterFloatingPointMean < 3) {
    o.count = buildSplitInt64();
    o.sum = 42.0;
  }
  buildCounterFloatingPointMean--;
  return o;
}

checkFloatingPointMean(api.FloatingPointMean o) {
  buildCounterFloatingPointMean++;
  if (buildCounterFloatingPointMean < 3) {
    checkSplitInt64(o.count);
    unittest.expect(o.sum, unittest.equals(42.0));
  }
  buildCounterFloatingPointMean--;
}

core.int buildCounterGetDebugConfigRequest = 0;
buildGetDebugConfigRequest() {
  var o = new api.GetDebugConfigRequest();
  buildCounterGetDebugConfigRequest++;
  if (buildCounterGetDebugConfigRequest < 3) {
    o.componentId = "foo";
    o.workerId = "foo";
  }
  buildCounterGetDebugConfigRequest--;
  return o;
}

checkGetDebugConfigRequest(api.GetDebugConfigRequest o) {
  buildCounterGetDebugConfigRequest++;
  if (buildCounterGetDebugConfigRequest < 3) {
    unittest.expect(o.componentId, unittest.equals('foo'));
    unittest.expect(o.workerId, unittest.equals('foo'));
  }
  buildCounterGetDebugConfigRequest--;
}

core.int buildCounterGetDebugConfigResponse = 0;
buildGetDebugConfigResponse() {
  var o = new api.GetDebugConfigResponse();
  buildCounterGetDebugConfigResponse++;
  if (buildCounterGetDebugConfigResponse < 3) {
    o.config = "foo";
  }
  buildCounterGetDebugConfigResponse--;
  return o;
}

checkGetDebugConfigResponse(api.GetDebugConfigResponse o) {
  buildCounterGetDebugConfigResponse++;
  if (buildCounterGetDebugConfigResponse < 3) {
    unittest.expect(o.config, unittest.equals('foo'));
  }
  buildCounterGetDebugConfigResponse--;
}

core.int buildCounterInstructionInput = 0;
buildInstructionInput() {
  var o = new api.InstructionInput();
  buildCounterInstructionInput++;
  if (buildCounterInstructionInput < 3) {
    o.outputNum = 42;
    o.producerInstructionIndex = 42;
  }
  buildCounterInstructionInput--;
  return o;
}

checkInstructionInput(api.InstructionInput o) {
  buildCounterInstructionInput++;
  if (buildCounterInstructionInput < 3) {
    unittest.expect(o.outputNum, unittest.equals(42));
    unittest.expect(o.producerInstructionIndex, unittest.equals(42));
  }
  buildCounterInstructionInput--;
}

buildUnnamed3368() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed3368(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted10 = (o["x"]) as core.Map; unittest.expect(casted10, unittest.hasLength(3)); unittest.expect(casted10["list"], unittest.equals([1, 2, 3])); unittest.expect(casted10["bool"], unittest.equals(true)); unittest.expect(casted10["string"], unittest.equals('foo')); 
  var casted11 = (o["y"]) as core.Map; unittest.expect(casted11, unittest.hasLength(3)); unittest.expect(casted11["list"], unittest.equals([1, 2, 3])); unittest.expect(casted11["bool"], unittest.equals(true)); unittest.expect(casted11["string"], unittest.equals('foo')); 
}

core.int buildCounterInstructionOutput = 0;
buildInstructionOutput() {
  var o = new api.InstructionOutput();
  buildCounterInstructionOutput++;
  if (buildCounterInstructionOutput < 3) {
    o.codec = buildUnnamed3368();
    o.name = "foo";
    o.onlyCountKeyBytes = true;
    o.onlyCountValueBytes = true;
    o.originalName = "foo";
    o.systemName = "foo";
  }
  buildCounterInstructionOutput--;
  return o;
}

checkInstructionOutput(api.InstructionOutput o) {
  buildCounterInstructionOutput++;
  if (buildCounterInstructionOutput < 3) {
    checkUnnamed3368(o.codec);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.onlyCountKeyBytes, unittest.isTrue);
    unittest.expect(o.onlyCountValueBytes, unittest.isTrue);
    unittest.expect(o.originalName, unittest.equals('foo'));
    unittest.expect(o.systemName, unittest.equals('foo'));
  }
  buildCounterInstructionOutput--;
}

buildUnnamed3369() {
  var o = new core.List<api.SplitInt64>();
  o.add(buildSplitInt64());
  o.add(buildSplitInt64());
  return o;
}

checkUnnamed3369(core.List<api.SplitInt64> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSplitInt64(o[0]);
  checkSplitInt64(o[1]);
}

core.int buildCounterIntegerList = 0;
buildIntegerList() {
  var o = new api.IntegerList();
  buildCounterIntegerList++;
  if (buildCounterIntegerList < 3) {
    o.elements = buildUnnamed3369();
  }
  buildCounterIntegerList--;
  return o;
}

checkIntegerList(api.IntegerList o) {
  buildCounterIntegerList++;
  if (buildCounterIntegerList < 3) {
    checkUnnamed3369(o.elements);
  }
  buildCounterIntegerList--;
}

core.int buildCounterIntegerMean = 0;
buildIntegerMean() {
  var o = new api.IntegerMean();
  buildCounterIntegerMean++;
  if (buildCounterIntegerMean < 3) {
    o.count = buildSplitInt64();
    o.sum = buildSplitInt64();
  }
  buildCounterIntegerMean--;
  return o;
}

checkIntegerMean(api.IntegerMean o) {
  buildCounterIntegerMean++;
  if (buildCounterIntegerMean < 3) {
    checkSplitInt64(o.count);
    checkSplitInt64(o.sum);
  }
  buildCounterIntegerMean--;
}

buildUnnamed3370() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed3370(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

buildUnnamed3371() {
  var o = new core.List<api.Step>();
  o.add(buildStep());
  o.add(buildStep());
  return o;
}

checkUnnamed3371(core.List<api.Step> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkStep(o[0]);
  checkStep(o[1]);
}

buildUnnamed3372() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3372(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3373() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed3373(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

core.int buildCounterJob = 0;
buildJob() {
  var o = new api.Job();
  buildCounterJob++;
  if (buildCounterJob < 3) {
    o.clientRequestId = "foo";
    o.createTime = "foo";
    o.currentState = "foo";
    o.currentStateTime = "foo";
    o.environment = buildEnvironment();
    o.executionInfo = buildJobExecutionInfo();
    o.id = "foo";
    o.labels = buildUnnamed3370();
    o.location = "foo";
    o.name = "foo";
    o.projectId = "foo";
    o.replaceJobId = "foo";
    o.replacedByJobId = "foo";
    o.requestedState = "foo";
    o.steps = buildUnnamed3371();
    o.tempFiles = buildUnnamed3372();
    o.transformNameMapping = buildUnnamed3373();
    o.type = "foo";
  }
  buildCounterJob--;
  return o;
}

checkJob(api.Job o) {
  buildCounterJob++;
  if (buildCounterJob < 3) {
    unittest.expect(o.clientRequestId, unittest.equals('foo'));
    unittest.expect(o.createTime, unittest.equals('foo'));
    unittest.expect(o.currentState, unittest.equals('foo'));
    unittest.expect(o.currentStateTime, unittest.equals('foo'));
    checkEnvironment(o.environment);
    checkJobExecutionInfo(o.executionInfo);
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed3370(o.labels);
    unittest.expect(o.location, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.projectId, unittest.equals('foo'));
    unittest.expect(o.replaceJobId, unittest.equals('foo'));
    unittest.expect(o.replacedByJobId, unittest.equals('foo'));
    unittest.expect(o.requestedState, unittest.equals('foo'));
    checkUnnamed3371(o.steps);
    checkUnnamed3372(o.tempFiles);
    checkUnnamed3373(o.transformNameMapping);
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterJob--;
}

buildUnnamed3374() {
  var o = new core.Map<core.String, api.JobExecutionStageInfo>();
  o["x"] = buildJobExecutionStageInfo();
  o["y"] = buildJobExecutionStageInfo();
  return o;
}

checkUnnamed3374(core.Map<core.String, api.JobExecutionStageInfo> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkJobExecutionStageInfo(o["x"]);
  checkJobExecutionStageInfo(o["y"]);
}

core.int buildCounterJobExecutionInfo = 0;
buildJobExecutionInfo() {
  var o = new api.JobExecutionInfo();
  buildCounterJobExecutionInfo++;
  if (buildCounterJobExecutionInfo < 3) {
    o.stages = buildUnnamed3374();
  }
  buildCounterJobExecutionInfo--;
  return o;
}

checkJobExecutionInfo(api.JobExecutionInfo o) {
  buildCounterJobExecutionInfo++;
  if (buildCounterJobExecutionInfo < 3) {
    checkUnnamed3374(o.stages);
  }
  buildCounterJobExecutionInfo--;
}

buildUnnamed3375() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3375(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterJobExecutionStageInfo = 0;
buildJobExecutionStageInfo() {
  var o = new api.JobExecutionStageInfo();
  buildCounterJobExecutionStageInfo++;
  if (buildCounterJobExecutionStageInfo < 3) {
    o.stepName = buildUnnamed3375();
  }
  buildCounterJobExecutionStageInfo--;
  return o;
}

checkJobExecutionStageInfo(api.JobExecutionStageInfo o) {
  buildCounterJobExecutionStageInfo++;
  if (buildCounterJobExecutionStageInfo < 3) {
    checkUnnamed3375(o.stepName);
  }
  buildCounterJobExecutionStageInfo--;
}

core.int buildCounterJobMessage = 0;
buildJobMessage() {
  var o = new api.JobMessage();
  buildCounterJobMessage++;
  if (buildCounterJobMessage < 3) {
    o.id = "foo";
    o.messageImportance = "foo";
    o.messageText = "foo";
    o.time = "foo";
  }
  buildCounterJobMessage--;
  return o;
}

checkJobMessage(api.JobMessage o) {
  buildCounterJobMessage++;
  if (buildCounterJobMessage < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.messageImportance, unittest.equals('foo'));
    unittest.expect(o.messageText, unittest.equals('foo'));
    unittest.expect(o.time, unittest.equals('foo'));
  }
  buildCounterJobMessage--;
}

buildUnnamed3376() {
  var o = new core.List<api.MetricUpdate>();
  o.add(buildMetricUpdate());
  o.add(buildMetricUpdate());
  return o;
}

checkUnnamed3376(core.List<api.MetricUpdate> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetricUpdate(o[0]);
  checkMetricUpdate(o[1]);
}

core.int buildCounterJobMetrics = 0;
buildJobMetrics() {
  var o = new api.JobMetrics();
  buildCounterJobMetrics++;
  if (buildCounterJobMetrics < 3) {
    o.metricTime = "foo";
    o.metrics = buildUnnamed3376();
  }
  buildCounterJobMetrics--;
  return o;
}

checkJobMetrics(api.JobMetrics o) {
  buildCounterJobMetrics++;
  if (buildCounterJobMetrics < 3) {
    unittest.expect(o.metricTime, unittest.equals('foo'));
    checkUnnamed3376(o.metrics);
  }
  buildCounterJobMetrics--;
}

core.int buildCounterKeyRangeDataDiskAssignment = 0;
buildKeyRangeDataDiskAssignment() {
  var o = new api.KeyRangeDataDiskAssignment();
  buildCounterKeyRangeDataDiskAssignment++;
  if (buildCounterKeyRangeDataDiskAssignment < 3) {
    o.dataDisk = "foo";
    o.end = "foo";
    o.start = "foo";
  }
  buildCounterKeyRangeDataDiskAssignment--;
  return o;
}

checkKeyRangeDataDiskAssignment(api.KeyRangeDataDiskAssignment o) {
  buildCounterKeyRangeDataDiskAssignment++;
  if (buildCounterKeyRangeDataDiskAssignment < 3) {
    unittest.expect(o.dataDisk, unittest.equals('foo'));
    unittest.expect(o.end, unittest.equals('foo'));
    unittest.expect(o.start, unittest.equals('foo'));
  }
  buildCounterKeyRangeDataDiskAssignment--;
}

core.int buildCounterKeyRangeLocation = 0;
buildKeyRangeLocation() {
  var o = new api.KeyRangeLocation();
  buildCounterKeyRangeLocation++;
  if (buildCounterKeyRangeLocation < 3) {
    o.dataDisk = "foo";
    o.deliveryEndpoint = "foo";
    o.end = "foo";
    o.persistentDirectory = "foo";
    o.start = "foo";
  }
  buildCounterKeyRangeLocation--;
  return o;
}

checkKeyRangeLocation(api.KeyRangeLocation o) {
  buildCounterKeyRangeLocation++;
  if (buildCounterKeyRangeLocation < 3) {
    unittest.expect(o.dataDisk, unittest.equals('foo'));
    unittest.expect(o.deliveryEndpoint, unittest.equals('foo'));
    unittest.expect(o.end, unittest.equals('foo'));
    unittest.expect(o.persistentDirectory, unittest.equals('foo'));
    unittest.expect(o.start, unittest.equals('foo'));
  }
  buildCounterKeyRangeLocation--;
}

buildUnnamed3377() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3377(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3378() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3378(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterLeaseWorkItemRequest = 0;
buildLeaseWorkItemRequest() {
  var o = new api.LeaseWorkItemRequest();
  buildCounterLeaseWorkItemRequest++;
  if (buildCounterLeaseWorkItemRequest < 3) {
    o.currentWorkerTime = "foo";
    o.location = "foo";
    o.requestedLeaseDuration = "foo";
    o.workItemTypes = buildUnnamed3377();
    o.workerCapabilities = buildUnnamed3378();
    o.workerId = "foo";
  }
  buildCounterLeaseWorkItemRequest--;
  return o;
}

checkLeaseWorkItemRequest(api.LeaseWorkItemRequest o) {
  buildCounterLeaseWorkItemRequest++;
  if (buildCounterLeaseWorkItemRequest < 3) {
    unittest.expect(o.currentWorkerTime, unittest.equals('foo'));
    unittest.expect(o.location, unittest.equals('foo'));
    unittest.expect(o.requestedLeaseDuration, unittest.equals('foo'));
    checkUnnamed3377(o.workItemTypes);
    checkUnnamed3378(o.workerCapabilities);
    unittest.expect(o.workerId, unittest.equals('foo'));
  }
  buildCounterLeaseWorkItemRequest--;
}

buildUnnamed3379() {
  var o = new core.List<api.WorkItem>();
  o.add(buildWorkItem());
  o.add(buildWorkItem());
  return o;
}

checkUnnamed3379(core.List<api.WorkItem> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkWorkItem(o[0]);
  checkWorkItem(o[1]);
}

core.int buildCounterLeaseWorkItemResponse = 0;
buildLeaseWorkItemResponse() {
  var o = new api.LeaseWorkItemResponse();
  buildCounterLeaseWorkItemResponse++;
  if (buildCounterLeaseWorkItemResponse < 3) {
    o.workItems = buildUnnamed3379();
  }
  buildCounterLeaseWorkItemResponse--;
  return o;
}

checkLeaseWorkItemResponse(api.LeaseWorkItemResponse o) {
  buildCounterLeaseWorkItemResponse++;
  if (buildCounterLeaseWorkItemResponse < 3) {
    checkUnnamed3379(o.workItems);
  }
  buildCounterLeaseWorkItemResponse--;
}

buildUnnamed3380() {
  var o = new core.List<api.JobMessage>();
  o.add(buildJobMessage());
  o.add(buildJobMessage());
  return o;
}

checkUnnamed3380(core.List<api.JobMessage> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkJobMessage(o[0]);
  checkJobMessage(o[1]);
}

core.int buildCounterListJobMessagesResponse = 0;
buildListJobMessagesResponse() {
  var o = new api.ListJobMessagesResponse();
  buildCounterListJobMessagesResponse++;
  if (buildCounterListJobMessagesResponse < 3) {
    o.jobMessages = buildUnnamed3380();
    o.nextPageToken = "foo";
  }
  buildCounterListJobMessagesResponse--;
  return o;
}

checkListJobMessagesResponse(api.ListJobMessagesResponse o) {
  buildCounterListJobMessagesResponse++;
  if (buildCounterListJobMessagesResponse < 3) {
    checkUnnamed3380(o.jobMessages);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListJobMessagesResponse--;
}

buildUnnamed3381() {
  var o = new core.List<api.FailedLocation>();
  o.add(buildFailedLocation());
  o.add(buildFailedLocation());
  return o;
}

checkUnnamed3381(core.List<api.FailedLocation> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFailedLocation(o[0]);
  checkFailedLocation(o[1]);
}

buildUnnamed3382() {
  var o = new core.List<api.Job>();
  o.add(buildJob());
  o.add(buildJob());
  return o;
}

checkUnnamed3382(core.List<api.Job> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkJob(o[0]);
  checkJob(o[1]);
}

core.int buildCounterListJobsResponse = 0;
buildListJobsResponse() {
  var o = new api.ListJobsResponse();
  buildCounterListJobsResponse++;
  if (buildCounterListJobsResponse < 3) {
    o.failedLocation = buildUnnamed3381();
    o.jobs = buildUnnamed3382();
    o.nextPageToken = "foo";
  }
  buildCounterListJobsResponse--;
  return o;
}

checkListJobsResponse(api.ListJobsResponse o) {
  buildCounterListJobsResponse++;
  if (buildCounterListJobsResponse < 3) {
    checkUnnamed3381(o.failedLocation);
    checkUnnamed3382(o.jobs);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListJobsResponse--;
}

buildUnnamed3383() {
  var o = new core.List<api.ParallelInstruction>();
  o.add(buildParallelInstruction());
  o.add(buildParallelInstruction());
  return o;
}

checkUnnamed3383(core.List<api.ParallelInstruction> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkParallelInstruction(o[0]);
  checkParallelInstruction(o[1]);
}

core.int buildCounterMapTask = 0;
buildMapTask() {
  var o = new api.MapTask();
  buildCounterMapTask++;
  if (buildCounterMapTask < 3) {
    o.instructions = buildUnnamed3383();
    o.stageName = "foo";
    o.systemName = "foo";
  }
  buildCounterMapTask--;
  return o;
}

checkMapTask(api.MapTask o) {
  buildCounterMapTask++;
  if (buildCounterMapTask < 3) {
    checkUnnamed3383(o.instructions);
    unittest.expect(o.stageName, unittest.equals('foo'));
    unittest.expect(o.systemName, unittest.equals('foo'));
  }
  buildCounterMapTask--;
}

core.int buildCounterMetricShortId = 0;
buildMetricShortId() {
  var o = new api.MetricShortId();
  buildCounterMetricShortId++;
  if (buildCounterMetricShortId < 3) {
    o.metricIndex = 42;
    o.shortId = "foo";
  }
  buildCounterMetricShortId--;
  return o;
}

checkMetricShortId(api.MetricShortId o) {
  buildCounterMetricShortId++;
  if (buildCounterMetricShortId < 3) {
    unittest.expect(o.metricIndex, unittest.equals(42));
    unittest.expect(o.shortId, unittest.equals('foo'));
  }
  buildCounterMetricShortId--;
}

buildUnnamed3384() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed3384(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

core.int buildCounterMetricStructuredName = 0;
buildMetricStructuredName() {
  var o = new api.MetricStructuredName();
  buildCounterMetricStructuredName++;
  if (buildCounterMetricStructuredName < 3) {
    o.context = buildUnnamed3384();
    o.name = "foo";
    o.origin = "foo";
  }
  buildCounterMetricStructuredName--;
  return o;
}

checkMetricStructuredName(api.MetricStructuredName o) {
  buildCounterMetricStructuredName++;
  if (buildCounterMetricStructuredName < 3) {
    checkUnnamed3384(o.context);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.origin, unittest.equals('foo'));
  }
  buildCounterMetricStructuredName--;
}

core.int buildCounterMetricUpdate = 0;
buildMetricUpdate() {
  var o = new api.MetricUpdate();
  buildCounterMetricUpdate++;
  if (buildCounterMetricUpdate < 3) {
    o.cumulative = true;
    o.internal = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
    o.kind = "foo";
    o.meanCount = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
    o.meanSum = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
    o.name = buildMetricStructuredName();
    o.scalar = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
    o.set = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
    o.updateTime = "foo";
  }
  buildCounterMetricUpdate--;
  return o;
}

checkMetricUpdate(api.MetricUpdate o) {
  buildCounterMetricUpdate++;
  if (buildCounterMetricUpdate < 3) {
    unittest.expect(o.cumulative, unittest.isTrue);
    var casted12 = (o.internal) as core.Map; unittest.expect(casted12, unittest.hasLength(3)); unittest.expect(casted12["list"], unittest.equals([1, 2, 3])); unittest.expect(casted12["bool"], unittest.equals(true)); unittest.expect(casted12["string"], unittest.equals('foo')); 
    unittest.expect(o.kind, unittest.equals('foo'));
    var casted13 = (o.meanCount) as core.Map; unittest.expect(casted13, unittest.hasLength(3)); unittest.expect(casted13["list"], unittest.equals([1, 2, 3])); unittest.expect(casted13["bool"], unittest.equals(true)); unittest.expect(casted13["string"], unittest.equals('foo')); 
    var casted14 = (o.meanSum) as core.Map; unittest.expect(casted14, unittest.hasLength(3)); unittest.expect(casted14["list"], unittest.equals([1, 2, 3])); unittest.expect(casted14["bool"], unittest.equals(true)); unittest.expect(casted14["string"], unittest.equals('foo')); 
    checkMetricStructuredName(o.name);
    var casted15 = (o.scalar) as core.Map; unittest.expect(casted15, unittest.hasLength(3)); unittest.expect(casted15["list"], unittest.equals([1, 2, 3])); unittest.expect(casted15["bool"], unittest.equals(true)); unittest.expect(casted15["string"], unittest.equals('foo')); 
    var casted16 = (o.set) as core.Map; unittest.expect(casted16, unittest.hasLength(3)); unittest.expect(casted16["list"], unittest.equals([1, 2, 3])); unittest.expect(casted16["bool"], unittest.equals(true)); unittest.expect(casted16["string"], unittest.equals('foo')); 
    unittest.expect(o.updateTime, unittest.equals('foo'));
  }
  buildCounterMetricUpdate--;
}

core.int buildCounterMountedDataDisk = 0;
buildMountedDataDisk() {
  var o = new api.MountedDataDisk();
  buildCounterMountedDataDisk++;
  if (buildCounterMountedDataDisk < 3) {
    o.dataDisk = "foo";
  }
  buildCounterMountedDataDisk--;
  return o;
}

checkMountedDataDisk(api.MountedDataDisk o) {
  buildCounterMountedDataDisk++;
  if (buildCounterMountedDataDisk < 3) {
    unittest.expect(o.dataDisk, unittest.equals('foo'));
  }
  buildCounterMountedDataDisk--;
}

core.int buildCounterMultiOutputInfo = 0;
buildMultiOutputInfo() {
  var o = new api.MultiOutputInfo();
  buildCounterMultiOutputInfo++;
  if (buildCounterMultiOutputInfo < 3) {
    o.tag = "foo";
  }
  buildCounterMultiOutputInfo--;
  return o;
}

checkMultiOutputInfo(api.MultiOutputInfo o) {
  buildCounterMultiOutputInfo++;
  if (buildCounterMultiOutputInfo < 3) {
    unittest.expect(o.tag, unittest.equals('foo'));
  }
  buildCounterMultiOutputInfo--;
}

core.int buildCounterNameAndKind = 0;
buildNameAndKind() {
  var o = new api.NameAndKind();
  buildCounterNameAndKind++;
  if (buildCounterNameAndKind < 3) {
    o.kind = "foo";
    o.name = "foo";
  }
  buildCounterNameAndKind--;
  return o;
}

checkNameAndKind(api.NameAndKind o) {
  buildCounterNameAndKind++;
  if (buildCounterNameAndKind < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterNameAndKind--;
}

core.int buildCounterPackage = 0;
buildPackage() {
  var o = new api.Package();
  buildCounterPackage++;
  if (buildCounterPackage < 3) {
    o.location = "foo";
    o.name = "foo";
  }
  buildCounterPackage--;
  return o;
}

checkPackage(api.Package o) {
  buildCounterPackage++;
  if (buildCounterPackage < 3) {
    unittest.expect(o.location, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterPackage--;
}

buildUnnamed3385() {
  var o = new core.List<api.MultiOutputInfo>();
  o.add(buildMultiOutputInfo());
  o.add(buildMultiOutputInfo());
  return o;
}

checkUnnamed3385(core.List<api.MultiOutputInfo> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMultiOutputInfo(o[0]);
  checkMultiOutputInfo(o[1]);
}

buildUnnamed3386() {
  var o = new core.List<api.SideInputInfo>();
  o.add(buildSideInputInfo());
  o.add(buildSideInputInfo());
  return o;
}

checkUnnamed3386(core.List<api.SideInputInfo> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSideInputInfo(o[0]);
  checkSideInputInfo(o[1]);
}

buildUnnamed3387() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed3387(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted17 = (o["x"]) as core.Map; unittest.expect(casted17, unittest.hasLength(3)); unittest.expect(casted17["list"], unittest.equals([1, 2, 3])); unittest.expect(casted17["bool"], unittest.equals(true)); unittest.expect(casted17["string"], unittest.equals('foo')); 
  var casted18 = (o["y"]) as core.Map; unittest.expect(casted18, unittest.hasLength(3)); unittest.expect(casted18["list"], unittest.equals([1, 2, 3])); unittest.expect(casted18["bool"], unittest.equals(true)); unittest.expect(casted18["string"], unittest.equals('foo')); 
}

core.int buildCounterParDoInstruction = 0;
buildParDoInstruction() {
  var o = new api.ParDoInstruction();
  buildCounterParDoInstruction++;
  if (buildCounterParDoInstruction < 3) {
    o.input = buildInstructionInput();
    o.multiOutputInfos = buildUnnamed3385();
    o.numOutputs = 42;
    o.sideInputs = buildUnnamed3386();
    o.userFn = buildUnnamed3387();
  }
  buildCounterParDoInstruction--;
  return o;
}

checkParDoInstruction(api.ParDoInstruction o) {
  buildCounterParDoInstruction++;
  if (buildCounterParDoInstruction < 3) {
    checkInstructionInput(o.input);
    checkUnnamed3385(o.multiOutputInfos);
    unittest.expect(o.numOutputs, unittest.equals(42));
    checkUnnamed3386(o.sideInputs);
    checkUnnamed3387(o.userFn);
  }
  buildCounterParDoInstruction--;
}

buildUnnamed3388() {
  var o = new core.List<api.InstructionOutput>();
  o.add(buildInstructionOutput());
  o.add(buildInstructionOutput());
  return o;
}

checkUnnamed3388(core.List<api.InstructionOutput> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInstructionOutput(o[0]);
  checkInstructionOutput(o[1]);
}

core.int buildCounterParallelInstruction = 0;
buildParallelInstruction() {
  var o = new api.ParallelInstruction();
  buildCounterParallelInstruction++;
  if (buildCounterParallelInstruction < 3) {
    o.flatten = buildFlattenInstruction();
    o.name = "foo";
    o.originalName = "foo";
    o.outputs = buildUnnamed3388();
    o.parDo = buildParDoInstruction();
    o.partialGroupByKey = buildPartialGroupByKeyInstruction();
    o.read = buildReadInstruction();
    o.systemName = "foo";
    o.write = buildWriteInstruction();
  }
  buildCounterParallelInstruction--;
  return o;
}

checkParallelInstruction(api.ParallelInstruction o) {
  buildCounterParallelInstruction++;
  if (buildCounterParallelInstruction < 3) {
    checkFlattenInstruction(o.flatten);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.originalName, unittest.equals('foo'));
    checkUnnamed3388(o.outputs);
    checkParDoInstruction(o.parDo);
    checkPartialGroupByKeyInstruction(o.partialGroupByKey);
    checkReadInstruction(o.read);
    unittest.expect(o.systemName, unittest.equals('foo'));
    checkWriteInstruction(o.write);
  }
  buildCounterParallelInstruction--;
}

buildUnnamed3389() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed3389(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted19 = (o["x"]) as core.Map; unittest.expect(casted19, unittest.hasLength(3)); unittest.expect(casted19["list"], unittest.equals([1, 2, 3])); unittest.expect(casted19["bool"], unittest.equals(true)); unittest.expect(casted19["string"], unittest.equals('foo')); 
  var casted20 = (o["y"]) as core.Map; unittest.expect(casted20, unittest.hasLength(3)); unittest.expect(casted20["list"], unittest.equals([1, 2, 3])); unittest.expect(casted20["bool"], unittest.equals(true)); unittest.expect(casted20["string"], unittest.equals('foo')); 
}

buildUnnamed3390() {
  var o = new core.List<api.SideInputInfo>();
  o.add(buildSideInputInfo());
  o.add(buildSideInputInfo());
  return o;
}

checkUnnamed3390(core.List<api.SideInputInfo> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSideInputInfo(o[0]);
  checkSideInputInfo(o[1]);
}

buildUnnamed3391() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed3391(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted21 = (o["x"]) as core.Map; unittest.expect(casted21, unittest.hasLength(3)); unittest.expect(casted21["list"], unittest.equals([1, 2, 3])); unittest.expect(casted21["bool"], unittest.equals(true)); unittest.expect(casted21["string"], unittest.equals('foo')); 
  var casted22 = (o["y"]) as core.Map; unittest.expect(casted22, unittest.hasLength(3)); unittest.expect(casted22["list"], unittest.equals([1, 2, 3])); unittest.expect(casted22["bool"], unittest.equals(true)); unittest.expect(casted22["string"], unittest.equals('foo')); 
}

core.int buildCounterPartialGroupByKeyInstruction = 0;
buildPartialGroupByKeyInstruction() {
  var o = new api.PartialGroupByKeyInstruction();
  buildCounterPartialGroupByKeyInstruction++;
  if (buildCounterPartialGroupByKeyInstruction < 3) {
    o.input = buildInstructionInput();
    o.inputElementCodec = buildUnnamed3389();
    o.originalCombineValuesInputStoreName = "foo";
    o.originalCombineValuesStepName = "foo";
    o.sideInputs = buildUnnamed3390();
    o.valueCombiningFn = buildUnnamed3391();
  }
  buildCounterPartialGroupByKeyInstruction--;
  return o;
}

checkPartialGroupByKeyInstruction(api.PartialGroupByKeyInstruction o) {
  buildCounterPartialGroupByKeyInstruction++;
  if (buildCounterPartialGroupByKeyInstruction < 3) {
    checkInstructionInput(o.input);
    checkUnnamed3389(o.inputElementCodec);
    unittest.expect(o.originalCombineValuesInputStoreName, unittest.equals('foo'));
    unittest.expect(o.originalCombineValuesStepName, unittest.equals('foo'));
    checkUnnamed3390(o.sideInputs);
    checkUnnamed3391(o.valueCombiningFn);
  }
  buildCounterPartialGroupByKeyInstruction--;
}

core.int buildCounterPosition = 0;
buildPosition() {
  var o = new api.Position();
  buildCounterPosition++;
  if (buildCounterPosition < 3) {
    o.byteOffset = "foo";
    o.concatPosition = buildConcatPosition();
    o.end = true;
    o.key = "foo";
    o.recordIndex = "foo";
    o.shufflePosition = "foo";
  }
  buildCounterPosition--;
  return o;
}

checkPosition(api.Position o) {
  buildCounterPosition++;
  if (buildCounterPosition < 3) {
    unittest.expect(o.byteOffset, unittest.equals('foo'));
    checkConcatPosition(o.concatPosition);
    unittest.expect(o.end, unittest.isTrue);
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.recordIndex, unittest.equals('foo'));
    unittest.expect(o.shufflePosition, unittest.equals('foo'));
  }
  buildCounterPosition--;
}

core.int buildCounterPubsubLocation = 0;
buildPubsubLocation() {
  var o = new api.PubsubLocation();
  buildCounterPubsubLocation++;
  if (buildCounterPubsubLocation < 3) {
    o.dropLateData = true;
    o.idLabel = "foo";
    o.subscription = "foo";
    o.timestampLabel = "foo";
    o.topic = "foo";
    o.trackingSubscription = "foo";
  }
  buildCounterPubsubLocation--;
  return o;
}

checkPubsubLocation(api.PubsubLocation o) {
  buildCounterPubsubLocation++;
  if (buildCounterPubsubLocation < 3) {
    unittest.expect(o.dropLateData, unittest.isTrue);
    unittest.expect(o.idLabel, unittest.equals('foo'));
    unittest.expect(o.subscription, unittest.equals('foo'));
    unittest.expect(o.timestampLabel, unittest.equals('foo'));
    unittest.expect(o.topic, unittest.equals('foo'));
    unittest.expect(o.trackingSubscription, unittest.equals('foo'));
  }
  buildCounterPubsubLocation--;
}

core.int buildCounterReadInstruction = 0;
buildReadInstruction() {
  var o = new api.ReadInstruction();
  buildCounterReadInstruction++;
  if (buildCounterReadInstruction < 3) {
    o.source = buildSource();
  }
  buildCounterReadInstruction--;
  return o;
}

checkReadInstruction(api.ReadInstruction o) {
  buildCounterReadInstruction++;
  if (buildCounterReadInstruction < 3) {
    checkSource(o.source);
  }
  buildCounterReadInstruction--;
}

buildUnnamed3392() {
  var o = new core.List<api.WorkItemStatus>();
  o.add(buildWorkItemStatus());
  o.add(buildWorkItemStatus());
  return o;
}

checkUnnamed3392(core.List<api.WorkItemStatus> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkWorkItemStatus(o[0]);
  checkWorkItemStatus(o[1]);
}

core.int buildCounterReportWorkItemStatusRequest = 0;
buildReportWorkItemStatusRequest() {
  var o = new api.ReportWorkItemStatusRequest();
  buildCounterReportWorkItemStatusRequest++;
  if (buildCounterReportWorkItemStatusRequest < 3) {
    o.currentWorkerTime = "foo";
    o.location = "foo";
    o.workItemStatuses = buildUnnamed3392();
    o.workerId = "foo";
  }
  buildCounterReportWorkItemStatusRequest--;
  return o;
}

checkReportWorkItemStatusRequest(api.ReportWorkItemStatusRequest o) {
  buildCounterReportWorkItemStatusRequest++;
  if (buildCounterReportWorkItemStatusRequest < 3) {
    unittest.expect(o.currentWorkerTime, unittest.equals('foo'));
    unittest.expect(o.location, unittest.equals('foo'));
    checkUnnamed3392(o.workItemStatuses);
    unittest.expect(o.workerId, unittest.equals('foo'));
  }
  buildCounterReportWorkItemStatusRequest--;
}

buildUnnamed3393() {
  var o = new core.List<api.WorkItemServiceState>();
  o.add(buildWorkItemServiceState());
  o.add(buildWorkItemServiceState());
  return o;
}

checkUnnamed3393(core.List<api.WorkItemServiceState> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkWorkItemServiceState(o[0]);
  checkWorkItemServiceState(o[1]);
}

core.int buildCounterReportWorkItemStatusResponse = 0;
buildReportWorkItemStatusResponse() {
  var o = new api.ReportWorkItemStatusResponse();
  buildCounterReportWorkItemStatusResponse++;
  if (buildCounterReportWorkItemStatusResponse < 3) {
    o.workItemServiceStates = buildUnnamed3393();
  }
  buildCounterReportWorkItemStatusResponse--;
  return o;
}

checkReportWorkItemStatusResponse(api.ReportWorkItemStatusResponse o) {
  buildCounterReportWorkItemStatusResponse++;
  if (buildCounterReportWorkItemStatusResponse < 3) {
    checkUnnamed3393(o.workItemServiceStates);
  }
  buildCounterReportWorkItemStatusResponse--;
}

core.int buildCounterReportedParallelism = 0;
buildReportedParallelism() {
  var o = new api.ReportedParallelism();
  buildCounterReportedParallelism++;
  if (buildCounterReportedParallelism < 3) {
    o.isInfinite = true;
    o.value = 42.0;
  }
  buildCounterReportedParallelism--;
  return o;
}

checkReportedParallelism(api.ReportedParallelism o) {
  buildCounterReportedParallelism++;
  if (buildCounterReportedParallelism < 3) {
    unittest.expect(o.isInfinite, unittest.isTrue);
    unittest.expect(o.value, unittest.equals(42.0));
  }
  buildCounterReportedParallelism--;
}

core.int buildCounterSendDebugCaptureRequest = 0;
buildSendDebugCaptureRequest() {
  var o = new api.SendDebugCaptureRequest();
  buildCounterSendDebugCaptureRequest++;
  if (buildCounterSendDebugCaptureRequest < 3) {
    o.componentId = "foo";
    o.data = "foo";
    o.workerId = "foo";
  }
  buildCounterSendDebugCaptureRequest--;
  return o;
}

checkSendDebugCaptureRequest(api.SendDebugCaptureRequest o) {
  buildCounterSendDebugCaptureRequest++;
  if (buildCounterSendDebugCaptureRequest < 3) {
    unittest.expect(o.componentId, unittest.equals('foo'));
    unittest.expect(o.data, unittest.equals('foo'));
    unittest.expect(o.workerId, unittest.equals('foo'));
  }
  buildCounterSendDebugCaptureRequest--;
}

core.int buildCounterSendDebugCaptureResponse = 0;
buildSendDebugCaptureResponse() {
  var o = new api.SendDebugCaptureResponse();
  buildCounterSendDebugCaptureResponse++;
  if (buildCounterSendDebugCaptureResponse < 3) {
  }
  buildCounterSendDebugCaptureResponse--;
  return o;
}

checkSendDebugCaptureResponse(api.SendDebugCaptureResponse o) {
  buildCounterSendDebugCaptureResponse++;
  if (buildCounterSendDebugCaptureResponse < 3) {
  }
  buildCounterSendDebugCaptureResponse--;
}

buildUnnamed3394() {
  var o = new core.List<api.WorkerMessage>();
  o.add(buildWorkerMessage());
  o.add(buildWorkerMessage());
  return o;
}

checkUnnamed3394(core.List<api.WorkerMessage> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkWorkerMessage(o[0]);
  checkWorkerMessage(o[1]);
}

core.int buildCounterSendWorkerMessagesRequest = 0;
buildSendWorkerMessagesRequest() {
  var o = new api.SendWorkerMessagesRequest();
  buildCounterSendWorkerMessagesRequest++;
  if (buildCounterSendWorkerMessagesRequest < 3) {
    o.workerMessages = buildUnnamed3394();
  }
  buildCounterSendWorkerMessagesRequest--;
  return o;
}

checkSendWorkerMessagesRequest(api.SendWorkerMessagesRequest o) {
  buildCounterSendWorkerMessagesRequest++;
  if (buildCounterSendWorkerMessagesRequest < 3) {
    checkUnnamed3394(o.workerMessages);
  }
  buildCounterSendWorkerMessagesRequest--;
}

buildUnnamed3395() {
  var o = new core.List<api.WorkerMessageResponse>();
  o.add(buildWorkerMessageResponse());
  o.add(buildWorkerMessageResponse());
  return o;
}

checkUnnamed3395(core.List<api.WorkerMessageResponse> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkWorkerMessageResponse(o[0]);
  checkWorkerMessageResponse(o[1]);
}

core.int buildCounterSendWorkerMessagesResponse = 0;
buildSendWorkerMessagesResponse() {
  var o = new api.SendWorkerMessagesResponse();
  buildCounterSendWorkerMessagesResponse++;
  if (buildCounterSendWorkerMessagesResponse < 3) {
    o.workerMessageResponses = buildUnnamed3395();
  }
  buildCounterSendWorkerMessagesResponse--;
  return o;
}

checkSendWorkerMessagesResponse(api.SendWorkerMessagesResponse o) {
  buildCounterSendWorkerMessagesResponse++;
  if (buildCounterSendWorkerMessagesResponse < 3) {
    checkUnnamed3395(o.workerMessageResponses);
  }
  buildCounterSendWorkerMessagesResponse--;
}

buildUnnamed3396() {
  var o = new core.List<api.SideInputInfo>();
  o.add(buildSideInputInfo());
  o.add(buildSideInputInfo());
  return o;
}

checkUnnamed3396(core.List<api.SideInputInfo> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSideInputInfo(o[0]);
  checkSideInputInfo(o[1]);
}

buildUnnamed3397() {
  var o = new core.List<api.SeqMapTaskOutputInfo>();
  o.add(buildSeqMapTaskOutputInfo());
  o.add(buildSeqMapTaskOutputInfo());
  return o;
}

checkUnnamed3397(core.List<api.SeqMapTaskOutputInfo> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSeqMapTaskOutputInfo(o[0]);
  checkSeqMapTaskOutputInfo(o[1]);
}

buildUnnamed3398() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed3398(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted23 = (o["x"]) as core.Map; unittest.expect(casted23, unittest.hasLength(3)); unittest.expect(casted23["list"], unittest.equals([1, 2, 3])); unittest.expect(casted23["bool"], unittest.equals(true)); unittest.expect(casted23["string"], unittest.equals('foo')); 
  var casted24 = (o["y"]) as core.Map; unittest.expect(casted24, unittest.hasLength(3)); unittest.expect(casted24["list"], unittest.equals([1, 2, 3])); unittest.expect(casted24["bool"], unittest.equals(true)); unittest.expect(casted24["string"], unittest.equals('foo')); 
}

core.int buildCounterSeqMapTask = 0;
buildSeqMapTask() {
  var o = new api.SeqMapTask();
  buildCounterSeqMapTask++;
  if (buildCounterSeqMapTask < 3) {
    o.inputs = buildUnnamed3396();
    o.name = "foo";
    o.outputInfos = buildUnnamed3397();
    o.stageName = "foo";
    o.systemName = "foo";
    o.userFn = buildUnnamed3398();
  }
  buildCounterSeqMapTask--;
  return o;
}

checkSeqMapTask(api.SeqMapTask o) {
  buildCounterSeqMapTask++;
  if (buildCounterSeqMapTask < 3) {
    checkUnnamed3396(o.inputs);
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed3397(o.outputInfos);
    unittest.expect(o.stageName, unittest.equals('foo'));
    unittest.expect(o.systemName, unittest.equals('foo'));
    checkUnnamed3398(o.userFn);
  }
  buildCounterSeqMapTask--;
}

core.int buildCounterSeqMapTaskOutputInfo = 0;
buildSeqMapTaskOutputInfo() {
  var o = new api.SeqMapTaskOutputInfo();
  buildCounterSeqMapTaskOutputInfo++;
  if (buildCounterSeqMapTaskOutputInfo < 3) {
    o.sink = buildSink();
    o.tag = "foo";
  }
  buildCounterSeqMapTaskOutputInfo--;
  return o;
}

checkSeqMapTaskOutputInfo(api.SeqMapTaskOutputInfo o) {
  buildCounterSeqMapTaskOutputInfo++;
  if (buildCounterSeqMapTaskOutputInfo < 3) {
    checkSink(o.sink);
    unittest.expect(o.tag, unittest.equals('foo'));
  }
  buildCounterSeqMapTaskOutputInfo--;
}

core.int buildCounterShellTask = 0;
buildShellTask() {
  var o = new api.ShellTask();
  buildCounterShellTask++;
  if (buildCounterShellTask < 3) {
    o.command = "foo";
    o.exitCode = 42;
  }
  buildCounterShellTask--;
  return o;
}

checkShellTask(api.ShellTask o) {
  buildCounterShellTask++;
  if (buildCounterShellTask < 3) {
    unittest.expect(o.command, unittest.equals('foo'));
    unittest.expect(o.exitCode, unittest.equals(42));
  }
  buildCounterShellTask--;
}

buildUnnamed3399() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed3399(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted25 = (o["x"]) as core.Map; unittest.expect(casted25, unittest.hasLength(3)); unittest.expect(casted25["list"], unittest.equals([1, 2, 3])); unittest.expect(casted25["bool"], unittest.equals(true)); unittest.expect(casted25["string"], unittest.equals('foo')); 
  var casted26 = (o["y"]) as core.Map; unittest.expect(casted26, unittest.hasLength(3)); unittest.expect(casted26["list"], unittest.equals([1, 2, 3])); unittest.expect(casted26["bool"], unittest.equals(true)); unittest.expect(casted26["string"], unittest.equals('foo')); 
}

buildUnnamed3400() {
  var o = new core.List<api.Source>();
  o.add(buildSource());
  o.add(buildSource());
  return o;
}

checkUnnamed3400(core.List<api.Source> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSource(o[0]);
  checkSource(o[1]);
}

core.int buildCounterSideInputInfo = 0;
buildSideInputInfo() {
  var o = new api.SideInputInfo();
  buildCounterSideInputInfo++;
  if (buildCounterSideInputInfo < 3) {
    o.kind = buildUnnamed3399();
    o.sources = buildUnnamed3400();
    o.tag = "foo";
  }
  buildCounterSideInputInfo--;
  return o;
}

checkSideInputInfo(api.SideInputInfo o) {
  buildCounterSideInputInfo++;
  if (buildCounterSideInputInfo < 3) {
    checkUnnamed3399(o.kind);
    checkUnnamed3400(o.sources);
    unittest.expect(o.tag, unittest.equals('foo'));
  }
  buildCounterSideInputInfo--;
}

buildUnnamed3401() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed3401(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted27 = (o["x"]) as core.Map; unittest.expect(casted27, unittest.hasLength(3)); unittest.expect(casted27["list"], unittest.equals([1, 2, 3])); unittest.expect(casted27["bool"], unittest.equals(true)); unittest.expect(casted27["string"], unittest.equals('foo')); 
  var casted28 = (o["y"]) as core.Map; unittest.expect(casted28, unittest.hasLength(3)); unittest.expect(casted28["list"], unittest.equals([1, 2, 3])); unittest.expect(casted28["bool"], unittest.equals(true)); unittest.expect(casted28["string"], unittest.equals('foo')); 
}

buildUnnamed3402() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed3402(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted29 = (o["x"]) as core.Map; unittest.expect(casted29, unittest.hasLength(3)); unittest.expect(casted29["list"], unittest.equals([1, 2, 3])); unittest.expect(casted29["bool"], unittest.equals(true)); unittest.expect(casted29["string"], unittest.equals('foo')); 
  var casted30 = (o["y"]) as core.Map; unittest.expect(casted30, unittest.hasLength(3)); unittest.expect(casted30["list"], unittest.equals([1, 2, 3])); unittest.expect(casted30["bool"], unittest.equals(true)); unittest.expect(casted30["string"], unittest.equals('foo')); 
}

core.int buildCounterSink = 0;
buildSink() {
  var o = new api.Sink();
  buildCounterSink++;
  if (buildCounterSink < 3) {
    o.codec = buildUnnamed3401();
    o.spec = buildUnnamed3402();
  }
  buildCounterSink--;
  return o;
}

checkSink(api.Sink o) {
  buildCounterSink++;
  if (buildCounterSink < 3) {
    checkUnnamed3401(o.codec);
    checkUnnamed3402(o.spec);
  }
  buildCounterSink--;
}

buildUnnamed3403() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed3403(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted31 = (o["x"]) as core.Map; unittest.expect(casted31, unittest.hasLength(3)); unittest.expect(casted31["list"], unittest.equals([1, 2, 3])); unittest.expect(casted31["bool"], unittest.equals(true)); unittest.expect(casted31["string"], unittest.equals('foo')); 
  var casted32 = (o["y"]) as core.Map; unittest.expect(casted32, unittest.hasLength(3)); unittest.expect(casted32["list"], unittest.equals([1, 2, 3])); unittest.expect(casted32["bool"], unittest.equals(true)); unittest.expect(casted32["string"], unittest.equals('foo')); 
}

buildUnnamed3404() {
  var o = new core.List<core.Map<core.String, core.Object>>();
  o.add(buildUnnamed3403());
  o.add(buildUnnamed3403());
  return o;
}

checkUnnamed3404(core.List<core.Map<core.String, core.Object>> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnnamed3403(o[0]);
  checkUnnamed3403(o[1]);
}

buildUnnamed3405() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed3405(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted33 = (o["x"]) as core.Map; unittest.expect(casted33, unittest.hasLength(3)); unittest.expect(casted33["list"], unittest.equals([1, 2, 3])); unittest.expect(casted33["bool"], unittest.equals(true)); unittest.expect(casted33["string"], unittest.equals('foo')); 
  var casted34 = (o["y"]) as core.Map; unittest.expect(casted34, unittest.hasLength(3)); unittest.expect(casted34["list"], unittest.equals([1, 2, 3])); unittest.expect(casted34["bool"], unittest.equals(true)); unittest.expect(casted34["string"], unittest.equals('foo')); 
}

buildUnnamed3406() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed3406(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted35 = (o["x"]) as core.Map; unittest.expect(casted35, unittest.hasLength(3)); unittest.expect(casted35["list"], unittest.equals([1, 2, 3])); unittest.expect(casted35["bool"], unittest.equals(true)); unittest.expect(casted35["string"], unittest.equals('foo')); 
  var casted36 = (o["y"]) as core.Map; unittest.expect(casted36, unittest.hasLength(3)); unittest.expect(casted36["list"], unittest.equals([1, 2, 3])); unittest.expect(casted36["bool"], unittest.equals(true)); unittest.expect(casted36["string"], unittest.equals('foo')); 
}

core.int buildCounterSource = 0;
buildSource() {
  var o = new api.Source();
  buildCounterSource++;
  if (buildCounterSource < 3) {
    o.baseSpecs = buildUnnamed3404();
    o.codec = buildUnnamed3405();
    o.doesNotNeedSplitting = true;
    o.metadata = buildSourceMetadata();
    o.spec = buildUnnamed3406();
  }
  buildCounterSource--;
  return o;
}

checkSource(api.Source o) {
  buildCounterSource++;
  if (buildCounterSource < 3) {
    checkUnnamed3404(o.baseSpecs);
    checkUnnamed3405(o.codec);
    unittest.expect(o.doesNotNeedSplitting, unittest.isTrue);
    checkSourceMetadata(o.metadata);
    checkUnnamed3406(o.spec);
  }
  buildCounterSource--;
}

core.int buildCounterSourceFork = 0;
buildSourceFork() {
  var o = new api.SourceFork();
  buildCounterSourceFork++;
  if (buildCounterSourceFork < 3) {
    o.primary = buildSourceSplitShard();
    o.primarySource = buildDerivedSource();
    o.residual = buildSourceSplitShard();
    o.residualSource = buildDerivedSource();
  }
  buildCounterSourceFork--;
  return o;
}

checkSourceFork(api.SourceFork o) {
  buildCounterSourceFork++;
  if (buildCounterSourceFork < 3) {
    checkSourceSplitShard(o.primary);
    checkDerivedSource(o.primarySource);
    checkSourceSplitShard(o.residual);
    checkDerivedSource(o.residualSource);
  }
  buildCounterSourceFork--;
}

core.int buildCounterSourceGetMetadataRequest = 0;
buildSourceGetMetadataRequest() {
  var o = new api.SourceGetMetadataRequest();
  buildCounterSourceGetMetadataRequest++;
  if (buildCounterSourceGetMetadataRequest < 3) {
    o.source = buildSource();
  }
  buildCounterSourceGetMetadataRequest--;
  return o;
}

checkSourceGetMetadataRequest(api.SourceGetMetadataRequest o) {
  buildCounterSourceGetMetadataRequest++;
  if (buildCounterSourceGetMetadataRequest < 3) {
    checkSource(o.source);
  }
  buildCounterSourceGetMetadataRequest--;
}

core.int buildCounterSourceGetMetadataResponse = 0;
buildSourceGetMetadataResponse() {
  var o = new api.SourceGetMetadataResponse();
  buildCounterSourceGetMetadataResponse++;
  if (buildCounterSourceGetMetadataResponse < 3) {
    o.metadata = buildSourceMetadata();
  }
  buildCounterSourceGetMetadataResponse--;
  return o;
}

checkSourceGetMetadataResponse(api.SourceGetMetadataResponse o) {
  buildCounterSourceGetMetadataResponse++;
  if (buildCounterSourceGetMetadataResponse < 3) {
    checkSourceMetadata(o.metadata);
  }
  buildCounterSourceGetMetadataResponse--;
}

core.int buildCounterSourceMetadata = 0;
buildSourceMetadata() {
  var o = new api.SourceMetadata();
  buildCounterSourceMetadata++;
  if (buildCounterSourceMetadata < 3) {
    o.estimatedSizeBytes = "foo";
    o.infinite = true;
    o.producesSortedKeys = true;
  }
  buildCounterSourceMetadata--;
  return o;
}

checkSourceMetadata(api.SourceMetadata o) {
  buildCounterSourceMetadata++;
  if (buildCounterSourceMetadata < 3) {
    unittest.expect(o.estimatedSizeBytes, unittest.equals('foo'));
    unittest.expect(o.infinite, unittest.isTrue);
    unittest.expect(o.producesSortedKeys, unittest.isTrue);
  }
  buildCounterSourceMetadata--;
}

core.int buildCounterSourceOperationRequest = 0;
buildSourceOperationRequest() {
  var o = new api.SourceOperationRequest();
  buildCounterSourceOperationRequest++;
  if (buildCounterSourceOperationRequest < 3) {
    o.getMetadata = buildSourceGetMetadataRequest();
    o.split = buildSourceSplitRequest();
  }
  buildCounterSourceOperationRequest--;
  return o;
}

checkSourceOperationRequest(api.SourceOperationRequest o) {
  buildCounterSourceOperationRequest++;
  if (buildCounterSourceOperationRequest < 3) {
    checkSourceGetMetadataRequest(o.getMetadata);
    checkSourceSplitRequest(o.split);
  }
  buildCounterSourceOperationRequest--;
}

core.int buildCounterSourceOperationResponse = 0;
buildSourceOperationResponse() {
  var o = new api.SourceOperationResponse();
  buildCounterSourceOperationResponse++;
  if (buildCounterSourceOperationResponse < 3) {
    o.getMetadata = buildSourceGetMetadataResponse();
    o.split = buildSourceSplitResponse();
  }
  buildCounterSourceOperationResponse--;
  return o;
}

checkSourceOperationResponse(api.SourceOperationResponse o) {
  buildCounterSourceOperationResponse++;
  if (buildCounterSourceOperationResponse < 3) {
    checkSourceGetMetadataResponse(o.getMetadata);
    checkSourceSplitResponse(o.split);
  }
  buildCounterSourceOperationResponse--;
}

core.int buildCounterSourceSplitOptions = 0;
buildSourceSplitOptions() {
  var o = new api.SourceSplitOptions();
  buildCounterSourceSplitOptions++;
  if (buildCounterSourceSplitOptions < 3) {
    o.desiredBundleSizeBytes = "foo";
    o.desiredShardSizeBytes = "foo";
  }
  buildCounterSourceSplitOptions--;
  return o;
}

checkSourceSplitOptions(api.SourceSplitOptions o) {
  buildCounterSourceSplitOptions++;
  if (buildCounterSourceSplitOptions < 3) {
    unittest.expect(o.desiredBundleSizeBytes, unittest.equals('foo'));
    unittest.expect(o.desiredShardSizeBytes, unittest.equals('foo'));
  }
  buildCounterSourceSplitOptions--;
}

core.int buildCounterSourceSplitRequest = 0;
buildSourceSplitRequest() {
  var o = new api.SourceSplitRequest();
  buildCounterSourceSplitRequest++;
  if (buildCounterSourceSplitRequest < 3) {
    o.options = buildSourceSplitOptions();
    o.source = buildSource();
  }
  buildCounterSourceSplitRequest--;
  return o;
}

checkSourceSplitRequest(api.SourceSplitRequest o) {
  buildCounterSourceSplitRequest++;
  if (buildCounterSourceSplitRequest < 3) {
    checkSourceSplitOptions(o.options);
    checkSource(o.source);
  }
  buildCounterSourceSplitRequest--;
}

buildUnnamed3407() {
  var o = new core.List<api.DerivedSource>();
  o.add(buildDerivedSource());
  o.add(buildDerivedSource());
  return o;
}

checkUnnamed3407(core.List<api.DerivedSource> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDerivedSource(o[0]);
  checkDerivedSource(o[1]);
}

buildUnnamed3408() {
  var o = new core.List<api.SourceSplitShard>();
  o.add(buildSourceSplitShard());
  o.add(buildSourceSplitShard());
  return o;
}

checkUnnamed3408(core.List<api.SourceSplitShard> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSourceSplitShard(o[0]);
  checkSourceSplitShard(o[1]);
}

core.int buildCounterSourceSplitResponse = 0;
buildSourceSplitResponse() {
  var o = new api.SourceSplitResponse();
  buildCounterSourceSplitResponse++;
  if (buildCounterSourceSplitResponse < 3) {
    o.bundles = buildUnnamed3407();
    o.outcome = "foo";
    o.shards = buildUnnamed3408();
  }
  buildCounterSourceSplitResponse--;
  return o;
}

checkSourceSplitResponse(api.SourceSplitResponse o) {
  buildCounterSourceSplitResponse++;
  if (buildCounterSourceSplitResponse < 3) {
    checkUnnamed3407(o.bundles);
    unittest.expect(o.outcome, unittest.equals('foo'));
    checkUnnamed3408(o.shards);
  }
  buildCounterSourceSplitResponse--;
}

core.int buildCounterSourceSplitShard = 0;
buildSourceSplitShard() {
  var o = new api.SourceSplitShard();
  buildCounterSourceSplitShard++;
  if (buildCounterSourceSplitShard < 3) {
    o.derivationMode = "foo";
    o.source = buildSource();
  }
  buildCounterSourceSplitShard--;
  return o;
}

checkSourceSplitShard(api.SourceSplitShard o) {
  buildCounterSourceSplitShard++;
  if (buildCounterSourceSplitShard < 3) {
    unittest.expect(o.derivationMode, unittest.equals('foo'));
    checkSource(o.source);
  }
  buildCounterSourceSplitShard--;
}

core.int buildCounterSplitInt64 = 0;
buildSplitInt64() {
  var o = new api.SplitInt64();
  buildCounterSplitInt64++;
  if (buildCounterSplitInt64 < 3) {
    o.highBits = 42;
    o.lowBits = 42;
  }
  buildCounterSplitInt64--;
  return o;
}

checkSplitInt64(api.SplitInt64 o) {
  buildCounterSplitInt64++;
  if (buildCounterSplitInt64 < 3) {
    unittest.expect(o.highBits, unittest.equals(42));
    unittest.expect(o.lowBits, unittest.equals(42));
  }
  buildCounterSplitInt64--;
}

core.int buildCounterStateFamilyConfig = 0;
buildStateFamilyConfig() {
  var o = new api.StateFamilyConfig();
  buildCounterStateFamilyConfig++;
  if (buildCounterStateFamilyConfig < 3) {
    o.isRead = true;
    o.stateFamily = "foo";
  }
  buildCounterStateFamilyConfig--;
  return o;
}

checkStateFamilyConfig(api.StateFamilyConfig o) {
  buildCounterStateFamilyConfig++;
  if (buildCounterStateFamilyConfig < 3) {
    unittest.expect(o.isRead, unittest.isTrue);
    unittest.expect(o.stateFamily, unittest.equals('foo'));
  }
  buildCounterStateFamilyConfig--;
}

buildUnnamed3409() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed3409(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted37 = (o["x"]) as core.Map; unittest.expect(casted37, unittest.hasLength(3)); unittest.expect(casted37["list"], unittest.equals([1, 2, 3])); unittest.expect(casted37["bool"], unittest.equals(true)); unittest.expect(casted37["string"], unittest.equals('foo')); 
  var casted38 = (o["y"]) as core.Map; unittest.expect(casted38, unittest.hasLength(3)); unittest.expect(casted38["list"], unittest.equals([1, 2, 3])); unittest.expect(casted38["bool"], unittest.equals(true)); unittest.expect(casted38["string"], unittest.equals('foo')); 
}

buildUnnamed3410() {
  var o = new core.List<core.Map<core.String, core.Object>>();
  o.add(buildUnnamed3409());
  o.add(buildUnnamed3409());
  return o;
}

checkUnnamed3410(core.List<core.Map<core.String, core.Object>> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnnamed3409(o[0]);
  checkUnnamed3409(o[1]);
}

core.int buildCounterStatus = 0;
buildStatus() {
  var o = new api.Status();
  buildCounterStatus++;
  if (buildCounterStatus < 3) {
    o.code = 42;
    o.details = buildUnnamed3410();
    o.message = "foo";
  }
  buildCounterStatus--;
  return o;
}

checkStatus(api.Status o) {
  buildCounterStatus++;
  if (buildCounterStatus < 3) {
    unittest.expect(o.code, unittest.equals(42));
    checkUnnamed3410(o.details);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterStatus--;
}

buildUnnamed3411() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed3411(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted39 = (o["x"]) as core.Map; unittest.expect(casted39, unittest.hasLength(3)); unittest.expect(casted39["list"], unittest.equals([1, 2, 3])); unittest.expect(casted39["bool"], unittest.equals(true)); unittest.expect(casted39["string"], unittest.equals('foo')); 
  var casted40 = (o["y"]) as core.Map; unittest.expect(casted40, unittest.hasLength(3)); unittest.expect(casted40["list"], unittest.equals([1, 2, 3])); unittest.expect(casted40["bool"], unittest.equals(true)); unittest.expect(casted40["string"], unittest.equals('foo')); 
}

core.int buildCounterStep = 0;
buildStep() {
  var o = new api.Step();
  buildCounterStep++;
  if (buildCounterStep < 3) {
    o.kind = "foo";
    o.name = "foo";
    o.properties = buildUnnamed3411();
  }
  buildCounterStep--;
  return o;
}

checkStep(api.Step o) {
  buildCounterStep++;
  if (buildCounterStep < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed3411(o.properties);
  }
  buildCounterStep--;
}

core.int buildCounterStreamLocation = 0;
buildStreamLocation() {
  var o = new api.StreamLocation();
  buildCounterStreamLocation++;
  if (buildCounterStreamLocation < 3) {
    o.customSourceLocation = buildCustomSourceLocation();
    o.pubsubLocation = buildPubsubLocation();
    o.sideInputLocation = buildStreamingSideInputLocation();
    o.streamingStageLocation = buildStreamingStageLocation();
  }
  buildCounterStreamLocation--;
  return o;
}

checkStreamLocation(api.StreamLocation o) {
  buildCounterStreamLocation++;
  if (buildCounterStreamLocation < 3) {
    checkCustomSourceLocation(o.customSourceLocation);
    checkPubsubLocation(o.pubsubLocation);
    checkStreamingSideInputLocation(o.sideInputLocation);
    checkStreamingStageLocation(o.streamingStageLocation);
  }
  buildCounterStreamLocation--;
}

buildUnnamed3412() {
  var o = new core.List<api.ParallelInstruction>();
  o.add(buildParallelInstruction());
  o.add(buildParallelInstruction());
  return o;
}

checkUnnamed3412(core.List<api.ParallelInstruction> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkParallelInstruction(o[0]);
  checkParallelInstruction(o[1]);
}

core.int buildCounterStreamingComputationConfig = 0;
buildStreamingComputationConfig() {
  var o = new api.StreamingComputationConfig();
  buildCounterStreamingComputationConfig++;
  if (buildCounterStreamingComputationConfig < 3) {
    o.computationId = "foo";
    o.instructions = buildUnnamed3412();
    o.stageName = "foo";
    o.systemName = "foo";
  }
  buildCounterStreamingComputationConfig--;
  return o;
}

checkStreamingComputationConfig(api.StreamingComputationConfig o) {
  buildCounterStreamingComputationConfig++;
  if (buildCounterStreamingComputationConfig < 3) {
    unittest.expect(o.computationId, unittest.equals('foo'));
    checkUnnamed3412(o.instructions);
    unittest.expect(o.stageName, unittest.equals('foo'));
    unittest.expect(o.systemName, unittest.equals('foo'));
  }
  buildCounterStreamingComputationConfig--;
}

buildUnnamed3413() {
  var o = new core.List<api.KeyRangeDataDiskAssignment>();
  o.add(buildKeyRangeDataDiskAssignment());
  o.add(buildKeyRangeDataDiskAssignment());
  return o;
}

checkUnnamed3413(core.List<api.KeyRangeDataDiskAssignment> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkKeyRangeDataDiskAssignment(o[0]);
  checkKeyRangeDataDiskAssignment(o[1]);
}

core.int buildCounterStreamingComputationRanges = 0;
buildStreamingComputationRanges() {
  var o = new api.StreamingComputationRanges();
  buildCounterStreamingComputationRanges++;
  if (buildCounterStreamingComputationRanges < 3) {
    o.computationId = "foo";
    o.rangeAssignments = buildUnnamed3413();
  }
  buildCounterStreamingComputationRanges--;
  return o;
}

checkStreamingComputationRanges(api.StreamingComputationRanges o) {
  buildCounterStreamingComputationRanges++;
  if (buildCounterStreamingComputationRanges < 3) {
    unittest.expect(o.computationId, unittest.equals('foo'));
    checkUnnamed3413(o.rangeAssignments);
  }
  buildCounterStreamingComputationRanges--;
}

buildUnnamed3414() {
  var o = new core.List<api.StreamingComputationRanges>();
  o.add(buildStreamingComputationRanges());
  o.add(buildStreamingComputationRanges());
  return o;
}

checkUnnamed3414(core.List<api.StreamingComputationRanges> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkStreamingComputationRanges(o[0]);
  checkStreamingComputationRanges(o[1]);
}

buildUnnamed3415() {
  var o = new core.List<api.MountedDataDisk>();
  o.add(buildMountedDataDisk());
  o.add(buildMountedDataDisk());
  return o;
}

checkUnnamed3415(core.List<api.MountedDataDisk> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMountedDataDisk(o[0]);
  checkMountedDataDisk(o[1]);
}

core.int buildCounterStreamingComputationTask = 0;
buildStreamingComputationTask() {
  var o = new api.StreamingComputationTask();
  buildCounterStreamingComputationTask++;
  if (buildCounterStreamingComputationTask < 3) {
    o.computationRanges = buildUnnamed3414();
    o.dataDisks = buildUnnamed3415();
    o.taskType = "foo";
  }
  buildCounterStreamingComputationTask--;
  return o;
}

checkStreamingComputationTask(api.StreamingComputationTask o) {
  buildCounterStreamingComputationTask++;
  if (buildCounterStreamingComputationTask < 3) {
    checkUnnamed3414(o.computationRanges);
    checkUnnamed3415(o.dataDisks);
    unittest.expect(o.taskType, unittest.equals('foo'));
  }
  buildCounterStreamingComputationTask--;
}

buildUnnamed3416() {
  var o = new core.List<api.StreamingComputationConfig>();
  o.add(buildStreamingComputationConfig());
  o.add(buildStreamingComputationConfig());
  return o;
}

checkUnnamed3416(core.List<api.StreamingComputationConfig> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkStreamingComputationConfig(o[0]);
  checkStreamingComputationConfig(o[1]);
}

buildUnnamed3417() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed3417(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

core.int buildCounterStreamingConfigTask = 0;
buildStreamingConfigTask() {
  var o = new api.StreamingConfigTask();
  buildCounterStreamingConfigTask++;
  if (buildCounterStreamingConfigTask < 3) {
    o.streamingComputationConfigs = buildUnnamed3416();
    o.userStepToStateFamilyNameMap = buildUnnamed3417();
  }
  buildCounterStreamingConfigTask--;
  return o;
}

checkStreamingConfigTask(api.StreamingConfigTask o) {
  buildCounterStreamingConfigTask++;
  if (buildCounterStreamingConfigTask < 3) {
    checkUnnamed3416(o.streamingComputationConfigs);
    checkUnnamed3417(o.userStepToStateFamilyNameMap);
  }
  buildCounterStreamingConfigTask--;
}

core.int buildCounterStreamingSetupTask = 0;
buildStreamingSetupTask() {
  var o = new api.StreamingSetupTask();
  buildCounterStreamingSetupTask++;
  if (buildCounterStreamingSetupTask < 3) {
    o.drain = true;
    o.receiveWorkPort = 42;
    o.streamingComputationTopology = buildTopologyConfig();
    o.workerHarnessPort = 42;
  }
  buildCounterStreamingSetupTask--;
  return o;
}

checkStreamingSetupTask(api.StreamingSetupTask o) {
  buildCounterStreamingSetupTask++;
  if (buildCounterStreamingSetupTask < 3) {
    unittest.expect(o.drain, unittest.isTrue);
    unittest.expect(o.receiveWorkPort, unittest.equals(42));
    checkTopologyConfig(o.streamingComputationTopology);
    unittest.expect(o.workerHarnessPort, unittest.equals(42));
  }
  buildCounterStreamingSetupTask--;
}

core.int buildCounterStreamingSideInputLocation = 0;
buildStreamingSideInputLocation() {
  var o = new api.StreamingSideInputLocation();
  buildCounterStreamingSideInputLocation++;
  if (buildCounterStreamingSideInputLocation < 3) {
    o.stateFamily = "foo";
    o.tag = "foo";
  }
  buildCounterStreamingSideInputLocation--;
  return o;
}

checkStreamingSideInputLocation(api.StreamingSideInputLocation o) {
  buildCounterStreamingSideInputLocation++;
  if (buildCounterStreamingSideInputLocation < 3) {
    unittest.expect(o.stateFamily, unittest.equals('foo'));
    unittest.expect(o.tag, unittest.equals('foo'));
  }
  buildCounterStreamingSideInputLocation--;
}

core.int buildCounterStreamingStageLocation = 0;
buildStreamingStageLocation() {
  var o = new api.StreamingStageLocation();
  buildCounterStreamingStageLocation++;
  if (buildCounterStreamingStageLocation < 3) {
    o.streamId = "foo";
  }
  buildCounterStreamingStageLocation--;
  return o;
}

checkStreamingStageLocation(api.StreamingStageLocation o) {
  buildCounterStreamingStageLocation++;
  if (buildCounterStreamingStageLocation < 3) {
    unittest.expect(o.streamId, unittest.equals('foo'));
  }
  buildCounterStreamingStageLocation--;
}

buildUnnamed3418() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3418(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterStringList = 0;
buildStringList() {
  var o = new api.StringList();
  buildCounterStringList++;
  if (buildCounterStringList < 3) {
    o.elements = buildUnnamed3418();
  }
  buildCounterStringList--;
  return o;
}

checkStringList(api.StringList o) {
  buildCounterStringList++;
  if (buildCounterStringList < 3) {
    checkUnnamed3418(o.elements);
  }
  buildCounterStringList--;
}

buildUnnamed3419() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3419(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterTaskRunnerSettings = 0;
buildTaskRunnerSettings() {
  var o = new api.TaskRunnerSettings();
  buildCounterTaskRunnerSettings++;
  if (buildCounterTaskRunnerSettings < 3) {
    o.alsologtostderr = true;
    o.baseTaskDir = "foo";
    o.baseUrl = "foo";
    o.commandlinesFileName = "foo";
    o.continueOnException = true;
    o.dataflowApiVersion = "foo";
    o.harnessCommand = "foo";
    o.languageHint = "foo";
    o.logDir = "foo";
    o.logToSerialconsole = true;
    o.logUploadLocation = "foo";
    o.oauthScopes = buildUnnamed3419();
    o.parallelWorkerSettings = buildWorkerSettings();
    o.streamingWorkerMainClass = "foo";
    o.taskGroup = "foo";
    o.taskUser = "foo";
    o.tempStoragePrefix = "foo";
    o.vmId = "foo";
    o.workflowFileName = "foo";
  }
  buildCounterTaskRunnerSettings--;
  return o;
}

checkTaskRunnerSettings(api.TaskRunnerSettings o) {
  buildCounterTaskRunnerSettings++;
  if (buildCounterTaskRunnerSettings < 3) {
    unittest.expect(o.alsologtostderr, unittest.isTrue);
    unittest.expect(o.baseTaskDir, unittest.equals('foo'));
    unittest.expect(o.baseUrl, unittest.equals('foo'));
    unittest.expect(o.commandlinesFileName, unittest.equals('foo'));
    unittest.expect(o.continueOnException, unittest.isTrue);
    unittest.expect(o.dataflowApiVersion, unittest.equals('foo'));
    unittest.expect(o.harnessCommand, unittest.equals('foo'));
    unittest.expect(o.languageHint, unittest.equals('foo'));
    unittest.expect(o.logDir, unittest.equals('foo'));
    unittest.expect(o.logToSerialconsole, unittest.isTrue);
    unittest.expect(o.logUploadLocation, unittest.equals('foo'));
    checkUnnamed3419(o.oauthScopes);
    checkWorkerSettings(o.parallelWorkerSettings);
    unittest.expect(o.streamingWorkerMainClass, unittest.equals('foo'));
    unittest.expect(o.taskGroup, unittest.equals('foo'));
    unittest.expect(o.taskUser, unittest.equals('foo'));
    unittest.expect(o.tempStoragePrefix, unittest.equals('foo'));
    unittest.expect(o.vmId, unittest.equals('foo'));
    unittest.expect(o.workflowFileName, unittest.equals('foo'));
  }
  buildCounterTaskRunnerSettings--;
}

buildUnnamed3420() {
  var o = new core.List<api.ComputationTopology>();
  o.add(buildComputationTopology());
  o.add(buildComputationTopology());
  return o;
}

checkUnnamed3420(core.List<api.ComputationTopology> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkComputationTopology(o[0]);
  checkComputationTopology(o[1]);
}

buildUnnamed3421() {
  var o = new core.List<api.DataDiskAssignment>();
  o.add(buildDataDiskAssignment());
  o.add(buildDataDiskAssignment());
  return o;
}

checkUnnamed3421(core.List<api.DataDiskAssignment> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDataDiskAssignment(o[0]);
  checkDataDiskAssignment(o[1]);
}

buildUnnamed3422() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed3422(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

core.int buildCounterTopologyConfig = 0;
buildTopologyConfig() {
  var o = new api.TopologyConfig();
  buildCounterTopologyConfig++;
  if (buildCounterTopologyConfig < 3) {
    o.computations = buildUnnamed3420();
    o.dataDiskAssignments = buildUnnamed3421();
    o.forwardingKeyBits = 42;
    o.persistentStateVersion = 42;
    o.userStageToComputationNameMap = buildUnnamed3422();
  }
  buildCounterTopologyConfig--;
  return o;
}

checkTopologyConfig(api.TopologyConfig o) {
  buildCounterTopologyConfig++;
  if (buildCounterTopologyConfig < 3) {
    checkUnnamed3420(o.computations);
    checkUnnamed3421(o.dataDiskAssignments);
    unittest.expect(o.forwardingKeyBits, unittest.equals(42));
    unittest.expect(o.persistentStateVersion, unittest.equals(42));
    checkUnnamed3422(o.userStageToComputationNameMap);
  }
  buildCounterTopologyConfig--;
}

buildUnnamed3423() {
  var o = new core.List<api.Package>();
  o.add(buildPackage());
  o.add(buildPackage());
  return o;
}

checkUnnamed3423(core.List<api.Package> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPackage(o[0]);
  checkPackage(o[1]);
}

core.int buildCounterWorkItem = 0;
buildWorkItem() {
  var o = new api.WorkItem();
  buildCounterWorkItem++;
  if (buildCounterWorkItem < 3) {
    o.configuration = "foo";
    o.id = "foo";
    o.initialReportIndex = "foo";
    o.jobId = "foo";
    o.leaseExpireTime = "foo";
    o.mapTask = buildMapTask();
    o.packages = buildUnnamed3423();
    o.projectId = "foo";
    o.reportStatusInterval = "foo";
    o.seqMapTask = buildSeqMapTask();
    o.shellTask = buildShellTask();
    o.sourceOperationTask = buildSourceOperationRequest();
    o.streamingComputationTask = buildStreamingComputationTask();
    o.streamingConfigTask = buildStreamingConfigTask();
    o.streamingSetupTask = buildStreamingSetupTask();
  }
  buildCounterWorkItem--;
  return o;
}

checkWorkItem(api.WorkItem o) {
  buildCounterWorkItem++;
  if (buildCounterWorkItem < 3) {
    unittest.expect(o.configuration, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.initialReportIndex, unittest.equals('foo'));
    unittest.expect(o.jobId, unittest.equals('foo'));
    unittest.expect(o.leaseExpireTime, unittest.equals('foo'));
    checkMapTask(o.mapTask);
    checkUnnamed3423(o.packages);
    unittest.expect(o.projectId, unittest.equals('foo'));
    unittest.expect(o.reportStatusInterval, unittest.equals('foo'));
    checkSeqMapTask(o.seqMapTask);
    checkShellTask(o.shellTask);
    checkSourceOperationRequest(o.sourceOperationTask);
    checkStreamingComputationTask(o.streamingComputationTask);
    checkStreamingConfigTask(o.streamingConfigTask);
    checkStreamingSetupTask(o.streamingSetupTask);
  }
  buildCounterWorkItem--;
}

buildUnnamed3424() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed3424(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted41 = (o["x"]) as core.Map; unittest.expect(casted41, unittest.hasLength(3)); unittest.expect(casted41["list"], unittest.equals([1, 2, 3])); unittest.expect(casted41["bool"], unittest.equals(true)); unittest.expect(casted41["string"], unittest.equals('foo')); 
  var casted42 = (o["y"]) as core.Map; unittest.expect(casted42, unittest.hasLength(3)); unittest.expect(casted42["list"], unittest.equals([1, 2, 3])); unittest.expect(casted42["bool"], unittest.equals(true)); unittest.expect(casted42["string"], unittest.equals('foo')); 
}

buildUnnamed3425() {
  var o = new core.List<api.MetricShortId>();
  o.add(buildMetricShortId());
  o.add(buildMetricShortId());
  return o;
}

checkUnnamed3425(core.List<api.MetricShortId> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetricShortId(o[0]);
  checkMetricShortId(o[1]);
}

core.int buildCounterWorkItemServiceState = 0;
buildWorkItemServiceState() {
  var o = new api.WorkItemServiceState();
  buildCounterWorkItemServiceState++;
  if (buildCounterWorkItemServiceState < 3) {
    o.harnessData = buildUnnamed3424();
    o.leaseExpireTime = "foo";
    o.metricShortId = buildUnnamed3425();
    o.nextReportIndex = "foo";
    o.reportStatusInterval = "foo";
    o.splitRequest = buildApproximateSplitRequest();
    o.suggestedStopPoint = buildApproximateProgress();
    o.suggestedStopPosition = buildPosition();
  }
  buildCounterWorkItemServiceState--;
  return o;
}

checkWorkItemServiceState(api.WorkItemServiceState o) {
  buildCounterWorkItemServiceState++;
  if (buildCounterWorkItemServiceState < 3) {
    checkUnnamed3424(o.harnessData);
    unittest.expect(o.leaseExpireTime, unittest.equals('foo'));
    checkUnnamed3425(o.metricShortId);
    unittest.expect(o.nextReportIndex, unittest.equals('foo'));
    unittest.expect(o.reportStatusInterval, unittest.equals('foo'));
    checkApproximateSplitRequest(o.splitRequest);
    checkApproximateProgress(o.suggestedStopPoint);
    checkPosition(o.suggestedStopPosition);
  }
  buildCounterWorkItemServiceState--;
}

buildUnnamed3426() {
  var o = new core.List<api.CounterUpdate>();
  o.add(buildCounterUpdate());
  o.add(buildCounterUpdate());
  return o;
}

checkUnnamed3426(core.List<api.CounterUpdate> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCounterUpdate(o[0]);
  checkCounterUpdate(o[1]);
}

buildUnnamed3427() {
  var o = new core.List<api.Status>();
  o.add(buildStatus());
  o.add(buildStatus());
  return o;
}

checkUnnamed3427(core.List<api.Status> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkStatus(o[0]);
  checkStatus(o[1]);
}

buildUnnamed3428() {
  var o = new core.List<api.MetricUpdate>();
  o.add(buildMetricUpdate());
  o.add(buildMetricUpdate());
  return o;
}

checkUnnamed3428(core.List<api.MetricUpdate> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetricUpdate(o[0]);
  checkMetricUpdate(o[1]);
}

core.int buildCounterWorkItemStatus = 0;
buildWorkItemStatus() {
  var o = new api.WorkItemStatus();
  buildCounterWorkItemStatus++;
  if (buildCounterWorkItemStatus < 3) {
    o.completed = true;
    o.counterUpdates = buildUnnamed3426();
    o.dynamicSourceSplit = buildDynamicSourceSplit();
    o.errors = buildUnnamed3427();
    o.metricUpdates = buildUnnamed3428();
    o.progress = buildApproximateProgress();
    o.reportIndex = "foo";
    o.reportedProgress = buildApproximateReportedProgress();
    o.requestedLeaseDuration = "foo";
    o.sourceFork = buildSourceFork();
    o.sourceOperationResponse = buildSourceOperationResponse();
    o.stopPosition = buildPosition();
    o.workItemId = "foo";
  }
  buildCounterWorkItemStatus--;
  return o;
}

checkWorkItemStatus(api.WorkItemStatus o) {
  buildCounterWorkItemStatus++;
  if (buildCounterWorkItemStatus < 3) {
    unittest.expect(o.completed, unittest.isTrue);
    checkUnnamed3426(o.counterUpdates);
    checkDynamicSourceSplit(o.dynamicSourceSplit);
    checkUnnamed3427(o.errors);
    checkUnnamed3428(o.metricUpdates);
    checkApproximateProgress(o.progress);
    unittest.expect(o.reportIndex, unittest.equals('foo'));
    checkApproximateReportedProgress(o.reportedProgress);
    unittest.expect(o.requestedLeaseDuration, unittest.equals('foo'));
    checkSourceFork(o.sourceFork);
    checkSourceOperationResponse(o.sourceOperationResponse);
    checkPosition(o.stopPosition);
    unittest.expect(o.workItemId, unittest.equals('foo'));
  }
  buildCounterWorkItemStatus--;
}

buildUnnamed3429() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed3429(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted43 = (o["x"]) as core.Map; unittest.expect(casted43, unittest.hasLength(3)); unittest.expect(casted43["list"], unittest.equals([1, 2, 3])); unittest.expect(casted43["bool"], unittest.equals(true)); unittest.expect(casted43["string"], unittest.equals('foo')); 
  var casted44 = (o["y"]) as core.Map; unittest.expect(casted44, unittest.hasLength(3)); unittest.expect(casted44["list"], unittest.equals([1, 2, 3])); unittest.expect(casted44["bool"], unittest.equals(true)); unittest.expect(casted44["string"], unittest.equals('foo')); 
}

buildUnnamed3430() {
  var o = new core.List<core.Map<core.String, core.Object>>();
  o.add(buildUnnamed3429());
  o.add(buildUnnamed3429());
  return o;
}

checkUnnamed3430(core.List<core.Map<core.String, core.Object>> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnnamed3429(o[0]);
  checkUnnamed3429(o[1]);
}

core.int buildCounterWorkerHealthReport = 0;
buildWorkerHealthReport() {
  var o = new api.WorkerHealthReport();
  buildCounterWorkerHealthReport++;
  if (buildCounterWorkerHealthReport < 3) {
    o.pods = buildUnnamed3430();
    o.reportInterval = "foo";
    o.vmIsHealthy = true;
    o.vmStartupTime = "foo";
  }
  buildCounterWorkerHealthReport--;
  return o;
}

checkWorkerHealthReport(api.WorkerHealthReport o) {
  buildCounterWorkerHealthReport++;
  if (buildCounterWorkerHealthReport < 3) {
    checkUnnamed3430(o.pods);
    unittest.expect(o.reportInterval, unittest.equals('foo'));
    unittest.expect(o.vmIsHealthy, unittest.isTrue);
    unittest.expect(o.vmStartupTime, unittest.equals('foo'));
  }
  buildCounterWorkerHealthReport--;
}

core.int buildCounterWorkerHealthReportResponse = 0;
buildWorkerHealthReportResponse() {
  var o = new api.WorkerHealthReportResponse();
  buildCounterWorkerHealthReportResponse++;
  if (buildCounterWorkerHealthReportResponse < 3) {
    o.reportInterval = "foo";
  }
  buildCounterWorkerHealthReportResponse--;
  return o;
}

checkWorkerHealthReportResponse(api.WorkerHealthReportResponse o) {
  buildCounterWorkerHealthReportResponse++;
  if (buildCounterWorkerHealthReportResponse < 3) {
    unittest.expect(o.reportInterval, unittest.equals('foo'));
  }
  buildCounterWorkerHealthReportResponse--;
}

buildUnnamed3431() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed3431(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

core.int buildCounterWorkerMessage = 0;
buildWorkerMessage() {
  var o = new api.WorkerMessage();
  buildCounterWorkerMessage++;
  if (buildCounterWorkerMessage < 3) {
    o.labels = buildUnnamed3431();
    o.time = "foo";
    o.workerHealthReport = buildWorkerHealthReport();
    o.workerMessageCode = buildWorkerMessageCode();
  }
  buildCounterWorkerMessage--;
  return o;
}

checkWorkerMessage(api.WorkerMessage o) {
  buildCounterWorkerMessage++;
  if (buildCounterWorkerMessage < 3) {
    checkUnnamed3431(o.labels);
    unittest.expect(o.time, unittest.equals('foo'));
    checkWorkerHealthReport(o.workerHealthReport);
    checkWorkerMessageCode(o.workerMessageCode);
  }
  buildCounterWorkerMessage--;
}

buildUnnamed3432() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed3432(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted45 = (o["x"]) as core.Map; unittest.expect(casted45, unittest.hasLength(3)); unittest.expect(casted45["list"], unittest.equals([1, 2, 3])); unittest.expect(casted45["bool"], unittest.equals(true)); unittest.expect(casted45["string"], unittest.equals('foo')); 
  var casted46 = (o["y"]) as core.Map; unittest.expect(casted46, unittest.hasLength(3)); unittest.expect(casted46["list"], unittest.equals([1, 2, 3])); unittest.expect(casted46["bool"], unittest.equals(true)); unittest.expect(casted46["string"], unittest.equals('foo')); 
}

core.int buildCounterWorkerMessageCode = 0;
buildWorkerMessageCode() {
  var o = new api.WorkerMessageCode();
  buildCounterWorkerMessageCode++;
  if (buildCounterWorkerMessageCode < 3) {
    o.code = "foo";
    o.parameters = buildUnnamed3432();
  }
  buildCounterWorkerMessageCode--;
  return o;
}

checkWorkerMessageCode(api.WorkerMessageCode o) {
  buildCounterWorkerMessageCode++;
  if (buildCounterWorkerMessageCode < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkUnnamed3432(o.parameters);
  }
  buildCounterWorkerMessageCode--;
}

core.int buildCounterWorkerMessageResponse = 0;
buildWorkerMessageResponse() {
  var o = new api.WorkerMessageResponse();
  buildCounterWorkerMessageResponse++;
  if (buildCounterWorkerMessageResponse < 3) {
    o.workerHealthReportResponse = buildWorkerHealthReportResponse();
  }
  buildCounterWorkerMessageResponse--;
  return o;
}

checkWorkerMessageResponse(api.WorkerMessageResponse o) {
  buildCounterWorkerMessageResponse++;
  if (buildCounterWorkerMessageResponse < 3) {
    checkWorkerHealthReportResponse(o.workerHealthReportResponse);
  }
  buildCounterWorkerMessageResponse--;
}

buildUnnamed3433() {
  var o = new core.List<api.Disk>();
  o.add(buildDisk());
  o.add(buildDisk());
  return o;
}

checkUnnamed3433(core.List<api.Disk> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDisk(o[0]);
  checkDisk(o[1]);
}

buildUnnamed3434() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed3434(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

buildUnnamed3435() {
  var o = new core.List<api.Package>();
  o.add(buildPackage());
  o.add(buildPackage());
  return o;
}

checkUnnamed3435(core.List<api.Package> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPackage(o[0]);
  checkPackage(o[1]);
}

buildUnnamed3436() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed3436(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted47 = (o["x"]) as core.Map; unittest.expect(casted47, unittest.hasLength(3)); unittest.expect(casted47["list"], unittest.equals([1, 2, 3])); unittest.expect(casted47["bool"], unittest.equals(true)); unittest.expect(casted47["string"], unittest.equals('foo')); 
  var casted48 = (o["y"]) as core.Map; unittest.expect(casted48, unittest.hasLength(3)); unittest.expect(casted48["list"], unittest.equals([1, 2, 3])); unittest.expect(casted48["bool"], unittest.equals(true)); unittest.expect(casted48["string"], unittest.equals('foo')); 
}

core.int buildCounterWorkerPool = 0;
buildWorkerPool() {
  var o = new api.WorkerPool();
  buildCounterWorkerPool++;
  if (buildCounterWorkerPool < 3) {
    o.autoscalingSettings = buildAutoscalingSettings();
    o.dataDisks = buildUnnamed3433();
    o.defaultPackageSet = "foo";
    o.diskSizeGb = 42;
    o.diskSourceImage = "foo";
    o.diskType = "foo";
    o.ipConfiguration = "foo";
    o.kind = "foo";
    o.machineType = "foo";
    o.metadata = buildUnnamed3434();
    o.network = "foo";
    o.numThreadsPerWorker = 42;
    o.numWorkers = 42;
    o.onHostMaintenance = "foo";
    o.packages = buildUnnamed3435();
    o.poolArgs = buildUnnamed3436();
    o.subnetwork = "foo";
    o.taskrunnerSettings = buildTaskRunnerSettings();
    o.teardownPolicy = "foo";
    o.workerHarnessContainerImage = "foo";
    o.zone = "foo";
  }
  buildCounterWorkerPool--;
  return o;
}

checkWorkerPool(api.WorkerPool o) {
  buildCounterWorkerPool++;
  if (buildCounterWorkerPool < 3) {
    checkAutoscalingSettings(o.autoscalingSettings);
    checkUnnamed3433(o.dataDisks);
    unittest.expect(o.defaultPackageSet, unittest.equals('foo'));
    unittest.expect(o.diskSizeGb, unittest.equals(42));
    unittest.expect(o.diskSourceImage, unittest.equals('foo'));
    unittest.expect(o.diskType, unittest.equals('foo'));
    unittest.expect(o.ipConfiguration, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.machineType, unittest.equals('foo'));
    checkUnnamed3434(o.metadata);
    unittest.expect(o.network, unittest.equals('foo'));
    unittest.expect(o.numThreadsPerWorker, unittest.equals(42));
    unittest.expect(o.numWorkers, unittest.equals(42));
    unittest.expect(o.onHostMaintenance, unittest.equals('foo'));
    checkUnnamed3435(o.packages);
    checkUnnamed3436(o.poolArgs);
    unittest.expect(o.subnetwork, unittest.equals('foo'));
    checkTaskRunnerSettings(o.taskrunnerSettings);
    unittest.expect(o.teardownPolicy, unittest.equals('foo'));
    unittest.expect(o.workerHarnessContainerImage, unittest.equals('foo'));
    unittest.expect(o.zone, unittest.equals('foo'));
  }
  buildCounterWorkerPool--;
}

core.int buildCounterWorkerSettings = 0;
buildWorkerSettings() {
  var o = new api.WorkerSettings();
  buildCounterWorkerSettings++;
  if (buildCounterWorkerSettings < 3) {
    o.baseUrl = "foo";
    o.reportingEnabled = true;
    o.servicePath = "foo";
    o.shuffleServicePath = "foo";
    o.tempStoragePrefix = "foo";
    o.workerId = "foo";
  }
  buildCounterWorkerSettings--;
  return o;
}

checkWorkerSettings(api.WorkerSettings o) {
  buildCounterWorkerSettings++;
  if (buildCounterWorkerSettings < 3) {
    unittest.expect(o.baseUrl, unittest.equals('foo'));
    unittest.expect(o.reportingEnabled, unittest.isTrue);
    unittest.expect(o.servicePath, unittest.equals('foo'));
    unittest.expect(o.shuffleServicePath, unittest.equals('foo'));
    unittest.expect(o.tempStoragePrefix, unittest.equals('foo'));
    unittest.expect(o.workerId, unittest.equals('foo'));
  }
  buildCounterWorkerSettings--;
}

core.int buildCounterWriteInstruction = 0;
buildWriteInstruction() {
  var o = new api.WriteInstruction();
  buildCounterWriteInstruction++;
  if (buildCounterWriteInstruction < 3) {
    o.input = buildInstructionInput();
    o.sink = buildSink();
  }
  buildCounterWriteInstruction--;
  return o;
}

checkWriteInstruction(api.WriteInstruction o) {
  buildCounterWriteInstruction++;
  if (buildCounterWriteInstruction < 3) {
    checkInstructionInput(o.input);
    checkSink(o.sink);
  }
  buildCounterWriteInstruction--;
}


main() {
  unittest.group("obj-schema-ApproximateProgress", () {
    unittest.test("to-json--from-json", () {
      var o = buildApproximateProgress();
      var od = new api.ApproximateProgress.fromJson(o.toJson());
      checkApproximateProgress(od);
    });
  });


  unittest.group("obj-schema-ApproximateReportedProgress", () {
    unittest.test("to-json--from-json", () {
      var o = buildApproximateReportedProgress();
      var od = new api.ApproximateReportedProgress.fromJson(o.toJson());
      checkApproximateReportedProgress(od);
    });
  });


  unittest.group("obj-schema-ApproximateSplitRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildApproximateSplitRequest();
      var od = new api.ApproximateSplitRequest.fromJson(o.toJson());
      checkApproximateSplitRequest(od);
    });
  });


  unittest.group("obj-schema-AutoscalingSettings", () {
    unittest.test("to-json--from-json", () {
      var o = buildAutoscalingSettings();
      var od = new api.AutoscalingSettings.fromJson(o.toJson());
      checkAutoscalingSettings(od);
    });
  });


  unittest.group("obj-schema-ComputationTopology", () {
    unittest.test("to-json--from-json", () {
      var o = buildComputationTopology();
      var od = new api.ComputationTopology.fromJson(o.toJson());
      checkComputationTopology(od);
    });
  });


  unittest.group("obj-schema-ConcatPosition", () {
    unittest.test("to-json--from-json", () {
      var o = buildConcatPosition();
      var od = new api.ConcatPosition.fromJson(o.toJson());
      checkConcatPosition(od);
    });
  });


  unittest.group("obj-schema-CounterMetadata", () {
    unittest.test("to-json--from-json", () {
      var o = buildCounterMetadata();
      var od = new api.CounterMetadata.fromJson(o.toJson());
      checkCounterMetadata(od);
    });
  });


  unittest.group("obj-schema-CounterStructuredName", () {
    unittest.test("to-json--from-json", () {
      var o = buildCounterStructuredName();
      var od = new api.CounterStructuredName.fromJson(o.toJson());
      checkCounterStructuredName(od);
    });
  });


  unittest.group("obj-schema-CounterStructuredNameAndMetadata", () {
    unittest.test("to-json--from-json", () {
      var o = buildCounterStructuredNameAndMetadata();
      var od = new api.CounterStructuredNameAndMetadata.fromJson(o.toJson());
      checkCounterStructuredNameAndMetadata(od);
    });
  });


  unittest.group("obj-schema-CounterUpdate", () {
    unittest.test("to-json--from-json", () {
      var o = buildCounterUpdate();
      var od = new api.CounterUpdate.fromJson(o.toJson());
      checkCounterUpdate(od);
    });
  });


  unittest.group("obj-schema-CreateJobFromTemplateRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreateJobFromTemplateRequest();
      var od = new api.CreateJobFromTemplateRequest.fromJson(o.toJson());
      checkCreateJobFromTemplateRequest(od);
    });
  });


  unittest.group("obj-schema-CustomSourceLocation", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomSourceLocation();
      var od = new api.CustomSourceLocation.fromJson(o.toJson());
      checkCustomSourceLocation(od);
    });
  });


  unittest.group("obj-schema-DataDiskAssignment", () {
    unittest.test("to-json--from-json", () {
      var o = buildDataDiskAssignment();
      var od = new api.DataDiskAssignment.fromJson(o.toJson());
      checkDataDiskAssignment(od);
    });
  });


  unittest.group("obj-schema-DerivedSource", () {
    unittest.test("to-json--from-json", () {
      var o = buildDerivedSource();
      var od = new api.DerivedSource.fromJson(o.toJson());
      checkDerivedSource(od);
    });
  });


  unittest.group("obj-schema-Disk", () {
    unittest.test("to-json--from-json", () {
      var o = buildDisk();
      var od = new api.Disk.fromJson(o.toJson());
      checkDisk(od);
    });
  });


  unittest.group("obj-schema-DynamicSourceSplit", () {
    unittest.test("to-json--from-json", () {
      var o = buildDynamicSourceSplit();
      var od = new api.DynamicSourceSplit.fromJson(o.toJson());
      checkDynamicSourceSplit(od);
    });
  });


  unittest.group("obj-schema-Environment", () {
    unittest.test("to-json--from-json", () {
      var o = buildEnvironment();
      var od = new api.Environment.fromJson(o.toJson());
      checkEnvironment(od);
    });
  });


  unittest.group("obj-schema-FailedLocation", () {
    unittest.test("to-json--from-json", () {
      var o = buildFailedLocation();
      var od = new api.FailedLocation.fromJson(o.toJson());
      checkFailedLocation(od);
    });
  });


  unittest.group("obj-schema-FlattenInstruction", () {
    unittest.test("to-json--from-json", () {
      var o = buildFlattenInstruction();
      var od = new api.FlattenInstruction.fromJson(o.toJson());
      checkFlattenInstruction(od);
    });
  });


  unittest.group("obj-schema-FloatingPointList", () {
    unittest.test("to-json--from-json", () {
      var o = buildFloatingPointList();
      var od = new api.FloatingPointList.fromJson(o.toJson());
      checkFloatingPointList(od);
    });
  });


  unittest.group("obj-schema-FloatingPointMean", () {
    unittest.test("to-json--from-json", () {
      var o = buildFloatingPointMean();
      var od = new api.FloatingPointMean.fromJson(o.toJson());
      checkFloatingPointMean(od);
    });
  });


  unittest.group("obj-schema-GetDebugConfigRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildGetDebugConfigRequest();
      var od = new api.GetDebugConfigRequest.fromJson(o.toJson());
      checkGetDebugConfigRequest(od);
    });
  });


  unittest.group("obj-schema-GetDebugConfigResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildGetDebugConfigResponse();
      var od = new api.GetDebugConfigResponse.fromJson(o.toJson());
      checkGetDebugConfigResponse(od);
    });
  });


  unittest.group("obj-schema-InstructionInput", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstructionInput();
      var od = new api.InstructionInput.fromJson(o.toJson());
      checkInstructionInput(od);
    });
  });


  unittest.group("obj-schema-InstructionOutput", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstructionOutput();
      var od = new api.InstructionOutput.fromJson(o.toJson());
      checkInstructionOutput(od);
    });
  });


  unittest.group("obj-schema-IntegerList", () {
    unittest.test("to-json--from-json", () {
      var o = buildIntegerList();
      var od = new api.IntegerList.fromJson(o.toJson());
      checkIntegerList(od);
    });
  });


  unittest.group("obj-schema-IntegerMean", () {
    unittest.test("to-json--from-json", () {
      var o = buildIntegerMean();
      var od = new api.IntegerMean.fromJson(o.toJson());
      checkIntegerMean(od);
    });
  });


  unittest.group("obj-schema-Job", () {
    unittest.test("to-json--from-json", () {
      var o = buildJob();
      var od = new api.Job.fromJson(o.toJson());
      checkJob(od);
    });
  });


  unittest.group("obj-schema-JobExecutionInfo", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobExecutionInfo();
      var od = new api.JobExecutionInfo.fromJson(o.toJson());
      checkJobExecutionInfo(od);
    });
  });


  unittest.group("obj-schema-JobExecutionStageInfo", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobExecutionStageInfo();
      var od = new api.JobExecutionStageInfo.fromJson(o.toJson());
      checkJobExecutionStageInfo(od);
    });
  });


  unittest.group("obj-schema-JobMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobMessage();
      var od = new api.JobMessage.fromJson(o.toJson());
      checkJobMessage(od);
    });
  });


  unittest.group("obj-schema-JobMetrics", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobMetrics();
      var od = new api.JobMetrics.fromJson(o.toJson());
      checkJobMetrics(od);
    });
  });


  unittest.group("obj-schema-KeyRangeDataDiskAssignment", () {
    unittest.test("to-json--from-json", () {
      var o = buildKeyRangeDataDiskAssignment();
      var od = new api.KeyRangeDataDiskAssignment.fromJson(o.toJson());
      checkKeyRangeDataDiskAssignment(od);
    });
  });


  unittest.group("obj-schema-KeyRangeLocation", () {
    unittest.test("to-json--from-json", () {
      var o = buildKeyRangeLocation();
      var od = new api.KeyRangeLocation.fromJson(o.toJson());
      checkKeyRangeLocation(od);
    });
  });


  unittest.group("obj-schema-LeaseWorkItemRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildLeaseWorkItemRequest();
      var od = new api.LeaseWorkItemRequest.fromJson(o.toJson());
      checkLeaseWorkItemRequest(od);
    });
  });


  unittest.group("obj-schema-LeaseWorkItemResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildLeaseWorkItemResponse();
      var od = new api.LeaseWorkItemResponse.fromJson(o.toJson());
      checkLeaseWorkItemResponse(od);
    });
  });


  unittest.group("obj-schema-ListJobMessagesResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListJobMessagesResponse();
      var od = new api.ListJobMessagesResponse.fromJson(o.toJson());
      checkListJobMessagesResponse(od);
    });
  });


  unittest.group("obj-schema-ListJobsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListJobsResponse();
      var od = new api.ListJobsResponse.fromJson(o.toJson());
      checkListJobsResponse(od);
    });
  });


  unittest.group("obj-schema-MapTask", () {
    unittest.test("to-json--from-json", () {
      var o = buildMapTask();
      var od = new api.MapTask.fromJson(o.toJson());
      checkMapTask(od);
    });
  });


  unittest.group("obj-schema-MetricShortId", () {
    unittest.test("to-json--from-json", () {
      var o = buildMetricShortId();
      var od = new api.MetricShortId.fromJson(o.toJson());
      checkMetricShortId(od);
    });
  });


  unittest.group("obj-schema-MetricStructuredName", () {
    unittest.test("to-json--from-json", () {
      var o = buildMetricStructuredName();
      var od = new api.MetricStructuredName.fromJson(o.toJson());
      checkMetricStructuredName(od);
    });
  });


  unittest.group("obj-schema-MetricUpdate", () {
    unittest.test("to-json--from-json", () {
      var o = buildMetricUpdate();
      var od = new api.MetricUpdate.fromJson(o.toJson());
      checkMetricUpdate(od);
    });
  });


  unittest.group("obj-schema-MountedDataDisk", () {
    unittest.test("to-json--from-json", () {
      var o = buildMountedDataDisk();
      var od = new api.MountedDataDisk.fromJson(o.toJson());
      checkMountedDataDisk(od);
    });
  });


  unittest.group("obj-schema-MultiOutputInfo", () {
    unittest.test("to-json--from-json", () {
      var o = buildMultiOutputInfo();
      var od = new api.MultiOutputInfo.fromJson(o.toJson());
      checkMultiOutputInfo(od);
    });
  });


  unittest.group("obj-schema-NameAndKind", () {
    unittest.test("to-json--from-json", () {
      var o = buildNameAndKind();
      var od = new api.NameAndKind.fromJson(o.toJson());
      checkNameAndKind(od);
    });
  });


  unittest.group("obj-schema-Package", () {
    unittest.test("to-json--from-json", () {
      var o = buildPackage();
      var od = new api.Package.fromJson(o.toJson());
      checkPackage(od);
    });
  });


  unittest.group("obj-schema-ParDoInstruction", () {
    unittest.test("to-json--from-json", () {
      var o = buildParDoInstruction();
      var od = new api.ParDoInstruction.fromJson(o.toJson());
      checkParDoInstruction(od);
    });
  });


  unittest.group("obj-schema-ParallelInstruction", () {
    unittest.test("to-json--from-json", () {
      var o = buildParallelInstruction();
      var od = new api.ParallelInstruction.fromJson(o.toJson());
      checkParallelInstruction(od);
    });
  });


  unittest.group("obj-schema-PartialGroupByKeyInstruction", () {
    unittest.test("to-json--from-json", () {
      var o = buildPartialGroupByKeyInstruction();
      var od = new api.PartialGroupByKeyInstruction.fromJson(o.toJson());
      checkPartialGroupByKeyInstruction(od);
    });
  });


  unittest.group("obj-schema-Position", () {
    unittest.test("to-json--from-json", () {
      var o = buildPosition();
      var od = new api.Position.fromJson(o.toJson());
      checkPosition(od);
    });
  });


  unittest.group("obj-schema-PubsubLocation", () {
    unittest.test("to-json--from-json", () {
      var o = buildPubsubLocation();
      var od = new api.PubsubLocation.fromJson(o.toJson());
      checkPubsubLocation(od);
    });
  });


  unittest.group("obj-schema-ReadInstruction", () {
    unittest.test("to-json--from-json", () {
      var o = buildReadInstruction();
      var od = new api.ReadInstruction.fromJson(o.toJson());
      checkReadInstruction(od);
    });
  });


  unittest.group("obj-schema-ReportWorkItemStatusRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportWorkItemStatusRequest();
      var od = new api.ReportWorkItemStatusRequest.fromJson(o.toJson());
      checkReportWorkItemStatusRequest(od);
    });
  });


  unittest.group("obj-schema-ReportWorkItemStatusResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportWorkItemStatusResponse();
      var od = new api.ReportWorkItemStatusResponse.fromJson(o.toJson());
      checkReportWorkItemStatusResponse(od);
    });
  });


  unittest.group("obj-schema-ReportedParallelism", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportedParallelism();
      var od = new api.ReportedParallelism.fromJson(o.toJson());
      checkReportedParallelism(od);
    });
  });


  unittest.group("obj-schema-SendDebugCaptureRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSendDebugCaptureRequest();
      var od = new api.SendDebugCaptureRequest.fromJson(o.toJson());
      checkSendDebugCaptureRequest(od);
    });
  });


  unittest.group("obj-schema-SendDebugCaptureResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSendDebugCaptureResponse();
      var od = new api.SendDebugCaptureResponse.fromJson(o.toJson());
      checkSendDebugCaptureResponse(od);
    });
  });


  unittest.group("obj-schema-SendWorkerMessagesRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSendWorkerMessagesRequest();
      var od = new api.SendWorkerMessagesRequest.fromJson(o.toJson());
      checkSendWorkerMessagesRequest(od);
    });
  });


  unittest.group("obj-schema-SendWorkerMessagesResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSendWorkerMessagesResponse();
      var od = new api.SendWorkerMessagesResponse.fromJson(o.toJson());
      checkSendWorkerMessagesResponse(od);
    });
  });


  unittest.group("obj-schema-SeqMapTask", () {
    unittest.test("to-json--from-json", () {
      var o = buildSeqMapTask();
      var od = new api.SeqMapTask.fromJson(o.toJson());
      checkSeqMapTask(od);
    });
  });


  unittest.group("obj-schema-SeqMapTaskOutputInfo", () {
    unittest.test("to-json--from-json", () {
      var o = buildSeqMapTaskOutputInfo();
      var od = new api.SeqMapTaskOutputInfo.fromJson(o.toJson());
      checkSeqMapTaskOutputInfo(od);
    });
  });


  unittest.group("obj-schema-ShellTask", () {
    unittest.test("to-json--from-json", () {
      var o = buildShellTask();
      var od = new api.ShellTask.fromJson(o.toJson());
      checkShellTask(od);
    });
  });


  unittest.group("obj-schema-SideInputInfo", () {
    unittest.test("to-json--from-json", () {
      var o = buildSideInputInfo();
      var od = new api.SideInputInfo.fromJson(o.toJson());
      checkSideInputInfo(od);
    });
  });


  unittest.group("obj-schema-Sink", () {
    unittest.test("to-json--from-json", () {
      var o = buildSink();
      var od = new api.Sink.fromJson(o.toJson());
      checkSink(od);
    });
  });


  unittest.group("obj-schema-Source", () {
    unittest.test("to-json--from-json", () {
      var o = buildSource();
      var od = new api.Source.fromJson(o.toJson());
      checkSource(od);
    });
  });


  unittest.group("obj-schema-SourceFork", () {
    unittest.test("to-json--from-json", () {
      var o = buildSourceFork();
      var od = new api.SourceFork.fromJson(o.toJson());
      checkSourceFork(od);
    });
  });


  unittest.group("obj-schema-SourceGetMetadataRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSourceGetMetadataRequest();
      var od = new api.SourceGetMetadataRequest.fromJson(o.toJson());
      checkSourceGetMetadataRequest(od);
    });
  });


  unittest.group("obj-schema-SourceGetMetadataResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSourceGetMetadataResponse();
      var od = new api.SourceGetMetadataResponse.fromJson(o.toJson());
      checkSourceGetMetadataResponse(od);
    });
  });


  unittest.group("obj-schema-SourceMetadata", () {
    unittest.test("to-json--from-json", () {
      var o = buildSourceMetadata();
      var od = new api.SourceMetadata.fromJson(o.toJson());
      checkSourceMetadata(od);
    });
  });


  unittest.group("obj-schema-SourceOperationRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSourceOperationRequest();
      var od = new api.SourceOperationRequest.fromJson(o.toJson());
      checkSourceOperationRequest(od);
    });
  });


  unittest.group("obj-schema-SourceOperationResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSourceOperationResponse();
      var od = new api.SourceOperationResponse.fromJson(o.toJson());
      checkSourceOperationResponse(od);
    });
  });


  unittest.group("obj-schema-SourceSplitOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildSourceSplitOptions();
      var od = new api.SourceSplitOptions.fromJson(o.toJson());
      checkSourceSplitOptions(od);
    });
  });


  unittest.group("obj-schema-SourceSplitRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSourceSplitRequest();
      var od = new api.SourceSplitRequest.fromJson(o.toJson());
      checkSourceSplitRequest(od);
    });
  });


  unittest.group("obj-schema-SourceSplitResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSourceSplitResponse();
      var od = new api.SourceSplitResponse.fromJson(o.toJson());
      checkSourceSplitResponse(od);
    });
  });


  unittest.group("obj-schema-SourceSplitShard", () {
    unittest.test("to-json--from-json", () {
      var o = buildSourceSplitShard();
      var od = new api.SourceSplitShard.fromJson(o.toJson());
      checkSourceSplitShard(od);
    });
  });


  unittest.group("obj-schema-SplitInt64", () {
    unittest.test("to-json--from-json", () {
      var o = buildSplitInt64();
      var od = new api.SplitInt64.fromJson(o.toJson());
      checkSplitInt64(od);
    });
  });


  unittest.group("obj-schema-StateFamilyConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildStateFamilyConfig();
      var od = new api.StateFamilyConfig.fromJson(o.toJson());
      checkStateFamilyConfig(od);
    });
  });


  unittest.group("obj-schema-Status", () {
    unittest.test("to-json--from-json", () {
      var o = buildStatus();
      var od = new api.Status.fromJson(o.toJson());
      checkStatus(od);
    });
  });


  unittest.group("obj-schema-Step", () {
    unittest.test("to-json--from-json", () {
      var o = buildStep();
      var od = new api.Step.fromJson(o.toJson());
      checkStep(od);
    });
  });


  unittest.group("obj-schema-StreamLocation", () {
    unittest.test("to-json--from-json", () {
      var o = buildStreamLocation();
      var od = new api.StreamLocation.fromJson(o.toJson());
      checkStreamLocation(od);
    });
  });


  unittest.group("obj-schema-StreamingComputationConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildStreamingComputationConfig();
      var od = new api.StreamingComputationConfig.fromJson(o.toJson());
      checkStreamingComputationConfig(od);
    });
  });


  unittest.group("obj-schema-StreamingComputationRanges", () {
    unittest.test("to-json--from-json", () {
      var o = buildStreamingComputationRanges();
      var od = new api.StreamingComputationRanges.fromJson(o.toJson());
      checkStreamingComputationRanges(od);
    });
  });


  unittest.group("obj-schema-StreamingComputationTask", () {
    unittest.test("to-json--from-json", () {
      var o = buildStreamingComputationTask();
      var od = new api.StreamingComputationTask.fromJson(o.toJson());
      checkStreamingComputationTask(od);
    });
  });


  unittest.group("obj-schema-StreamingConfigTask", () {
    unittest.test("to-json--from-json", () {
      var o = buildStreamingConfigTask();
      var od = new api.StreamingConfigTask.fromJson(o.toJson());
      checkStreamingConfigTask(od);
    });
  });


  unittest.group("obj-schema-StreamingSetupTask", () {
    unittest.test("to-json--from-json", () {
      var o = buildStreamingSetupTask();
      var od = new api.StreamingSetupTask.fromJson(o.toJson());
      checkStreamingSetupTask(od);
    });
  });


  unittest.group("obj-schema-StreamingSideInputLocation", () {
    unittest.test("to-json--from-json", () {
      var o = buildStreamingSideInputLocation();
      var od = new api.StreamingSideInputLocation.fromJson(o.toJson());
      checkStreamingSideInputLocation(od);
    });
  });


  unittest.group("obj-schema-StreamingStageLocation", () {
    unittest.test("to-json--from-json", () {
      var o = buildStreamingStageLocation();
      var od = new api.StreamingStageLocation.fromJson(o.toJson());
      checkStreamingStageLocation(od);
    });
  });


  unittest.group("obj-schema-StringList", () {
    unittest.test("to-json--from-json", () {
      var o = buildStringList();
      var od = new api.StringList.fromJson(o.toJson());
      checkStringList(od);
    });
  });


  unittest.group("obj-schema-TaskRunnerSettings", () {
    unittest.test("to-json--from-json", () {
      var o = buildTaskRunnerSettings();
      var od = new api.TaskRunnerSettings.fromJson(o.toJson());
      checkTaskRunnerSettings(od);
    });
  });


  unittest.group("obj-schema-TopologyConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildTopologyConfig();
      var od = new api.TopologyConfig.fromJson(o.toJson());
      checkTopologyConfig(od);
    });
  });


  unittest.group("obj-schema-WorkItem", () {
    unittest.test("to-json--from-json", () {
      var o = buildWorkItem();
      var od = new api.WorkItem.fromJson(o.toJson());
      checkWorkItem(od);
    });
  });


  unittest.group("obj-schema-WorkItemServiceState", () {
    unittest.test("to-json--from-json", () {
      var o = buildWorkItemServiceState();
      var od = new api.WorkItemServiceState.fromJson(o.toJson());
      checkWorkItemServiceState(od);
    });
  });


  unittest.group("obj-schema-WorkItemStatus", () {
    unittest.test("to-json--from-json", () {
      var o = buildWorkItemStatus();
      var od = new api.WorkItemStatus.fromJson(o.toJson());
      checkWorkItemStatus(od);
    });
  });


  unittest.group("obj-schema-WorkerHealthReport", () {
    unittest.test("to-json--from-json", () {
      var o = buildWorkerHealthReport();
      var od = new api.WorkerHealthReport.fromJson(o.toJson());
      checkWorkerHealthReport(od);
    });
  });


  unittest.group("obj-schema-WorkerHealthReportResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildWorkerHealthReportResponse();
      var od = new api.WorkerHealthReportResponse.fromJson(o.toJson());
      checkWorkerHealthReportResponse(od);
    });
  });


  unittest.group("obj-schema-WorkerMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildWorkerMessage();
      var od = new api.WorkerMessage.fromJson(o.toJson());
      checkWorkerMessage(od);
    });
  });


  unittest.group("obj-schema-WorkerMessageCode", () {
    unittest.test("to-json--from-json", () {
      var o = buildWorkerMessageCode();
      var od = new api.WorkerMessageCode.fromJson(o.toJson());
      checkWorkerMessageCode(od);
    });
  });


  unittest.group("obj-schema-WorkerMessageResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildWorkerMessageResponse();
      var od = new api.WorkerMessageResponse.fromJson(o.toJson());
      checkWorkerMessageResponse(od);
    });
  });


  unittest.group("obj-schema-WorkerPool", () {
    unittest.test("to-json--from-json", () {
      var o = buildWorkerPool();
      var od = new api.WorkerPool.fromJson(o.toJson());
      checkWorkerPool(od);
    });
  });


  unittest.group("obj-schema-WorkerSettings", () {
    unittest.test("to-json--from-json", () {
      var o = buildWorkerSettings();
      var od = new api.WorkerSettings.fromJson(o.toJson());
      checkWorkerSettings(od);
    });
  });


  unittest.group("obj-schema-WriteInstruction", () {
    unittest.test("to-json--from-json", () {
      var o = buildWriteInstruction();
      var od = new api.WriteInstruction.fromJson(o.toJson());
      checkWriteInstruction(od);
    });
  });


  unittest.group("resource-ProjectsResourceApi", () {
    unittest.test("method--workerMessages", () {

      var mock = new HttpServerMock();
      api.ProjectsResourceApi res = new api.DataflowApi(mock).projects;
      var arg_request = buildSendWorkerMessagesRequest();
      var arg_projectId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.SendWorkerMessagesRequest.fromJson(json);
        checkSendWorkerMessagesRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1b3/projects/"));
        pathOffset += 14;
        index = path.indexOf("/WorkerMessages", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("/WorkerMessages"));
        pathOffset += 15;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildSendWorkerMessagesResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.workerMessages(arg_request, arg_projectId).then(unittest.expectAsync(((api.SendWorkerMessagesResponse response) {
        checkSendWorkerMessagesResponse(response);
      })));
    });

  });


  unittest.group("resource-ProjectsJobsResourceApi", () {
    unittest.test("method--create", () {

      var mock = new HttpServerMock();
      api.ProjectsJobsResourceApi res = new api.DataflowApi(mock).projects.jobs;
      var arg_request = buildJob();
      var arg_projectId = "foo";
      var arg_view = "foo";
      var arg_replaceJobId = "foo";
      var arg_location = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Job.fromJson(json);
        checkJob(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1b3/projects/"));
        pathOffset += 14;
        index = path.indexOf("/jobs", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 5), unittest.equals("/jobs"));
        pathOffset += 5;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["view"].first, unittest.equals(arg_view));
        unittest.expect(queryMap["replaceJobId"].first, unittest.equals(arg_replaceJobId));
        unittest.expect(queryMap["location"].first, unittest.equals(arg_location));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildJob());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.create(arg_request, arg_projectId, view: arg_view, replaceJobId: arg_replaceJobId, location: arg_location).then(unittest.expectAsync(((api.Job response) {
        checkJob(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.ProjectsJobsResourceApi res = new api.DataflowApi(mock).projects.jobs;
      var arg_projectId = "foo";
      var arg_jobId = "foo";
      var arg_view = "foo";
      var arg_location = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1b3/projects/"));
        pathOffset += 14;
        index = path.indexOf("/jobs/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("/jobs/"));
        pathOffset += 6;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_jobId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["view"].first, unittest.equals(arg_view));
        unittest.expect(queryMap["location"].first, unittest.equals(arg_location));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildJob());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_projectId, arg_jobId, view: arg_view, location: arg_location).then(unittest.expectAsync(((api.Job response) {
        checkJob(response);
      })));
    });

    unittest.test("method--getMetrics", () {

      var mock = new HttpServerMock();
      api.ProjectsJobsResourceApi res = new api.DataflowApi(mock).projects.jobs;
      var arg_projectId = "foo";
      var arg_jobId = "foo";
      var arg_startTime = "foo";
      var arg_location = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1b3/projects/"));
        pathOffset += 14;
        index = path.indexOf("/jobs/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("/jobs/"));
        pathOffset += 6;
        index = path.indexOf("/metrics", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_jobId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("/metrics"));
        pathOffset += 8;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["startTime"].first, unittest.equals(arg_startTime));
        unittest.expect(queryMap["location"].first, unittest.equals(arg_location));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildJobMetrics());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.getMetrics(arg_projectId, arg_jobId, startTime: arg_startTime, location: arg_location).then(unittest.expectAsync(((api.JobMetrics response) {
        checkJobMetrics(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.ProjectsJobsResourceApi res = new api.DataflowApi(mock).projects.jobs;
      var arg_projectId = "foo";
      var arg_filter = "foo";
      var arg_view = "foo";
      var arg_pageSize = 42;
      var arg_pageToken = "foo";
      var arg_location = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1b3/projects/"));
        pathOffset += 14;
        index = path.indexOf("/jobs", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 5), unittest.equals("/jobs"));
        pathOffset += 5;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(queryMap["view"].first, unittest.equals(arg_view));
        unittest.expect(core.int.parse(queryMap["pageSize"].first), unittest.equals(arg_pageSize));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["location"].first, unittest.equals(arg_location));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListJobsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_projectId, filter: arg_filter, view: arg_view, pageSize: arg_pageSize, pageToken: arg_pageToken, location: arg_location).then(unittest.expectAsync(((api.ListJobsResponse response) {
        checkListJobsResponse(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.ProjectsJobsResourceApi res = new api.DataflowApi(mock).projects.jobs;
      var arg_request = buildJob();
      var arg_projectId = "foo";
      var arg_jobId = "foo";
      var arg_location = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Job.fromJson(json);
        checkJob(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1b3/projects/"));
        pathOffset += 14;
        index = path.indexOf("/jobs/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("/jobs/"));
        pathOffset += 6;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_jobId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["location"].first, unittest.equals(arg_location));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildJob());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_projectId, arg_jobId, location: arg_location).then(unittest.expectAsync(((api.Job response) {
        checkJob(response);
      })));
    });

  });


  unittest.group("resource-ProjectsJobsDebugResourceApi", () {
    unittest.test("method--getConfig", () {

      var mock = new HttpServerMock();
      api.ProjectsJobsDebugResourceApi res = new api.DataflowApi(mock).projects.jobs.debug;
      var arg_request = buildGetDebugConfigRequest();
      var arg_projectId = "foo";
      var arg_jobId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.GetDebugConfigRequest.fromJson(json);
        checkGetDebugConfigRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1b3/projects/"));
        pathOffset += 14;
        index = path.indexOf("/jobs/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("/jobs/"));
        pathOffset += 6;
        index = path.indexOf("/debug/getConfig", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_jobId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16), unittest.equals("/debug/getConfig"));
        pathOffset += 16;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildGetDebugConfigResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.getConfig(arg_request, arg_projectId, arg_jobId).then(unittest.expectAsync(((api.GetDebugConfigResponse response) {
        checkGetDebugConfigResponse(response);
      })));
    });

    unittest.test("method--sendCapture", () {

      var mock = new HttpServerMock();
      api.ProjectsJobsDebugResourceApi res = new api.DataflowApi(mock).projects.jobs.debug;
      var arg_request = buildSendDebugCaptureRequest();
      var arg_projectId = "foo";
      var arg_jobId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.SendDebugCaptureRequest.fromJson(json);
        checkSendDebugCaptureRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1b3/projects/"));
        pathOffset += 14;
        index = path.indexOf("/jobs/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("/jobs/"));
        pathOffset += 6;
        index = path.indexOf("/debug/sendCapture", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_jobId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 18), unittest.equals("/debug/sendCapture"));
        pathOffset += 18;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildSendDebugCaptureResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.sendCapture(arg_request, arg_projectId, arg_jobId).then(unittest.expectAsync(((api.SendDebugCaptureResponse response) {
        checkSendDebugCaptureResponse(response);
      })));
    });

  });


  unittest.group("resource-ProjectsJobsMessagesResourceApi", () {
    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.ProjectsJobsMessagesResourceApi res = new api.DataflowApi(mock).projects.jobs.messages;
      var arg_projectId = "foo";
      var arg_jobId = "foo";
      var arg_minimumImportance = "foo";
      var arg_pageSize = 42;
      var arg_pageToken = "foo";
      var arg_startTime = "foo";
      var arg_endTime = "foo";
      var arg_location = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1b3/projects/"));
        pathOffset += 14;
        index = path.indexOf("/jobs/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("/jobs/"));
        pathOffset += 6;
        index = path.indexOf("/messages", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_jobId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/messages"));
        pathOffset += 9;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["minimumImportance"].first, unittest.equals(arg_minimumImportance));
        unittest.expect(core.int.parse(queryMap["pageSize"].first), unittest.equals(arg_pageSize));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["startTime"].first, unittest.equals(arg_startTime));
        unittest.expect(queryMap["endTime"].first, unittest.equals(arg_endTime));
        unittest.expect(queryMap["location"].first, unittest.equals(arg_location));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListJobMessagesResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_projectId, arg_jobId, minimumImportance: arg_minimumImportance, pageSize: arg_pageSize, pageToken: arg_pageToken, startTime: arg_startTime, endTime: arg_endTime, location: arg_location).then(unittest.expectAsync(((api.ListJobMessagesResponse response) {
        checkListJobMessagesResponse(response);
      })));
    });

  });


  unittest.group("resource-ProjectsJobsWorkItemsResourceApi", () {
    unittest.test("method--lease", () {

      var mock = new HttpServerMock();
      api.ProjectsJobsWorkItemsResourceApi res = new api.DataflowApi(mock).projects.jobs.workItems;
      var arg_request = buildLeaseWorkItemRequest();
      var arg_projectId = "foo";
      var arg_jobId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.LeaseWorkItemRequest.fromJson(json);
        checkLeaseWorkItemRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1b3/projects/"));
        pathOffset += 14;
        index = path.indexOf("/jobs/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("/jobs/"));
        pathOffset += 6;
        index = path.indexOf("/workItems:lease", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_jobId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16), unittest.equals("/workItems:lease"));
        pathOffset += 16;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildLeaseWorkItemResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.lease(arg_request, arg_projectId, arg_jobId).then(unittest.expectAsync(((api.LeaseWorkItemResponse response) {
        checkLeaseWorkItemResponse(response);
      })));
    });

    unittest.test("method--reportStatus", () {

      var mock = new HttpServerMock();
      api.ProjectsJobsWorkItemsResourceApi res = new api.DataflowApi(mock).projects.jobs.workItems;
      var arg_request = buildReportWorkItemStatusRequest();
      var arg_projectId = "foo";
      var arg_jobId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.ReportWorkItemStatusRequest.fromJson(json);
        checkReportWorkItemStatusRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1b3/projects/"));
        pathOffset += 14;
        index = path.indexOf("/jobs/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("/jobs/"));
        pathOffset += 6;
        index = path.indexOf("/workItems:reportStatus", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_jobId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 23), unittest.equals("/workItems:reportStatus"));
        pathOffset += 23;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildReportWorkItemStatusResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.reportStatus(arg_request, arg_projectId, arg_jobId).then(unittest.expectAsync(((api.ReportWorkItemStatusResponse response) {
        checkReportWorkItemStatusResponse(response);
      })));
    });

  });


  unittest.group("resource-ProjectsLocationsJobsResourceApi", () {
    unittest.test("method--create", () {

      var mock = new HttpServerMock();
      api.ProjectsLocationsJobsResourceApi res = new api.DataflowApi(mock).projects.locations.jobs;
      var arg_request = buildJob();
      var arg_projectId = "foo";
      var arg_location = "foo";
      var arg_view = "foo";
      var arg_replaceJobId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Job.fromJson(json);
        checkJob(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1b3/projects/"));
        pathOffset += 14;
        index = path.indexOf("/locations/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/locations/"));
        pathOffset += 11;
        index = path.indexOf("/jobs", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_location"));
        unittest.expect(path.substring(pathOffset, pathOffset + 5), unittest.equals("/jobs"));
        pathOffset += 5;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["view"].first, unittest.equals(arg_view));
        unittest.expect(queryMap["replaceJobId"].first, unittest.equals(arg_replaceJobId));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildJob());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.create(arg_request, arg_projectId, arg_location, view: arg_view, replaceJobId: arg_replaceJobId).then(unittest.expectAsync(((api.Job response) {
        checkJob(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.ProjectsLocationsJobsResourceApi res = new api.DataflowApi(mock).projects.locations.jobs;
      var arg_projectId = "foo";
      var arg_location = "foo";
      var arg_jobId = "foo";
      var arg_view = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1b3/projects/"));
        pathOffset += 14;
        index = path.indexOf("/locations/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/locations/"));
        pathOffset += 11;
        index = path.indexOf("/jobs/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_location"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("/jobs/"));
        pathOffset += 6;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_jobId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["view"].first, unittest.equals(arg_view));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildJob());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_projectId, arg_location, arg_jobId, view: arg_view).then(unittest.expectAsync(((api.Job response) {
        checkJob(response);
      })));
    });

    unittest.test("method--getMetrics", () {

      var mock = new HttpServerMock();
      api.ProjectsLocationsJobsResourceApi res = new api.DataflowApi(mock).projects.locations.jobs;
      var arg_projectId = "foo";
      var arg_location = "foo";
      var arg_jobId = "foo";
      var arg_startTime = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1b3/projects/"));
        pathOffset += 14;
        index = path.indexOf("/locations/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/locations/"));
        pathOffset += 11;
        index = path.indexOf("/jobs/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_location"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("/jobs/"));
        pathOffset += 6;
        index = path.indexOf("/metrics", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_jobId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("/metrics"));
        pathOffset += 8;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["startTime"].first, unittest.equals(arg_startTime));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildJobMetrics());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.getMetrics(arg_projectId, arg_location, arg_jobId, startTime: arg_startTime).then(unittest.expectAsync(((api.JobMetrics response) {
        checkJobMetrics(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.ProjectsLocationsJobsResourceApi res = new api.DataflowApi(mock).projects.locations.jobs;
      var arg_projectId = "foo";
      var arg_location = "foo";
      var arg_filter = "foo";
      var arg_view = "foo";
      var arg_pageSize = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1b3/projects/"));
        pathOffset += 14;
        index = path.indexOf("/locations/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/locations/"));
        pathOffset += 11;
        index = path.indexOf("/jobs", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_location"));
        unittest.expect(path.substring(pathOffset, pathOffset + 5), unittest.equals("/jobs"));
        pathOffset += 5;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(queryMap["view"].first, unittest.equals(arg_view));
        unittest.expect(core.int.parse(queryMap["pageSize"].first), unittest.equals(arg_pageSize));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListJobsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_projectId, arg_location, filter: arg_filter, view: arg_view, pageSize: arg_pageSize, pageToken: arg_pageToken).then(unittest.expectAsync(((api.ListJobsResponse response) {
        checkListJobsResponse(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.ProjectsLocationsJobsResourceApi res = new api.DataflowApi(mock).projects.locations.jobs;
      var arg_request = buildJob();
      var arg_projectId = "foo";
      var arg_location = "foo";
      var arg_jobId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Job.fromJson(json);
        checkJob(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1b3/projects/"));
        pathOffset += 14;
        index = path.indexOf("/locations/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/locations/"));
        pathOffset += 11;
        index = path.indexOf("/jobs/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_location"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("/jobs/"));
        pathOffset += 6;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_jobId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildJob());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_projectId, arg_location, arg_jobId).then(unittest.expectAsync(((api.Job response) {
        checkJob(response);
      })));
    });

  });


  unittest.group("resource-ProjectsLocationsJobsMessagesResourceApi", () {
    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.ProjectsLocationsJobsMessagesResourceApi res = new api.DataflowApi(mock).projects.locations.jobs.messages;
      var arg_projectId = "foo";
      var arg_location = "foo";
      var arg_jobId = "foo";
      var arg_minimumImportance = "foo";
      var arg_pageSize = 42;
      var arg_pageToken = "foo";
      var arg_startTime = "foo";
      var arg_endTime = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1b3/projects/"));
        pathOffset += 14;
        index = path.indexOf("/locations/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/locations/"));
        pathOffset += 11;
        index = path.indexOf("/jobs/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_location"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("/jobs/"));
        pathOffset += 6;
        index = path.indexOf("/messages", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_jobId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/messages"));
        pathOffset += 9;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["minimumImportance"].first, unittest.equals(arg_minimumImportance));
        unittest.expect(core.int.parse(queryMap["pageSize"].first), unittest.equals(arg_pageSize));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["startTime"].first, unittest.equals(arg_startTime));
        unittest.expect(queryMap["endTime"].first, unittest.equals(arg_endTime));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListJobMessagesResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_projectId, arg_location, arg_jobId, minimumImportance: arg_minimumImportance, pageSize: arg_pageSize, pageToken: arg_pageToken, startTime: arg_startTime, endTime: arg_endTime).then(unittest.expectAsync(((api.ListJobMessagesResponse response) {
        checkListJobMessagesResponse(response);
      })));
    });

  });


  unittest.group("resource-ProjectsLocationsJobsWorkItemsResourceApi", () {
    unittest.test("method--lease", () {

      var mock = new HttpServerMock();
      api.ProjectsLocationsJobsWorkItemsResourceApi res = new api.DataflowApi(mock).projects.locations.jobs.workItems;
      var arg_request = buildLeaseWorkItemRequest();
      var arg_projectId = "foo";
      var arg_location = "foo";
      var arg_jobId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.LeaseWorkItemRequest.fromJson(json);
        checkLeaseWorkItemRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1b3/projects/"));
        pathOffset += 14;
        index = path.indexOf("/locations/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/locations/"));
        pathOffset += 11;
        index = path.indexOf("/jobs/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_location"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("/jobs/"));
        pathOffset += 6;
        index = path.indexOf("/workItems:lease", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_jobId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16), unittest.equals("/workItems:lease"));
        pathOffset += 16;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildLeaseWorkItemResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.lease(arg_request, arg_projectId, arg_location, arg_jobId).then(unittest.expectAsync(((api.LeaseWorkItemResponse response) {
        checkLeaseWorkItemResponse(response);
      })));
    });

    unittest.test("method--reportStatus", () {

      var mock = new HttpServerMock();
      api.ProjectsLocationsJobsWorkItemsResourceApi res = new api.DataflowApi(mock).projects.locations.jobs.workItems;
      var arg_request = buildReportWorkItemStatusRequest();
      var arg_projectId = "foo";
      var arg_location = "foo";
      var arg_jobId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.ReportWorkItemStatusRequest.fromJson(json);
        checkReportWorkItemStatusRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1b3/projects/"));
        pathOffset += 14;
        index = path.indexOf("/locations/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/locations/"));
        pathOffset += 11;
        index = path.indexOf("/jobs/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_location"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("/jobs/"));
        pathOffset += 6;
        index = path.indexOf("/workItems:reportStatus", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_jobId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 23), unittest.equals("/workItems:reportStatus"));
        pathOffset += 23;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildReportWorkItemStatusResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.reportStatus(arg_request, arg_projectId, arg_location, arg_jobId).then(unittest.expectAsync(((api.ReportWorkItemStatusResponse response) {
        checkReportWorkItemStatusResponse(response);
      })));
    });

  });


  unittest.group("resource-ProjectsTemplatesResourceApi", () {
    unittest.test("method--create", () {

      var mock = new HttpServerMock();
      api.ProjectsTemplatesResourceApi res = new api.DataflowApi(mock).projects.templates;
      var arg_request = buildCreateJobFromTemplateRequest();
      var arg_projectId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.CreateJobFromTemplateRequest.fromJson(json);
        checkCreateJobFromTemplateRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1b3/projects/"));
        pathOffset += 14;
        index = path.indexOf("/templates", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("/templates"));
        pathOffset += 10;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildJob());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.create(arg_request, arg_projectId).then(unittest.expectAsync(((api.Job response) {
        checkJob(response);
      })));
    });

  });


}

