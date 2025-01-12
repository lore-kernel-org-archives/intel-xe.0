Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5A2E77188
	for <intel-xe@archiver.kernel.org>; Sun, 12 Jan 2025 23:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6971810E26D;
	Sun, 12 Jan 2025 23:05:08 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987FC10E26D;
 Sun, 12 Jan 2025 23:05:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5847653372984266721=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/oa=3A_Add_missing_VI?=
 =?utf-8?q?SACTL_mux_registers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 12 Jan 2025 23:05:06 -0000
Message-ID: <173672310661.3025930.2926771538560948292@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250111021539.2920346-1-ashutosh.dixit@intel.com>
In-Reply-To: <20250111021539.2920346-1-ashutosh.dixit@intel.com>
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

--===============5847653372984266721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/oa: Add missing VISACTL mux registers (rev2)
URL   : https://patchwork.freedesktop.org/series/143423/
State : success

== Summary ==

CI Bug Log - changes from xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780_BAT -> xe-pw-143423v2_BAT
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

  * Linux: xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780 -> xe-pw-143423v2

  IGT_8188: ef0abf7f39a7ef0ecf2f08c62b90b852c435c755 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780: 83e5b68f2dee4e409b69f279da7562073e2c5780
  xe-pw-143423v2: 143423v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143423v2/index.html

--===============5847653372984266721==
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
<tr><td><b>Series:</b></td><td>drm/xe/oa: Add missing VISACTL mux registers (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143423/">https://patchwork.freedesktop.org/series/143423/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143423v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143423v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780_BAT -&gt; xe-pw-143423v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780 -&gt; xe-pw-143423v2</li>
</ul>
<p>IGT_8188: ef0abf7f39a7ef0ecf2f08c62b90b852c435c755 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780: 83e5b68f2dee4e409b69f279da7562073e2c5780<br />
  xe-pw-143423v2: 143423v2</p>

</body>
</html>

--===============5847653372984266721==--
