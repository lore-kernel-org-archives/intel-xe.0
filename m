Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEC3C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 15:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8D310E461;
	Mon,  5 Jan 2026 15:51:48 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702F010E461;
 Mon,  5 Jan 2026 15:51:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1401644536981751948=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_put_COMMON=5FSLIC?=
 =?utf-8?q?E=5FCHICKEN3_on_the_allowlist_for_UMD?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lionel Landwerlin" <lionel.g.landwerlin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Jan 2026 15:51:46 -0000
Message-ID: <176762830645.126412.10211725434470031005@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260105150222.462293-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20260105150222.462293-1-lionel.g.landwerlin@intel.com>
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

--===============1401644536981751948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: put COMMON_SLICE_CHICKEN3 on the allowlist for UMD
URL   : https://patchwork.freedesktop.org/series/159648/
State : success

== Summary ==

CI Bug Log - changes from xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e_BAT -> xe-pw-159648v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 12)
------------------------------

  Additional (1): bat-bmg-1 

Known issues
------------

  Here are the changes found in xe-pw-159648v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-bmg-1:          NOTRUN -> [ABORT][1] ([Intel XE#6922] / [Intel XE#6930])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159648v1/bat-bmg-1/igt@xe_module_load@load.html

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][2] -> [TIMEOUT][3] ([Intel XE#6506])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159648v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][4] -> [FAIL][5] ([Intel XE#6520])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159648v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
#### Possible fixes ####

  * igt@kms_force_connector_basic@force-edid:
    - bat-ptl-1:          [SKIP][6] -> [PASS][7] +3 other tests pass
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/bat-ptl-1/igt@kms_force_connector_basic@force-edid.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159648v1/bat-ptl-1/igt@kms_force_connector_basic@force-edid.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][8] ([Intel XE#6519]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159648v1/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
  [Intel XE#6922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6922
  [Intel XE#6930]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6930


Build changes
-------------

  * IGT: IGT_8682 -> IGT_8683
  * Linux: xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e -> xe-pw-159648v1

  IGT_8682: 8682
  IGT_8683: 8683
  xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e: f5136cded03e959ebb00a1160e5f00973c38007e
  xe-pw-159648v1: 159648v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159648v1/index.html

--===============1401644536981751948==
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
<tr><td><b>Series:</b></td><td>drm/xe: put COMMON_SLICE_CHICKEN3 on the allowlist for UMD</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159648/">https://patchwork.freedesktop.org/series/159648/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159648v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159648v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e_BAT -&gt; xe-pw-159648v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 12)</h2>
<p>Additional (1): bat-bmg-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159648v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159648v1/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6922">Intel XE#6922</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6930">Intel XE#6930</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159648v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159648v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/bat-ptl-1/igt@kms_force_connector_basic@force-edid.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159648v1/bat-ptl-1/igt@kms_force_connector_basic@force-edid.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159648v1/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8682 -&gt; IGT_8683</li>
<li>Linux: xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e -&gt; xe-pw-159648v1</li>
</ul>
<p>IGT_8682: 8682<br />
  IGT_8683: 8683<br />
  xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e: f5136cded03e959ebb00a1160e5f00973c38007e<br />
  xe-pw-159648v1: 159648v1</p>

</body>
</html>

--===============1401644536981751948==--
