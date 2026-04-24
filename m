Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24A9FE5202
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 11:29:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1520B10F509;
	Fri, 24 Apr 2026 11:29:14 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C27F10F509;
 Fri, 24 Apr 2026 11:29:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7649978260407648336=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_AS_SDP_cleanups_and_additio?=
 =?utf-8?q?ns_for_Panel_Replay_+_VRR?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Apr 2026 11:29:13 -0000
Message-ID: <177703015310.7958.10892175446202621570@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260424093424.3060805-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260424093424.3060805-1-ankit.k.nautiyal@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============7649978260407648336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: AS SDP cleanups and additions for Panel Replay + VRR
URL   : https://patchwork.freedesktop.org/series/165419/
State : success

== Summary ==

CI Bug Log - changes from xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e_BAT -> xe-pw-165419v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 13)
------------------------------

  Additional (1): bat-bmg-3 

Known issues
------------

  Here are the changes found in xe-pw-165419v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#7483])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * igt@xe_create@multigpu-create-massive-size:
    - bat-bmg-3:          NOTRUN -> [SKIP][3] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - bat-bmg-3:          NOTRUN -> [SKIP][4] ([Intel XE#2322] / [Intel XE#7372]) +53 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_multigpu_svm@mgpu-latency-prefetch:
    - bat-bmg-3:          NOTRUN -> [SKIP][5] ([Intel XE#6964]) +20 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html

  * igt@xe_peer2peer@read:
    - bat-bmg-3:          NOTRUN -> [SKIP][6] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/bat-bmg-3/igt@xe_peer2peer@read.html

  * igt@xe_query@multigpu-query-pxp-status:
    - bat-bmg-3:          NOTRUN -> [SKIP][7] ([Intel XE#944]) +16 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/bat-bmg-3/igt@xe_query@multigpu-query-pxp-status.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][8] ([Intel XE#7483]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e -> xe-pw-165419v1

  IGT_8872: e70db143b7bafe09bdea4d33188cb10d2070d0e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e: 15ccea1aede9d776f85ed002cf0df3c8ea8bd81e
  xe-pw-165419v1: 165419v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/index.html

--===============7649978260407648336==
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
<tr><td><b>Series:</b></td><td>AS SDP cleanups and additions for Panel Replay + VRR</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165419/">https://patchwork.freedesktop.org/series/165419/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e_BAT -&gt; xe-pw-165419v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 13)</h2>
<p>Additional (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-165419v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#7350</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-prefetch:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/bat-bmg-3/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/bat-bmg-3/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +16 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e -&gt; xe-pw-165419v1</li>
</ul>
<p>IGT_8872: e70db143b7bafe09bdea4d33188cb10d2070d0e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e: 15ccea1aede9d776f85ed002cf0df3c8ea8bd81e<br />
  xe-pw-165419v1: 165419v1</p>

</body>
</html>

--===============7649978260407648336==--
