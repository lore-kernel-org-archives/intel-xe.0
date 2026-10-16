Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BCECCA462
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 10:21:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052E410E035;
	Fri, 16 Oct 2026 10:21:00 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DAB10E035;
 Fri, 16 Oct 2026 10:20:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2746169002321775965=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Move_the_PLL_power_save_W/A?=
 =?utf-8?q?_to_the_display_W/A_framework_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Oct 2026 10:20:58 -0000
Message-ID: <179214605877.34806.16336799635766370626@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261016092400.3112502-1-mika.kahola@intel.com>
In-Reply-To: <20261016092400.3112502-1-mika.kahola@intel.com>
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

--===============2746169002321775965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Move the PLL power save W/A to the display W/A framework (rev5)
URL   : https://patchwork.freedesktop.org/series/175834/
State : success

== Summary ==

CI Bug Log - changes from xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d_BAT -> xe-pw-175834v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d -> xe-pw-175834v5

  IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d: 82ab1be49df113aeb03406f683b9b978c56ac87d
  xe-pw-175834v5: 175834v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175834v5/index.html

--===============2746169002321775965==
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
<tr><td><b>Series:</b></td><td>Move the PLL power save W/A to the display W/A framework (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175834/">https://patchwork.freedesktop.org/series/175834/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175834v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175834v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d_BAT -&gt; xe-pw-175834v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d -&gt; xe-pw-175834v5</li>
</ul>
<p>IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d: 82ab1be49df113aeb03406f683b9b978c56ac87d<br />
  xe-pw-175834v5: 175834v5</p>

</body>
</html>

--===============2746169002321775965==--
