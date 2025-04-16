Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CC2C369B1
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 06:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A80010E075;
	Wed, 16 Apr 2025 06:48:25 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A294C10E075;
 Wed, 16 Apr 2025 06:48:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3715540436070727286=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/xe=5Fpmu=3A_Add_a_nu?=
 =?utf-8?q?ll_check_for_xe_gt?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Apr 2025 06:48:23 -0000
Message-ID: <174478610366.8986.234348495357355826@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250416060531.2454332-1-riana.tauro@intel.com>
In-Reply-To: <20250416060531.2454332-1-riana.tauro@intel.com>
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

--===============3715540436070727286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_pmu: Add a null check for xe gt
URL   : https://patchwork.freedesktop.org/series/147798/
State : failure

== Summary ==

CI Bug Log - changes from xe-2957-b8f79cb562e983515cf827f0f336f79423b8d5a7_BAT -> xe-pw-147798v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-147798v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-147798v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 0)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-147798v1_BAT prevented too many machines from booting.

  Missing    (9): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-vm bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2957-b8f79cb562e983515cf827f0f336f79423b8d5a7 -> xe-pw-147798v1

  IGT_8320: cd3b5612be3cef838f16e074bf1bc421399d584d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2957-b8f79cb562e983515cf827f0f336f79423b8d5a7: b8f79cb562e983515cf827f0f336f79423b8d5a7
  xe-pw-147798v1: 147798v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147798v1/index.html

--===============3715540436070727286==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_pmu: Add a null check for xe gt</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147798/">https://patchwork.freedesktop.org/series/147798/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147798v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147798v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2957-b8f79cb562e983515cf827f0f336f79423b8d5a7_BAT -&gt; xe-pw-147798v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-147798v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-147798v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-147798v1_BAT prevented too many machines from booting.</p>
<p>Missing    (9): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-vm bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2957-b8f79cb562e983515cf827f0f336f79423b8d5a7 -&gt; xe-pw-147798v1</li>
</ul>
<p>IGT_8320: cd3b5612be3cef838f16e074bf1bc421399d584d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2957-b8f79cb562e983515cf827f0f336f79423b8d5a7: b8f79cb562e983515cf827f0f336f79423b8d5a7<br />
  xe-pw-147798v1: 147798v1</p>

</body>
</html>

--===============3715540436070727286==--
