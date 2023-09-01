Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CD1CA0FE6
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 08:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4BA10E73F;
	Fri,  1 Sep 2023 08:12:01 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 90DB510E73F;
 Fri,  1 Sep 2023 08:11:59 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 88C7CAADE1;
 Fri,  1 Sep 2023 08:11:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5852230664773644606=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Date: Fri, 01 Sep 2023 08:11:59 -0000
Message-ID: <169355591952.9813.8974896536338177253@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230901070648.1100049-1-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20230901070648.1100049-1-aravind.iddamsetty@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/pm?=
 =?utf-8?q?u=3A_Enable_PMU_interface_=28rev6=29?=
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

--===============5852230664773644606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pmu: Enable PMU interface (rev6)
URL   : https://patchwork.freedesktop.org/series/119504/
State : failure

== Summary ==

CI Bug Log - changes from xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505_BAT -> xe-pw-119504v6_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-119504v6_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-119504v6_BAT, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-119504v6_BAT:

### IGT changes ###

#### Warnings ####

  * igt@xe_exec_fault_mode@many-basic:
    - bat-dg2-oem2:       [SKIP][1] ([Intel XE#288]) -> [SKIP][2] +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_exec_fault_mode@twice-userptr:
    - bat-adlp-7:         [SKIP][3] ([Intel XE#288]) -> [SKIP][4] +17 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         [SKIP][5] ([Intel XE#288]) -> [SKIP][6] +17 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr}:
    - bat-adlp-7:         [SKIP][7] ([Intel XE#288]) -> [SKIP][8] +14 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:
    - bat-dg2-oem2:       [SKIP][9] ([Intel XE#288]) -> [SKIP][10] +14 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind}:
    - bat-atsm-2:         [SKIP][11] ([Intel XE#288]) -> [SKIP][12] +14 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-119504v6_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-dg2-oem2:       [PASS][13] -> [TIMEOUT][14] ([Intel XE#529]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3:
    - bat-dg2-oem2:       [PASS][15] -> [INCOMPLETE][16] ([Intel XE#529]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [FAIL][17] ([Intel XE#480]) -> [PASS][18] +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][19] ([Intel XE#400]) -> [DMESG-FAIL][20] ([Intel XE#530]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#529]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/529
  [Intel XE#530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/530


Build changes
-------------

  * IGT: IGT_7460 -> IGT_7463
  * Linux: xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505 -> xe-pw-119504v6

  IGT_7460: 30b4034ea562952039ba6af58106791d5c39999e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7463: 7463
  xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505: bca3262d221e1402c03a89bb4ba520d6aa610505
  xe-pw-119504v6: 119504v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/index.html

--===============5852230664773644606==
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
<tr><td><b>Series:</b></td><td>drm/xe/pmu: Enable PMU interface (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/119504/">https://patchwork.freedesktop.org/series/119504/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505_BAT -&gt; xe-pw-119504v6_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-119504v6_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-119504v6_BAT, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-119504v6_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">SKIP</a> +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> +17 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> +14 similar issues</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> +14 similar issues</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">SKIP</a> +14 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-119504v6_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/529">Intel XE#529</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/529">Intel XE#529</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-119504v6/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/530">Intel XE#530</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7460 -&gt; IGT_7463</li>
<li>Linux: xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505 -&gt; xe-pw-119504v6</li>
</ul>
<p>IGT_7460: 30b4034ea562952039ba6af58106791d5c39999e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7463: 7463<br />
  xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505: bca3262d221e1402c03a89bb4ba520d6aa610505<br />
  xe-pw-119504v6: 119504v6</p>

</body>
</html>

--===============5852230664773644606==--
