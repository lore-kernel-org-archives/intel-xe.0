Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1FCF34C62
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 15:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B1B10E4C8;
	Mon, 13 Apr 2026 15:40:43 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4F210E4AA;
 Mon, 13 Apr 2026 15:40:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5540692379233875294=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dp=3A_Fix_VSC_dyna?=
 =?utf-8?q?mic_range_signaling_for_RGB_formats_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Apr 2026 15:40:43 -0000
Message-ID: <177609484316.457299.5672288121655848651@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260413095407.1426322-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260413095407.1426322-1-chaitanya.kumar.borah@intel.com>
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

--===============5540692379233875294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Fix VSC dynamic range signaling for RGB formats (rev2)
URL   : https://patchwork.freedesktop.org/series/164779/
State : success

== Summary ==

CI Bug Log - changes from xe-4891-72fe09744c8f1cfd8a33c06f9b926832a7e78a56_BAT -> xe-pw-164779v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4891-72fe09744c8f1cfd8a33c06f9b926832a7e78a56 -> xe-pw-164779v2

  IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4891-72fe09744c8f1cfd8a33c06f9b926832a7e78a56: 72fe09744c8f1cfd8a33c06f9b926832a7e78a56
  xe-pw-164779v2: 164779v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164779v2/index.html

--===============5540692379233875294==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Fix VSC dynamic range signaling for RGB formats (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164779/">https://patchwork.freedesktop.org/series/164779/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164779v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164779v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4891-72fe09744c8f1cfd8a33c06f9b926832a7e78a56_BAT -&gt; xe-pw-164779v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4891-72fe09744c8f1cfd8a33c06f9b926832a7e78a56 -&gt; xe-pw-164779v2</li>
</ul>
<p>IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4891-72fe09744c8f1cfd8a33c06f9b926832a7e78a56: 72fe09744c8f1cfd8a33c06f9b926832a7e78a56<br />
  xe-pw-164779v2: 164779v2</p>

</body>
</html>

--===============5540692379233875294==--
