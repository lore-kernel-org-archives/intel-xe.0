Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A457C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 15:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B9110E2B4;
	Thu, 25 Jul 2024 15:43:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558B910E2B4;
 Thu, 25 Jul 2024 15:43:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3434956433647323486=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_spi=3A_add_driver_for_Intel_disc?=
 =?utf-8?q?rete_graphics_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jul 2024 15:43:48 -0000
Message-ID: <172192222834.382191.5413415121554087010@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240725135657.1061836-1-alexander.usyskin@intel.com>
In-Reply-To: <20240725135657.1061836-1-alexander.usyskin@intel.com>
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

--===============3434956433647323486==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: spi: add driver for Intel discrete graphics (rev2)
URL   : https://patchwork.freedesktop.org/series/136430/
State : failure

== Summary ==

CI Bug Log - changes from xe-1667-9f8e597a1c39d7e316f9479e6f627c15dbc58e1d_BAT -> xe-pw-136430v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136430v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136430v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136430v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-atsm-2:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1667-9f8e597a1c39d7e316f9479e6f627c15dbc58e1d/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v2/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-136430v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-atsm-2:         [PASS][3] -> [SKIP][4] ([Intel XE#2109]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1667-9f8e597a1c39d7e316f9479e6f627c15dbc58e1d/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v2/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#2109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109


Build changes
-------------

  * Linux: xe-1667-9f8e597a1c39d7e316f9479e6f627c15dbc58e1d -> xe-pw-136430v2

  IGT_7937: eba69333dfe8c295d053997367e395d7bde2b4b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1667-9f8e597a1c39d7e316f9479e6f627c15dbc58e1d: 9f8e597a1c39d7e316f9479e6f627c15dbc58e1d
  xe-pw-136430v2: 136430v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v2/index.html

--===============3434956433647323486==
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
<tr><td><b>Series:</b></td><td>spi: add driver for Intel discrete graphics (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136430/">https://patchwork.freedesktop.org/series/136430/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1667-9f8e597a1c39d7e316f9479e6f627c15dbc58e1d_BAT -&gt; xe-pw-136430v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136430v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136430v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136430v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1667-9f8e597a1c39d7e316f9479e6f627c15dbc58e1d/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v2/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136430v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1667-9f8e597a1c39d7e316f9479e6f627c15dbc58e1d/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v2/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109">Intel XE#2109</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1667-9f8e597a1c39d7e316f9479e6f627c15dbc58e1d -&gt; xe-pw-136430v2</li>
</ul>
<p>IGT_7937: eba69333dfe8c295d053997367e395d7bde2b4b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1667-9f8e597a1c39d7e316f9479e6f627c15dbc58e1d: 9f8e597a1c39d7e316f9479e6f627c15dbc58e1d<br />
  xe-pw-136430v2: 136430v2</p>

</body>
</html>

--===============3434956433647323486==--
