Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4561BC55174
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 15:22:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C044410EEAE;
	Wed,  5 Aug 2026 15:22:20 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCD610E216;
 Wed,  5 Aug 2026 15:22:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3201965802113536043=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe=5Fdebugfs=3A_Expo?=
 =?utf-8?q?se_G-State_and_PCIe_link_state_debugfs_for_CRI?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Aug 2026 15:22:19 -0000
Message-ID: <178594333963.21461.6514528516486552649@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260805102226.1764-1-karthik.poosa@intel.com>
In-Reply-To: <20260805102226.1764-1-karthik.poosa@intel.com>
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

--===============3201965802113536043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_debugfs: Expose G-State and PCIe link state debugfs for CRI
URL   : https://patchwork.freedesktop.org/series/171649/
State : success

== Summary ==

CI Bug Log - changes from xe-5546-b50d67c8afa30f742e87999b53f80d22f8be4ffc_BAT -> xe-pw-171649v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5546-b50d67c8afa30f742e87999b53f80d22f8be4ffc -> xe-pw-171649v1

  IGT_9038: 9038
  xe-5546-b50d67c8afa30f742e87999b53f80d22f8be4ffc: b50d67c8afa30f742e87999b53f80d22f8be4ffc
  xe-pw-171649v1: 171649v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171649v1/index.html

--===============3201965802113536043==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_debugfs: Expose G-State and PCIe link state debugfs for CRI</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171649/">https://patchwork.freedesktop.org/series/171649/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171649v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171649v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5546-b50d67c8afa30f742e87999b53f80d22f8be4ffc_BAT -&gt; xe-pw-171649v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5546-b50d67c8afa30f742e87999b53f80d22f8be4ffc -&gt; xe-pw-171649v1</li>
</ul>
<p>IGT_9038: 9038<br />
  xe-5546-b50d67c8afa30f742e87999b53f80d22f8be4ffc: b50d67c8afa30f742e87999b53f80d22f8be4ffc<br />
  xe-pw-171649v1: 171649v1</p>

</body>
</html>

--===============3201965802113536043==--
