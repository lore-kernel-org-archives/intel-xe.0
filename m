Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94C8FF885E
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 13:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D94010E2B2;
	Mon, 27 Apr 2026 13:12:07 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDA210E2B2;
 Mon, 27 Apr 2026 13:12:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0651357901105165517=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Minor_GuC_PC_cleanups_=28re?=
 =?utf-8?q?v2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 Apr 2026 13:12:06 -0000
Message-ID: <177729552676.13242.12687706773569137688@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260427092928.1181893-1-raag.jadav@intel.com>
In-Reply-To: <20260427092928.1181893-1-raag.jadav@intel.com>
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

--===============0651357901105165517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Minor GuC PC cleanups (rev2)
URL   : https://patchwork.freedesktop.org/series/165293/
State : success

== Summary ==

CI Bug Log - changes from xe-4938-81f5e3410e2adb3d0336498c8fddaf294be2f901_BAT -> xe-pw-165293v2_BAT
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

  * Linux: xe-4938-81f5e3410e2adb3d0336498c8fddaf294be2f901 -> xe-pw-165293v2

  IGT_8873: a5c5d655807ead8204e01754b6434f0ecae40b96 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4938-81f5e3410e2adb3d0336498c8fddaf294be2f901: 81f5e3410e2adb3d0336498c8fddaf294be2f901
  xe-pw-165293v2: 165293v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165293v2/index.html

--===============0651357901105165517==
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
<tr><td><b>Series:</b></td><td>Minor GuC PC cleanups (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165293/">https://patchwork.freedesktop.org/series/165293/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165293v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165293v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4938-81f5e3410e2adb3d0336498c8fddaf294be2f901_BAT -&gt; xe-pw-165293v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4938-81f5e3410e2adb3d0336498c8fddaf294be2f901 -&gt; xe-pw-165293v2</li>
</ul>
<p>IGT_8873: a5c5d655807ead8204e01754b6434f0ecae40b96 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4938-81f5e3410e2adb3d0336498c8fddaf294be2f901: 81f5e3410e2adb3d0336498c8fddaf294be2f901<br />
  xe-pw-165293v2: 165293v2</p>

</body>
</html>

--===============0651357901105165517==--
