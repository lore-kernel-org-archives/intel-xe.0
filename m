Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736DCE68960
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 08:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425FA10E3FA;
	Thu, 31 Oct 2024 08:56:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8183010E3FA;
 Thu, 31 Oct 2024 08:56:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2816984234179523510=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915/psr=3A_Disable_Panel_Re?=
 =?utf-8?q?play_as_well_if_VRR_is_enabled?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Oct 2024 08:56:23 -0000
Message-ID: <173036498351.1365305.7583299586112990054@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241031081025.3215966-1-jouni.hogander@intel.com>
In-Reply-To: <20241031081025.3215966-1-jouni.hogander@intel.com>
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

--===============2816984234179523510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/psr: Disable Panel Replay as well if VRR is enabled
URL   : https://patchwork.freedesktop.org/series/140753/
State : success

== Summary ==

CI Bug Log - changes from xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31_BAT -> xe-pw-140753v1_BAT
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

  Here are the changes found in xe-pw-140753v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-bmg-2:          [PASS][1] -> [INCOMPLETE][2] ([Intel XE#2874] / [Intel XE#2998]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
    - bat-bmg-1:          [PASS][3] -> [INCOMPLETE][4] ([Intel XE#2874] / [Intel XE#2998]) +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
    - bat-adlp-7:         [PASS][5] -> [INCOMPLETE][6] ([Intel XE#2874]) +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
    - bat-dg2-oem2:       [PASS][7] -> [INCOMPLETE][8] ([Intel XE#2874]) +1 other test incomplete
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [FAIL][9] ([Intel XE#886]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][11] ([Intel XE#1861]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * Linux: xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31 -> xe-pw-140753v1

  IGT_8090: ef818fb3a73d6d69d09d573c2a6d071b2c7dc84a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31: baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31
  xe-pw-140753v1: 140753v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/index.html

--===============2816984234179523510==
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
<tr><td><b>Series:</b></td><td>drm/i915/psr: Disable Panel Replay as well if VRR is enabled</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140753/">https://patchwork.freedesktop.org/series/140753/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31_BAT -&gt; xe-pw-140753v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140753v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) +1 other test incomplete</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) +1 other test incomplete</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) +1 other test incomplete</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140753v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31 -&gt; xe-pw-140753v1</li>
</ul>
<p>IGT_8090: ef818fb3a73d6d69d09d573c2a6d071b2c7dc84a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2148-baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31: baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31<br />
  xe-pw-140753v1: 140753v1</p>

</body>
</html>

--===============2816984234179523510==--
