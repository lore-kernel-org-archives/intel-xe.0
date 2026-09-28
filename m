Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533BDCA5FA5
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 14:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06A810E0E9;
	Mon, 28 Sep 2026 14:42:17 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A6510E0E9;
 Mon, 28 Sep 2026 14:42:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0790415881536052046=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/pps=3A_Don=27t_blo?=
 =?utf-8?q?ck_DC_states_while_the_VDD_override_is_held?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Sep 2026 14:42:16 -0000
Message-ID: <179060653661.214600.8426465283620081873@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260928061211.2764543-1-suraj.kandpal@intel.com>
In-Reply-To: <20260928061211.2764543-1-suraj.kandpal@intel.com>
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

--===============0790415881536052046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/pps: Don't block DC states while the VDD override is held
URL   : https://patchwork.freedesktop.org/series/175079/
State : success

== Summary ==

CI Bug Log - changes from xe-5834-183265fddd55ef951adb7bcd5703927abaa76bb5_BAT -> xe-pw-175079v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 13)
------------------------------

  Missing    (2): bat-bmg-vm bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5834-183265fddd55ef951adb7bcd5703927abaa76bb5 -> xe-pw-175079v1

  IGT_9113: 691cc6fd50d5a3f6f2b5805c9698af1df28f6830 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5834-183265fddd55ef951adb7bcd5703927abaa76bb5: 183265fddd55ef951adb7bcd5703927abaa76bb5
  xe-pw-175079v1: 175079v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175079v1/index.html

--===============0790415881536052046==
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
<tr><td><b>Series:</b></td><td>drm/i915/pps: Don&#x27;t block DC states while the VDD override is held</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175079/">https://patchwork.freedesktop.org/series/175079/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175079v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175079v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5834-183265fddd55ef951adb7bcd5703927abaa76bb5_BAT -&gt; xe-pw-175079v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 13)</h2>
<p>Missing    (2): bat-bmg-vm bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5834-183265fddd55ef951adb7bcd5703927abaa76bb5 -&gt; xe-pw-175079v1</li>
</ul>
<p>IGT_9113: 691cc6fd50d5a3f6f2b5805c9698af1df28f6830 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5834-183265fddd55ef951adb7bcd5703927abaa76bb5: 183265fddd55ef951adb7bcd5703927abaa76bb5<br />
  xe-pw-175079v1: 175079v1</p>

</body>
</html>

--===============0790415881536052046==--
