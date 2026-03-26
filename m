Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23628106F31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 10:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEC010E0E2;
	Thu, 26 Mar 2026 10:28:44 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDE810E05F;
 Thu, 26 Mar 2026 10:28:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3201953085258845188=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/gpusvm=3A_Reject_VMAs_?=
 =?utf-8?q?with_VM=5FIO_or_VM=5FPFNMAP_when_creating_SVM_ranges?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Mar 2026 10:28:43 -0000
Message-ID: <177452092356.401031.11837782358482853926@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260325231608.25581-1-matthew.brost@intel.com>
In-Reply-To: <20260325231608.25581-1-matthew.brost@intel.com>
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

--===============3201953085258845188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/gpusvm: Reject VMAs with VM_IO or VM_PFNMAP when creating SVM ranges
URL   : https://patchwork.freedesktop.org/series/163880/
State : success

== Summary ==

CI Bug Log - changes from xe-4785-ec0484d20b9f962d04a62ff1feb03676c3ce7611_FULL -> xe-pw-163880v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-163880v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#7340])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4785-ec0484d20b9f962d04a62ff1feb03676c3ce7611/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163880v1/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#5625])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4785-ec0484d20b9f962d04a62ff1feb03676c3ce7611/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163880v1/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][5] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4785-ec0484d20b9f962d04a62ff1feb03676c3ce7611/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163880v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][7] ([Intel XE#7340]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4785-ec0484d20b9f962d04a62ff1feb03676c3ce7611/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163880v1/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html

  
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340


Build changes
-------------

  * IGT: IGT_8827 -> IGT_8829
  * Linux: xe-4785-ec0484d20b9f962d04a62ff1feb03676c3ce7611 -> xe-pw-163880v1

  IGT_8827: 8827
  IGT_8829: 8829
  xe-4785-ec0484d20b9f962d04a62ff1feb03676c3ce7611: ec0484d20b9f962d04a62ff1feb03676c3ce7611
  xe-pw-163880v1: 163880v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163880v1/index.html

--===============3201953085258845188==
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
<tr><td><b>Series:</b></td><td>drm/gpusvm: Reject VMAs with VM_IO or VM_PFNMAP when creating SVM ranges</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163880/">https://patchwork.freedesktop.org/series/163880/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163880v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163880v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4785-ec0484d20b9f962d04a62ff1feb03676c3ce7611_FULL -&gt; xe-pw-163880v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163880v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4785-ec0484d20b9f962d04a62ff1feb03676c3ce7611/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163880v1/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4785-ec0484d20b9f962d04a62ff1feb03676c3ce7611/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163880v1/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4785-ec0484d20b9f962d04a62ff1feb03676c3ce7611/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163880v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4785-ec0484d20b9f962d04a62ff1feb03676c3ce7611/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163880v1/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8827 -&gt; IGT_8829</li>
<li>Linux: xe-4785-ec0484d20b9f962d04a62ff1feb03676c3ce7611 -&gt; xe-pw-163880v1</li>
</ul>
<p>IGT_8827: 8827<br />
  IGT_8829: 8829<br />
  xe-4785-ec0484d20b9f962d04a62ff1feb03676c3ce7611: ec0484d20b9f962d04a62ff1feb03676c3ce7611<br />
  xe-pw-163880v1: 163880v1</p>

</body>
</html>

--===============3201953085258845188==--
