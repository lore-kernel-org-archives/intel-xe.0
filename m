Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D5BCDB46F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 15:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5E489798;
	Mon, 22 Jun 2026 15:29:25 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90D289798;
 Mon, 22 Jun 2026 15:29:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0008713111619567788=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/vm=3A_Fix_BO_prefet?=
 =?utf-8?q?ch_with_CONSULT=5FMEM=5FADVISE=5FPREF=5FLOC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Jun 2026 15:29:24 -0000
Message-ID: <178214216468.101529.7028086389232752541@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260622082445.1720007-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260622082445.1720007-2-himal.prasad.ghimiray@intel.com>
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

--===============0008713111619567788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vm: Fix BO prefetch with CONSULT_MEM_ADVISE_PREF_LOC
URL   : https://patchwork.freedesktop.org/series/168913/
State : success

== Summary ==

CI Bug Log - changes from xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294_FULL -> xe-pw-168913v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294_FULL and xe-pw-168913v1_FULL:

### New IGT tests (14) ###

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.31] s

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.30] s

  * igt@kms_async_flips@crc@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.31] s

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.30] s

  * igt@kms_async_flips@test-cursor@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_async_flips@test-cursor@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_async_flips@test-cursor@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_async_flips@test-cursor@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  

Known issues
------------

  Here are the changes found in xe-pw-168913v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#301] / [Intel XE#3149])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#1503])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#7922]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-6/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-4/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#7915]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-1/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-7/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1489])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@xe_vm@large-userptr-binds-16777216:
    - shard-bmg:          NOTRUN -> [ABORT][10] ([Intel XE#8007])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-1/igt@xe_vm@large-userptr-binds-16777216.html

  
#### Possible fixes ####

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [FAIL][11] ([Intel XE#7949]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
    - shard-bmg:          [FAIL][13] ([Intel XE#6266]) -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][15] ([Intel XE#301]) -> [PASS][16] +2 other tests pass
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][17] ([Intel XE#7915]) -> [PASS][18] +3 other tests pass
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-7/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@xe_exec_reset@long-spin-many-preempt-threads:
    - shard-bmg:          [FAIL][19] ([Intel XE#7956]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-10/igt@xe_exec_reset@long-spin-many-preempt-threads.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-3/igt@xe_exec_reset@long-spin-many-preempt-threads.html

  * igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads:
    - shard-bmg:          [FAIL][21] ([Intel XE#7850]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-5/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-4/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [ABORT][23] ([Intel XE#8007]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-8/igt@xe_wedged@wedged-mode-toggle.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][25] ([Intel XE#301]) -> [FAIL][26] ([Intel XE#301] / [Intel XE#3149])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][27] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][28] ([Intel XE#2426] / [Intel XE#5848])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#7949]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7949
  [Intel XE#7956]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007


Build changes
-------------

  * Linux: xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294 -> xe-pw-168913v1

  IGT_8976: 8976
  xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294: 55ba13f332ab983d0c3ce0c448d46af3da717294
  xe-pw-168913v1: 168913v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/index.html

--===============0008713111619567788==
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
<tr><td><b>Series:</b></td><td>drm/xe/vm: Fix BO prefetch with CONSULT_MEM_ADVISE_PREF_LOC</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168913/">https://patchwork.freedesktop.org/series/168913/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294_FULL -&gt; xe-pw-168913v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294_FULL and xe-pw-168913v1_FULL:</p>
<h3>New IGT tests (14)</h3>
<ul>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168913v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-6/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-4/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-1/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-7/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-16777216:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-1/igt@xe_vm@large-userptr-binds-16777216.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7949">Intel XE#7949</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-7/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-10/igt@xe_exec_reset@long-spin-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956">Intel XE#7956</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-3/igt@xe_exec_reset@long-spin-many-preempt-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-5/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-4/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-8/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294 -&gt; xe-pw-168913v1</li>
</ul>
<p>IGT_8976: 8976<br />
  xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294: 55ba13f332ab983d0c3ce0c448d46af3da717294<br />
  xe-pw-168913v1: 168913v1</p>

</body>
</html>

--===============0008713111619567788==--
