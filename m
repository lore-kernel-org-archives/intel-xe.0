Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AC3C36000
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 15:44:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8E110E151;
	Fri, 21 Mar 2025 15:44:12 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7D010E151;
 Fri, 21 Mar 2025 15:44:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1507291762711942355=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915=3A_Fix_DP_MST_SB_m?=
 =?utf-8?q?essage_timeouts_due_to_PPS_delays?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Mar 2025 15:44:10 -0000
Message-ID: <174257185056.65114.10676761687001865842@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250321145626.94101-1-imre.deak@intel.com>
In-Reply-To: <20250321145626.94101-1-imre.deak@intel.com>
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

--===============1507291762711942355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Fix DP MST SB message timeouts due to PPS delays
URL   : https://patchwork.freedesktop.org/series/146601/
State : success

== Summary ==

CI Bug Log - changes from xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396_BAT -> xe-pw-146601v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396 -> xe-pw-146601v1

  IGT_8277: 8277
  xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396: b15a87713d14b1c2986f47a622c5a8c5458e2396
  xe-pw-146601v1: 146601v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146601v1/index.html

--===============1507291762711942355==
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
<tr><td><b>Series:</b></td><td>drm/i915: Fix DP MST SB message timeouts due to PPS delays</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146601/">https://patchwork.freedesktop.org/series/146601/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146601v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146601v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396_BAT -&gt; xe-pw-146601v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396 -&gt; xe-pw-146601v1</li>
</ul>
<p>IGT_8277: 8277<br />
  xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396: b15a87713d14b1c2986f47a622c5a8c5458e2396<br />
  xe-pw-146601v1: 146601v1</p>

</body>
</html>

--===============1507291762711942355==--
