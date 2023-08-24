Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DBDC83003
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 18:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DA810E5AC;
	Thu, 24 Aug 2023 18:20:40 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 05AB310E5AC;
 Thu, 24 Aug 2023 18:20:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E6A7BAADD7;
 Thu, 24 Aug 2023 18:20:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4172710717028958612=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Date: Thu, 24 Aug 2023 18:20:37 -0000
Message-ID: <169290123793.13341.1244061589563193936@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230824174618.1560317-1-badal.nilawar@intel.com>
In-Reply-To: <20230824174618.1560317-1-badal.nilawar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/dg?=
 =?utf-8?q?fx=3A_Release_mmap_mappings_on_rpm_suspend?=
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

--===============4172710717028958612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/dgfx: Release mmap mappings on rpm suspend
URL   : https://patchwork.freedesktop.org/series/122860/
State : failure

== Summary ==

CI Bug Log - changes from xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5_BAT -> xe-pw-122860v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-122860v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-122860v1_BAT, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-122860v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_dma_buf_sync@export-dma-buf-once:
    - bat-dg2-oem2:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122860v1/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html
    - bat-atsm-2:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122860v1/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
    - bat-adlp-7:         [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122860v1/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once.html

  * igt@xe_dma_buf_sync@export-dma-buf-once-read-sync:
    - bat-dg2-oem2:       [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122860v1/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html
    - bat-adlp-7:         [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122860v1/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html
    - bat-atsm-2:         [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122860v1/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html

  


Build changes
-------------

  * Linux: xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5 -> xe-pw-122860v1

  IGT_7451: 5d48d1fb231f449fe2f80cda14ea7a1ecfda59fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5: c77796cf84361b4716839141f2e48de2bf7f4bd5
  xe-pw-122860v1: 122860v1



--===============4172710717028958612==
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
<tr><td><b>Series:</b></td><td>drm/xe/dgfx: Release mmap mappings on rpm suspend</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122860/">https://patchwork.freedesktop.org/series/122860/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

</table>


    <h1>CI Bug Log - changes from xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5_BAT -&gt; xe-pw-122860v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-122860v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-122860v1_BAT, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-122860v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122860v1/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html">DMESG-WARN</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122860v1/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">DMESG-WARN</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122860v1/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once.html">DMESG-WARN</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once-read-sync:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122860v1/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html">ABORT</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122860v1/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html">ABORT</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122860v1/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html">ABORT</a></p>
</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5 -&gt; xe-pw-122860v1</li>
</ul>
<p>IGT_7451: 5d48d1fb231f449fe2f80cda14ea7a1ecfda59fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5: c77796cf84361b4716839141f2e48de2bf7f4bd5<br />
  xe-pw-122860v1: 122860v1</p>

</body>
</html>

--===============4172710717028958612==--
