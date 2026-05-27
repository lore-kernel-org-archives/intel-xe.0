Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085B4CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 17:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB96D10E85D;
	Wed, 27 May 2026 17:35:25 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8AE10E85D;
 Wed, 27 May 2026 17:35:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2933633640845555204=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/=7Bi915=2C_xe=7D=3A_rel?=
 =?utf-8?q?ocate_shutdown_and_pm_hooks_from_xe_to_display?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 May 2026 17:35:24 -0000
Message-ID: <177990332463.16848.10041588045675460712@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <cover.1779887154.git.jani.nikula@intel.com>
In-Reply-To: <cover.1779887154.git.jani.nikula@intel.com>
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

--===============2933633640845555204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915, xe}: relocate shutdown and pm hooks from xe to display
URL   : https://patchwork.freedesktop.org/series/167379/
State : success

== Summary ==

CI Bug Log - changes from xe-5137-5390f2273d45bb259d88508828018c0fbbb79d32_BAT -> xe-pw-167379v1_BAT
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

  * IGT: IGT_8938 -> IGT_8939
  * Linux: xe-5137-5390f2273d45bb259d88508828018c0fbbb79d32 -> xe-pw-167379v1

  IGT_8938: b024a3b67372962ff6e643d3998c5cf5acc07081 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8939: 8939
  xe-5137-5390f2273d45bb259d88508828018c0fbbb79d32: 5390f2273d45bb259d88508828018c0fbbb79d32
  xe-pw-167379v1: 167379v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167379v1/index.html

--===============2933633640845555204==
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
<tr><td><b>Series:</b></td><td>drm/{i915, xe}: relocate shutdown and pm hooks from xe to display</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167379/">https://patchwork.freedesktop.org/series/167379/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167379v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167379v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5137-5390f2273d45bb259d88508828018c0fbbb79d32_BAT -&gt; xe-pw-167379v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8938 -&gt; IGT_8939</li>
<li>Linux: xe-5137-5390f2273d45bb259d88508828018c0fbbb79d32 -&gt; xe-pw-167379v1</li>
</ul>
<p>IGT_8938: b024a3b67372962ff6e643d3998c5cf5acc07081 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8939: 8939<br />
  xe-5137-5390f2273d45bb259d88508828018c0fbbb79d32: 5390f2273d45bb259d88508828018c0fbbb79d32<br />
  xe-pw-167379v1: 167379v1</p>

</body>
</html>

--===============2933633640845555204==--
