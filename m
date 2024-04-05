Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DCEC67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 16:01:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2FE10EBA9;
	Fri,  5 Apr 2024 16:01:55 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34ED10EBA9;
 Fri,  5 Apr 2024 16:01:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4669654066649916888=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5Bv2=5D_dr?=
 =?utf-8?q?m=3A_Add_drm=5Fvblank=5Fwork=5Fflush=5Fall=28=29=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Apr 2024 16:01:53 -0000
Message-ID: <171233291373.1239329.5666648054318800085@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240404104813.150030-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240404104813.150030-1-maarten.lankhorst@linux.intel.com>
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

--===============4669654066649916888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v2] drm: Add drm_vblank_work_flush_all(). (rev2)
URL   : https://patchwork.freedesktop.org/series/132027/
State : success

== Summary ==

CI Bug Log - changes from xe-1046-5714711c6612120bd9c306824ec807d322c0735b_BAT -> xe-pw-132027v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-132027v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          NOTRUN -> [FAIL][1] ([Intel XE#1000]) +3 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132027v2/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-cm:
    - bat-adlp-7:         NOTRUN -> [SKIP][2] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132027v2/bat-adlp-7/igt@xe_evict@evict-small-cm.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-pvc-2:          NOTRUN -> [DMESG-FAIL][3] ([Intel XE#482]) +3 other tests dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132027v2/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
  [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688


Build changes
-------------

  * IGT: IGT_7800 -> IGT_7801
  * Linux: xe-1046-5714711c6612120bd9c306824ec807d322c0735b -> xe-pw-132027v2

  IGT_7800: 7800
  IGT_7801: 7801
  xe-1046-5714711c6612120bd9c306824ec807d322c0735b: 5714711c6612120bd9c306824ec807d322c0735b
  xe-pw-132027v2: 132027v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132027v2/index.html

--===============4669654066649916888==
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
<tr><td><b>Series:</b></td><td>series starting with [v2] drm: Add drm_vblank_work_flush_all(). (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132027/">https://patchwork.freedesktop.org/series/132027/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132027v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132027v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1046-5714711c6612120bd9c306824ec807d322c0735b_BAT -&gt; xe-pw-132027v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132027v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132027v2/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132027v2/bat-adlp-7/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132027v2/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7800 -&gt; IGT_7801</li>
<li>Linux: xe-1046-5714711c6612120bd9c306824ec807d322c0735b -&gt; xe-pw-132027v2</li>
</ul>
<p>IGT_7800: 7800<br />
  IGT_7801: 7801<br />
  xe-1046-5714711c6612120bd9c306824ec807d322c0735b: 5714711c6612120bd9c306824ec807d322c0735b<br />
  xe-pw-132027v2: 132027v2</p>

</body>
</html>

--===============4669654066649916888==--
