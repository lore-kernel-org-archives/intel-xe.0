Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C608DC4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 13:39:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728F610E7CF;
	Thu,  2 May 2024 13:39:14 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A7010E529;
 Thu,  2 May 2024 13:39:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6947431793769260686=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Perform_dma=5Fmap_when?=
 =?utf-8?q?_moving_system_buffer_objects_to_TT_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 May 2024 13:39:12 -0000
Message-ID: <171465715281.1848696.1675285262105896258@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240430120214.5372-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240430120214.5372-1-thomas.hellstrom@linux.intel.com>
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

--===============6947431793769260686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Perform dma_map when moving system buffer objects to TT (rev2)
URL   : https://patchwork.freedesktop.org/series/133068/
State : failure

== Summary ==

CI Bug Log - changes from xe-1219-0f511aa3b7d7eafc1f8d7cea4a29cc270b748212_BAT -> xe-pw-133068v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-133068v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-133068v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 5)
------------------------------

  Additional (1): bat-lnl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-133068v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-adlp-7:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1219-0f511aa3b7d7eafc1f8d7cea4a29cc270b748212/bat-adlp-7/igt@xe_live_ktest@xe_dma_buf.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v2/bat-adlp-7/igt@xe_live_ktest@xe_dma_buf.html
    - bat-pvc-2:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1219-0f511aa3b7d7eafc1f8d7cea4a29cc270b748212/bat-pvc-2/igt@xe_live_ktest@xe_dma_buf.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v2/bat-pvc-2/igt@xe_live_ktest@xe_dma_buf.html
    - bat-dg2-oem2:       [PASS][5] -> [ABORT][6] +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1219-0f511aa3b7d7eafc1f8d7cea4a29cc270b748212/bat-dg2-oem2/igt@xe_live_ktest@xe_dma_buf.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v2/bat-dg2-oem2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:
    - bat-atsm-2:         [PASS][7] -> [INCOMPLETE][8] +1 other test incomplete
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1219-0f511aa3b7d7eafc1f8d7cea4a29cc270b748212/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v2/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html

  
Known issues
------------

  Here are the changes found in xe-pw-133068v2_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466


Build changes
-------------

  * Linux: xe-1219-0f511aa3b7d7eafc1f8d7cea4a29cc270b748212 -> xe-pw-133068v2

  IGT_7828: 68a055ff91b91dadb01d9501cd8670f654b5b952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1219-0f511aa3b7d7eafc1f8d7cea4a29cc270b748212: 0f511aa3b7d7eafc1f8d7cea4a29cc270b748212
  xe-pw-133068v2: 133068v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v2/index.html

--===============6947431793769260686==
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
<tr><td><b>Series:</b></td><td>drm/xe: Perform dma_map when moving system buffer objects to TT (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133068/">https://patchwork.freedesktop.org/series/133068/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1219-0f511aa3b7d7eafc1f8d7cea4a29cc270b748212_BAT -&gt; xe-pw-133068v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-133068v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-133068v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 5)</h2>
<p>Additional (1): bat-lnl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-133068v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1219-0f511aa3b7d7eafc1f8d7cea4a29cc270b748212/bat-adlp-7/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v2/bat-adlp-7/igt@xe_live_ktest@xe_dma_buf.html">ABORT</a> +1 other test abort</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1219-0f511aa3b7d7eafc1f8d7cea4a29cc270b748212/bat-pvc-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v2/bat-pvc-2/igt@xe_live_ktest@xe_dma_buf.html">INCOMPLETE</a> +1 other test incomplete</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1219-0f511aa3b7d7eafc1f8d7cea4a29cc270b748212/bat-dg2-oem2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v2/bat-dg2-oem2/igt@xe_live_ktest@xe_dma_buf.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1219-0f511aa3b7d7eafc1f8d7cea4a29cc270b748212/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v2/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133068v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1219-0f511aa3b7d7eafc1f8d7cea4a29cc270b748212 -&gt; xe-pw-133068v2</li>
</ul>
<p>IGT_7828: 68a055ff91b91dadb01d9501cd8670f654b5b952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1219-0f511aa3b7d7eafc1f8d7cea4a29cc270b748212: 0f511aa3b7d7eafc1f8d7cea4a29cc270b748212<br />
  xe-pw-133068v2: 133068v2</p>

</body>
</html>

--===============6947431793769260686==--
