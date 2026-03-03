Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D43E67A6B
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 06:35:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B587810E63D;
	Tue,  3 Mar 2026 06:35:23 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2372A10E032;
 Tue,  3 Mar 2026 06:35:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4032763921052844053=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_platform/x86/intel/vsec=3A_?=
 =?utf-8?q?Prep_for_ACPI_PMT_discovery_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Mar 2026 06:35:22 -0000
Message-ID: <177251972215.305661.8221451082850089168@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260303051953.1453372-1-david.e.box@linux.intel.com>
In-Reply-To: <20260303051953.1453372-1-david.e.box@linux.intel.com>
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

--===============4032763921052844053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: platform/x86/intel/vsec: Prep for ACPI PMT discovery (rev7)
URL   : https://patchwork.freedesktop.org/series/159716/
State : success

== Summary ==

CI Bug Log - changes from xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143_BAT -> xe-pw-159716v7_BAT
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

  Here are the changes found in xe-pw-159716v7_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-bmg-3:          NOTRUN -> [DMESG-WARN][1] ([Intel XE#7433])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159716v7/bat-bmg-3/igt@xe_module_load@load.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - bat-bmg-3:          NOTRUN -> [SKIP][2] ([Intel XE#6566]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159716v7/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][3] -> [TIMEOUT][4] ([Intel XE#6506])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159716v7/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566
  [Intel XE#7433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433


Build changes
-------------

  * Linux: xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143 -> xe-pw-159716v7

  IGT_8777: a50285a68dbef0fe11140adef4016a756f57b324 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143: 69ee18cb718c8e62d92b25235881fc562e71a143
  xe-pw-159716v7: 159716v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159716v7/index.html

--===============4032763921052844053==
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
<tr><td><b>Series:</b></td><td>platform/x86/intel/vsec: Prep for ACPI PMT discovery (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159716/">https://patchwork.freedesktop.org/series/159716/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159716v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159716v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143_BAT -&gt; xe-pw-159716v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 14)</h2>
<p>Additional (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159716v7_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159716v7/bat-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159716v7/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159716v7/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143 -&gt; xe-pw-159716v7</li>
</ul>
<p>IGT_8777: a50285a68dbef0fe11140adef4016a756f57b324 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4646-69ee18cb718c8e62d92b25235881fc562e71a143: 69ee18cb718c8e62d92b25235881fc562e71a143<br />
  xe-pw-159716v7: 159716v7</p>

</body>
</html>

--===============4032763921052844053==--
