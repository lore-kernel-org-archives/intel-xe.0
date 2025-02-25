Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637E8C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 13:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D88010E695;
	Tue, 25 Feb 2025 13:43:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9321D10E695;
 Tue, 25 Feb 2025 13:43:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0687781289697020779=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/power=3A_move_runt?=
 =?utf-8?q?ime_power_status_info_to_power_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 13:43:39 -0000
Message-ID: <174049101959.1980804.13883706742357457785@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250225121742.721871-1-jani.nikula@intel.com>
In-Reply-To: <20250225121742.721871-1-jani.nikula@intel.com>
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

--===============0687781289697020779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/power: move runtime power status info to power debugfs
URL   : https://patchwork.freedesktop.org/series/145398/
State : success

== Summary ==

CI Bug Log - changes from xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475_BAT -> xe-pw-145398v1_BAT
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

  * Linux: xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475 -> xe-pw-145398v1

  IGT_8247: 8247
  xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475: d5debc4841e604372c74ebda0bbf54bd527c3475
  xe-pw-145398v1: 145398v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145398v1/index.html

--===============0687781289697020779==
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
<tr><td><b>Series:</b></td><td>drm/i915/power: move runtime power status info to power debugfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145398/">https://patchwork.freedesktop.org/series/145398/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145398v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145398v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475_BAT -&gt; xe-pw-145398v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475 -&gt; xe-pw-145398v1</li>
</ul>
<p>IGT_8247: 8247<br />
  xe-2709-d5debc4841e604372c74ebda0bbf54bd527c3475: d5debc4841e604372c74ebda0bbf54bd527c3475<br />
  xe-pw-145398v1: 145398v1</p>

</body>
</html>

--===============0687781289697020779==--
