Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8232BC5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 17:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F5C10E522;
	Thu, 13 Aug 2026 17:19:36 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0E110E522;
 Thu, 13 Aug 2026 17:19:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3456636472928314980=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Vswing_/_Pre-emphasis_Overr?=
 =?utf-8?q?ide_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Aug 2026 17:19:34 -0000
Message-ID: <178664157438.49454.13352662533058595531@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260813160918.918857-1-michal.grzelak@intel.com>
In-Reply-To: <20260813160918.918857-1-michal.grzelak@intel.com>
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

--===============3456636472928314980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Vswing / Pre-emphasis Override (rev6)
URL   : https://patchwork.freedesktop.org/series/167570/
State : success

== Summary ==

CI Bug Log - changes from xe-5592-8f48eda9bfa40ec5c0292d3983108a903106e20c_BAT -> xe-pw-167570v6_BAT
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

  * Linux: xe-5592-8f48eda9bfa40ec5c0292d3983108a903106e20c -> xe-pw-167570v6

  IGT_9054: 3d819a8f511b2bcd844647bcf7e433b9407d058e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5592-8f48eda9bfa40ec5c0292d3983108a903106e20c: 8f48eda9bfa40ec5c0292d3983108a903106e20c
  xe-pw-167570v6: 167570v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167570v6/index.html

--===============3456636472928314980==
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
<tr><td><b>Series:</b></td><td>Vswing / Pre-emphasis Override (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167570/">https://patchwork.freedesktop.org/series/167570/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167570v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167570v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5592-8f48eda9bfa40ec5c0292d3983108a903106e20c_BAT -&gt; xe-pw-167570v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-nvls-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5592-8f48eda9bfa40ec5c0292d3983108a903106e20c -&gt; xe-pw-167570v6</li>
</ul>
<p>IGT_9054: 3d819a8f511b2bcd844647bcf7e433b9407d058e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5592-8f48eda9bfa40ec5c0292d3983108a903106e20c: 8f48eda9bfa40ec5c0292d3983108a903106e20c<br />
  xe-pw-167570v6: 167570v6</p>

</body>
</html>

--===============3456636472928314980==--
