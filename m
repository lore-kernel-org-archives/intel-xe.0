Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F55CEE342
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 19:06:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C364810E7D3;
	Wed,  9 Oct 2024 19:06:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79EA10E7D3;
 Wed,  9 Oct 2024 19:06:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3666374549419620600=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915/display=3A_Don=27t_allo?=
 =?utf-8?q?w_tile4_framebuffer_to_do_hflip_on_display20_or_greater_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Oct 2024 19:06:55 -0000
Message-ID: <172850081580.1211789.13086090616672993550@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241007182841.2104740-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20241007182841.2104740-1-juhapekka.heikkila@gmail.com>
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

--===============3666374549419620600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Don't allow tile4 framebuffer to do hflip on display20 or greater (rev2)
URL   : https://patchwork.freedesktop.org/series/139665/
State : success

== Summary ==

CI Bug Log - changes from xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f_BAT -> xe-pw-139665v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f -> xe-pw-139665v2

  IGT_8061: 8061
  xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f: 3e9cfd28b00560e4928ef9b8ab95429b17e0562f
  xe-pw-139665v2: 139665v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/index.html

--===============3666374549419620600==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Don&#x27;t allow tile4 framebuffer to do hflip on display20 or greater (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139665/">https://patchwork.freedesktop.org/series/139665/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f_BAT -&gt; xe-pw-139665v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f -&gt; xe-pw-139665v2</li>
</ul>
<p>IGT_8061: 8061<br />
  xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f: 3e9cfd28b00560e4928ef9b8ab95429b17e0562f<br />
  xe-pw-139665v2: 139665v2</p>

</body>
</html>

--===============3666374549419620600==--
