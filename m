Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F28C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 14:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E6010E7DA;
	Fri, 16 Aug 2024 14:57:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09C510E7DA;
 Fri, 16 Aug 2024 14:57:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5882638869353782491=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5Bv6=2C1/2?=
 =?utf-8?q?=5D_drm/ttm=3A_Add_a_flag_to_allow_drivers_to_skip_clear-on-free?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Aug 2024 14:57:54 -0000
Message-ID: <172382027497.658442.13629221879363659532@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240816135154.19678-1-nirmoy.das@intel.com>
In-Reply-To: <20240816135154.19678-1-nirmoy.das@intel.com>
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

--===============5882638869353782491==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v6,1/2] drm/ttm: Add a flag to allow drivers to skip clear-on-free
URL   : https://patchwork.freedesktop.org/series/137396/
State : success

== Summary ==

CI Bug Log - changes from xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425_BAT -> xe-pw-137396v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-137396v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-lnl-1:          [FAIL][1] ([Intel XE#2479]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137396v1/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  
  [Intel XE#2479]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2479


Build changes
-------------

  * Linux: xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425 -> xe-pw-137396v1

  IGT_7973: 9c3a20d0403a2fe80bde618de5c2ef83b7e08d50 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425: cfdb0d68f7d07eecfafb5fda99e6dc313359d425
  xe-pw-137396v1: 137396v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137396v1/index.html

--===============5882638869353782491==
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
<tr><td><b>Series:</b></td><td>series starting with [v6,1/2] drm/ttm: Add a flag to allow drivers to skip clear-on-free</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137396/">https://patchwork.freedesktop.org/series/137396/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137396v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137396v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425_BAT -&gt; xe-pw-137396v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137396v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2479">Intel XE#2479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137396v1/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425 -&gt; xe-pw-137396v1</li>
</ul>
<p>IGT_7973: 9c3a20d0403a2fe80bde618de5c2ef83b7e08d50 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425: cfdb0d68f7d07eecfafb5fda99e6dc313359d425<br />
  xe-pw-137396v1: 137396v1</p>

</body>
</html>

--===============5882638869353782491==--
