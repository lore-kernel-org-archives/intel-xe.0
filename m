Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC94DCCF9E0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 21:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DEE10EB41;
	Fri, 24 Oct 2025 21:12:20 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F58C10EB41;
 Fri, 24 Oct 2025 21:12:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5837416696303454027=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/configfs=3A_Drop_MAX?=
 =?utf-8?q?=5FGT=5FTYPE=5FCHARS_constant?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Oct 2025 21:12:19 -0000
Message-ID: <176134033929.54054.9087836478159356441@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251024200834.1512329-2-matthew.d.roper@intel.com>
In-Reply-To: <20251024200834.1512329-2-matthew.d.roper@intel.com>
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

--===============5837416696303454027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/configfs: Drop MAX_GT_TYPE_CHARS constant
URL   : https://patchwork.freedesktop.org/series/156513/
State : success

== Summary ==

CI Bug Log - changes from xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e_BAT -> xe-pw-156513v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e -> xe-pw-156513v1

  IGT_8596: 8596
  xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e: dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e
  xe-pw-156513v1: 156513v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156513v1/index.html

--===============5837416696303454027==
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
<tr><td><b>Series:</b></td><td>drm/xe/configfs: Drop MAX_GT_TYPE_CHARS constant</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156513/">https://patchwork.freedesktop.org/series/156513/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156513v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156513v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e_BAT -&gt; xe-pw-156513v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e -&gt; xe-pw-156513v1</li>
</ul>
<p>IGT_8596: 8596<br />
  xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e: dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e<br />
  xe-pw-156513v1: 156513v1</p>

</body>
</html>

--===============5837416696303454027==--
