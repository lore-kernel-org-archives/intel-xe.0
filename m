Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9215BC8303C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 22:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F3710E6EF;
	Tue,  8 Jul 2025 22:35:46 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24A810E1E1;
 Tue,  8 Jul 2025 22:35:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2491592109026452229=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/dp=3A_Change_AUX_DPCD_p?=
 =?utf-8?q?robe_address_from_LANE0=5F1=5FSTATUS_to_TRAINING=5FPATTERN=5FSET?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Jul 2025 22:35:45 -0000
Message-ID: <175201414585.145914.14074874423845882270@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250708212331.112898-1-imre.deak@intel.com>
In-Reply-To: <20250708212331.112898-1-imre.deak@intel.com>
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

--===============2491592109026452229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/dp: Change AUX DPCD probe address from LANE0_1_STATUS to TRAINING_PATTERN_SET
URL   : https://patchwork.freedesktop.org/series/151358/
State : success

== Summary ==

CI Bug Log - changes from xe-3375-8928bbe5e909305341302cbcb5f58cb9eb2dddcb_BAT -> xe-pw-151358v1_BAT
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

  * Linux: xe-3375-8928bbe5e909305341302cbcb5f58cb9eb2dddcb -> xe-pw-151358v1

  IGT_8447: 8447
  xe-3375-8928bbe5e909305341302cbcb5f58cb9eb2dddcb: 8928bbe5e909305341302cbcb5f58cb9eb2dddcb
  xe-pw-151358v1: 151358v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151358v1/index.html

--===============2491592109026452229==
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
<tr><td><b>Series:</b></td><td>drm/dp: Change AUX DPCD probe address from LANE0_1_STATUS to TRAINING_PATTERN_SET</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151358/">https://patchwork.freedesktop.org/series/151358/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151358v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151358v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3375-8928bbe5e909305341302cbcb5f58cb9eb2dddcb_BAT -&gt; xe-pw-151358v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3375-8928bbe5e909305341302cbcb5f58cb9eb2dddcb -&gt; xe-pw-151358v1</li>
</ul>
<p>IGT_8447: 8447<br />
  xe-3375-8928bbe5e909305341302cbcb5f58cb9eb2dddcb: 8928bbe5e909305341302cbcb5f58cb9eb2dddcb<br />
  xe-pw-151358v1: 151358v1</p>

</body>
</html>

--===============2491592109026452229==--
