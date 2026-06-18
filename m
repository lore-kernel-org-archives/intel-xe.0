Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65B8CD98DE
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 05:22:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898A310F167;
	Thu, 18 Jun 2026 05:22:13 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79B410F167;
 Thu, 18 Jun 2026 05:22:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6774010110210996034=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Add_debugfs_knob_?=
 =?utf-8?q?to_disable_Mid-Thread_Preemption_per_GT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Jun 2026 05:22:12 -0000
Message-ID: <178176013281.92016.11268193699397311189@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260618042421.483657-1-varun.gupta@intel.com>
In-Reply-To: <20260618042421.483657-1-varun.gupta@intel.com>
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

--===============6774010110210996034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add debugfs knob to disable Mid-Thread Preemption per GT
URL   : https://patchwork.freedesktop.org/series/168743/
State : success

== Summary ==

CI Bug Log - changes from xe-5276-909e0a88ba7edb191c7d3d3bf23b768a5c2407c3_BAT -> xe-pw-168743v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8971 -> IGT_8972
  * Linux: xe-5276-909e0a88ba7edb191c7d3d3bf23b768a5c2407c3 -> xe-pw-168743v1

  IGT_8971: 8971
  IGT_8972: 8972
  xe-5276-909e0a88ba7edb191c7d3d3bf23b768a5c2407c3: 909e0a88ba7edb191c7d3d3bf23b768a5c2407c3
  xe-pw-168743v1: 168743v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v1/index.html

--===============6774010110210996034==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add debugfs knob to disable Mid-Thread Preemption per GT</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168743/">https://patchwork.freedesktop.org/series/168743/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5276-909e0a88ba7edb191c7d3d3bf23b768a5c2407c3_BAT -&gt; xe-pw-168743v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8971 -&gt; IGT_8972</li>
<li>Linux: xe-5276-909e0a88ba7edb191c7d3d3bf23b768a5c2407c3 -&gt; xe-pw-168743v1</li>
</ul>
<p>IGT_8971: 8971<br />
  IGT_8972: 8972<br />
  xe-5276-909e0a88ba7edb191c7d3d3bf23b768a5c2407c3: 909e0a88ba7edb191c7d3d3bf23b768a5c2407c3<br />
  xe-pw-168743v1: 168743v1</p>

</body>
</html>

--===============6774010110210996034==--
