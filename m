Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B1DCCFA18
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 17:01:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3AFB10E11C;
	Tue, 11 Nov 2025 17:01:41 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2A510E11C;
 Tue, 11 Nov 2025 17:01:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2199129358062463517=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_mtd=3A_intel-dg=3A_Fix_acce?=
 =?utf-8?q?ssing_regions_before_setting_nregions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Nov 2025 17:01:40 -0000
Message-ID: <176288050050.42606.3106737257589436944@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251111-mtd-nregions-v1-1-61db61e78c63@intel.com>
In-Reply-To: <20251111-mtd-nregions-v1-1-61db61e78c63@intel.com>
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

--===============2199129358062463517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: mtd: intel-dg: Fix accessing regions before setting nregions
URL   : https://patchwork.freedesktop.org/series/157392/
State : failure

== Summary ==

CI Bug Log - changes from xe-4086-52764bea2cf028d285b0f4d86ee1ebfd4e196486_BAT -> xe-pw-157392v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-157392v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-157392v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-157392v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_waitfence@reltime:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4086-52764bea2cf028d285b0f4d86ee1ebfd4e196486/bat-atsm-2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157392v1/bat-atsm-2/igt@xe_waitfence@reltime.html

  
Known issues
------------

  Here are the changes found in xe-pw-157392v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] ([Intel XE#6519])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4086-52764bea2cf028d285b0f4d86ee1ebfd4e196486/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157392v1/bat-dg2-oem2/igt@xe_waitfence@engine.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6] ([Intel XE#6520])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4086-52764bea2cf028d285b0f4d86ee1ebfd4e196486/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157392v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-pvc-2:          [FAIL][7] ([Intel XE#6520]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4086-52764bea2cf028d285b0f4d86ee1ebfd4e196486/bat-pvc-2/igt@xe_waitfence@reltime.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157392v1/bat-pvc-2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * Linux: xe-4086-52764bea2cf028d285b0f4d86ee1ebfd4e196486 -> xe-pw-157392v1

  IGT_8620: 8620
  xe-4086-52764bea2cf028d285b0f4d86ee1ebfd4e196486: 52764bea2cf028d285b0f4d86ee1ebfd4e196486
  xe-pw-157392v1: 157392v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157392v1/index.html

--===============2199129358062463517==
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
<tr><td><b>Series:</b></td><td>mtd: intel-dg: Fix accessing regions before setting nregions</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157392/">https://patchwork.freedesktop.org/series/157392/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157392v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157392v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4086-52764bea2cf028d285b0f4d86ee1ebfd4e196486_BAT -&gt; xe-pw-157392v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-157392v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-157392v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-157392v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4086-52764bea2cf028d285b0f4d86ee1ebfd4e196486/bat-atsm-2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157392v1/bat-atsm-2/igt@xe_waitfence@reltime.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157392v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4086-52764bea2cf028d285b0f4d86ee1ebfd4e196486/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157392v1/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4086-52764bea2cf028d285b0f4d86ee1ebfd4e196486/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157392v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4086-52764bea2cf028d285b0f4d86ee1ebfd4e196486/bat-pvc-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157392v1/bat-pvc-2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4086-52764bea2cf028d285b0f4d86ee1ebfd4e196486 -&gt; xe-pw-157392v1</li>
</ul>
<p>IGT_8620: 8620<br />
  xe-4086-52764bea2cf028d285b0f4d86ee1ebfd4e196486: 52764bea2cf028d285b0f4d86ee1ebfd4e196486<br />
  xe-pw-157392v1: 157392v1</p>

</body>
</html>

--===============2199129358062463517==--
