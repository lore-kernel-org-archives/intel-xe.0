Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7B8C36014
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 10:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CCC10E73F;
	Wed,  2 Apr 2025 10:35:14 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C09510E73F;
 Wed,  2 Apr 2025 10:35:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6752147193722508880=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Remove_UHBR13=2E5_for_ICL?=
 =?utf-8?q?=2C_DG2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Apr 2025 10:35:13 -0000
Message-ID: <174359011317.26680.17443408089594792448@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250402-dprates-v3-0-9e5d8ca989dd@intel.com>
In-Reply-To: <20250402-dprates-v3-0-9e5d8ca989dd@intel.com>
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

--===============6752147193722508880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove UHBR13.5 for ICL, DG2
URL   : https://patchwork.freedesktop.org/series/147114/
State : success

== Summary ==

CI Bug Log - changes from xe-2896-f0fd77956987f035c79d08c812343a27a655a57b_BAT -> xe-pw-147114v1_BAT
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

  * IGT: IGT_8297 -> IGT_8298
  * Linux: xe-2896-f0fd77956987f035c79d08c812343a27a655a57b -> xe-pw-147114v1

  IGT_8297: 0a27244ed1972af84c78d68523d5791e596349e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8298: 8298
  xe-2896-f0fd77956987f035c79d08c812343a27a655a57b: f0fd77956987f035c79d08c812343a27a655a57b
  xe-pw-147114v1: 147114v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147114v1/index.html

--===============6752147193722508880==
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
<tr><td><b>Series:</b></td><td>Remove UHBR13.5 for ICL, DG2</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147114/">https://patchwork.freedesktop.org/series/147114/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147114v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147114v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2896-f0fd77956987f035c79d08c812343a27a655a57b_BAT -&gt; xe-pw-147114v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8297 -&gt; IGT_8298</li>
<li>Linux: xe-2896-f0fd77956987f035c79d08c812343a27a655a57b -&gt; xe-pw-147114v1</li>
</ul>
<p>IGT_8297: 0a27244ed1972af84c78d68523d5791e596349e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8298: 8298<br />
  xe-2896-f0fd77956987f035c79d08c812343a27a655a57b: f0fd77956987f035c79d08c812343a27a655a57b<br />
  xe-pw-147114v1: 147114v1</p>

</body>
</html>

--===============6752147193722508880==--
