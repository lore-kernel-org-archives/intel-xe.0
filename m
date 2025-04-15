Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6B5C369B8
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 08:01:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAE310E672;
	Tue, 15 Apr 2025 08:01:36 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7309610E672;
 Tue, 15 Apr 2025 08:01:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0329338604333050042=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_drm/xe=3A_Add_fault_injection_for_kobj=5Fxe=5Fhw=5Fengine=5Fc?=
 =?utf-8?q?lass?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Apr 2025 08:01:34 -0000
Message-ID: <174470409446.4343.17097994001399283639@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250415064211.2889970-1-sobin.thomas@intel.com>
In-Reply-To: <20250415064211.2889970-1-sobin.thomas@intel.com>
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

--===============0329338604333050042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Add fault injection for kobj_xe_hw_engine_class
URL   : https://patchwork.freedesktop.org/series/147729/
State : success

== Summary ==

CI Bug Log - changes from xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2_BAT -> xe-pw-147729v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2 -> xe-pw-147729v1

  IGT_8319: db9eca9df70fbb72589fcaf689dd92784b06a9c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2: 0b6f7071ae34910671f2fadcc0829a960b09c0a2
  xe-pw-147729v1: 147729v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/index.html

--===============0329338604333050042==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Add fault injection for kobj_xe_hw_engine_class</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147729/">https://patchwork.freedesktop.org/series/147729/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2_BAT -&gt; xe-pw-147729v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2 -&gt; xe-pw-147729v1</li>
</ul>
<p>IGT_8319: db9eca9df70fbb72589fcaf689dd92784b06a9c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2: 0b6f7071ae34910671f2fadcc0829a960b09c0a2<br />
  xe-pw-147729v1: 147729v1</p>

</body>
</html>

--===============0329338604333050042==--
