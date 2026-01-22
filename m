Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D339D3EE67
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 13:31:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E5E10E9AB;
	Thu, 22 Jan 2026 13:31:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0940710E9AD;
 Thu, 22 Jan 2026 13:31:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3581604139104936197=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/cdclk=3A_Extend_Wa?=
 =?utf-8?q?=5F13012396614_to_Xe3p=5FLPD?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Jan 2026 13:31:13 -0000
Message-ID: <176908867303.183336.16279719596350334072@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260122-wa_13012396614-xe3p_lpd-v1-1-39d34a3a5b77@intel.com>
In-Reply-To: <20260122-wa_13012396614-xe3p_lpd-v1-1-39d34a3a5b77@intel.com>
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

--===============3581604139104936197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/cdclk: Extend Wa_13012396614 to Xe3p_LPD
URL   : https://patchwork.freedesktop.org/series/160488/
State : failure

== Summary ==

CI Bug Log - changes from xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c_BAT -> xe-pw-160488v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-160488v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160488v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 1)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-160488v1_BAT prevented too many machines from booting.

  Missing    (11): bat-bmg-1 bat-lnl-2 bat-ptl-1 bat-ptl-2 bat-lnl-1 bat-ptl-vm bat-dg2-oem2 bat-atsm-2 bat-bmg-3 bat-bmg-2 bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c -> xe-pw-160488v1

  IGT_8712: 8712
  xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c: 2efdbb79ed20bfabfbe6f2e5cc393d85973d567c
  xe-pw-160488v1: 160488v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/index.html

--===============3581604139104936197==
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
<tr><td><b>Series:</b></td><td>drm/i915/cdclk: Extend Wa_13012396614 to Xe3p_LPD</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160488/">https://patchwork.freedesktop.org/series/160488/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c_BAT -&gt; xe-pw-160488v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-160488v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-160488v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 1)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-160488v1_BAT prevented too many machines from booting.</p>
<p>Missing    (11): bat-bmg-1 bat-lnl-2 bat-ptl-1 bat-ptl-2 bat-lnl-1 bat-ptl-vm bat-dg2-oem2 bat-atsm-2 bat-bmg-3 bat-bmg-2 bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c -&gt; xe-pw-160488v1</li>
</ul>
<p>IGT_8712: 8712<br />
  xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c: 2efdbb79ed20bfabfbe6f2e5cc393d85973d567c<br />
  xe-pw-160488v1: 160488v1</p>

</body>
</html>

--===============3581604139104936197==--
