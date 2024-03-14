Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEC3C5475B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 08:27:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BB810F97F;
	Thu, 14 Mar 2024 08:27:14 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F7910F97D;
 Thu, 14 Mar 2024 08:27:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3441533145382141507=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/i915/display=3A_DMC_wakelock?=
 =?utf-8?q?_implementation_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Mar 2024 08:27:13 -0000
Message-ID: <171040483303.754222.13501524284477327680@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240314073752.1245879-1-luciano.coelho@intel.com>
In-Reply-To: <20240314073752.1245879-1-luciano.coelho@intel.com>
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

--===============3441533145382141507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: DMC wakelock implementation (rev3)
URL   : https://patchwork.freedesktop.org/series/128628/
State : failure

== Summary ==

CI Bug Log - changes from xe-938-96e47e3f3a5952e104d56352872becdc0048d26e_BAT -> xe-pw-128628v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-128628v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-128628v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-128628v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-cm-threads-small:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-938-96e47e3f3a5952e104d56352872becdc0048d26e/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128628v3/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html

  


Build changes
-------------

  * IGT: IGT_7760 -> IGT_7761
  * Linux: xe-938-96e47e3f3a5952e104d56352872becdc0048d26e -> xe-pw-128628v3

  IGT_7760: 7760
  IGT_7761: 67af6998a7e0467a7a0718cbbfe05a9fd383206f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-938-96e47e3f3a5952e104d56352872becdc0048d26e: 96e47e3f3a5952e104d56352872becdc0048d26e
  xe-pw-128628v3: 128628v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128628v3/index.html

--===============3441533145382141507==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: DMC wakelock implementation (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128628/">https://patchwork.freedesktop.org/series/128628/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128628v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128628v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-938-96e47e3f3a5952e104d56352872becdc0048d26e_BAT -&gt; xe-pw-128628v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-128628v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-128628v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-128628v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_evict@evict-cm-threads-small:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-938-96e47e3f3a5952e104d56352872becdc0048d26e/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128628v3/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7760 -&gt; IGT_7761</li>
<li>Linux: xe-938-96e47e3f3a5952e104d56352872becdc0048d26e -&gt; xe-pw-128628v3</li>
</ul>
<p>IGT_7760: 7760<br />
  IGT_7761: 67af6998a7e0467a7a0718cbbfe05a9fd383206f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-938-96e47e3f3a5952e104d56352872becdc0048d26e: 96e47e3f3a5952e104d56352872becdc0048d26e<br />
  xe-pw-128628v3: 128628v3</p>

</body>
</html>

--===============3441533145382141507==--
