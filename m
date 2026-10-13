Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7A8CC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 15:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE15210EE9C;
	Tue, 13 Oct 2026 15:40:36 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D27410F8BF;
 Tue, 13 Oct 2026 15:40:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2551935843519425072=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Introduce_xe=5Fwedge_=28rev?=
 =?utf-8?q?4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Oct 2026 15:40:36 -0000
Message-ID: <179190603644.19039.6111861516708733778@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261013110439.181447-1-raag.jadav@intel.com>
In-Reply-To: <20261013110439.181447-1-raag.jadav@intel.com>
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

--===============2551935843519425072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce xe_wedge (rev4)
URL   : https://patchwork.freedesktop.org/series/173011/
State : success

== Summary ==

CI Bug Log - changes from xe-5937-f70a5a920a49326b4b953fe6f756586c21e3fbeb_BAT -> xe-pw-173011v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-5937-f70a5a920a49326b4b953fe6f756586c21e3fbeb_BAT and xe-pw-173011v4_BAT:

### New IGT tests (3) ###

  * igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:
    - Statuses : 14 pass(s)
    - Exec time: [0.01, 0.11] s

  * igt@xe_dma_buf_sync@export-dma-buf-once-write-read-sync:
    - Statuses : 14 pass(s)
    - Exec time: [0.01, 0.11] s

  * igt@xe_dma_buf_sync@export-dma-buf-once-write-sync:
    - Statuses : 14 pass(s)
    - Exec time: [0.02, 0.11] s

  

Known issues
------------

  Here are the changes found in xe-pw-173011v4_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][1] ([Intel XE#9463]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5937-f70a5a920a49326b4b953fe6f756586c21e3fbeb/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173011v4/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * Linux: xe-5937-f70a5a920a49326b4b953fe6f756586c21e3fbeb -> xe-pw-173011v4

  IGT_9141: 272395cfec06bd5809c9b9c0a17a32f34c48799c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5937-f70a5a920a49326b4b953fe6f756586c21e3fbeb: f70a5a920a49326b4b953fe6f756586c21e3fbeb
  xe-pw-173011v4: 173011v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173011v4/index.html

--===============2551935843519425072==
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
<tr><td><b>Series:</b></td><td>Introduce xe_wedge (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173011/">https://patchwork.freedesktop.org/series/173011/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173011v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173011v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5937-f70a5a920a49326b4b953fe6f756586c21e3fbeb_BAT -&gt; xe-pw-173011v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5937-f70a5a920a49326b4b953fe6f756586c21e3fbeb_BAT and xe-pw-173011v4_BAT:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:</p>
<ul>
<li>Statuses : 14 pass(s)</li>
<li>Exec time: [0.01, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once-write-read-sync:</p>
<ul>
<li>Statuses : 14 pass(s)</li>
<li>Exec time: [0.01, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once-write-sync:</p>
<ul>
<li>Statuses : 14 pass(s)</li>
<li>Exec time: [0.02, 0.11] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173011v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5937-f70a5a920a49326b4b953fe6f756586c21e3fbeb/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173011v4/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5937-f70a5a920a49326b4b953fe6f756586c21e3fbeb -&gt; xe-pw-173011v4</li>
</ul>
<p>IGT_9141: 272395cfec06bd5809c9b9c0a17a32f34c48799c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5937-f70a5a920a49326b4b953fe6f756586c21e3fbeb: f70a5a920a49326b4b953fe6f756586c21e3fbeb<br />
  xe-pw-173011v4: 173011v4</p>

</body>
</html>

--===============2551935843519425072==--
