Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BC6CD4F25
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 10:05:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8338610E37F;
	Thu, 14 May 2026 10:05:42 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D98210E37F;
 Thu, 14 May 2026 10:05:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5430994740647216891=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/pf=3A_Fix_CFI_failur?=
 =?utf-8?q?e_in_debugfs_access?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Meenakshisundaram, Mohanram" <mohanram.meenakshisundaram@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 May 2026 10:05:40 -0000
Message-ID: <177875314063.71738.11207615764955640890@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260514090352.1554803-1-mohanram.meenakshisundaram@intel.com>
In-Reply-To: <20260514090352.1554803-1-mohanram.meenakshisundaram@intel.com>
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

--===============5430994740647216891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pf: Fix CFI failure in debugfs access
URL   : https://patchwork.freedesktop.org/series/166565/
State : success

== Summary ==

CI Bug Log - changes from xe-5062-dee34cfbffbfe2196a9332f966b006cd2e54e976_BAT -> xe-pw-166565v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  Additional (1): bat-bmg-vm 
  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-166565v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@pat-index-xehpc:
    - bat-bmg-vm:         NOTRUN -> [SKIP][1] ([Intel XE#1420] / [Intel XE#7590])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v1/bat-bmg-vm/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-vm:         NOTRUN -> [SKIP][2] ([Intel XE#2245] / [Intel XE#7590])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v1/bat-bmg-vm/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-bmg-vm:         NOTRUN -> [SKIP][3] ([Intel XE#2236] / [Intel XE#7590])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v1/bat-bmg-vm/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590


Build changes
-------------

  * IGT: IGT_8910 -> IGT_8911
  * Linux: xe-5062-dee34cfbffbfe2196a9332f966b006cd2e54e976 -> xe-pw-166565v1

  IGT_8910: f29c30f540896e8b9cb55609c0d7d1c789b62914 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8911: c7f4a459bf125a487220a0b56f5f17cc0721c541 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5062-dee34cfbffbfe2196a9332f966b006cd2e54e976: dee34cfbffbfe2196a9332f966b006cd2e54e976
  xe-pw-166565v1: 166565v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v1/index.html

--===============5430994740647216891==
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
<tr><td><b>Series:</b></td><td>drm/xe/pf: Fix CFI failure in debugfs access</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166565/">https://patchwork.freedesktop.org/series/166565/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5062-dee34cfbffbfe2196a9332f966b006cd2e54e976_BAT -&gt; xe-pw-166565v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>Additional (1): bat-bmg-vm <br />
  Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166565v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v1/bat-bmg-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v1/bat-bmg-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166565v1/bat-bmg-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8910 -&gt; IGT_8911</li>
<li>Linux: xe-5062-dee34cfbffbfe2196a9332f966b006cd2e54e976 -&gt; xe-pw-166565v1</li>
</ul>
<p>IGT_8910: f29c30f540896e8b9cb55609c0d7d1c789b62914 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8911: c7f4a459bf125a487220a0b56f5f17cc0721c541 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5062-dee34cfbffbfe2196a9332f966b006cd2e54e976: dee34cfbffbfe2196a9332f966b006cd2e54e976<br />
  xe-pw-166565v1: 166565v1</p>

</body>
</html>

--===============5430994740647216891==--
