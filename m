Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA36C3ABBC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 07:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C86510E14A;
	Tue,  6 May 2025 07:52:58 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6F810E14A;
 Tue,  6 May 2025 07:52:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5693567238124436108=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/vrr=3A_Program_EMP?=
 =?utf-8?q?=5FAS=5FSDP=5FTL_for_DP_AS_SDP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 May 2025 07:52:56 -0000
Message-ID: <174651797633.50314.14245483492929040994@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250429143055.130701-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250429143055.130701-1-ankit.k.nautiyal@intel.com>
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

--===============5693567238124436108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/vrr: Program EMP_AS_SDP_TL for DP AS SDP
URL   : https://patchwork.freedesktop.org/series/148422/
State : success

== Summary ==

CI Bug Log - changes from xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039_BAT -> xe-pw-148422v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8342 -> IGT_8343
  * Linux: xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039 -> xe-pw-148422v1

  IGT_8342: 8342
  IGT_8343: 882124078d617b631891f40f54e3f41b0334f142 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039: 5752a8bfd947553d8006307e10d1bd5abdfc8039
  xe-pw-148422v1: 148422v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/index.html

--===============5693567238124436108==
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
<tr><td><b>Series:</b></td><td>drm/i915/vrr: Program EMP_AS_SDP_TL for DP AS SDP</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148422/">https://patchwork.freedesktop.org/series/148422/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039_BAT -&gt; xe-pw-148422v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8342 -&gt; IGT_8343</li>
<li>Linux: xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039 -&gt; xe-pw-148422v1</li>
</ul>
<p>IGT_8342: 8342<br />
  IGT_8343: 882124078d617b631891f40f54e3f41b0334f142 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039: 5752a8bfd947553d8006307e10d1bd5abdfc8039<br />
  xe-pw-148422v1: 148422v1</p>

</body>
</html>

--===============5693567238124436108==--
