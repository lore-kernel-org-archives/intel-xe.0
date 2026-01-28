Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B1ED3F083
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 15:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041B110E728;
	Wed, 28 Jan 2026 15:51:16 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FE010E6EE;
 Wed, 28 Jan 2026 15:51:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2184918806273745837=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/1?=
 =?utf-8?q?=5D_drm/xe/xe2lpg=3A_Extend_Wa=5F18041344222_to_graphics_IP_20=2E?=
 =?utf-8?q?04_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Jan 2026 15:51:12 -0000
Message-ID: <176961547248.201476.17581610150125454597@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <ddcfcd0631ccc39a84d63e1760cce672dcc7f097.1769499842.git.harish.chegondi@intel.com>
In-Reply-To: <ddcfcd0631ccc39a84d63e1760cce672dcc7f097.1769499842.git.harish.chegondi@intel.com>
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

--===============2184918806273745837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/1] drm/xe/xe2lpg: Extend Wa_18041344222 to graphics IP 20.04 (rev2)
URL   : https://patchwork.freedesktop.org/series/160683/
State : success

== Summary ==

CI Bug Log - changes from xe-4465-8059f097e25f736bb3da09af6a9b283079abfd4f_BAT -> xe-pw-160683v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-160683v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6519]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4465-8059f097e25f736bb3da09af6a9b283079abfd4f/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160683v2/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8721 -> IGT_8722
  * Linux: xe-4465-8059f097e25f736bb3da09af6a9b283079abfd4f -> xe-pw-160683v2

  IGT_8721: 3707bb4267de22a18d61b232c4ab5fbaf61db90c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8722: 8722
  xe-4465-8059f097e25f736bb3da09af6a9b283079abfd4f: 8059f097e25f736bb3da09af6a9b283079abfd4f
  xe-pw-160683v2: 160683v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160683v2/index.html

--===============2184918806273745837==
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
<tr><td><b>Series:</b></td><td>series starting with [1/1] drm/xe/xe2lpg: Extend Wa_18041344222 to graphics IP 20.04 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160683/">https://patchwork.freedesktop.org/series/160683/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160683v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160683v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4465-8059f097e25f736bb3da09af6a9b283079abfd4f_BAT -&gt; xe-pw-160683v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160683v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4465-8059f097e25f736bb3da09af6a9b283079abfd4f/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160683v2/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8721 -&gt; IGT_8722</li>
<li>Linux: xe-4465-8059f097e25f736bb3da09af6a9b283079abfd4f -&gt; xe-pw-160683v2</li>
</ul>
<p>IGT_8721: 3707bb4267de22a18d61b232c4ab5fbaf61db90c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8722: 8722<br />
  xe-4465-8059f097e25f736bb3da09af6a9b283079abfd4f: 8059f097e25f736bb3da09af6a9b283079abfd4f<br />
  xe-pw-160683v2: 160683v2</p>

</body>
</html>

--===============2184918806273745837==--
