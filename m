Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA41D5D699
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 23:10:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772DC10E1AE;
	Thu,  7 Nov 2024 23:10:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9F310E1AE;
 Thu,  7 Nov 2024 23:10:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0330780595164922462=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/guc=3A_Remove_duplicate_s?=
 =?utf-8?q?ource_field_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Nov 2024 23:10:31 -0000
Message-ID: <173102103170.1424812.12636959224596332950@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241107213841.436384-1-zhanjun.dong@intel.com>
In-Reply-To: <20241107213841.436384-1-zhanjun.dong@intel.com>
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

--===============0330780595164922462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Remove duplicate source field (rev2)
URL   : https://patchwork.freedesktop.org/series/141033/
State : success

== Summary ==

CI Bug Log - changes from xe-2185-a1fa8135081e9c259deee601ef3dc945af012447_BAT -> xe-pw-141033v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-141033v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         NOTRUN -> [SKIP][1] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][2] ([Intel XE#288]) +32 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-7:         NOTRUN -> [SKIP][3] ([Intel XE#2229])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [FAIL][4] ([Intel XE#886]) -> [PASS][5] +1 other test pass
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-adlp-7:         [INCOMPLETE][6] ([Intel XE#2874]) -> [PASS][7] +1 other test pass
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * Linux: xe-2185-a1fa8135081e9c259deee601ef3dc945af012447 -> xe-pw-141033v2

  IGT_8100: 84e42580f918da926481fd2fb37be01451d6ee9a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2185-a1fa8135081e9c259deee601ef3dc945af012447: a1fa8135081e9c259deee601ef3dc945af012447
  xe-pw-141033v2: 141033v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/index.html

--===============0330780595164922462==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Remove duplicate source field (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141033/">https://patchwork.freedesktop.org/series/141033/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2185-a1fa8135081e9c259deee601ef3dc945af012447_BAT -&gt; xe-pw-141033v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141033v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2185-a1fa8135081e9c259deee601ef3dc945af012447/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141033v2/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2185-a1fa8135081e9c259deee601ef3dc945af012447 -&gt; xe-pw-141033v2</li>
</ul>
<p>IGT_8100: 84e42580f918da926481fd2fb37be01451d6ee9a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2185-a1fa8135081e9c259deee601ef3dc945af012447: a1fa8135081e9c259deee601ef3dc945af012447<br />
  xe-pw-141033v2: 141033v2</p>

</body>
</html>

--===============0330780595164922462==--
