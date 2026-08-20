Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24C6C5DF8C
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 22:19:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6725110E610;
	Thu, 20 Aug 2026 22:19:54 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0737510E610;
 Thu, 20 Aug 2026 22:19:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7998832937222523648=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_drm/xe/guc=3A_Test_GuC_v70=2E74=2E0_for_BMG=2C_LNL=2C_PTL=2C_?=
 =?utf-8?q?NVL-S/U/H_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Aug 2026 22:19:53 -0000
Message-ID: <178726439302.72177.15508685005673768834@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260814210758.2779837-3-julia.filipchuk@intel.com>
In-Reply-To: <20260814210758.2779837-3-julia.filipchuk@intel.com>
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

--===============7998832937222523648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe/guc: Test GuC v70.74.0 for BMG, LNL, PTL, NVL-S/U/H (rev3)
URL   : https://patchwork.freedesktop.org/series/172255/
State : failure

== Summary ==

CI Bug Log - changes from xe-5626-2343402d0a2ef55b16b8701e1a345d0b798b2629_BAT -> xe-pw-172255v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-172255v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-172255v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-172255v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_waitfence@engine:
    - bat-ptl-2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5626-2343402d0a2ef55b16b8701e1a345d0b798b2629/bat-ptl-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v3/bat-ptl-2/igt@xe_waitfence@engine.html

  


Build changes
-------------

  * Linux: xe-5626-2343402d0a2ef55b16b8701e1a345d0b798b2629 -> xe-pw-172255v3

  IGT_9066: 9066
  xe-5626-2343402d0a2ef55b16b8701e1a345d0b798b2629: 2343402d0a2ef55b16b8701e1a345d0b798b2629
  xe-pw-172255v3: 172255v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v3/index.html

--===============7998832937222523648==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe/guc: Test GuC v70.74.0 for BMG, LNL, PTL, NVL-S/U/H (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172255/">https://patchwork.freedesktop.org/series/172255/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5626-2343402d0a2ef55b16b8701e1a345d0b798b2629_BAT -&gt; xe-pw-172255v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-172255v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-172255v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-172255v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5626-2343402d0a2ef55b16b8701e1a345d0b798b2629/bat-ptl-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v3/bat-ptl-2/igt@xe_waitfence@engine.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5626-2343402d0a2ef55b16b8701e1a345d0b798b2629 -&gt; xe-pw-172255v3</li>
</ul>
<p>IGT_9066: 9066<br />
  xe-5626-2343402d0a2ef55b16b8701e1a345d0b798b2629: 2343402d0a2ef55b16b8701e1a345d0b798b2629<br />
  xe-pw-172255v3: 172255v3</p>

</body>
</html>

--===============7998832937222523648==--
