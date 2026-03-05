Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9548F33A7D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 14:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F93D10E29B;
	Thu,  5 Mar 2026 14:56:59 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EC010E29B;
 Thu,  5 Mar 2026 14:56:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6866771903345982425=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_add_VM=5FBIND_DEC?=
 =?utf-8?q?OMPRESS_support_and_on=E2=80=91demand_decompression_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Mar 2026 14:56:59 -0000
Message-ID: <177272261907.322277.5068823640456978141@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260304123758.3050386-5-nitin.r.gote@intel.com>
In-Reply-To: <20260304123758.3050386-5-nitin.r.gote@intel.com>
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

--===============6866771903345982425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

== Series Details ==

Series: drm/xe: add VM_BIND DECOMPRESS support and on‑demand decompression (rev7)
URL   : https://patchwork.freedesktop.org/series/154714/
State : success

== Summary ==

CI Bug Log - changes from xe-4659-dd83a882e1ed89be4c00a53f5ff49dd8bc997d59_BAT -> xe-pw-154714v7_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 14)
------------------------------

  Additional (1): bat-bmg-3 

Known issues
------------

  Here are the changes found in xe-pw-154714v7_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - bat-bmg-3:          NOTRUN -> [SKIP][1] ([Intel XE#6566]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v7/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][2] -> [FAIL][3] ([Intel XE#6519])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4659-dd83a882e1ed89be4c00a53f5ff49dd8bc997d59/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v7/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566


Build changes
-------------

  * Linux: xe-4659-dd83a882e1ed89be4c00a53f5ff49dd8bc997d59 -> xe-pw-154714v7

  IGT_8779: 4aff2e43cb4a07d16e9b203d77705e29fa50cb9e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4659-dd83a882e1ed89be4c00a53f5ff49dd8bc997d59: dd83a882e1ed89be4c00a53f5ff49dd8bc997d59
  xe-pw-154714v7: 154714v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v7/index.html

--===============6866771903345982425==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


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
<tr><td><b>Series:</b></td><td>drm/xe: add VM_BIND DECOMPRESS support and on‑demand decompression (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154714/">https://patchwork.freedesktop.org/series/154714/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4659-dd83a882e1ed89be4c00a53f5ff49dd8bc997d59_BAT -&gt; xe-pw-154714v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 14)</h2>
<p>Additional (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154714v7_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v7/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4659-dd83a882e1ed89be4c00a53f5ff49dd8bc997d59/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v7/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4659-dd83a882e1ed89be4c00a53f5ff49dd8bc997d59 -&gt; xe-pw-154714v7</li>
</ul>
<p>IGT_8779: 4aff2e43cb4a07d16e9b203d77705e29fa50cb9e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4659-dd83a882e1ed89be4c00a53f5ff49dd8bc997d59: dd83a882e1ed89be4c00a53f5ff49dd8bc997d59<br />
  xe-pw-154714v7: 154714v7</p>

</body>
</html>

--===============6866771903345982425==--
