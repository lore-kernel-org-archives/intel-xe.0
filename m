Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE12C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 16:07:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5574E10E1CC;
	Mon, 10 Feb 2025 16:07:09 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2514A10E1CC;
 Mon, 10 Feb 2025 16:07:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5433257315647863053=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Carve_out_wopcm_p?=
 =?utf-8?q?ortion_from_the_stolen_memory_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Feb 2025 16:07:08 -0000
Message-ID: <173920362814.372828.2810739811691294824@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250210143654.2076747-1-nirmoy.das@intel.com>
In-Reply-To: <20250210143654.2076747-1-nirmoy.das@intel.com>
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

--===============5433257315647863053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Carve out wopcm portion from the stolen memory (rev2)
URL   : https://patchwork.freedesktop.org/series/144520/
State : success

== Summary ==

CI Bug Log - changes from xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237_BAT -> xe-pw-144520v2_BAT
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

  * Linux: xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237 -> xe-pw-144520v2

  IGT_8227: 8227
  xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237: 656e731586e568a8633c0bd16d28dcec8d67f237
  xe-pw-144520v2: 144520v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/index.html

--===============5433257315647863053==
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
<tr><td><b>Series:</b></td><td>drm/xe: Carve out wopcm portion from the stolen memory (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144520/">https://patchwork.freedesktop.org/series/144520/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237_BAT -&gt; xe-pw-144520v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237 -&gt; xe-pw-144520v2</li>
</ul>
<p>IGT_8227: 8227<br />
  xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237: 656e731586e568a8633c0bd16d28dcec8d67f237<br />
  xe-pw-144520v2: 144520v2</p>

</body>
</html>

--===============5433257315647863053==--
