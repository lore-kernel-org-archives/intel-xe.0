Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4372EC71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 08:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A5110E541;
	Tue, 17 Jun 2025 08:49:14 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E51E10E242;
 Tue, 17 Jun 2025 08:49:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4032181498984430351=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/panel=3A_register_?=
 =?utf-8?q?drm=5Fpanel_and_call_prepare/unprepare_for_eDP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Jun 2025 08:49:13 -0000
Message-ID: <175015015337.86154.2293750454389372626@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250617-edp_panel-v1-1-ce1a581e8fcd@intel.com>
In-Reply-To: <20250617-edp_panel-v1-1-ce1a581e8fcd@intel.com>
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

--===============4032181498984430351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/panel: register drm_panel and call prepare/unprepare for eDP
URL   : https://patchwork.freedesktop.org/series/150369/
State : failure

== Summary ==

CI Bug Log - changes from xe-3261-95f0ac069cc2eee10b5d5e0ba67502ccea089de8_BAT -> xe-pw-150369v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-150369v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-150369v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-150369v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-lnl-1:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3261-95f0ac069cc2eee10b5d5e0ba67502ccea089de8/bat-lnl-1/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150369v1/bat-lnl-1/igt@xe_module_load@load.html
    - bat-adlp-7:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3261-95f0ac069cc2eee10b5d5e0ba67502ccea089de8/bat-adlp-7/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150369v1/bat-adlp-7/igt@xe_module_load@load.html

  


Build changes
-------------

  * Linux: xe-3261-95f0ac069cc2eee10b5d5e0ba67502ccea089de8 -> xe-pw-150369v1

  IGT_8412: 8412
  xe-3261-95f0ac069cc2eee10b5d5e0ba67502ccea089de8: 95f0ac069cc2eee10b5d5e0ba67502ccea089de8
  xe-pw-150369v1: 150369v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150369v1/index.html

--===============4032181498984430351==
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
<tr><td><b>Series:</b></td><td>drm/i915/panel: register drm_panel and call prepare/unprepare for eDP</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150369/">https://patchwork.freedesktop.org/series/150369/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150369v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150369v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3261-95f0ac069cc2eee10b5d5e0ba67502ccea089de8_BAT -&gt; xe-pw-150369v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-150369v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-150369v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-150369v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3261-95f0ac069cc2eee10b5d5e0ba67502ccea089de8/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150369v1/bat-lnl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3261-95f0ac069cc2eee10b5d5e0ba67502ccea089de8/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150369v1/bat-adlp-7/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3261-95f0ac069cc2eee10b5d5e0ba67502ccea089de8 -&gt; xe-pw-150369v1</li>
</ul>
<p>IGT_8412: 8412<br />
  xe-3261-95f0ac069cc2eee10b5d5e0ba67502ccea089de8: 95f0ac069cc2eee10b5d5e0ba67502ccea089de8<br />
  xe-pw-150369v1: 150369v1</p>

</body>
</html>

--===============4032181498984430351==--
