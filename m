Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EE9F4BB7D
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 19:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5E410E5F0;
	Tue, 24 Feb 2026 19:05:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264A410E5F0;
 Tue, 24 Feb 2026 19:05:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2433352076087101616=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Enable_Wa=5F14025?=
 =?utf-8?q?515070=2C_Enable_indirect_ring_state_for_XE2+_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Feb 2026 19:05:12 -0000
Message-ID: <177195991211.283382.15424221678954406939@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260224174918.616779-3-julia.filipchuk@intel.com>
In-Reply-To: <20260224174918.616779-3-julia.filipchuk@intel.com>
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

--===============2433352076087101616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Enable Wa_14025515070, Enable indirect ring state for XE2+ (rev7)
URL   : https://patchwork.freedesktop.org/series/160812/
State : success

== Summary ==

CI Bug Log - changes from xe-4605-5f0edafcf46674a4a1a4179740f23cea4fadf87f_BAT -> xe-pw-160812v7_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 13)
------------------------------

  Missing    (1): bat-bmg-3 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4605-5f0edafcf46674a4a1a4179740f23cea4fadf87f -> xe-pw-160812v7

  IGT_8768: 8768
  xe-4605-5f0edafcf46674a4a1a4179740f23cea4fadf87f: 5f0edafcf46674a4a1a4179740f23cea4fadf87f
  xe-pw-160812v7: 160812v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v7/index.html

--===============2433352076087101616==
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
<tr><td><b>Series:</b></td><td>drm/xe: Enable Wa_14025515070, Enable indirect ring state for XE2+ (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160812/">https://patchwork.freedesktop.org/series/160812/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160812v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4605-5f0edafcf46674a4a1a4179740f23cea4fadf87f_BAT -&gt; xe-pw-160812v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 13)</h2>
<p>Missing    (1): bat-bmg-3 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4605-5f0edafcf46674a4a1a4179740f23cea4fadf87f -&gt; xe-pw-160812v7</li>
</ul>
<p>IGT_8768: 8768<br />
  xe-4605-5f0edafcf46674a4a1a4179740f23cea4fadf87f: 5f0edafcf46674a4a1a4179740f23cea4fadf87f<br />
  xe-pw-160812v7: 160812v7</p>

</body>
</html>

--===============2433352076087101616==--
