Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556E0C88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 09:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B7610E986;
	Wed, 16 Sep 2026 09:19:28 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C1010E97C;
 Wed, 16 Sep 2026 09:19:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2837290716345856649=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_switch_?=
 =?utf-8?q?to_modern_drm=5Fdp=5Fdpcd*_accessors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Sep 2026 09:19:26 -0000
Message-ID: <178955036635.170627.10614092574777553955@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <cover.1789547331.git.jani.nikula@intel.com>
In-Reply-To: <cover.1789547331.git.jani.nikula@intel.com>
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

--===============2837290716345856649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: switch to modern drm_dp_dpcd* accessors
URL   : https://patchwork.freedesktop.org/series/174241/
State : success

== Summary ==

CI Bug Log - changes from xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8_BAT -> xe-pw-174241v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9098 -> IGT_9099
  * Linux: xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 -> xe-pw-174241v1

  IGT_9098: 9098
  IGT_9099: 9099
  xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8: 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8
  xe-pw-174241v1: 174241v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v1/index.html

--===============2837290716345856649==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: switch to modern drm_dp_dpcd* accessors</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174241/">https://patchwork.freedesktop.org/series/174241/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8_BAT -&gt; xe-pw-174241v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9098 -&gt; IGT_9099</li>
<li>Linux: xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 -&gt; xe-pw-174241v1</li>
</ul>
<p>IGT_9098: 9098<br />
  IGT_9099: 9099<br />
  xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8: 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8<br />
  xe-pw-174241v1: 174241v1</p>

</body>
</html>

--===============2837290716345856649==--
