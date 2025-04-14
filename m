Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCEEC369B5
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 21:28:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B5D10E00A;
	Mon, 14 Apr 2025 21:28:19 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA9E10E00A;
 Mon, 14 Apr 2025 21:28:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0934491988061917081=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_drm/xe/guc=3A_Fix_out-of-bound_while_enabling_engine_activity?=
 =?utf-8?q?_stats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Apr 2025 21:28:18 -0000
Message-ID: <174466609812.3481.7309140600263127076@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250414202347.1909-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250414202347.1909-1-michal.wajdeczko@intel.com>
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

--===============0934491988061917081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe/guc: Fix out-of-bound while enabling engine activity stats
URL   : https://patchwork.freedesktop.org/series/147717/
State : success

== Summary ==

CI Bug Log - changes from xe-2949-e331ba51493bc26a70408e28bf3b3a6fe2e0ddfb_BAT -> xe-pw-147717v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2949-e331ba51493bc26a70408e28bf3b3a6fe2e0ddfb -> xe-pw-147717v1

  IGT_8318: 6a33ce105328c5c7cdc63cdd799698638f20db28 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2949-e331ba51493bc26a70408e28bf3b3a6fe2e0ddfb: e331ba51493bc26a70408e28bf3b3a6fe2e0ddfb
  xe-pw-147717v1: 147717v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147717v1/index.html

--===============0934491988061917081==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe/guc: Fix out-of-bound while enabling engine activity stats</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147717/">https://patchwork.freedesktop.org/series/147717/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147717v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147717v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2949-e331ba51493bc26a70408e28bf3b3a6fe2e0ddfb_BAT -&gt; xe-pw-147717v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2949-e331ba51493bc26a70408e28bf3b3a6fe2e0ddfb -&gt; xe-pw-147717v1</li>
</ul>
<p>IGT_8318: 6a33ce105328c5c7cdc63cdd799698638f20db28 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2949-e331ba51493bc26a70408e28bf3b3a6fe2e0ddfb: e331ba51493bc26a70408e28bf3b3a6fe2e0ddfb<br />
  xe-pw-147717v1: 147717v1</p>

</body>
</html>

--===============0934491988061917081==--
