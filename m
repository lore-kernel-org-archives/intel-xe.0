Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1F0C3ABDD
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 15:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A6F10E4F1;
	Tue, 20 May 2025 15:03:51 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA0610E4F1;
 Tue, 20 May 2025 15:03:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9169617764145837230=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/dp=3A_Fix_the_enab?=
 =?utf-8?q?ling/disabling_of_audio_SDP_splitting?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 May 2025 15:03:50 -0000
Message-ID: <174775343011.5114.7483818439397329026@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250520142219.1688401-1-imre.deak@intel.com>
In-Reply-To: <20250520142219.1688401-1-imre.deak@intel.com>
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

--===============9169617764145837230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Fix the enabling/disabling of audio SDP splitting
URL   : https://patchwork.freedesktop.org/series/149254/
State : failure

== Summary ==

CI Bug Log - changes from xe-3114-943adcb1bc226246125ec1d18a387b4295e73703_BAT -> xe-pw-149254v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149254v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149254v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 1)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-149254v1_BAT prevented too many machines from booting.

  Missing    (8): bat-bmg-1 bat-lnl-2 bat-pvc-2 bat-lnl-1 bat-atsm-2 bat-bmg-2 bat-adlp-vm bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8369 -> IGT_8370
  * Linux: xe-3114-943adcb1bc226246125ec1d18a387b4295e73703 -> xe-pw-149254v1

  IGT_8369: 8369
  IGT_8370: 8370
  xe-3114-943adcb1bc226246125ec1d18a387b4295e73703: 943adcb1bc226246125ec1d18a387b4295e73703
  xe-pw-149254v1: 149254v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v1/index.html

--===============9169617764145837230==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Fix the enabling/disabling of audio SDP splitting</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149254/">https://patchwork.freedesktop.org/series/149254/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3114-943adcb1bc226246125ec1d18a387b4295e73703_BAT -&gt; xe-pw-149254v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149254v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-149254v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 1)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-149254v1_BAT prevented too many machines from booting.</p>
<p>Missing    (8): bat-bmg-1 bat-lnl-2 bat-pvc-2 bat-lnl-1 bat-atsm-2 bat-bmg-2 bat-adlp-vm bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8369 -&gt; IGT_8370</li>
<li>Linux: xe-3114-943adcb1bc226246125ec1d18a387b4295e73703 -&gt; xe-pw-149254v1</li>
</ul>
<p>IGT_8369: 8369<br />
  IGT_8370: 8370<br />
  xe-3114-943adcb1bc226246125ec1d18a387b4295e73703: 943adcb1bc226246125ec1d18a387b4295e73703<br />
  xe-pw-149254v1: 149254v1</p>

</body>
</html>

--===============9169617764145837230==--
