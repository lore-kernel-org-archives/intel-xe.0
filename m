Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBABC021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 15:34:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B1F10EAA2;
	Fri, 21 Feb 2025 15:34:32 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9B410E2D3;
 Fri, 21 Feb 2025 15:34:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9040149047573916144=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/wa=3A_Limit_char_per?=
 =?utf-8?q?_line_to_100?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Feb 2025 15:34:30 -0000
Message-ID: <174015207069.491017.10394368467953344377@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250221115344.389975-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250221115344.389975-1-tejas.upadhyay@intel.com>
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

--===============9040149047573916144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/wa: Limit char per line to 100
URL   : https://patchwork.freedesktop.org/series/145227/
State : success

== Summary ==

CI Bug Log - changes from xe-2698-a22ac320a08377d760e73fa530c27782f0b68b6d_BAT -> xe-pw-145227v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-145227v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [PASS][1] -> [SKIP][2] ([Intel XE#4322]) +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2698-a22ac320a08377d760e73fa530c27782f0b68b6d/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145227v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [PASS][3] -> [SKIP][4] ([Intel XE#4322]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2698-a22ac320a08377d760e73fa530c27782f0b68b6d/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145227v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
    - bat-lnl-1:          [PASS][5] -> [SKIP][6] ([Intel XE#4322]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2698-a22ac320a08377d760e73fa530c27782f0b68b6d/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145227v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          [SKIP][7] ([Intel XE#2229]) -> [SKIP][8] ([Intel XE#4322])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2698-a22ac320a08377d760e73fa530c27782f0b68b6d/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145227v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#4322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322


Build changes
-------------

  * Linux: xe-2698-a22ac320a08377d760e73fa530c27782f0b68b6d -> xe-pw-145227v1

  IGT_8245: 822e95b2560133bc21aa3065f70d7148f23f87cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2698-a22ac320a08377d760e73fa530c27782f0b68b6d: a22ac320a08377d760e73fa530c27782f0b68b6d
  xe-pw-145227v1: 145227v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145227v1/index.html

--===============9040149047573916144==
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
<tr><td><b>Series:</b></td><td>drm/xe/wa: Limit char per line to 100</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145227/">https://patchwork.freedesktop.org/series/145227/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145227v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145227v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2698-a22ac320a08377d760e73fa530c27782f0b68b6d_BAT -&gt; xe-pw-145227v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145227v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2698-a22ac320a08377d760e73fa530c27782f0b68b6d/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145227v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322">Intel XE#4322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2698-a22ac320a08377d760e73fa530c27782f0b68b6d/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145227v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322">Intel XE#4322</a>) +2 other tests skip</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2698-a22ac320a08377d760e73fa530c27782f0b68b6d/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145227v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322">Intel XE#4322</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2698-a22ac320a08377d760e73fa530c27782f0b68b6d/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145227v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322">Intel XE#4322</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2698-a22ac320a08377d760e73fa530c27782f0b68b6d -&gt; xe-pw-145227v1</li>
</ul>
<p>IGT_8245: 822e95b2560133bc21aa3065f70d7148f23f87cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2698-a22ac320a08377d760e73fa530c27782f0b68b6d: a22ac320a08377d760e73fa530c27782f0b68b6d<br />
  xe-pw-145227v1: 145227v1</p>

</body>
</html>

--===============9040149047573916144==--
