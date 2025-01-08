Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EC7E77188
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 16:43:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C4D10EC0F;
	Wed,  8 Jan 2025 16:43:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F0310EC19;
 Wed,  8 Jan 2025 16:43:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6953369778208056807=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/audio=3A_convert_t?=
 =?utf-8?q?o_struct_intel=5Fdisplay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Jan 2025 16:43:55 -0000
Message-ID: <173635463568.1351624.6683151006687394271@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1736345025.git.jani.nikula@intel.com>
In-Reply-To: <cover.1736345025.git.jani.nikula@intel.com>
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

--===============6953369778208056807==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/audio: convert to struct intel_display
URL   : https://patchwork.freedesktop.org/series/143247/
State : success

== Summary ==

CI Bug Log - changes from xe-2455-930246dd1dd2d36e858d8c53fa5a0b2bcd0e47f3_BAT -> xe-pw-143247v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2455-930246dd1dd2d36e858d8c53fa5a0b2bcd0e47f3 -> xe-pw-143247v1

  IGT_8181: 32ed9fc482fee95777054d53b96d19a7e30eaa18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2455-930246dd1dd2d36e858d8c53fa5a0b2bcd0e47f3: 930246dd1dd2d36e858d8c53fa5a0b2bcd0e47f3
  xe-pw-143247v1: 143247v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143247v1/index.html

--===============6953369778208056807==
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
<tr><td><b>Series:</b></td><td>drm/i915/audio: convert to struct intel_display</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143247/">https://patchwork.freedesktop.org/series/143247/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143247v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143247v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2455-930246dd1dd2d36e858d8c53fa5a0b2bcd0e47f3_BAT -&gt; xe-pw-143247v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2455-930246dd1dd2d36e858d8c53fa5a0b2bcd0e47f3 -&gt; xe-pw-143247v1</li>
</ul>
<p>IGT_8181: 32ed9fc482fee95777054d53b96d19a7e30eaa18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2455-930246dd1dd2d36e858d8c53fa5a0b2bcd0e47f3: 930246dd1dd2d36e858d8c53fa5a0b2bcd0e47f3<br />
  xe-pw-143247v1: 143247v1</p>

</body>
</html>

--===============6953369778208056807==--
