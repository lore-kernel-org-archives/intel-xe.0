Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603E2C71150
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 23:19:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1F710E0D5;
	Wed, 28 Aug 2024 23:19:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FF810E0D5;
 Wed, 28 Aug 2024 23:19:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8471994270302069562=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_fixes_and_debug_improv?=
 =?utf-8?q?ements_for_GSC_load_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Aug 2024 23:19:53 -0000
Message-ID: <172488719302.829522.3371531015236104266@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240828215158.2743994-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240828215158.2743994-1-daniele.ceraolospurio@intel.com>
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

--===============8471994270302069562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: fixes and debug improvements for GSC load (rev2)
URL   : https://patchwork.freedesktop.org/series/137270/
State : success

== Summary ==

CI Bug Log - changes from xe-1852-6b66ec881f7ae385f90fe6ad8c6ebef112873a17_BAT -> xe-pw-137270v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-137270v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-lnl-1:          [FAIL][1] ([Intel XE#1069]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1852-6b66ec881f7ae385f90fe6ad8c6ebef112873a17/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137270v2/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069


Build changes
-------------

  * IGT: IGT_7995 -> IGT_7996
  * Linux: xe-1852-6b66ec881f7ae385f90fe6ad8c6ebef112873a17 -> xe-pw-137270v2

  IGT_7995: 7d4588779db2939a057c2b27d773b09a9a5e7f53 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7996: 0eb26907b747c34903e9ae482ea19bc263a8eeed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1852-6b66ec881f7ae385f90fe6ad8c6ebef112873a17: 6b66ec881f7ae385f90fe6ad8c6ebef112873a17
  xe-pw-137270v2: 137270v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137270v2/index.html

--===============8471994270302069562==
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
<tr><td><b>Series:</b></td><td>drm/xe: fixes and debug improvements for GSC load (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137270/">https://patchwork.freedesktop.org/series/137270/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137270v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137270v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1852-6b66ec881f7ae385f90fe6ad8c6ebef112873a17_BAT -&gt; xe-pw-137270v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137270v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1852-6b66ec881f7ae385f90fe6ad8c6ebef112873a17/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137270v2/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7995 -&gt; IGT_7996</li>
<li>Linux: xe-1852-6b66ec881f7ae385f90fe6ad8c6ebef112873a17 -&gt; xe-pw-137270v2</li>
</ul>
<p>IGT_7995: 7d4588779db2939a057c2b27d773b09a9a5e7f53 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7996: 0eb26907b747c34903e9ae482ea19bc263a8eeed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1852-6b66ec881f7ae385f90fe6ad8c6ebef112873a17: 6b66ec881f7ae385f90fe6ad8c6ebef112873a17<br />
  xe-pw-137270v2: 137270v2</p>

</body>
</html>

--===============8471994270302069562==--
