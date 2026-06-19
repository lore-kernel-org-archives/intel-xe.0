Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F617CD98F6
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 02:53:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA42B10E02A;
	Fri, 19 Jun 2026 02:53:04 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D5110E00C;
 Fri, 19 Jun 2026 02:53:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6587177178025725893=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_=3A_drm/i915/display=3A_Fi?=
 =?utf-8?q?x_NV12_ceiling_division_for_bigjoiner_case?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vidya Srinivas" <vidya.srinivas@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Jun 2026 02:53:03 -0000
Message-ID: <178183758350.95050.4677366568844327017@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260618181837.687302-1-vidya.srinivas@intel.com>
In-Reply-To: <20260618181837.687302-1-vidya.srinivas@intel.com>
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

--===============6587177178025725893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: : drm/i915/display: Fix NV12 ceiling division for bigjoiner case
URL   : https://patchwork.freedesktop.org/series/168812/
State : failure

== Summary ==

CI Bug Log - changes from xe-5280-24209d838338d162bb25aadfd637b11747a357ca_FULL -> xe-pw-168812v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-168812v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-168812v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-168812v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@once-mmap-free-race-nomemset:
    - shard-bmg:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-10/igt@xe_exec_system_allocator@once-mmap-free-race-nomemset.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-9/igt@xe_exec_system_allocator@once-mmap-free-race-nomemset.html

  
New tests
---------

  New tests have been introduced between xe-5280-24209d838338d162bb25aadfd637b11747a357ca_FULL and xe-pw-168812v1_FULL:

### New IGT tests (2) ###

  * igt@kms_getfb@getfb-reject-nv12:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_getfb@getfb2-accept-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in xe-pw-168812v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#3098]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-1/igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#301])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#301] / [Intel XE#3149])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#1503])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-9/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#7922]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-8/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-9/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#7915]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-9/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-8/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][15] -> [FAIL][16] ([Intel XE#6361]) +5 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-1/igt@kms_setmode@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-3/igt@kms_setmode@basic.html
    - shard-lnl:          [PASS][17] -> [FAIL][18] ([Intel XE#6361]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-lnl-7/igt@kms_setmode@basic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-lnl-3/igt@kms_setmode@basic.html

  * igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads:
    - shard-bmg:          [PASS][19] -> [FAIL][20] ([Intel XE#7850])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-2/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-3/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html

  
#### Possible fixes ####

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][21] ([Intel XE#7915]) -> [PASS][22] +3 other tests pass
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-2/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][23] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][25] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][26] ([Intel XE#309] / [Intel XE#7343])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][27] ([Intel XE#301]) -> [FAIL][28] ([Intel XE#301] / [Intel XE#3149])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][29] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916]) -> [SKIP][30] ([Intel XE#3544] / [Intel XE#7916])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][31] ([Intel XE#7915]) -> [SKIP][32] ([Intel XE#7916]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-2/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-10/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html

  
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355


Build changes
-------------

  * Linux: xe-5280-24209d838338d162bb25aadfd637b11747a357ca -> xe-pw-168812v1

  IGT_8973: 8973
  xe-5280-24209d838338d162bb25aadfd637b11747a357ca: 24209d838338d162bb25aadfd637b11747a357ca
  xe-pw-168812v1: 168812v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/index.html

--===============6587177178025725893==
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
<tr><td><b>Series:</b></td><td>: drm/i915/display: Fix NV12 ceiling division for bigjoiner case</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168812/">https://patchwork.freedesktop.org/series/168812/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5280-24209d838338d162bb25aadfd637b11747a357ca_FULL -&gt; xe-pw-168812v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-168812v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-168812v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-168812v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_system_allocator@once-mmap-free-race-nomemset:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-10/igt@xe_exec_system_allocator@once-mmap-free-race-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-9/igt@xe_exec_system_allocator@once-mmap-free-race-nomemset.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5280-24209d838338d162bb25aadfd637b11747a357ca_FULL and xe-pw-168812v1_FULL:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_getfb@getfb-reject-nv12:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168812v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-1/igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-8/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-9/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-9/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-8/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-1/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-3/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) +5 other tests fail</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-lnl-7/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-lnl-3/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-2/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-3/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-2/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5280-24209d838338d162bb25aadfd637b11747a357ca/shard-bmg-2/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168812v1/shard-bmg-10/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5280-24209d838338d162bb25aadfd637b11747a357ca -&gt; xe-pw-168812v1</li>
</ul>
<p>IGT_8973: 8973<br />
  xe-5280-24209d838338d162bb25aadfd637b11747a357ca: 24209d838338d162bb25aadfd637b11747a357ca<br />
  xe-pw-168812v1: 168812v1</p>

</body>
</html>

--===============6587177178025725893==--
