Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A95C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 16:39:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDFB112CE5;
	Tue, 30 Apr 2024 16:39:27 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D1A112CE5;
 Tue, 30 Apr 2024 16:39:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9221849924873797464=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_remove_sysfs_entries_o?=
 =?utf-8?q?n_driver_unbind?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Apr 2024 16:39:26 -0000
Message-ID: <171449516685.1793102.12755750703586359839@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240430-hotrebind_xu-v1-1-3c5e88d1516b@intel.com>
In-Reply-To: <20240430-hotrebind_xu-v1-1-3c5e88d1516b@intel.com>
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

--===============9221849924873797464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: remove sysfs entries on driver unbind
URL   : https://patchwork.freedesktop.org/series/133080/
State : failure

== Summary ==

CI Bug Log - changes from xe-1210-016b4f46551e7a9b3da9607e546b18df2ca31cbc_BAT -> xe-pw-133080v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-133080v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-133080v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 0)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-133080v1_BAT prevented too many machines from booting.

  Missing    (5): bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1210-016b4f46551e7a9b3da9607e546b18df2ca31cbc -> xe-pw-133080v1

  IGT_7826: ce6ce0f60dd1a6c0df93a01ad71a31964158a2cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1210-016b4f46551e7a9b3da9607e546b18df2ca31cbc: 016b4f46551e7a9b3da9607e546b18df2ca31cbc
  xe-pw-133080v1: 133080v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133080v1/index.html

--===============9221849924873797464==
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
<tr><td><b>Series:</b></td><td>drm/xe: remove sysfs entries on driver unbind</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133080/">https://patchwork.freedesktop.org/series/133080/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133080v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133080v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1210-016b4f46551e7a9b3da9607e546b18df2ca31cbc_BAT -&gt; xe-pw-133080v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-133080v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-133080v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-133080v1_BAT prevented too many machines from booting.</p>
<p>Missing    (5): bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1210-016b4f46551e7a9b3da9607e546b18df2ca31cbc -&gt; xe-pw-133080v1</li>
</ul>
<p>IGT_7826: ce6ce0f60dd1a6c0df93a01ad71a31964158a2cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1210-016b4f46551e7a9b3da9607e546b18df2ca31cbc: 016b4f46551e7a9b3da9607e546b18df2ca31cbc<br />
  xe-pw-133080v1: 133080v1</p>

</body>
</html>

--===============9221849924873797464==--
