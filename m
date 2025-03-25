Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C970C36002
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 01:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC2410E258;
	Tue, 25 Mar 2025 01:11:31 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B0310E0A5;
 Tue, 25 Mar 2025 01:11:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8857335389200842557=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/pmu=3A_Add_GT_freque?=
 =?utf-8?q?ncy_events_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Mar 2025 01:11:30 -0000
Message-ID: <174286509080.75924.11595397651922075860@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250324232402.46481-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250324232402.46481-1-vinay.belgaumkar@intel.com>
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

--===============8857335389200842557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pmu: Add GT frequency events (rev6)
URL   : https://patchwork.freedesktop.org/series/144164/
State : success

== Summary ==

CI Bug Log - changes from xe-2842-9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c_BAT -> xe-pw-144164v6_BAT
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

  * IGT: IGT_8280 -> IGT_8281
  * Linux: xe-2842-9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c -> xe-pw-144164v6

  IGT_8280: 8280
  IGT_8281: 18c445bea641c03b637d7ed5bc3bd120b5d83b2a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2842-9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c: 9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c
  xe-pw-144164v6: 144164v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144164v6/index.html

--===============8857335389200842557==
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
<tr><td><b>Series:</b></td><td>drm/xe/pmu: Add GT frequency events (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144164/">https://patchwork.freedesktop.org/series/144164/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144164v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144164v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2842-9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c_BAT -&gt; xe-pw-144164v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8280 -&gt; IGT_8281</li>
<li>Linux: xe-2842-9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c -&gt; xe-pw-144164v6</li>
</ul>
<p>IGT_8280: 8280<br />
  IGT_8281: 18c445bea641c03b637d7ed5bc3bd120b5d83b2a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2842-9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c: 9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c<br />
  xe-pw-144164v6: 144164v6</p>

</body>
</html>

--===============8857335389200842557==--
