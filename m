Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8E9C6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 16:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1740510F21B;
	Thu, 21 Mar 2024 16:57:09 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD44B10F211;
 Thu, 21 Mar 2024 16:57:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6357516330990498753=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Fix_bo_leak_in_intel?=
 =?utf-8?q?=5Ffb=5Fbo=5Fframebuffer=5Finit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Mar 2024 16:57:07 -0000
Message-ID: <171104022784.940819.11742502796586884398@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321145644.33091-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240321145644.33091-1-maarten.lankhorst@linux.intel.com>
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

--===============6357516330990498753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix bo leak in intel_fb_bo_framebuffer_init
URL   : https://patchwork.freedesktop.org/series/131429/
State : success

== Summary ==

CI Bug Log - changes from xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31_BAT -> xe-pw-131429v1_BAT
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

  Here are the changes found in xe-pw-131429v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-cm-threads-small:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#1259])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131429v1/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html

  
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259


Build changes
-------------

  * Linux: xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31 -> xe-pw-131429v1

  IGT_7774: 7774
  xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31: 0cd99ca612f004f19c35f4966a584f0a729bbc31
  xe-pw-131429v1: 131429v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131429v1/index.html

--===============6357516330990498753==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix bo leak in intel_fb_bo_framebuffer_init</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131429/">https://patchwork.freedesktop.org/series/131429/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131429v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131429v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31_BAT -&gt; xe-pw-131429v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131429v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_evict@evict-cm-threads-small:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131429v1/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31 -&gt; xe-pw-131429v1</li>
</ul>
<p>IGT_7774: 7774<br />
  xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31: 0cd99ca612f004f19c35f4966a584f0a729bbc31<br />
  xe-pw-131429v1: 131429v1</p>

</body>
</html>

--===============6357516330990498753==--
