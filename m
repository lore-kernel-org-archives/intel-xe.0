Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359C1C8303C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 14:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9FA10E667;
	Tue,  8 Jul 2025 14:36:33 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE0F10E66A;
 Tue,  8 Jul 2025 14:36:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0140357744487605085=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/sched=3A_Consolidate_dr?=
 =?utf-8?q?m=5Fsched=5Frq=5Fselect=5Fentity=5Frr?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Jul 2025 14:36:32 -0000
Message-ID: <175198539271.144352.4354396872897421005@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250708122121.75689-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250708122121.75689-1-tvrtko.ursulin@igalia.com>
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

--===============0140357744487605085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/sched: Consolidate drm_sched_rq_select_entity_rr
URL   : https://patchwork.freedesktop.org/series/151335/
State : failure

== Summary ==

CI Bug Log - changes from xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b_BAT -> xe-pw-151335v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-151335v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-151335v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 4)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-151335v1_BAT prevented too many machines from booting.

  Missing    (5): bat-bmg-1 bat-pvc-2 bat-dg2-oem2 bat-atsm-2 bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b -> xe-pw-151335v1

  IGT_8445: 8445
  xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b: 8b32b5509128873da8ecfc06beefcb58927eb50b
  xe-pw-151335v1: 151335v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/index.html

--===============0140357744487605085==
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
<tr><td><b>Series:</b></td><td>drm/sched: Consolidate drm_sched_rq_select_entity_rr</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151335/">https://patchwork.freedesktop.org/series/151335/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b_BAT -&gt; xe-pw-151335v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-151335v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-151335v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 4)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-151335v1_BAT prevented too many machines from booting.</p>
<p>Missing    (5): bat-bmg-1 bat-pvc-2 bat-dg2-oem2 bat-atsm-2 bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b -&gt; xe-pw-151335v1</li>
</ul>
<p>IGT_8445: 8445<br />
  xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b: 8b32b5509128873da8ecfc06beefcb58927eb50b<br />
  xe-pw-151335v1: 151335v1</p>

</body>
</html>

--===============0140357744487605085==--
