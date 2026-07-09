Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E64C43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 13:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E343110F5CB;
	Thu,  9 Jul 2026 13:26:29 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB1310E6EF;
 Thu,  9 Jul 2026 13:26:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2173498689125764015=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dp=3A_fix_MSA_VSC?=
 =?utf-8?q?=5FSDP_delegation_for_colorimetry?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Jul 2026 13:26:28 -0000
Message-ID: <178360358825.171269.5756733835980637757@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260709113951.3557968-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260709113951.3557968-1-chaitanya.kumar.borah@intel.com>
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

--===============2173498689125764015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: fix MSA VSC_SDP delegation for colorimetry
URL   : https://patchwork.freedesktop.org/series/170125/
State : success

== Summary ==

CI Bug Log - changes from xe-5373-85c80edcaa1b51184fe70d731cd2d35f00bffb05_BAT -> xe-pw-170125v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-1 

Known issues
------------

  Here are the changes found in xe-pw-170125v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-vm:         [ABORT][1] ([Intel XE#8007] / [Intel XE#8023]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5373-85c80edcaa1b51184fe70d731cd2d35f00bffb05/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170125v1/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8023


Build changes
-------------

  * IGT: IGT_8994 -> IGT_8995
  * Linux: xe-5373-85c80edcaa1b51184fe70d731cd2d35f00bffb05 -> xe-pw-170125v1

  IGT_8994: 59469572ae481848d6bd469242aef7c5333b39ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8995: 8995
  xe-5373-85c80edcaa1b51184fe70d731cd2d35f00bffb05: 85c80edcaa1b51184fe70d731cd2d35f00bffb05
  xe-pw-170125v1: 170125v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170125v1/index.html

--===============2173498689125764015==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: fix MSA VSC_SDP delegation for colorimetry</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170125/">https://patchwork.freedesktop.org/series/170125/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170125v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170125v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5373-85c80edcaa1b51184fe70d731cd2d35f00bffb05_BAT -&gt; xe-pw-170125v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-170125v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_live_ktest@xe_dma_buf:<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5373-85c80edcaa1b51184fe70d731cd2d35f00bffb05/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8023">Intel XE#8023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170125v1/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8994 -&gt; IGT_8995</li>
<li>Linux: xe-5373-85c80edcaa1b51184fe70d731cd2d35f00bffb05 -&gt; xe-pw-170125v1</li>
</ul>
<p>IGT_8994: 59469572ae481848d6bd469242aef7c5333b39ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8995: 8995<br />
  xe-5373-85c80edcaa1b51184fe70d731cd2d35f00bffb05: 85c80edcaa1b51184fe70d731cd2d35f00bffb05<br />
  xe-pw-170125v1: 170125v1</p>

</body>
</html>

--===============2173498689125764015==--
