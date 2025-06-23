Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914E9C7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 09:30:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521A810E2B4;
	Mon, 23 Jun 2025 09:30:22 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1104A10E2B4;
 Mon, 23 Jun 2025 09:30:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2105746386836443081=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_move_un?=
 =?utf-8?q?ordered_works_to_new_private_workqueue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Jun 2025 09:30:21 -0000
Message-ID: <175067102106.99774.12100856083056333134@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250620091632.1256135-1-luciano.coelho@intel.com>
In-Reply-To: <20250620091632.1256135-1-luciano.coelho@intel.com>
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

--===============2105746386836443081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: move unordered works to new private workqueue
URL   : https://patchwork.freedesktop.org/series/150604/
State : success

== Summary ==

CI Bug Log - changes from xe-3286-cc5c19e59842d7e522f9f9f3943efe34943ed70b_BAT -> xe-pw-150604v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 7)
------------------------------

  Missing    (2): bat-pvc-2 bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8420 -> IGT_8421
  * Linux: xe-3286-cc5c19e59842d7e522f9f9f3943efe34943ed70b -> xe-pw-150604v1

  IGT_8420: 7da0c57182cc149656dde626cf09ccf6353e8ed2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8421: 8421
  xe-3286-cc5c19e59842d7e522f9f9f3943efe34943ed70b: cc5c19e59842d7e522f9f9f3943efe34943ed70b
  xe-pw-150604v1: 150604v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150604v1/index.html

--===============2105746386836443081==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: move unordered works to new private workqueue</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150604/">https://patchwork.freedesktop.org/series/150604/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150604v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150604v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3286-cc5c19e59842d7e522f9f9f3943efe34943ed70b_BAT -&gt; xe-pw-150604v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 7)</h2>
<p>Missing    (2): bat-pvc-2 bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8420 -&gt; IGT_8421</li>
<li>Linux: xe-3286-cc5c19e59842d7e522f9f9f3943efe34943ed70b -&gt; xe-pw-150604v1</li>
</ul>
<p>IGT_8420: 7da0c57182cc149656dde626cf09ccf6353e8ed2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8421: 8421<br />
  xe-3286-cc5c19e59842d7e522f9f9f3943efe34943ed70b: cc5c19e59842d7e522f9f9f3943efe34943ed70b<br />
  xe-pw-150604v1: 150604v1</p>

</body>
</html>

--===============2105746386836443081==--
