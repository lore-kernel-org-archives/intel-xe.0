Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27251C2D0CD
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 14:38:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C1C10E12A;
	Mon, 19 May 2025 14:38:24 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A7E10E12A;
 Mon, 19 May 2025 14:38:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3173407185991603791=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dp=5Fmst=3A_Work_a?=
 =?utf-8?q?round_Thunderbolt_sink_disconnect_after_SINK=5FCOUNT=5FESI_read_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 May 2025 14:38:23 -0000
Message-ID: <174766550353.12.12161883724259921243@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250516170946.1313722-1-imre.deak@intel.com>
In-Reply-To: <20250516170946.1313722-1-imre.deak@intel.com>
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

--===============3173407185991603791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp_mst: Work around Thunderbolt sink disconnect after SINK_COUNT_ESI read (rev2)
URL   : https://patchwork.freedesktop.org/series/149130/
State : success

== Summary ==

CI Bug Log - changes from xe-3108-36da6a9300fc8686d01b5450723200dafd89526f_BAT -> xe-pw-149130v2_BAT
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

  * IGT: IGT_8366 -> IGT_8367
  * Linux: xe-3108-36da6a9300fc8686d01b5450723200dafd89526f -> xe-pw-149130v2

  IGT_8366: 8366
  IGT_8367: 8367
  xe-3108-36da6a9300fc8686d01b5450723200dafd89526f: 36da6a9300fc8686d01b5450723200dafd89526f
  xe-pw-149130v2: 149130v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149130v2/index.html

--===============3173407185991603791==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp_mst: Work around Thunderbolt sink disconnect after SINK_COUNT_ESI read (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149130/">https://patchwork.freedesktop.org/series/149130/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149130v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149130v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3108-36da6a9300fc8686d01b5450723200dafd89526f_BAT -&gt; xe-pw-149130v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8366 -&gt; IGT_8367</li>
<li>Linux: xe-3108-36da6a9300fc8686d01b5450723200dafd89526f -&gt; xe-pw-149130v2</li>
</ul>
<p>IGT_8366: 8366<br />
  IGT_8367: 8367<br />
  xe-3108-36da6a9300fc8686d01b5450723200dafd89526f: 36da6a9300fc8686d01b5450723200dafd89526f<br />
  xe-pw-149130v2: 149130v2</p>

</body>
</html>

--===============3173407185991603791==--
