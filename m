Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B75C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 18:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F8410E9C1;
	Fri,  9 Aug 2024 18:06:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271D210E9C1;
 Fri,  9 Aug 2024 18:06:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8090266458220781821=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_PF=3A_Improve_VF_control_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Aug 2024 18:06:12 -0000
Message-ID: <172322677215.552626.9013582988902999663@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240809165159.662-1-michal.wajdeczko@intel.com>
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

--===============8090266458220781821==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PF: Improve VF control (rev2)
URL   : https://patchwork.freedesktop.org/series/137095/
State : success

== Summary ==

CI Bug Log - changes from xe-1742-13384fb5b1e76e7012902cc10b1e49023358dc1d_BAT -> xe-pw-137095v2_BAT
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

  Here are the changes found in xe-pw-137095v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#877])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1742-13384fb5b1e76e7012902cc10b1e49023358dc1d/bat-bmg-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137095v2/bat-bmg-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * IGT: IGT_7964 -> IGT_7965
  * Linux: xe-1742-13384fb5b1e76e7012902cc10b1e49023358dc1d -> xe-pw-137095v2

  IGT_7964: 0dabf88262c0349d261248638064b97da35369f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7965: 965de1e69e91e331eee9d9f53e46b4652ba157c1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1742-13384fb5b1e76e7012902cc10b1e49023358dc1d: 13384fb5b1e76e7012902cc10b1e49023358dc1d
  xe-pw-137095v2: 137095v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137095v2/index.html

--===============8090266458220781821==
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
<tr><td><b>Series:</b></td><td>PF: Improve VF control (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137095/">https://patchwork.freedesktop.org/series/137095/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137095v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137095v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1742-13384fb5b1e76e7012902cc10b1e49023358dc1d_BAT -&gt; xe-pw-137095v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137095v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_addfb_basic@addfb25-x-tiled-legacy:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1742-13384fb5b1e76e7012902cc10b1e49023358dc1d/bat-bmg-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137095v2/bat-bmg-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7964 -&gt; IGT_7965</li>
<li>Linux: xe-1742-13384fb5b1e76e7012902cc10b1e49023358dc1d -&gt; xe-pw-137095v2</li>
</ul>
<p>IGT_7964: 0dabf88262c0349d261248638064b97da35369f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7965: 965de1e69e91e331eee9d9f53e46b4652ba157c1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1742-13384fb5b1e76e7012902cc10b1e49023358dc1d: 13384fb5b1e76e7012902cc10b1e49023358dc1d<br />
  xe-pw-137095v2: 137095v2</p>

</body>
</html>

--===============8090266458220781821==--
