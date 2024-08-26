Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F97CC5321E
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 14:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC0710E20C;
	Mon, 26 Aug 2024 14:16:26 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984A810E204;
 Mon, 26 Aug 2024 14:16:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6624944625149657223=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/hwmon=3A_Fix_WRITE=5FI1_p?=
 =?utf-8?q?aram_from_u32_to_u16?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Aug 2024 14:16:25 -0000
Message-ID: <172468178561.784489.17747395748878888489@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240826133633.129853-1-karthik.poosa@intel.com>
In-Reply-To: <20240826133633.129853-1-karthik.poosa@intel.com>
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

--===============6624944625149657223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Fix WRITE_I1 param from u32 to u16
URL   : https://patchwork.freedesktop.org/series/137796/
State : success

== Summary ==

CI Bug Log - changes from xe-1826-3180bea570dadc713d6f1cc50662818d684cfb4a_BAT -> xe-pw-137796v1_BAT
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

  * Linux: xe-1826-3180bea570dadc713d6f1cc50662818d684cfb4a -> xe-pw-137796v1

  IGT_7991: e5cbe548dbd6ee44200a83745a605643a1a4c714 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1826-3180bea570dadc713d6f1cc50662818d684cfb4a: 3180bea570dadc713d6f1cc50662818d684cfb4a
  xe-pw-137796v1: 137796v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137796v1/index.html

--===============6624944625149657223==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Fix WRITE_I1 param from u32 to u16</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137796/">https://patchwork.freedesktop.org/series/137796/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137796v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137796v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1826-3180bea570dadc713d6f1cc50662818d684cfb4a_BAT -&gt; xe-pw-137796v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1826-3180bea570dadc713d6f1cc50662818d684cfb4a -&gt; xe-pw-137796v1</li>
</ul>
<p>IGT_7991: e5cbe548dbd6ee44200a83745a605643a1a4c714 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1826-3180bea570dadc713d6f1cc50662818d684cfb4a: 3180bea570dadc713d6f1cc50662818d684cfb4a<br />
  xe-pw-137796v1: 137796v1</p>

</body>
</html>

--===============6624944625149657223==--
