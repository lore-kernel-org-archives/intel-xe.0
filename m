Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862AEC27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 17:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFC210E110;
	Thu, 13 Jun 2024 17:51:06 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEF910E110;
 Thu, 13 Jun 2024 17:51:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4926025972915077624=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/exec=5Fqueue=3A_Rename_xe?=
 =?utf-8?q?=5Fexec=5Fqueue=3A=3Acompute_to_xe=5Fexec=5Fqueue=3A=3Alr?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jun 2024 17:51:05 -0000
Message-ID: <171830106504.72831.1717303287331649603@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240613170348.723245-1-francois.dugast@intel.com>
In-Reply-To: <20240613170348.723245-1-francois.dugast@intel.com>
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

--===============4926025972915077624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/exec_queue: Rename xe_exec_queue::compute to xe_exec_queue::lr
URL   : https://patchwork.freedesktop.org/series/134842/
State : success

== Summary ==

CI Bug Log - changes from xe-1459-5123ff6f6fa8412bfba48083f334cbdbb8606cfc_BAT -> xe-pw-134842v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7886 -> IGT_7887
  * Linux: xe-1459-5123ff6f6fa8412bfba48083f334cbdbb8606cfc -> xe-pw-134842v1

  IGT_7886: 53b62502a04bd57cbcb3ae85ffc2cdf09b2b22a9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7887: 2e11d4875602eab34e8943f47e67c1bc546423c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1459-5123ff6f6fa8412bfba48083f334cbdbb8606cfc: 5123ff6f6fa8412bfba48083f334cbdbb8606cfc
  xe-pw-134842v1: 134842v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134842v1/index.html

--===============4926025972915077624==
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
<tr><td><b>Series:</b></td><td>drm/xe/exec_queue: Rename xe_exec_queue::compute to xe_exec_queue::lr</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134842/">https://patchwork.freedesktop.org/series/134842/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134842v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134842v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1459-5123ff6f6fa8412bfba48083f334cbdbb8606cfc_BAT -&gt; xe-pw-134842v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7886 -&gt; IGT_7887</li>
<li>Linux: xe-1459-5123ff6f6fa8412bfba48083f334cbdbb8606cfc -&gt; xe-pw-134842v1</li>
</ul>
<p>IGT_7886: 53b62502a04bd57cbcb3ae85ffc2cdf09b2b22a9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7887: 2e11d4875602eab34e8943f47e67c1bc546423c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1459-5123ff6f6fa8412bfba48083f334cbdbb8606cfc: 5123ff6f6fa8412bfba48083f334cbdbb8606cfc<br />
  xe-pw-134842v1: 134842v1</p>

</body>
</html>

--===============4926025972915077624==--
