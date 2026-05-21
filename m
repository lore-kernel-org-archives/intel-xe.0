Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12466CD4F3C
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 07:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DB910F23C;
	Thu, 21 May 2026 07:48:46 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C2510F23C;
 Thu, 21 May 2026 07:48:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3417633285450973766=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_return_type_o?=
 =?utf-8?q?f_disable=5Flate=5Fbinding=5Fset=28=29_in_debugfs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohanram Meenakshisundaram" <mohanram.meenakshisundaram@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 May 2026 07:48:45 -0000
Message-ID: <177934972545.94609.8331494493843766322@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260520070255.2021100-1-mohanram.meenakshisundaram@intel.com>
In-Reply-To: <20260520070255.2021100-1-mohanram.meenakshisundaram@intel.com>
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

--===============3417633285450973766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix return type of disable_late_binding_set() in debugfs (rev2)
URL   : https://patchwork.freedesktop.org/series/166914/
State : success

== Summary ==

CI Bug Log - changes from xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed_BAT -> xe-pw-166914v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-166914v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-vm:         [PASS][1] -> [ABORT][2] ([Intel XE#8007] / [Intel XE#8023]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v2/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8023


Build changes
-------------

  * IGT: IGT_8926 -> IGT_8927
  * Linux: xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed -> xe-pw-166914v2

  IGT_8926: 8926
  IGT_8927: 3adedfd3a52fa7cdf94df31e5da59e0fdbda92fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed: a7f4472d401c5c4ee7710c20b7350b6958b8bbed
  xe-pw-166914v2: 166914v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v2/index.html

--===============3417633285450973766==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix return type of disable_late_binding_set() in debugfs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166914/">https://patchwork.freedesktop.org/series/166914/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed_BAT -&gt; xe-pw-166914v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166914v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_dma_buf:<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v2/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8023">Intel XE#8023</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8926 -&gt; IGT_8927</li>
<li>Linux: xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed -&gt; xe-pw-166914v2</li>
</ul>
<p>IGT_8926: 8926<br />
  IGT_8927: 3adedfd3a52fa7cdf94df31e5da59e0fdbda92fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed: a7f4472d401c5c4ee7710c20b7350b6958b8bbed<br />
  xe-pw-166914v2: 166914v2</p>

</body>
</html>

--===============3417633285450973766==--
