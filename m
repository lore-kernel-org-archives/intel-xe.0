Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0761BCA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 21:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E76B10E144;
	Wed, 10 Sep 2025 21:34:37 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200FF10E144;
 Wed, 10 Sep 2025 21:34:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6168658752024735311=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/hwmon=3A_Remove_type?=
 =?utf-8?q?_casting=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: mallesh.koujalagi@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Sep 2025 21:34:36 -0000
Message-ID: <175754007612.323585.9663764630348620232@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250910204234.2724272-1-mallesh.koujalagi@intel.com>
In-Reply-To: <20250910204234.2724272-1-mallesh.koujalagi@intel.com>
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

--===============6168658752024735311==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Remove type casting. (rev2)
URL   : https://patchwork.freedesktop.org/series/154298/
State : success

== Summary ==

CI Bug Log - changes from xe-3719-f8ab4be9461e5155e0b3b8b7c4fd6d68bbb811ac_BAT -> xe-pw-154298v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3719-f8ab4be9461e5155e0b3b8b7c4fd6d68bbb811ac -> xe-pw-154298v2

  IGT_8532: 3b9f234d6efe0529a233b81bb0d5ffee5adddb01 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3719-f8ab4be9461e5155e0b3b8b7c4fd6d68bbb811ac: f8ab4be9461e5155e0b3b8b7c4fd6d68bbb811ac
  xe-pw-154298v2: 154298v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154298v2/index.html

--===============6168658752024735311==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Remove type casting. (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154298/">https://patchwork.freedesktop.org/series/154298/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154298v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154298v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3719-f8ab4be9461e5155e0b3b8b7c4fd6d68bbb811ac_BAT -&gt; xe-pw-154298v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3719-f8ab4be9461e5155e0b3b8b7c4fd6d68bbb811ac -&gt; xe-pw-154298v2</li>
</ul>
<p>IGT_8532: 3b9f234d6efe0529a233b81bb0d5ffee5adddb01 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3719-f8ab4be9461e5155e0b3b8b7c4fd6d68bbb811ac: f8ab4be9461e5155e0b3b8b7c4fd6d68bbb811ac<br />
  xe-pw-154298v2: 154298v2</p>

</body>
</html>

--===============6168658752024735311==--
