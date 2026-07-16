Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D0BC44512
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 20:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BB910F3D8;
	Thu, 16 Jul 2026 20:58:03 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36A610F357;
 Thu, 16 Jul 2026 20:58:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8309200337328396497=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/ttm/pool=3A_back_up_at_?=
 =?utf-8?q?native_page_order_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Jul 2026 20:58:02 -0000
Message-ID: <178423548266.199042.5240802716540775161@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260716201358.4086085-1-matthew.brost@intel.com>
In-Reply-To: <20260716201358.4086085-1-matthew.brost@intel.com>
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

--===============8309200337328396497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/ttm/pool: back up at native page order (rev4)
URL   : https://patchwork.freedesktop.org/series/165878/
State : success

== Summary ==

CI Bug Log - changes from xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319_BAT -> xe-pw-165878v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-165878v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-ptl-2:          [PASS][1] -> [SKIP][2] ([Intel XE#352]) +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165878v4/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-ptl-2:          [PASS][3] -> [SKIP][4] ([Intel XE#2853])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319/bat-ptl-2/igt@kms_hdmi_inject@inject-audio.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165878v4/bat-ptl-2/igt@kms_hdmi_inject@inject-audio.html

  
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352


Build changes
-------------

  * Linux: xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319 -> xe-pw-165878v4

  IGT_9010: 17413fe8bc1c3c9418d3d2359fc16531927ab42e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319: 0fcee361fa4cf13207af78b95e71bbbaeb046319
  xe-pw-165878v4: 165878v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165878v4/index.html

--===============8309200337328396497==
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
<tr><td><b>Series:</b></td><td>drm/ttm/pool: back up at native page order (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165878/">https://patchwork.freedesktop.org/series/165878/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165878v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165878v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319_BAT -&gt; xe-pw-165878v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-165878v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165878v4/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319/bat-ptl-2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165878v4/bat-ptl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319 -&gt; xe-pw-165878v4</li>
</ul>
<p>IGT_9010: 17413fe8bc1c3c9418d3d2359fc16531927ab42e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5419-0fcee361fa4cf13207af78b95e71bbbaeb046319: 0fcee361fa4cf13207af78b95e71bbbaeb046319<br />
  xe-pw-165878v4: 165878v4</p>

</body>
</html>

--===============8309200337328396497==--
