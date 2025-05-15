Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DCCC3ABC9
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 13:07:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5E610E010;
	Thu, 15 May 2025 13:07:30 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE1710E010;
 Thu, 15 May 2025 13:07:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8932288620155875132=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/vf=3A_Fail_migration?=
 =?utf-8?q?_recovery_if_fixups_needed_but_platform_not_supported_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 May 2025 13:07:30 -0000
Message-ID: <174731445017.84675.11171555759453234045@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250515111229.815047-1-tomasz.lis@intel.com>
In-Reply-To: <20250515111229.815047-1-tomasz.lis@intel.com>
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

--===============8932288620155875132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Fail migration recovery if fixups needed but platform not supported (rev4)
URL   : https://patchwork.freedesktop.org/series/148914/
State : success

== Summary ==

CI Bug Log - changes from xe-3090-fbf1cb830ae7cca1f6094630da357a8418596a5b_BAT -> xe-pw-148914v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3090-fbf1cb830ae7cca1f6094630da357a8418596a5b -> xe-pw-148914v4

  IGT_8364: 8364
  xe-3090-fbf1cb830ae7cca1f6094630da357a8418596a5b: fbf1cb830ae7cca1f6094630da357a8418596a5b
  xe-pw-148914v4: 148914v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v4/index.html

--===============8932288620155875132==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Fail migration recovery if fixups needed but platform not supported (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148914/">https://patchwork.freedesktop.org/series/148914/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148914v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3090-fbf1cb830ae7cca1f6094630da357a8418596a5b_BAT -&gt; xe-pw-148914v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3090-fbf1cb830ae7cca1f6094630da357a8418596a5b -&gt; xe-pw-148914v4</li>
</ul>
<p>IGT_8364: 8364<br />
  xe-3090-fbf1cb830ae7cca1f6094630da357a8418596a5b: fbf1cb830ae7cca1f6094630da357a8418596a5b<br />
  xe-pw-148914v4: 148914v4</p>

</body>
</html>

--===============8932288620155875132==--
