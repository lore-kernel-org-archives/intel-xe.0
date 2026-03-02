Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112D7D58E47
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 04:27:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBA510E1A4;
	Mon,  2 Mar 2026 04:27:46 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7097110E1A4;
 Mon,  2 Mar 2026 04:27:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3771989315000145360=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dp=3A_ALPM_init_to?=
 =?utf-8?q?_be_done_after_DPCD_init?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Mar 2026 04:27:45 -0000
Message-ID: <177242566542.302126.10749341314819824106@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260302033630.428913-1-arun.r.murthy@intel.com>
In-Reply-To: <20260302033630.428913-1-arun.r.murthy@intel.com>
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

--===============3771989315000145360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: ALPM init to be done after DPCD init
URL   : https://patchwork.freedesktop.org/series/162392/
State : success

== Summary ==

CI Bug Log - changes from xe-4636-1ad945dbcb06504e1d9796cac1588c31b4ee62e9_BAT -> xe-pw-162392v1_BAT
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

  * IGT: IGT_8775 -> IGT_8776
  * Linux: xe-4636-1ad945dbcb06504e1d9796cac1588c31b4ee62e9 -> xe-pw-162392v1

  IGT_8775: 8775
  IGT_8776: 8776
  xe-4636-1ad945dbcb06504e1d9796cac1588c31b4ee62e9: 1ad945dbcb06504e1d9796cac1588c31b4ee62e9
  xe-pw-162392v1: 162392v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162392v1/index.html

--===============3771989315000145360==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: ALPM init to be done after DPCD init</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162392/">https://patchwork.freedesktop.org/series/162392/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162392v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162392v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4636-1ad945dbcb06504e1d9796cac1588c31b4ee62e9_BAT -&gt; xe-pw-162392v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8775 -&gt; IGT_8776</li>
<li>Linux: xe-4636-1ad945dbcb06504e1d9796cac1588c31b4ee62e9 -&gt; xe-pw-162392v1</li>
</ul>
<p>IGT_8775: 8775<br />
  IGT_8776: 8776<br />
  xe-4636-1ad945dbcb06504e1d9796cac1588c31b4ee62e9: 1ad945dbcb06504e1d9796cac1588c31b4ee62e9<br />
  xe-pw-162392v1: 162392v1</p>

</body>
</html>

--===============3771989315000145360==--
