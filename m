Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC15CC98315
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 04:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9958910E346;
	Mon, 19 Jan 2026 04:11:06 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D433A10E340;
 Mon, 19 Jan 2026 04:11:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0030660212270102701=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Introduce_DRM=5FRAS_using_g?=
 =?utf-8?q?eneric_netlink_for_RAS_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 Jan 2026 04:11:05 -0000
Message-ID: <176879586585.165702.1525401155479351626@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260119040023.2821518-6-riana.tauro@intel.com>
In-Reply-To: <20260119040023.2821518-6-riana.tauro@intel.com>
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

--===============0030660212270102701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce DRM_RAS using generic netlink for RAS (rev4)
URL   : https://patchwork.freedesktop.org/series/155188/
State : failure

== Summary ==

CI Bug Log - changes from xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac_BAT -> xe-pw-155188v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-155188v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-155188v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-155188v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/bat-dg2-oem2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155188v4/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-atsm-2:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/bat-atsm-2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155188v4/bat-atsm-2/igt@xe_module_load@load.html
    - bat-bmg-2:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/bat-bmg-2/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155188v4/bat-bmg-2/igt@xe_module_load@load.html
    - bat-bmg-3:          [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/bat-bmg-3/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155188v4/bat-bmg-3/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/bat-bmg-1/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155188v4/bat-bmg-1/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-155188v4_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-bmg-2:          [FAIL][11] -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/bat-bmg-2/igt@xe_waitfence@engine.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155188v4/bat-bmg-2/igt@xe_waitfence@engine.html

  


Build changes
-------------

  * Linux: xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac -> xe-pw-155188v4

  IGT_8704: 8704
  xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac: af18785a6a8621b1a5805ba8a1b35d290cb4bcac
  xe-pw-155188v4: 155188v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155188v4/index.html

--===============0030660212270102701==
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
<tr><td><b>Series:</b></td><td>Introduce DRM_RAS using generic netlink for RAS (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155188/">https://patchwork.freedesktop.org/series/155188/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155188v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155188v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac_BAT -&gt; xe-pw-155188v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-155188v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-155188v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-155188v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155188v4/bat-dg2-oem2/igt@xe_module_load@load.html">DMESG-WARN</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155188v4/bat-atsm-2/igt@xe_module_load@load.html">DMESG-WARN</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155188v4/bat-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a></li>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/bat-bmg-3/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155188v4/bat-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155188v4/bat-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155188v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/bat-bmg-2/igt@xe_waitfence@engine.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155188v4/bat-bmg-2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac -&gt; xe-pw-155188v4</li>
</ul>
<p>IGT_8704: 8704<br />
  xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac: af18785a6a8621b1a5805ba8a1b35d290cb4bcac<br />
  xe-pw-155188v4: 155188v4</p>

</body>
</html>

--===============0030660212270102701==--
