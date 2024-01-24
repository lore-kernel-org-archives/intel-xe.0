Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B807DC46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 09:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6966710F6B9;
	Wed, 24 Jan 2024 09:40:50 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B3810F69E;
 Wed, 24 Jan 2024 09:40:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1860938959985590874=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_don=27t_build_debugfs_?=
 =?utf-8?q?files_when_CONFIG=5FDEBUG=5FFS=3Dn?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Wed, 24 Jan 2024 09:40:48 -0000
Message-ID: <170608924872.685200.5733249575592881314@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240124090515.3363901-1-jani.nikula@intel.com>
In-Reply-To: <20240124090515.3363901-1-jani.nikula@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============1860938959985590874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: don't build debugfs files when CONFIG_DEBUG_FS=n
URL   : https://patchwork.freedesktop.org/series/129125/
State : success

== Summary ==

CI Bug Log - changes from xe-674-0496fe20d8ed5e73ed186d293ef67e7bae4658eb_BAT -> xe-pw-129125v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-dg2-oem2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-674-0496fe20d8ed5e73ed186d293ef67e7bae4658eb -> xe-pw-129125v1

  IGT_7690: aa45298ff675abbe6bf8f04ae186e2388c35f03a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-674-0496fe20d8ed5e73ed186d293ef67e7bae4658eb: 0496fe20d8ed5e73ed186d293ef67e7bae4658eb
  xe-pw-129125v1: 129125v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129125v1/index.html

--===============1860938959985590874==
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
<tr><td><b>Series:</b></td><td>drm/xe: don&#x27;t build debugfs files when CONFIG_DEBUG_FS=n</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129125/">https://patchwork.freedesktop.org/series/129125/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129125v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129125v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-674-0496fe20d8ed5e73ed186d293ef67e7bae4658eb_BAT -&gt; xe-pw-129125v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-674-0496fe20d8ed5e73ed186d293ef67e7bae4658eb -&gt; xe-pw-129125v1</li>
</ul>
<p>IGT_7690: aa45298ff675abbe6bf8f04ae186e2388c35f03a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-674-0496fe20d8ed5e73ed186d293ef67e7bae4658eb: 0496fe20d8ed5e73ed186d293ef67e7bae4658eb<br />
  xe-pw-129125v1: 129125v1</p>

</body>
</html>

--===============1860938959985590874==--
