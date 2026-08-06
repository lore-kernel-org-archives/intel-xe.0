Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1E6C56208
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 16:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1251010F257;
	Thu,  6 Aug 2026 16:41:33 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C158510F257;
 Thu,  6 Aug 2026 16:41:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5396743599544200580=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Limit_m?=
 =?utf-8?q?ax_joined_dotclock_on_pipes_available?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Aug 2026 16:41:31 -0000
Message-ID: <178603449178.25985.1940046956840654064@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260806143738.2710312-1-jani.nikula@intel.com>
In-Reply-To: <20260806143738.2710312-1-jani.nikula@intel.com>
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

--===============5396743599544200580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Limit max joined dotclock on pipes available
URL   : https://patchwork.freedesktop.org/series/171737/
State : success

== Summary ==

CI Bug Log - changes from xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343_BAT -> xe-pw-171737v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-nvls-1 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343 -> xe-pw-171737v1

  IGT_9043: 9043
  xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343: 25ed4a41b6058c0622ccadb523aa009c55d1f343
  xe-pw-171737v1: 171737v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171737v1/index.html

--===============5396743599544200580==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Limit max joined dotclock on pipes available</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171737/">https://patchwork.freedesktop.org/series/171737/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171737v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171737v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343_BAT -&gt; xe-pw-171737v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-nvls-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343 -&gt; xe-pw-171737v1</li>
</ul>
<p>IGT_9043: 9043<br />
  xe-5554-25ed4a41b6058c0622ccadb523aa009c55d1f343: 25ed4a41b6058c0622ccadb523aa009c55d1f343<br />
  xe-pw-171737v1: 171737v1</p>

</body>
</html>

--===============5396743599544200580==--
