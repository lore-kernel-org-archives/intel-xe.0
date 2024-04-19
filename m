Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68E1C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 14:46:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8969D10E789;
	Fri, 19 Apr 2024 14:46:55 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174DE10E789;
 Fri, 19 Apr 2024 14:46:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8605190123268726348=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/hwmon=3A_Remove_unwanted_?=
 =?utf-8?q?write_permission_for_currN=5Flabel?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Apr 2024 14:46:54 -0000
Message-ID: <171353801409.1520924.16532544162843865125@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240419125945.4085629-1-karthik.poosa@intel.com>
In-Reply-To: <20240419125945.4085629-1-karthik.poosa@intel.com>
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

--===============8605190123268726348==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Remove unwanted write permission for currN_label
URL   : https://patchwork.freedesktop.org/series/132643/
State : failure

== Summary ==

CI Bug Log - changes from xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724_BAT -> xe-pw-132643v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-132643v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132643v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 0)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-132643v1_BAT prevented too many machines from booting.

  Missing    (4): bat-pvc-2 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724 -> xe-pw-132643v1

  IGT_7814: 7814
  xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724: a6272ececd0c019dbb4b9e20dfd2026b7e299724
  xe-pw-132643v1: 132643v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/index.html

--===============8605190123268726348==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Remove unwanted write permission for currN_label</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132643/">https://patchwork.freedesktop.org/series/132643/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724_BAT -&gt; xe-pw-132643v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-132643v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-132643v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-132643v1_BAT prevented too many machines from booting.</p>
<p>Missing    (4): bat-pvc-2 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724 -&gt; xe-pw-132643v1</li>
</ul>
<p>IGT_7814: 7814<br />
  xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724: a6272ececd0c019dbb4b9e20dfd2026b7e299724<br />
  xe-pw-132643v1: 132643v1</p>

</body>
</html>

--===============8605190123268726348==--
