Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E1BD46C0B
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 22:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F10210E778;
	Wed, 28 Jan 2026 22:39:17 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D031B10E778;
 Wed, 28 Jan 2026 22:39:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5549994553540135638=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/mmio=3A_Avoid_double?=
 =?utf-8?q?-adjust_in_64-bit_reads?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Jan 2026 22:39:16 -0000
Message-ID: <176963995685.202811.71264869654909591@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260128211250.3643131-2-shuicheng.lin@intel.com>
In-Reply-To: <20260128211250.3643131-2-shuicheng.lin@intel.com>
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

--===============5549994553540135638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/mmio: Avoid double-adjust in 64-bit reads
URL   : https://patchwork.freedesktop.org/series/160793/
State : success

== Summary ==

CI Bug Log - changes from xe-4465-8059f097e25f736bb3da09af6a9b283079abfd4f_BAT -> xe-pw-160793v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 12)
------------------------------

  Additional (1): bat-bmg-3 

Known issues
------------

  Here are the changes found in xe-pw-160793v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:
    - bat-bmg-3:          NOTRUN -> [SKIP][1] ([Intel XE#6566]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160793v1/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html

  
#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][2] ([Intel XE#6519]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4465-8059f097e25f736bb3da09af6a9b283079abfd4f/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160793v1/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566


Build changes
-------------

  * IGT: IGT_8721 -> IGT_8723
  * Linux: xe-4465-8059f097e25f736bb3da09af6a9b283079abfd4f -> xe-pw-160793v1

  IGT_8721: 3707bb4267de22a18d61b232c4ab5fbaf61db90c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8723: 8723
  xe-4465-8059f097e25f736bb3da09af6a9b283079abfd4f: 8059f097e25f736bb3da09af6a9b283079abfd4f
  xe-pw-160793v1: 160793v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160793v1/index.html

--===============5549994553540135638==
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
<tr><td><b>Series:</b></td><td>drm/xe/mmio: Avoid double-adjust in 64-bit reads</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160793/">https://patchwork.freedesktop.org/series/160793/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160793v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160793v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4465-8059f097e25f736bb3da09af6a9b283079abfd4f_BAT -&gt; xe-pw-160793v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 12)</h2>
<p>Additional (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160793v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160793v1/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4465-8059f097e25f736bb3da09af6a9b283079abfd4f/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160793v1/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8721 -&gt; IGT_8723</li>
<li>Linux: xe-4465-8059f097e25f736bb3da09af6a9b283079abfd4f -&gt; xe-pw-160793v1</li>
</ul>
<p>IGT_8721: 3707bb4267de22a18d61b232c4ab5fbaf61db90c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8723: 8723<br />
  xe-4465-8059f097e25f736bb3da09af6a9b283079abfd4f: 8059f097e25f736bb3da09af6a9b283079abfd4f<br />
  xe-pw-160793v1: 160793v1</p>

</body>
</html>

--===============5549994553540135638==--
