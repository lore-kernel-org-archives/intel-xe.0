Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55022C4828D
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 16:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECFC10E738;
	Mon,  5 Feb 2024 16:37:29 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8EE10E738;
 Mon,  5 Feb 2024 16:37:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4353442009421384520=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/display=3A_fix_i915=5Fgem?=
 =?utf-8?q?=5Fobject=5Fis=5Fshmem=28=29_wrapper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Feb 2024 16:37:28 -0000
Message-ID: <170715104830.1024443.9513601318283084702@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240205153110.38340-2-matthew.auld@intel.com>
In-Reply-To: <20240205153110.38340-2-matthew.auld@intel.com>
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

--===============4353442009421384520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: fix i915_gem_object_is_shmem() wrapper
URL   : https://patchwork.freedesktop.org/series/129547/
State : success

== Summary ==

CI Bug Log - changes from xe-728-9d1ffaa4ebf651f2c0a4afef1561874252247515_BAT -> xe-pw-129547v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-728-9d1ffaa4ebf651f2c0a4afef1561874252247515 -> xe-pw-129547v1

  IGT_7703: c58c5fb6aa1cb7d3627a15e364816a7a2add9edc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-728-9d1ffaa4ebf651f2c0a4afef1561874252247515: 9d1ffaa4ebf651f2c0a4afef1561874252247515
  xe-pw-129547v1: 129547v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129547v1/index.html

--===============4353442009421384520==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: fix i915_gem_object_is_shmem() wrapper</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129547/">https://patchwork.freedesktop.org/series/129547/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129547v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129547v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-728-9d1ffaa4ebf651f2c0a4afef1561874252247515_BAT -&gt; xe-pw-129547v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-728-9d1ffaa4ebf651f2c0a4afef1561874252247515 -&gt; xe-pw-129547v1</li>
</ul>
<p>IGT_7703: c58c5fb6aa1cb7d3627a15e364816a7a2add9edc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-728-9d1ffaa4ebf651f2c0a4afef1561874252247515: 9d1ffaa4ebf651f2c0a4afef1561874252247515<br />
  xe-pw-129547v1: 129547v1</p>

</body>
</html>

--===============4353442009421384520==--
