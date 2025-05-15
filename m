Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BF8C54754
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 07:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C1E10E798;
	Thu, 15 May 2025 07:42:02 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D5010E798;
 Thu, 15 May 2025 07:42:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2804656552877496743=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_quirk_for_panels_that_s?=
 =?utf-8?q?upport_HBR3_without_TPS4_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 May 2025 07:42:02 -0000
Message-ID: <174729492202.83245.16741690489199780107@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250514084356.1558407-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250514084356.1558407-1-ankit.k.nautiyal@intel.com>
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

--===============2804656552877496743==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add quirk for panels that support HBR3 without TPS4 (rev2)
URL   : https://patchwork.freedesktop.org/series/149004/
State : success

== Summary ==

CI Bug Log - changes from xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1_BAT -> xe-pw-149004v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-149004v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#3970])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149004v2/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * Linux: xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1 -> xe-pw-149004v2

  IGT_8364: 8364
  xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1: 3d6670fab64cb00b5e6ed80d2517147db533faf1
  xe-pw-149004v2: 149004v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149004v2/index.html

--===============2804656552877496743==
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
<tr><td><b>Series:</b></td><td>Add quirk for panels that support HBR3 without TPS4 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149004/">https://patchwork.freedesktop.org/series/149004/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149004v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149004v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1_BAT -&gt; xe-pw-149004v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149004v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_intel_bb@intel-bb-blit-y:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149004v2/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1 -&gt; xe-pw-149004v2</li>
</ul>
<p>IGT_8364: 8364<br />
  xe-3089-3d6670fab64cb00b5e6ed80d2517147db533faf1: 3d6670fab64cb00b5e6ed80d2517147db533faf1<br />
  xe-pw-149004v2: 149004v2</p>

</body>
</html>

--===============2804656552877496743==--
