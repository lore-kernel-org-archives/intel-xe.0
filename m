Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1B9C55ABF
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 09:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB82A10E303;
	Thu,  6 Aug 2026 09:52:49 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6472110F177;
 Thu,  6 Aug 2026 09:52:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4556174014682850548=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/pm=3A_do_not_warn_ab?=
 =?utf-8?q?out_missing_runtime_PM_protection_after_hot-unplug_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Aug 2026 09:52:48 -0000
Message-ID: <178600996840.24442.1972323213866923167@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260806085711.437110-2-nitin.r.gote@intel.com>
In-Reply-To: <20260806085711.437110-2-nitin.r.gote@intel.com>
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

--===============4556174014682850548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pm: do not warn about missing runtime PM protection after hot-unplug (rev2)
URL   : https://patchwork.freedesktop.org/series/171320/
State : success

== Summary ==

CI Bug Log - changes from xe-5552-8d11ccdc98daac5e969243b42907fd060a650091_BAT -> xe-pw-171320v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 13)
------------------------------

  Missing    (2): bat-bmg-2 bat-bmg-3 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5552-8d11ccdc98daac5e969243b42907fd060a650091 -> xe-pw-171320v2

  IGT_9041: 9041
  xe-5552-8d11ccdc98daac5e969243b42907fd060a650091: 8d11ccdc98daac5e969243b42907fd060a650091
  xe-pw-171320v2: 171320v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v2/index.html

--===============4556174014682850548==
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
<tr><td><b>Series:</b></td><td>drm/xe/pm: do not warn about missing runtime PM protection after hot-unplug (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171320/">https://patchwork.freedesktop.org/series/171320/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171320v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5552-8d11ccdc98daac5e969243b42907fd060a650091_BAT -&gt; xe-pw-171320v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 13)</h2>
<p>Missing    (2): bat-bmg-2 bat-bmg-3 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5552-8d11ccdc98daac5e969243b42907fd060a650091 -&gt; xe-pw-171320v2</li>
</ul>
<p>IGT_9041: 9041<br />
  xe-5552-8d11ccdc98daac5e969243b42907fd060a650091: 8d11ccdc98daac5e969243b42907fd060a650091<br />
  xe-pw-171320v2: 171320v2</p>

</body>
</html>

--===============4556174014682850548==--
