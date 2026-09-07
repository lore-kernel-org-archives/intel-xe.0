Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFF2C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 05:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E2610E0C1;
	Mon,  7 Sep 2026 05:17:36 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8F410E0C1;
 Mon,  7 Sep 2026 05:17:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4298527285670539648=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/quirks=3A_Limit_eD?=
 =?utf-8?q?P_rate_to_HBR2_on_HP_Pavilion_Plus_14-ew1?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Sep 2026 05:17:34 -0000
Message-ID: <178875825462.127987.15041231624039970016@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260907034555.2753846-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260907034555.2753846-1-ankit.k.nautiyal@intel.com>
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

--===============4298527285670539648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/quirks: Limit eDP rate to HBR2 on HP Pavilion Plus 14-ew1
URL   : https://patchwork.freedesktop.org/series/173464/
State : failure

== Summary ==

CI Bug Log - changes from xe-5696-496ff8213a2d2e1e5b1c8efe8b55e1dcdc3e3f8f_BAT -> xe-pw-173464v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-173464v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-173464v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 10)
------------------------------

  Missing    (2): bat-bmg-2 bat-nvls-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-173464v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_waitfence@abstime:
    - bat-wcl-1:          [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5696-496ff8213a2d2e1e5b1c8efe8b55e1dcdc3e3f8f/bat-wcl-1/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173464v1/bat-wcl-1/igt@xe_waitfence@abstime.html

  
Known issues
------------

  Here are the changes found in xe-pw-173464v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-ptl-2:          [FAIL][3] ([Intel XE#9109]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5696-496ff8213a2d2e1e5b1c8efe8b55e1dcdc3e3f8f/bat-ptl-2/igt@xe_waitfence@engine.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173464v1/bat-ptl-2/igt@xe_waitfence@engine.html
    - bat-wcl-1:          [FAIL][5] ([Intel XE#9103]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5696-496ff8213a2d2e1e5b1c8efe8b55e1dcdc3e3f8f/bat-wcl-1/igt@xe_waitfence@engine.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173464v1/bat-wcl-1/igt@xe_waitfence@engine.html

  
  [Intel XE#9103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103
  [Intel XE#9109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109


Build changes
-------------

  * Linux: xe-5696-496ff8213a2d2e1e5b1c8efe8b55e1dcdc3e3f8f -> xe-pw-173464v1

  IGT_9084: 9084
  xe-5696-496ff8213a2d2e1e5b1c8efe8b55e1dcdc3e3f8f: 496ff8213a2d2e1e5b1c8efe8b55e1dcdc3e3f8f
  xe-pw-173464v1: 173464v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173464v1/index.html

--===============4298527285670539648==
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
<tr><td><b>Series:</b></td><td>drm/i915/quirks: Limit eDP rate to HBR2 on HP Pavilion Plus 14-ew1</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173464/">https://patchwork.freedesktop.org/series/173464/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173464v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173464v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5696-496ff8213a2d2e1e5b1c8efe8b55e1dcdc3e3f8f_BAT -&gt; xe-pw-173464v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-173464v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-173464v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 10)</h2>
<p>Missing    (2): bat-bmg-2 bat-nvls-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-173464v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5696-496ff8213a2d2e1e5b1c8efe8b55e1dcdc3e3f8f/bat-wcl-1/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173464v1/bat-wcl-1/igt@xe_waitfence@abstime.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173464v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5696-496ff8213a2d2e1e5b1c8efe8b55e1dcdc3e3f8f/bat-ptl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109">Intel XE#9109</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173464v1/bat-ptl-2/igt@xe_waitfence@engine.html">PASS</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5696-496ff8213a2d2e1e5b1c8efe8b55e1dcdc3e3f8f/bat-wcl-1/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103">Intel XE#9103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173464v1/bat-wcl-1/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5696-496ff8213a2d2e1e5b1c8efe8b55e1dcdc3e3f8f -&gt; xe-pw-173464v1</li>
</ul>
<p>IGT_9084: 9084<br />
  xe-5696-496ff8213a2d2e1e5b1c8efe8b55e1dcdc3e3f8f: 496ff8213a2d2e1e5b1c8efe8b55e1dcdc3e3f8f<br />
  xe-pw-173464v1: 173464v1</p>

</body>
</html>

--===============4298527285670539648==--
