Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7AACDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 11:46:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6168C10E3CF;
	Wed, 18 Oct 2023 11:46:14 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4349610E3D3;
 Wed, 18 Oct 2023 11:46:12 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 38379A02F0;
 Wed, 18 Oct 2023 11:46:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6590957529816100541=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Wed, 18 Oct 2023 11:46:12 -0000
Message-ID: <169762957222.15108.15472468293432589180@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231018103603.1814906-1-tejas.upadhyay@intel.com>
In-Reply-To: <20231018103603.1814906-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_Count_and_report_low_level_driver_errors_=28rev9=29?=
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

--===============6590957529816100541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Count and report low level driver errors (rev9)
URL   : https://patchwork.freedesktop.org/series/124026/
State : success

== Summary ==

CI Bug Log - changes from xe-441-4d039d7be23937e2b498ed783aa5b0d8801b377b_BAT -> xe-pw-124026v9_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-124026v9_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - bat-pvc-2:          NOTRUN -> [INCOMPLETE][1] ([Intel XE#613] / [Intel XE#814])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v9/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [FAIL][2] ([Intel XE#480]) -> [PASS][3] +1 other test pass
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-441-4d039d7be23937e2b498ed783aa5b0d8801b377b/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v9/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/613
  [Intel XE#814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/814


Build changes
-------------

  * Linux: xe-441-4d039d7be23937e2b498ed783aa5b0d8801b377b -> xe-pw-124026v9

  IGT_7543: 688f12831f876590e084e9b13b4d5ab85fe13d51 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-441-4d039d7be23937e2b498ed783aa5b0d8801b377b: 4d039d7be23937e2b498ed783aa5b0d8801b377b
  xe-pw-124026v9: 124026v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v9/index.html

--===============6590957529816100541==
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
<tr><td><b>Series:</b></td><td>drm/xe: Count and report low level driver errors (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124026/">https://patchwork.freedesktop.org/series/124026/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v9/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-441-4d039d7be23937e2b498ed783aa5b0d8801b377b_BAT -&gt; xe-pw-124026v9_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-124026v9_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-invalid-fault:<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v9/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/613">Intel XE#613</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/814">Intel XE#814</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-441-4d039d7be23937e2b498ed783aa5b0d8801b377b/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v9/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-441-4d039d7be23937e2b498ed783aa5b0d8801b377b -&gt; xe-pw-124026v9</li>
</ul>
<p>IGT_7543: 688f12831f876590e084e9b13b4d5ab85fe13d51 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-441-4d039d7be23937e2b498ed783aa5b0d8801b377b: 4d039d7be23937e2b498ed783aa5b0d8801b377b<br />
  xe-pw-124026v9: 124026v9</p>

</body>
</html>

--===============6590957529816100541==--
