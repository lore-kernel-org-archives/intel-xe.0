Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56322EDF021
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 02:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8F310E115;
	Thu, 12 Feb 2026 02:29:23 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A0310E115;
 Thu, 12 Feb 2026 02:29:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8681992386430966966=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Prevent?=
 =?utf-8?q?_NV12_Y-plane_allocation_from_stealing_userspace_planes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Khaled Almahallawy" <khaled.almahallawy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Feb 2026 02:29:21 -0000
Message-ID: <177086336196.248700.3284606351947075829@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260212004852.1920270-1-khaled.almahallawy@intel.com>
In-Reply-To: <20260212004852.1920270-1-khaled.almahallawy@intel.com>
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

--===============8681992386430966966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Prevent NV12 Y-plane allocation from stealing userspace planes
URL   : https://patchwork.freedesktop.org/series/161521/
State : success

== Summary ==

CI Bug Log - changes from xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68_BAT -> xe-pw-161521v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68 -> xe-pw-161521v1

  IGT_8751: af788251f1ef729d17c802aec2c4547b52059e58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68: b4bfe7d753afaf6ea4950111a309a4e2ef5aef68
  xe-pw-161521v1: 161521v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161521v1/index.html

--===============8681992386430966966==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Prevent NV12 Y-plane allocation from stealing userspace planes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161521/">https://patchwork.freedesktop.org/series/161521/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161521v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161521v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68_BAT -&gt; xe-pw-161521v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68 -&gt; xe-pw-161521v1</li>
</ul>
<p>IGT_8751: af788251f1ef729d17c802aec2c4547b52059e58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68: b4bfe7d753afaf6ea4950111a309a4e2ef5aef68<br />
  xe-pw-161521v1: 161521v1</p>

</body>
</html>

--===============8681992386430966966==--
