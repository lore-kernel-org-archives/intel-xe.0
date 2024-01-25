Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E37C47422
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 16:15:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A106110F918;
	Thu, 25 Jan 2024 16:15:53 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD8810F43D;
 Thu, 25 Jan 2024 16:15:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2649975627691165377=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/xe=5Fguc=3A_Reduce_a_prin?=
 =?utf-8?q?t_from_warn_to_debug?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Date: Thu, 25 Jan 2024 16:15:52 -0000
Message-ID: <170619935296.710554.11780636035811316000@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240125154647.3743708-1-karthik.poosa@intel.com>
In-Reply-To: <20240125154647.3743708-1-karthik.poosa@intel.com>
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

--===============2649975627691165377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_guc: Reduce a print from warn to debug
URL   : https://patchwork.freedesktop.org/series/129168/
State : success

== Summary ==

CI Bug Log - changes from xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a_BAT -> xe-pw-129168v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-129168v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_intel_bb@bb-with-allocator:
    - bat-adlp-7:         [INCOMPLETE][1] ([Intel XE#1044]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a/bat-adlp-7/igt@xe_intel_bb@bb-with-allocator.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129168v1/bat-adlp-7/igt@xe_intel_bb@bb-with-allocator.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][3] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][4] ([Intel XE#455])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129168v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * Linux: xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a -> xe-pw-129168v1

  IGT_7692: 5d9c29c620701497323bf3721146da57efa50952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a: 38a58d4231067e1b548c12ee521b73ffc0ebb73a
  xe-pw-129168v1: 129168v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129168v1/index.html

--===============2649975627691165377==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_guc: Reduce a print from warn to debug</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129168/">https://patchwork.freedesktop.org/series/129168/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129168v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129168v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a_BAT -&gt; xe-pw-129168v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-129168v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_intel_bb@bb-with-allocator:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a/bat-adlp-7/igt@xe_intel_bb@bb-with-allocator.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129168v1/bat-adlp-7/igt@xe_intel_bb@bb-with-allocator.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_dsc@dsc-basic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129168v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a -&gt; xe-pw-129168v1</li>
</ul>
<p>IGT_7692: 5d9c29c620701497323bf3721146da57efa50952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a: 38a58d4231067e1b548c12ee521b73ffc0ebb73a<br />
  xe-pw-129168v1: 129168v1</p>

</body>
</html>

--===============2649975627691165377==--
