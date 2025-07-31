Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96517C87FCC
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 13:54:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A79B10E796;
	Thu, 31 Jul 2025 13:54:27 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D53A10E799;
 Thu, 31 Jul 2025 13:54:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5338308620683090164=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_use_int?=
 =?utf-8?q?el=5Fde=5Fwait=5F*=28=29_functions_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Jul 2025 13:54:26 -0000
Message-ID: <175397006631.202217.15358269203381296876@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1753956266.git.jani.nikula@intel.com>
In-Reply-To: <cover.1753956266.git.jani.nikula@intel.com>
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

--===============5338308620683090164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: use intel_de_wait_*() functions (rev3)
URL   : https://patchwork.freedesktop.org/series/150832/
State : success

== Summary ==

CI Bug Log - changes from xe-3492-d61b45f1c6f1aeb5dd516491cfb7cbc03d024888_BAT -> xe-pw-150832v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3492-d61b45f1c6f1aeb5dd516491cfb7cbc03d024888 -> xe-pw-150832v3

  IGT_8481: 8481
  xe-3492-d61b45f1c6f1aeb5dd516491cfb7cbc03d024888: d61b45f1c6f1aeb5dd516491cfb7cbc03d024888
  xe-pw-150832v3: 150832v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150832v3/index.html

--===============5338308620683090164==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: use intel_de_wait_*() functions (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150832/">https://patchwork.freedesktop.org/series/150832/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150832v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150832v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3492-d61b45f1c6f1aeb5dd516491cfb7cbc03d024888_BAT -&gt; xe-pw-150832v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3492-d61b45f1c6f1aeb5dd516491cfb7cbc03d024888 -&gt; xe-pw-150832v3</li>
</ul>
<p>IGT_8481: 8481<br />
  xe-3492-d61b45f1c6f1aeb5dd516491cfb7cbc03d024888: d61b45f1c6f1aeb5dd516491cfb7cbc03d024888<br />
  xe-pw-150832v3: 150832v3</p>

</body>
</html>

--===============5338308620683090164==--
