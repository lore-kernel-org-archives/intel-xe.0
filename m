Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C78C55822
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 05:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC0410E1A9;
	Wed,  5 Aug 2026 05:10:59 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F5B10E16E;
 Wed,  5 Aug 2026 05:10:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2149609189746450368=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/drm=5Fras=3A_Move_ha?=
 =?utf-8?q?s=5Fdrm=5Fras_check_to_drm=5Fras_layer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Aug 2026 05:10:59 -0000
Message-ID: <178590665909.20166.7590039677419580288@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260803080823.1166925-1-raag.jadav@intel.com>
In-Reply-To: <20260803080823.1166925-1-raag.jadav@intel.com>
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

--===============2149609189746450368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/drm_ras: Move has_drm_ras check to drm_ras layer
URL   : https://patchwork.freedesktop.org/series/171492/
State : failure

== Summary ==

CI Bug Log - changes from xe-5520-602e9a8963a891cde0c1c0cdcb3f3ff16c3a8b39_BAT -> xe-pw-171492v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-171492v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-171492v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 0)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-171492v1_BAT prevented too many machines from booting.

  Missing    (13): bat-bmg-1 bat-lnl-2 bat-ptl-1 bat-ptl-2 bat-lnl-1 bat-ptl-vm bat-bmg-vm bat-atsm-2 bat-bmg-3 bat-wcl-1 bat-wcl-2 bat-bmg-2 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5520-602e9a8963a891cde0c1c0cdcb3f3ff16c3a8b39 -> xe-pw-171492v1

  IGT_9036: 9036
  xe-5520-602e9a8963a891cde0c1c0cdcb3f3ff16c3a8b39: 602e9a8963a891cde0c1c0cdcb3f3ff16c3a8b39
  xe-pw-171492v1: 171492v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v1/index.html

--===============2149609189746450368==
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
<tr><td><b>Series:</b></td><td>drm/xe/drm_ras: Move has_drm_ras check to drm_ras layer</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171492/">https://patchwork.freedesktop.org/series/171492/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5520-602e9a8963a891cde0c1c0cdcb3f3ff16c3a8b39_BAT -&gt; xe-pw-171492v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-171492v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-171492v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-171492v1_BAT prevented too many machines from booting.</p>
<p>Missing    (13): bat-bmg-1 bat-lnl-2 bat-ptl-1 bat-ptl-2 bat-lnl-1 bat-ptl-vm bat-bmg-vm bat-atsm-2 bat-bmg-3 bat-wcl-1 bat-wcl-2 bat-bmg-2 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5520-602e9a8963a891cde0c1c0cdcb3f3ff16c3a8b39 -&gt; xe-pw-171492v1</li>
</ul>
<p>IGT_9036: 9036<br />
  xe-5520-602e9a8963a891cde0c1c0cdcb3f3ff16c3a8b39: 602e9a8963a891cde0c1c0cdcb3f3ff16c3a8b39<br />
  xe-pw-171492v1: 171492v1</p>

</body>
</html>

--===============2149609189746450368==--
