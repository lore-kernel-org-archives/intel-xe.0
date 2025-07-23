Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A28C83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 10:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AE010E7A2;
	Wed, 23 Jul 2025 10:36:22 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D35710E7A2;
 Wed, 23 Jul 2025 10:36:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4025005009485083186=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/display=3A_Block_hpd?=
 =?utf-8?q?_during_suspend_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Jul 2025 10:36:21 -0000
Message-ID: <175326698103.182772.11713595700438886275@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250723092946.1975018-1-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20250723092946.1975018-1-dibin.moolakadan.subrahmanian@intel.com>
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

--===============4025005009485083186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Block hpd during suspend (rev3)
URL   : https://patchwork.freedesktop.org/series/151747/
State : success

== Summary ==

CI Bug Log - changes from xe-3461-0a0e5494c4c91b11918d08c3ca88d8868141a5e5_BAT -> xe-pw-151747v3_BAT
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

  * IGT: IGT_8473 -> IGT_8474
  * Linux: xe-3461-0a0e5494c4c91b11918d08c3ca88d8868141a5e5 -> xe-pw-151747v3

  IGT_8473: b8b6f7615f840e15377c3b48a9c4178b3a248fb0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8474: 54376e96f3f84e7bc6ccdc0106017cf2778ef08a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3461-0a0e5494c4c91b11918d08c3ca88d8868141a5e5: 0a0e5494c4c91b11918d08c3ca88d8868141a5e5
  xe-pw-151747v3: 151747v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v3/index.html

--===============4025005009485083186==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Block hpd during suspend (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151747/">https://patchwork.freedesktop.org/series/151747/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3461-0a0e5494c4c91b11918d08c3ca88d8868141a5e5_BAT -&gt; xe-pw-151747v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8473 -&gt; IGT_8474</li>
<li>Linux: xe-3461-0a0e5494c4c91b11918d08c3ca88d8868141a5e5 -&gt; xe-pw-151747v3</li>
</ul>
<p>IGT_8473: b8b6f7615f840e15377c3b48a9c4178b3a248fb0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8474: 54376e96f3f84e7bc6ccdc0106017cf2778ef08a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3461-0a0e5494c4c91b11918d08c3ca88d8868141a5e5: 0a0e5494c4c91b11918d08c3ca88d8868141a5e5<br />
  xe-pw-151747v3: 151747v3</p>

</body>
</html>

--===============4025005009485083186==--
