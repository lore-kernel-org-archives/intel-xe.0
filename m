Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFACCC8303F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 19:12:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BB410E034;
	Thu, 28 Aug 2025 19:12:46 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8752C10E034;
 Thu, 28 Aug 2025 19:12:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2811488586764391956=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Attempt_to_bring_?=
 =?utf-8?q?bos_back_to_VRAM_after_eviction?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Aug 2025 19:12:45 -0000
Message-ID: <175640836554.280646.4537605270418569382@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250828154219.4889-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250828154219.4889-1-thomas.hellstrom@linux.intel.com>
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

--===============2811488586764391956==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Attempt to bring bos back to VRAM after eviction
URL   : https://patchwork.freedesktop.org/series/153648/
State : failure

== Summary ==

CI Bug Log - changes from xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97_BAT -> xe-pw-153648v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-153648v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-153648v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-153648v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/bat-dg2-oem2/igt@xe_live_ktest@xe_dma_buf.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153648v1/bat-dg2-oem2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:
    - bat-atsm-2:         [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153648v1/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html

  
Known issues
------------

  Here are the changes found in xe-pw-153648v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [PASS][5] -> [FAIL][6] ([Intel XE#2909]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153648v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
    - bat-bmg-1:          [PASS][7] -> [FAIL][8] ([Intel XE#2909]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153648v1/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@d-edp1:
    - bat-adlp-7:         [DMESG-WARN][9] ([Intel XE#4543]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153648v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-1}:        [FAIL][11] ([Intel XE#5783]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153648v1/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html
    - {bat-ptl-vm}:       [FAIL][13] ([Intel XE#5783]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153648v1/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2909
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8512 -> IGT_8513
  * Linux: xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97 -> xe-pw-153648v1

  IGT_8512: 8512
  IGT_8513: 6540636111c1c01271f55abcc18c775426d4a18f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97: a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97
  xe-pw-153648v1: 153648v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153648v1/index.html

--===============2811488586764391956==
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
<tr><td><b>Series:</b></td><td>drm/xe: Attempt to bring bos back to VRAM after eviction</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153648/">https://patchwork.freedesktop.org/series/153648/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153648v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153648v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97_BAT -&gt; xe-pw-153648v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-153648v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-153648v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-153648v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/bat-dg2-oem2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153648v1/bat-dg2-oem2/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153648v1/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153648v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_dma_buf:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153648v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2909">Intel XE#2909</a>) +1 other test fail</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153648v1/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2909">Intel XE#2909</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153648v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-independent:</p>
<ul>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153648v1/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
<li>{bat-ptl-vm}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153648v1/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8512 -&gt; IGT_8513</li>
<li>Linux: xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97 -&gt; xe-pw-153648v1</li>
</ul>
<p>IGT_8512: 8512<br />
  IGT_8513: 6540636111c1c01271f55abcc18c775426d4a18f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97: a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97<br />
  xe-pw-153648v1: 153648v1</p>

</body>
</html>

--===============2811488586764391956==--
