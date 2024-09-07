Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82191CD4846
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 04:22:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AD510E1E5;
	Sat,  7 Sep 2024 04:22:36 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E4A10E1E5;
 Sat,  7 Sep 2024 04:22:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5170944861015496424=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Stop_using_xe=5Fgt_as_a_register?=
 =?utf-8?q?_MMIO_target_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 07 Sep 2024 04:22:34 -0000
Message-ID: <172568295403.955480.16668910984517881317@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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

--===============5170944861015496424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Stop using xe_gt as a register MMIO target (rev2)
URL   : https://patchwork.freedesktop.org/series/138168/
State : failure

== Summary ==

CI Bug Log - changes from xe-1909-217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a_BAT -> xe-pw-138168v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138168v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138168v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 0)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-138168v2_BAT prevented too many machines from booting.

  Missing    (8): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8008 -> IGT_8010
  * Linux: xe-1909-217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a -> xe-pw-138168v2

  IGT_8008: 91925eef7a79b1402b9422758311a4d693825362 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8010: 8010
  xe-1909-217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a: 217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a
  xe-pw-138168v2: 138168v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v2/index.html

--===============5170944861015496424==
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
<tr><td><b>Series:</b></td><td>Stop using xe_gt as a register MMIO target (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138168/">https://patchwork.freedesktop.org/series/138168/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1909-217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a_BAT -&gt; xe-pw-138168v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138168v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138168v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-138168v2_BAT prevented too many machines from booting.</p>
<p>Missing    (8): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8008 -&gt; IGT_8010</li>
<li>Linux: xe-1909-217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a -&gt; xe-pw-138168v2</li>
</ul>
<p>IGT_8008: 91925eef7a79b1402b9422758311a4d693825362 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8010: 8010<br />
  xe-1909-217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a: 217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a<br />
  xe-pw-138168v2: 138168v2</p>

</body>
</html>

--===============5170944861015496424==--
