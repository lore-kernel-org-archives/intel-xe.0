Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B62C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 05:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED3E10E323;
	Fri, 15 Dec 2023 05:55:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 28EF710E31C;
 Fri, 15 Dec 2023 05:55:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 224CEA3ECB;
 Fri, 15 Dec 2023 05:55:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6093351667387029172=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Add_wait_for_completio?=
 =?utf-8?q?n_after_gt_force_reset?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Date: Fri, 15 Dec 2023 05:55:37 -0000
Message-ID: <170261973711.27831.15041169338674520512@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231215051541.2536859-1-karthik.poosa@intel.com>
In-Reply-To: <20231215051541.2536859-1-karthik.poosa@intel.com>
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

--===============6093351667387029172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add wait for completion after gt force reset
URL   : https://patchwork.freedesktop.org/series/127855/
State : success

== Summary ==

CI Bug Log - changes from xe-579-6154a8abd3c0766b93740feb7e0268ae3f425849_BAT -> xe-pw-127855v1_BAT
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

  Here are the changes found in xe-pw-127855v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-3:
    - bat-dg2-oem2:       [PASS][1] -> [DMESG-WARN][2] ([Intel XE#1033]) +5 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-579-6154a8abd3c0766b93740feb7e0268ae3f425849/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127855v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-3.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [FAIL][3] ([Intel XE#480]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-579-6154a8abd3c0766b93740feb7e0268ae3f425849/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127855v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@xe_create@create-execqueues-leak:
    - bat-atsm-2:         [FAIL][5] ([Intel XE#524]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-579-6154a8abd3c0766b93740feb7e0268ae3f425849/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127855v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-atsm-2:         [FAIL][7] ([Intel XE#999]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-579-6154a8abd3c0766b93740feb7e0268ae3f425849/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127855v1/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][9] ([Intel XE#400] / [Intel XE#616]) -> [DMESG-FAIL][10] ([Intel XE#1033]) +1 other test dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-579-6154a8abd3c0766b93740feb7e0268ae3f425849/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127855v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999


Build changes
-------------

  * Linux: xe-579-6154a8abd3c0766b93740feb7e0268ae3f425849 -> xe-pw-127855v1

  IGT_7643: ced22f8bf4263ff395dc852c86b682e62a7a1c1b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-579-6154a8abd3c0766b93740feb7e0268ae3f425849: 6154a8abd3c0766b93740feb7e0268ae3f425849
  xe-pw-127855v1: 127855v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127855v1/index.html

--===============6093351667387029172==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add wait for completion after gt force reset</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127855/">https://patchwork.freedesktop.org/series/127855/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127855v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127855v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-579-6154a8abd3c0766b93740feb7e0268ae3f425849_BAT -&gt; xe-pw-127855v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127855v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-3:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-579-6154a8abd3c0766b93740feb7e0268ae3f425849/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127855v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-579-6154a8abd3c0766b93740feb7e0268ae3f425849/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127855v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-execqueues-leak:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-579-6154a8abd3c0766b93740feb7e0268ae3f425849/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127855v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-579-6154a8abd3c0766b93740feb7e0268ae3f425849/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127855v1/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-579-6154a8abd3c0766b93740feb7e0268ae3f425849/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127855v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-579-6154a8abd3c0766b93740feb7e0268ae3f425849 -&gt; xe-pw-127855v1</li>
</ul>
<p>IGT_7643: ced22f8bf4263ff395dc852c86b682e62a7a1c1b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-579-6154a8abd3c0766b93740feb7e0268ae3f425849: 6154a8abd3c0766b93740feb7e0268ae3f425849<br />
  xe-pw-127855v1: 127855v1</p>

</body>
</html>

--===============6093351667387029172==--
