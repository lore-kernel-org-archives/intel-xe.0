Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B410E94615
	for <intel-xe@archiver.kernel.org>; Mon,  9 Feb 2026 22:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B6F10E106;
	Mon,  9 Feb 2026 22:21:26 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEE210E106;
 Mon,  9 Feb 2026 22:21:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6911318643896801642=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/wa=3A_Steer_RMW_of_M?=
 =?utf-8?q?CR_registers_while_building_default_LRC_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Feb 2026 22:21:25 -0000
Message-ID: <177067568580.239534.13146313915401259575@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260206223058.387014-2-matthew.d.roper@intel.com>
In-Reply-To: <20260206223058.387014-2-matthew.d.roper@intel.com>
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

--===============6911318643896801642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/wa: Steer RMW of MCR registers while building default LRC (rev3)
URL   : https://patchwork.freedesktop.org/series/161300/
State : success

== Summary ==

CI Bug Log - changes from xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266_BAT -> xe-pw-161300v3_BAT
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

  Here are the changes found in xe-pw-161300v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:
    - bat-bmg-3:          NOTRUN -> [SKIP][1] ([Intel XE#6566]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][2] -> [FAIL][3] ([Intel XE#6519])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566


Build changes
-------------

  * Linux: xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266 -> xe-pw-161300v3

  IGT_8746: 8746
  xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266: 51b5b2d82487a590ad0bfd8c3908f82fa8277266
  xe-pw-161300v3: 161300v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/index.html

--===============6911318643896801642==
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
<tr><td><b>Series:</b></td><td>drm/xe/wa: Steer RMW of MCR registers while building default LRC (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161300/">https://patchwork.freedesktop.org/series/161300/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266_BAT -&gt; xe-pw-161300v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 12)</h2>
<p>Additional (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161300v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266 -&gt; xe-pw-161300v3</li>
</ul>
<p>IGT_8746: 8746<br />
  xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266: 51b5b2d82487a590ad0bfd8c3908f82fa8277266<br />
  xe-pw-161300v3: 161300v3</p>

</body>
</html>

--===============6911318643896801642==--
