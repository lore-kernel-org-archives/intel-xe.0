Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FE5CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 14:43:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB4D10E839;
	Wed,  8 Oct 2025 14:43:26 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9750710E83A;
 Wed,  8 Oct 2025 14:43:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3468492077754820202=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/=7Bi915=2C_xe=7D/displa?=
 =?utf-8?q?y=3A_pass_parent_interface_to_display_probe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Oct 2025 14:43:25 -0000
Message-ID: <175993460560.18440.15818077614444978647@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251008135344.773326-1-jani.nikula@intel.com>
In-Reply-To: <20251008135344.773326-1-jani.nikula@intel.com>
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

--===============3468492077754820202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915, xe}/display: pass parent interface to display probe
URL   : https://patchwork.freedesktop.org/series/155615/
State : success

== Summary ==

CI Bug Log - changes from xe-3885-45c0689519437d48d0de2bff3fbf13ee51012232_BAT -> xe-pw-155615v1_BAT
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

  * Linux: xe-3885-45c0689519437d48d0de2bff3fbf13ee51012232 -> xe-pw-155615v1

  IGT_8577: 8577
  xe-3885-45c0689519437d48d0de2bff3fbf13ee51012232: 45c0689519437d48d0de2bff3fbf13ee51012232
  xe-pw-155615v1: 155615v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155615v1/index.html

--===============3468492077754820202==
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
<tr><td><b>Series:</b></td><td>drm/{i915, xe}/display: pass parent interface to display probe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155615/">https://patchwork.freedesktop.org/series/155615/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155615v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155615v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3885-45c0689519437d48d0de2bff3fbf13ee51012232_BAT -&gt; xe-pw-155615v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3885-45c0689519437d48d0de2bff3fbf13ee51012232 -&gt; xe-pw-155615v1</li>
</ul>
<p>IGT_8577: 8577<br />
  xe-3885-45c0689519437d48d0de2bff3fbf13ee51012232: 45c0689519437d48d0de2bff3fbf13ee51012232<br />
  xe-pw-155615v1: 155615v1</p>

</body>
</html>

--===============3468492077754820202==--
