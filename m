Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35AFE9271B
	for <intel-xe@archiver.kernel.org>; Mon, 29 Dec 2025 12:41:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25BA10E44A;
	Mon, 29 Dec 2025 12:41:52 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF91B10E44A;
 Mon, 29 Dec 2025 12:41:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4495508527809428041=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/=7Bi915=2C_xe=7D/displa?=
 =?utf-8?q?y=3A_remove_the_-Ddrm=5Fi915=5Fprivate=3Dxe=5Fdevice_hack?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Dec 2025 12:41:50 -0000
Message-ID: <176701211091.119742.7218141226162865726@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1767009044.git.jani.nikula@intel.com>
In-Reply-To: <cover.1767009044.git.jani.nikula@intel.com>
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

--===============4495508527809428041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915, xe}/display: remove the -Ddrm_i915_private=xe_device hack
URL   : https://patchwork.freedesktop.org/series/159523/
State : success

== Summary ==

CI Bug Log - changes from xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f_BAT -> xe-pw-159523v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-bmg-3 

Known issues
------------

  Here are the changes found in xe-pw-159523v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6520])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * Linux: xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f -> xe-pw-159523v1

  IGT_8679: 8679
  xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f: c4f21b26a21816b3a28bddeeaec7db024fc2e54f
  xe-pw-159523v1: 159523v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/index.html

--===============4495508527809428041==
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
<tr><td><b>Series:</b></td><td>drm/{i915, xe}/display: remove the -Ddrm_i915_private=xe_device hack</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159523/">https://patchwork.freedesktop.org/series/159523/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f_BAT -&gt; xe-pw-159523v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159523v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f -&gt; xe-pw-159523v1</li>
</ul>
<p>IGT_8679: 8679<br />
  xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f: c4f21b26a21816b3a28bddeeaec7db024fc2e54f<br />
  xe-pw-159523v1: 159523v1</p>

</body>
</html>

--===============4495508527809428041==--
