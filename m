Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA60CAC5A8
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 14:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A21A10E1CA;
	Mon, 22 Sep 2025 14:30:15 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC78F10E1CA;
 Mon, 22 Sep 2025 14:30:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5549621381531344392=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/psr=3A_Deactivate_?=
 =?utf-8?q?PSR_only_on_LNL_and_when_selective_fetch_enabled?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Sep 2025 14:30:13 -0000
Message-ID: <175855141396.354596.15755591198108714414@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250922102725.2752742-1-jouni.hogander@intel.com>
In-Reply-To: <20250922102725.2752742-1-jouni.hogander@intel.com>
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

--===============5549621381531344392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/psr: Deactivate PSR only on LNL and when selective fetch enabled
URL   : https://patchwork.freedesktop.org/series/154834/
State : success

== Summary ==

CI Bug Log - changes from xe-3811-07f928e6921093fc1341f7024f0bf72bcebc8842_BAT -> xe-pw-154834v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3811-07f928e6921093fc1341f7024f0bf72bcebc8842 -> xe-pw-154834v1

  IGT_8546: 8546
  xe-3811-07f928e6921093fc1341f7024f0bf72bcebc8842: 07f928e6921093fc1341f7024f0bf72bcebc8842
  xe-pw-154834v1: 154834v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154834v1/index.html

--===============5549621381531344392==
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
<tr><td><b>Series:</b></td><td>drm/i915/psr: Deactivate PSR only on LNL and when selective fetch enabled</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154834/">https://patchwork.freedesktop.org/series/154834/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154834v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154834v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3811-07f928e6921093fc1341f7024f0bf72bcebc8842_BAT -&gt; xe-pw-154834v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3811-07f928e6921093fc1341f7024f0bf72bcebc8842 -&gt; xe-pw-154834v1</li>
</ul>
<p>IGT_8546: 8546<br />
  xe-3811-07f928e6921093fc1341f7024f0bf72bcebc8842: 07f928e6921093fc1341f7024f0bf72bcebc8842<br />
  xe-pw-154834v1: 154834v1</p>

</body>
</html>

--===============5549621381531344392==--
