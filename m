Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285A5C369CB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 12:38:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DD010E66A;
	Wed, 23 Apr 2025 12:38:38 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D7210E66A;
 Wed, 23 Apr 2025 12:38:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3040747320517698336=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5BCI?=
 =?utf-8?q?=2C1/2=5D_drm/i915/reg=3A_use_REG=5FBIT_and_friends_to_define_DP_?=
 =?utf-8?q?registers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Apr 2025 12:38:37 -0000
Message-ID: <174541191703.355.18327372379029029685@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250423100213.720585-1-jani.nikula@intel.com>
In-Reply-To: <20250423100213.720585-1-jani.nikula@intel.com>
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

--===============3040747320517698336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/2] drm/i915/reg: use REG_BIT and friends to define DP registers
URL   : https://patchwork.freedesktop.org/series/148124/
State : success

== Summary ==

CI Bug Log - changes from xe-2984-3a6aa65ba6ed7ef9992ded617f44faa063b664d9_BAT -> xe-pw-148124v1_BAT
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

  * Linux: xe-2984-3a6aa65ba6ed7ef9992ded617f44faa063b664d9 -> xe-pw-148124v1

  IGT_8332: 8c1b777b5e59af1e17be96470dcc8ff9fb14ff5b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2984-3a6aa65ba6ed7ef9992ded617f44faa063b664d9: 3a6aa65ba6ed7ef9992ded617f44faa063b664d9
  xe-pw-148124v1: 148124v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148124v1/index.html

--===============3040747320517698336==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/2] drm/i915/reg: use REG_BIT and friends to define DP registers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148124/">https://patchwork.freedesktop.org/series/148124/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148124v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148124v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2984-3a6aa65ba6ed7ef9992ded617f44faa063b664d9_BAT -&gt; xe-pw-148124v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2984-3a6aa65ba6ed7ef9992ded617f44faa063b664d9 -&gt; xe-pw-148124v1</li>
</ul>
<p>IGT_8332: 8c1b777b5e59af1e17be96470dcc8ff9fb14ff5b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2984-3a6aa65ba6ed7ef9992ded617f44faa063b664d9: 3a6aa65ba6ed7ef9992ded617f44faa063b664d9<br />
  xe-pw-148124v1: 148124v1</p>

</body>
</html>

--===============3040747320517698336==--
