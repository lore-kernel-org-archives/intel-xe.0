Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970D9C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 11:50:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1E310E7E3;
	Thu, 12 Jun 2025 11:50:16 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242E710E7E4;
 Thu, 12 Jun 2025 11:50:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8212857697924669303=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/vf=3A_Post-migration?=
 =?utf-8?q?_recovery_of_queues_and_jobs_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Jun 2025 11:50:15 -0000
Message-ID: <174972901513.71058.8978182632451360364@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250612102449.1412058-1-tomasz.lis@intel.com>
In-Reply-To: <20250612102449.1412058-1-tomasz.lis@intel.com>
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

--===============8212857697924669303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Post-migration recovery of queues and jobs (rev5)
URL   : https://patchwork.freedesktop.org/series/148982/
State : success

== Summary ==

CI Bug Log - changes from xe-3237-75238c32deae15ee4120b42a5be556ec36807a84_BAT -> xe-pw-148982v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8405 -> IGT_8406
  * Linux: xe-3237-75238c32deae15ee4120b42a5be556ec36807a84 -> xe-pw-148982v5

  IGT_8405: 8405
  IGT_8406: 12d7c99650c85e479571b6db2c392408be474c88 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3237-75238c32deae15ee4120b42a5be556ec36807a84: 75238c32deae15ee4120b42a5be556ec36807a84
  xe-pw-148982v5: 148982v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v5/index.html

--===============8212857697924669303==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Post-migration recovery of queues and jobs (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148982/">https://patchwork.freedesktop.org/series/148982/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3237-75238c32deae15ee4120b42a5be556ec36807a84_BAT -&gt; xe-pw-148982v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8405 -&gt; IGT_8406</li>
<li>Linux: xe-3237-75238c32deae15ee4120b42a5be556ec36807a84 -&gt; xe-pw-148982v5</li>
</ul>
<p>IGT_8405: 8405<br />
  IGT_8406: 12d7c99650c85e479571b6db2c392408be474c88 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3237-75238c32deae15ee4120b42a5be556ec36807a84: 75238c32deae15ee4120b42a5be556ec36807a84<br />
  xe-pw-148982v5: 148982v5</p>

</body>
</html>

--===============8212857697924669303==--
