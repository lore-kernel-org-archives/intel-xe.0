Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D493FD3A661
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 14:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FF910E67E;
	Tue, 29 Oct 2024 14:52:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF7F10E67C;
 Tue, 29 Oct 2024 14:52:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1975123527990195519=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915/psr=3A_WA_for_panels_st?=
 =?utf-8?q?ating_bad_link_status_after_PSR_is_enabled_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Oct 2024 14:52:53 -0000
Message-ID: <173021357311.1359386.12493743791510134886@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241029122415.1789528-1-jouni.hogander@intel.com>
In-Reply-To: <20241029122415.1789528-1-jouni.hogander@intel.com>
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

--===============1975123527990195519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/psr: WA for panels stating bad link status after PSR is enabled (rev2)
URL   : https://patchwork.freedesktop.org/series/140571/
State : success

== Summary ==

CI Bug Log - changes from xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab_BAT -> xe-pw-140571v2_BAT
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

  Here are the changes found in xe-pw-140571v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-pvc-2:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3295])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-bmg-1:          [PASS][3] -> [INCOMPLETE][4] ([Intel XE#2874] / [Intel XE#2998]) +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][5] ([Intel XE#1861]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [SKIP][7] ([Intel XE#455]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-adlp-7:         [DMESG-FAIL][9] ([Intel XE#2871]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html

  
#### Warnings ####

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-adlp-7:         [SKIP][11] ([Intel XE#455]) -> [DMESG-FAIL][12] ([Intel XE#2871]) +1 other test dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html

  
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2871]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#3295]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3295
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8086 -> IGT_8087
  * Linux: xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab -> xe-pw-140571v2

  IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8087: 7abd9c49a49a9ff1f3300d7c51a92a5af8a789f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab: 738c18d8599dce736da8b6958f96d2eac08a36ab
  xe-pw-140571v2: 140571v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/index.html

--===============1975123527990195519==
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
<tr><td><b>Series:</b></td><td>drm/i915/psr: WA for panels stating bad link status after PSR is enabled (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140571/">https://patchwork.freedesktop.org/series/140571/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab_BAT -&gt; xe-pw-140571v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140571v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3295">Intel XE#3295</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip@edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871">Intel XE#2871</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr@psr-sprite-plane-onoff:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871">Intel XE#2871</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8086 -&gt; IGT_8087</li>
<li>Linux: xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab -&gt; xe-pw-140571v2</li>
</ul>
<p>IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8087: 7abd9c49a49a9ff1f3300d7c51a92a5af8a789f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab: 738c18d8599dce736da8b6958f96d2eac08a36ab<br />
  xe-pw-140571v2: 140571v2</p>

</body>
</html>

--===============1975123527990195519==--
