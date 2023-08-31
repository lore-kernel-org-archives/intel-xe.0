Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFD3C83F10
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 11:20:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B93F10E62F;
	Thu, 31 Aug 2023 11:20:45 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 93B7810E62F;
 Thu, 31 Aug 2023 11:20:43 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8C981AADE3;
 Thu, 31 Aug 2023 11:20:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4321783881367333031=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 31 Aug 2023 11:20:43 -0000
Message-ID: <169348084354.12509.9947128729702628040@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230831092937.2197-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230831092937.2197-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A?=
 =?utf-8?q?_Convert_to_drm=5Fexec_=28rev2=29?=
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

--===============4321783881367333031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Convert to drm_exec (rev2)
URL   : https://patchwork.freedesktop.org/series/123100/
State : failure

== Summary ==

CI Bug Log - changes from xe-348-72da4b45f58f2a95d45743801a10e1f1e1dcce05_BAT -> xe-pw-123100v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-123100v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-123100v2_BAT, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-123100v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_dma_buf_sync@export-dma-buf-once:
    - bat-dg2-oem2:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-348-72da4b45f58f2a95d45743801a10e1f1e1dcce05/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v2/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html
    - bat-atsm-2:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-348-72da4b45f58f2a95d45743801a10e1f1e1dcce05/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v2/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
    - bat-adlp-7:         [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-348-72da4b45f58f2a95d45743801a10e1f1e1dcce05/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v2/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once.html

  


Build changes
-------------

  * IGT: IGT_7459 -> IGT_7460
  * Linux: xe-348-72da4b45f58f2a95d45743801a10e1f1e1dcce05 -> xe-pw-123100v2

  IGT_7459: 7459
  IGT_7460: 30b4034ea562952039ba6af58106791d5c39999e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-348-72da4b45f58f2a95d45743801a10e1f1e1dcce05: 72da4b45f58f2a95d45743801a10e1f1e1dcce05
  xe-pw-123100v2: 123100v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe//index.html

--===============4321783881367333031==
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
<tr><td><b>Series:</b></td><td>drm/xe: Convert to drm_exec (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123100/">https://patchwork.freedesktop.org/series/123100/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe//index.html">https://intel-gfx-ci.01.org/tree/intel-xe//index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-348-72da4b45f58f2a95d45743801a10e1f1e1dcce05_BAT -&gt; xe-pw-123100v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-123100v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-123100v2_BAT, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-123100v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-348-72da4b45f58f2a95d45743801a10e1f1e1dcce05/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v2/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-348-72da4b45f58f2a95d45743801a10e1f1e1dcce05/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v2/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-348-72da4b45f58f2a95d45743801a10e1f1e1dcce05/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v2/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7459 -&gt; IGT_7460</li>
<li>Linux: xe-348-72da4b45f58f2a95d45743801a10e1f1e1dcce05 -&gt; xe-pw-123100v2</li>
</ul>
<p>IGT_7459: 7459<br />
  IGT_7460: 30b4034ea562952039ba6af58106791d5c39999e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-348-72da4b45f58f2a95d45743801a10e1f1e1dcce05: 72da4b45f58f2a95d45743801a10e1f1e1dcce05<br />
  xe-pw-123100v2: 123100v2</p>

</body>
</html>

--===============4321783881367333031==--
