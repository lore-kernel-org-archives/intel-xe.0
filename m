Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42585CDB474
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 17:37:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEC610E194;
	Tue, 17 Oct 2023 17:37:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C236E10E189;
 Tue, 17 Oct 2023 17:37:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id BC94BAADD7;
 Tue, 17 Oct 2023 17:37:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1627996360509798658=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 17 Oct 2023 17:37:05 -0000
Message-ID: <169756422574.14380.747262848009509364@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231017163243.14112-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231017163243.14112-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_xe/xe=5Fb?=
 =?utf-8?q?o=3A_Reject_bo_creation_of_unaligned_size_=28rev2=29?=
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

--===============1627996360509798658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe/xe_bo: Reject bo creation of unaligned size (rev2)
URL   : https://patchwork.freedesktop.org/series/116419/
State : failure

== Summary ==

CI Bug Log - changes from xe-440-b87b8637576a00e513f995952fcc891f3d154f5d_BAT -> xe-pw-116419v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-116419v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-116419v2_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-116419v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] +4 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-440-b87b8637576a00e513f995952fcc891f3d154f5d/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-116419v2/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-atsm-2:         [PASS][3] -> [FAIL][4] +4 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-440-b87b8637576a00e513f995952fcc891f3d154f5d/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-116419v2/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit}:
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-440-b87b8637576a00e513f995952fcc891f3d154f5d/bat-dg2-oem2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-116419v2/bat-dg2-oem2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html
    - bat-atsm-2:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-440-b87b8637576a00e513f995952fcc891f3d154f5d/bat-atsm-2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-116419v2/bat-atsm-2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html

  
Known issues
------------

  Here are the changes found in xe-pw-116419v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][9] -> [FAIL][10] ([Intel XE#480]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-440-b87b8637576a00e513f995952fcc891f3d154f5d/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-116419v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][11] -> [FAIL][12] ([Intel XE#750])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-440-b87b8637576a00e513f995952fcc891f3d154f5d/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-116419v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/750


Build changes
-------------

  * Linux: xe-440-b87b8637576a00e513f995952fcc891f3d154f5d -> xe-pw-116419v2

  IGT_7543: 688f12831f876590e084e9b13b4d5ab85fe13d51 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-440-b87b8637576a00e513f995952fcc891f3d154f5d: b87b8637576a00e513f995952fcc891f3d154f5d
  xe-pw-116419v2: 116419v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-116419v2/index.html

--===============1627996360509798658==
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
<tr><td><b>Series:</b></td><td>xe/xe_bo: Reject bo creation of unaligned size (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/116419/">https://patchwork.freedesktop.org/series/116419/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-116419v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-116419v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-440-b87b8637576a00e513f995952fcc891f3d154f5d_BAT -&gt; xe-pw-116419v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-116419v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-116419v2_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-116419v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-440-b87b8637576a00e513f995952fcc891f3d154f5d/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-116419v2/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-440-b87b8637576a00e513f995952fcc891f3d154f5d/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-116419v2/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit}:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-440-b87b8637576a00e513f995952fcc891f3d154f5d/bat-dg2-oem2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-116419v2/bat-dg2-oem2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html">FAIL</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-440-b87b8637576a00e513f995952fcc891f3d154f5d/bat-atsm-2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-116419v2/bat-atsm-2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-116419v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-440-b87b8637576a00e513f995952fcc891f3d154f5d/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-116419v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-440-b87b8637576a00e513f995952fcc891f3d154f5d/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-116419v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/750">Intel XE#750</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-440-b87b8637576a00e513f995952fcc891f3d154f5d -&gt; xe-pw-116419v2</li>
</ul>
<p>IGT_7543: 688f12831f876590e084e9b13b4d5ab85fe13d51 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-440-b87b8637576a00e513f995952fcc891f3d154f5d: b87b8637576a00e513f995952fcc891f3d154f5d<br />
  xe-pw-116419v2: 116419v2</p>

</body>
</html>

--===============1627996360509798658==--
