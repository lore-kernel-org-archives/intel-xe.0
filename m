Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DF3CDB474
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 00:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7787710E34C;
	Wed, 18 Oct 2023 00:06:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A943C10E34C;
 Wed, 18 Oct 2023 00:06:33 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A2487AADD5;
 Wed, 18 Oct 2023 00:06:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0523994115633213070=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Wed, 18 Oct 2023 00:06:33 -0000
Message-ID: <169758759362.15107.11345580083561443916@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231017231843.1790243-5-matthew.d.roper@intel.com>
In-Reply-To: <20231017231843.1790243-5-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Emit_SVG_?=
 =?utf-8?q?3DSTATE_during_LRC_init?=
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============0523994115633213070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Emit SVG 3DSTATE during LRC init
URL   : https://patchwork.freedesktop.org/series/125255/
State : failure

== Summary ==

CI Bug Log - changes from xe-441-4d039d7be23937e2b498ed783aa5b0d8801b377b_BAT -> xe-pw-125255v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-125255v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-125255v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-125255v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - bat-pvc-2:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html

  
Known issues
------------

  Here are the changes found in xe-pw-125255v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [FAIL][2] ([Intel XE#480]) -> [PASS][3] +1 other test pass
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-441-4d039d7be23937e2b498ed783aa5b0d8801b377b/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [FAIL][4] ([Intel XE#480]) -> [PASS][5] +1 other test pass
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-441-4d039d7be23937e2b498ed783aa5b0d8801b377b/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * Linux: xe-441-4d039d7be23937e2b498ed783aa5b0d8801b377b -> xe-pw-125255v1

  IGT_7543: 688f12831f876590e084e9b13b4d5ab85fe13d51 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-441-4d039d7be23937e2b498ed783aa5b0d8801b377b: 4d039d7be23937e2b498ed783aa5b0d8801b377b
  xe-pw-125255v1: 125255v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v1/index.html

--===============0523994115633213070==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Emit SVG 3DSTATE during LRC init</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125255/">https://patchwork.freedesktop.org/series/125255/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-441-4d039d7be23937e2b498ed783aa5b0d8801b377b_BAT -&gt; xe-pw-125255v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-125255v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-125255v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-125255v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-invalid-fault:<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-125255v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-441-4d039d7be23937e2b498ed783aa5b0d8801b377b/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-441-4d039d7be23937e2b498ed783aa5b0d8801b377b/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-441-4d039d7be23937e2b498ed783aa5b0d8801b377b -&gt; xe-pw-125255v1</li>
</ul>
<p>IGT_7543: 688f12831f876590e084e9b13b4d5ab85fe13d51 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-441-4d039d7be23937e2b498ed783aa5b0d8801b377b: 4d039d7be23937e2b498ed783aa5b0d8801b377b<br />
  xe-pw-125255v1: 125255v1</p>

</body>
</html>

--===============0523994115633213070==--
