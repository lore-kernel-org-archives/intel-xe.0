Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB987CD8CB2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 15:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550F710EA0A;
	Wed, 10 Jun 2026 15:03:35 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3D510EA0A;
 Wed, 10 Jun 2026 15:03:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6235616764469928774=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/displayid=3A_fix_Tiled_?=
 =?utf-8?q?Display_Topology_ID_size?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Jun 2026 15:03:33 -0000
Message-ID: <178110381369.64488.1645897313453397190@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260610141549.555605-1-jani.nikula@intel.com>
In-Reply-To: <20260610141549.555605-1-jani.nikula@intel.com>
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

--===============6235616764469928774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/displayid: fix Tiled Display Topology ID size
URL   : https://patchwork.freedesktop.org/series/168250/
State : success

== Summary ==

CI Bug Log - changes from xe-5231-fc59f76558703febba8056be87d1c97d14f7485e_BAT -> xe-pw-168250v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-168250v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-vm:         [PASS][1] -> [ABORT][2] ([Intel XE#8007] / [Intel XE#8023]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5231-fc59f76558703febba8056be87d1c97d14f7485e/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168250v1/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8023


Build changes
-------------

  * Linux: xe-5231-fc59f76558703febba8056be87d1c97d14f7485e -> xe-pw-168250v1

  IGT_8956: 8956
  xe-5231-fc59f76558703febba8056be87d1c97d14f7485e: fc59f76558703febba8056be87d1c97d14f7485e
  xe-pw-168250v1: 168250v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168250v1/index.html

--===============6235616764469928774==
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
<tr><td><b>Series:</b></td><td>drm/displayid: fix Tiled Display Topology ID size</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168250/">https://patchwork.freedesktop.org/series/168250/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168250v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168250v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5231-fc59f76558703febba8056be87d1c97d14f7485e_BAT -&gt; xe-pw-168250v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168250v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_dma_buf:<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5231-fc59f76558703febba8056be87d1c97d14f7485e/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168250v1/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8023">Intel XE#8023</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5231-fc59f76558703febba8056be87d1c97d14f7485e -&gt; xe-pw-168250v1</li>
</ul>
<p>IGT_8956: 8956<br />
  xe-5231-fc59f76558703febba8056be87d1c97d14f7485e: fc59f76558703febba8056be87d1c97d14f7485e<br />
  xe-pw-168250v1: 168250v1</p>

</body>
</html>

--===============6235616764469928774==--
