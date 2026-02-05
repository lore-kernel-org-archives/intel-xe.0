Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C03CEC1E81
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 09:29:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118F210E854;
	Thu,  5 Feb 2026 09:29:49 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE75C10E842;
 Thu,  5 Feb 2026 09:29:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5402803930901626692=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/query=3A_Only_advert?=
 =?utf-8?q?ise_NO=5FCOMPRESSION_hint_on_devices_with_flat_CCS?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Feb 2026 09:29:48 -0000
Message-ID: <177028378867.227557.5124352804535688404@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260205082048.2988738-2-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20260205082048.2988738-2-sanjay.kumar.yadav@intel.com>
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

--===============5402803930901626692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/query: Only advertise NO_COMPRESSION hint on devices with flat CCS
URL   : https://patchwork.freedesktop.org/series/161180/
State : success

== Summary ==

CI Bug Log - changes from xe-4503-8883ec84c85819dacca94997b60371c3ed57ee29_BAT -> xe-pw-161180v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 10)
------------------------------

  Missing    (2): bat-dg2-oem2 bat-bmg-3 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8737 -> IGT_8738
  * Linux: xe-4503-8883ec84c85819dacca94997b60371c3ed57ee29 -> xe-pw-161180v1

  IGT_8737: 8737
  IGT_8738: b3fc8fb534a27517f2a49e63ef993e7550b9b959 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4503-8883ec84c85819dacca94997b60371c3ed57ee29: 8883ec84c85819dacca94997b60371c3ed57ee29
  xe-pw-161180v1: 161180v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161180v1/index.html

--===============5402803930901626692==
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
<tr><td><b>Series:</b></td><td>drm/xe/query: Only advertise NO_COMPRESSION hint on devices with flat CCS</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161180/">https://patchwork.freedesktop.org/series/161180/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161180v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161180v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4503-8883ec84c85819dacca94997b60371c3ed57ee29_BAT -&gt; xe-pw-161180v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 10)</h2>
<p>Missing    (2): bat-dg2-oem2 bat-bmg-3 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8737 -&gt; IGT_8738</li>
<li>Linux: xe-4503-8883ec84c85819dacca94997b60371c3ed57ee29 -&gt; xe-pw-161180v1</li>
</ul>
<p>IGT_8737: 8737<br />
  IGT_8738: b3fc8fb534a27517f2a49e63ef993e7550b9b959 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4503-8883ec84c85819dacca94997b60371c3ed57ee29: 8883ec84c85819dacca94997b60371c3ed57ee29<br />
  xe-pw-161180v1: 161180v1</p>

</body>
</html>

--===============5402803930901626692==--
