Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE34C3064D
	for <intel-xe@archiver.kernel.org>; Sun, 30 Jun 2024 19:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291A910E002;
	Sun, 30 Jun 2024 19:24:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596C110E002;
 Sun, 30 Jun 2024 19:24:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1443524144358577805=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_lean_exhaustive_evicti?=
 =?utf-8?q?on?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 30 Jun 2024 19:24:54 -0000
Message-ID: <171977549435.459.2352536941520972222@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240630184727.3417-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240630184727.3417-1-thomas.hellstrom@linux.intel.com>
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

--===============1443524144358577805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: lean exhaustive eviction
URL   : https://patchwork.freedesktop.org/series/135570/
State : failure

== Summary ==

CI Bug Log - changes from xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299_BAT -> xe-pw-135570v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-135570v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-135570v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-135570v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@fbdev@eof:
    - bat-dg2-oem2:       [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-dg2-oem2/igt@fbdev@eof.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/bat-dg2-oem2/igt@fbdev@eof.html
    - bat-adlp-7:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-adlp-7/igt@fbdev@eof.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/bat-adlp-7/igt@fbdev@eof.html

  * igt@xe_dma_buf_sync@export-dma-buf-once:
    - bat-pvc-2:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
    - bat-atsm-2:         [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@fbdev@eof:
    - {bat-lnl-1}:        [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-lnl-1/igt@fbdev@eof.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/bat-lnl-1/igt@fbdev@eof.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_7907 -> IGT_7908
  * Linux: xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299 -> xe-pw-135570v1

  IGT_7907: 676b8e660cadae8ffb29a45b12ad5b53ef228b6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7908: 7908
  xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299: 886eeb6d89b58f914ee5045fcac54b59a73d8299
  xe-pw-135570v1: 135570v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/index.html

--===============1443524144358577805==
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
<tr><td><b>Series:</b></td><td>drm/xe: lean exhaustive eviction</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135570/">https://patchwork.freedesktop.org/series/135570/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299_BAT -&gt; xe-pw-135570v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-135570v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-135570v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-135570v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-dg2-oem2/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/bat-dg2-oem2/igt@fbdev@eof.html">ABORT</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-adlp-7/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/bat-adlp-7/igt@fbdev@eof.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@fbdev@eof:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-lnl-1/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v1/bat-lnl-1/igt@fbdev@eof.html">ABORT</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7907 -&gt; IGT_7908</li>
<li>Linux: xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299 -&gt; xe-pw-135570v1</li>
</ul>
<p>IGT_7907: 676b8e660cadae8ffb29a45b12ad5b53ef228b6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7908: 7908<br />
  xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299: 886eeb6d89b58f914ee5045fcac54b59a73d8299<br />
  xe-pw-135570v1: 135570v1</p>

</body>
</html>

--===============1443524144358577805==--
