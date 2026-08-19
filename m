Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7778FC5B572
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 15:09:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A8F10E571;
	Wed, 19 Aug 2026 15:09:49 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A288910E571;
 Wed, 19 Aug 2026 15:09:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3672630667999798385=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/=7Bi915=2C_xe=7D/displa?=
 =?utf-8?q?y=3A_another_stab_at_i915=5Ffence=5Ftimeout=28=29_removal?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Aug 2026 15:09:47 -0000
Message-ID: <178715218765.67900.7629183354605353604@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <cover.1787148235.git.jani.nikula@intel.com>
In-Reply-To: <cover.1787148235.git.jani.nikula@intel.com>
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

--===============3672630667999798385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915, xe}/display: another stab at i915_fence_timeout() removal
URL   : https://patchwork.freedesktop.org/series/172457/
State : success

== Summary ==

CI Bug Log - changes from xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c_BAT -> xe-pw-172457v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 11)
------------------------------

  Missing    (2): bat-bmg-2 bat-nvls-1 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9060 -> IGT_9061
  * Linux: xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c -> xe-pw-172457v1

  IGT_9060: 9060
  IGT_9061: 9061
  xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c: 291141d363710c4ac7ef9ab71153459d746ed50c
  xe-pw-172457v1: 172457v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172457v1/index.html

--===============3672630667999798385==
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
<tr><td><b>Series:</b></td><td>drm/{i915, xe}/display: another stab at i915_fence_timeout() removal</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172457/">https://patchwork.freedesktop.org/series/172457/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172457v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172457v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c_BAT -&gt; xe-pw-172457v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-bmg-2 bat-nvls-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9060 -&gt; IGT_9061</li>
<li>Linux: xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c -&gt; xe-pw-172457v1</li>
</ul>
<p>IGT_9060: 9060<br />
  IGT_9061: 9061<br />
  xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c: 291141d363710c4ac7ef9ab71153459d746ed50c<br />
  xe-pw-172457v1: 172457v1</p>

</body>
</html>

--===============3672630667999798385==--
