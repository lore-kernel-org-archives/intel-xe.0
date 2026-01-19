Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF43C98315
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 06:07:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00D210E37A;
	Mon, 19 Jan 2026 06:07:19 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3109410E370;
 Mon, 19 Jan 2026 06:07:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7856647137276510798=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_Wait_f?=
 =?utf-8?q?or_pipe_start_to_avoid_vblank_and_scanline_jumps?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 Jan 2026 06:07:18 -0000
Message-ID: <176880283819.165965.4915982897468776346@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260119043025.589754-1-suraj.kandpal@intel.com>
In-Reply-To: <20260119043025.589754-1-suraj.kandpal@intel.com>
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

--===============7856647137276510798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Wait for pipe start to avoid vblank and scanline jumps
URL   : https://patchwork.freedesktop.org/series/160261/
State : failure

== Summary ==

CI Bug Log - changes from xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac_FULL -> xe-pw-160261v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-160261v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160261v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-160261v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-lnl:          [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-lnl-4/igt@kms_joiner@basic-force-big-joiner.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-lnl-2/igt@kms_joiner@basic-force-big-joiner.html

  
#### Warnings ####

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26], [SKIP][27], [PASS][28]) ([Intel XE#2457]) -> ([DMESG-WARN][29], [DMESG-WARN][30], [DMESG-WARN][31], [DMESG-WARN][32], [DMESG-WARN][33], [DMESG-WARN][34], [DMESG-WARN][35], [DMESG-WARN][36], [DMESG-WARN][37], [DMESG-WARN][38], [DMESG-WARN][39], [DMESG-WARN][40], [DMESG-WARN][41], [DMESG-WARN][42], [DMESG-WARN][43], [DMESG-WARN][44], [DMESG-WARN][45], [DMESG-WARN][46], [DMESG-WARN][47], [DMESG-WARN][48], [DMESG-WARN][49], [DMESG-WARN][50], [DMESG-WARN][51], [DMESG-WARN][52], [DMESG-WARN][53])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-10/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-2/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-2/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-2/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-10/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-8/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-8/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-7/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-7/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-7/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-1/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-8/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-1/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-10/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-10/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-3/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-3/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-2/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-3/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-9/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-9/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-9/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-9/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-2/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-10/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-1/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-1/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-1/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-1/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-1/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-1/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-7/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-7/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-7/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-7/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-9/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-9/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-9/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-9/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-2/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-2/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-2/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-2/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-3/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-10/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-10/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-10/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-3/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-3/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-3/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-8/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-160261v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-lnl:          [PASS][54] -> [FAIL][55] ([Intel XE#5993]) +3 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][56] -> [FAIL][57] ([Intel XE#301]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][58] -> [FAIL][59] ([Intel XE#4459]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-lnl:          [PASS][60] -> [DMESG-WARN][61] ([Intel XE#7063]) +6 other tests dmesg-warn
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-lnl-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-lnl-7/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-lnl:          [PASS][62] -> [DMESG-WARN][63] ([Intel XE#7023])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-lnl-2/igt@xe_exec_reset@gt-reset-stress.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-lnl-8/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_system_allocator@twice-large-mmap-free-nomemset:
    - shard-lnl:          [PASS][64] -> [DMESG-WARN][65] ([Intel XE#4537] / [Intel XE#7063])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-lnl-5/igt@xe_exec_system_allocator@twice-large-mmap-free-nomemset.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-lnl-7/igt@xe_exec_system_allocator@twice-large-mmap-free-nomemset.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][66] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][67] +1 other test pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#7023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7023
  [Intel XE#7063]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063


Build changes
-------------

  * Linux: xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac -> xe-pw-160261v1

  IGT_8704: 8704
  xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac: af18785a6a8621b1a5805ba8a1b35d290cb4bcac
  xe-pw-160261v1: 160261v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/index.html

--===============7856647137276510798==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/i915/display: Wait for pipe start to avo=
id vblank and scanline jumps</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/160261/">https://patchwork.freedesktop.org/series/160261/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-160261v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-160261v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4406-af18785a6a8621b1a5805ba8a1b35d290=
cb4bcac_FULL -&gt; xe-pw-160261v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-160261v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-160261v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1602=
61v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_joiner@basic-force-big-joiner:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-lnl-4/igt@kms_join=
er@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-lnl-2/igt@kms_joiner@basic-fo=
rce-big-joiner.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-10/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-=
bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/s=
hard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bc=
ac/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290c=
b4bcac/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d=
290cb4bcac/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1=
b35d290cb4bcac/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805=
ba8a1b35d290cb4bcac/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a=
5805ba8a1b35d290cb4bcac/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a862=
1b1a5805ba8a1b35d290cb4bcac/shard-bmg-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6=
a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-10/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18=
785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-10/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4406=
-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-3/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-3/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-3/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg-9/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-bmg=
-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard=
-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/s=
hard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bc=
ac/shard-bmg-10/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-4406-af18785a6a8621b1a5805ba8a1b35d290=
cb4bcac/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/s=
hard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-1/igt@xe_module=
_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-160261v1/shard-bmg-1/igt@xe_module_load@load.html">DMESG-W=
ARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v=
1/shard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-1/igt@xe_mod=
ule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-160261v1/shard-bmg-7/igt@xe_module_load@load.html">DMES=
G-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1602=
61v1/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-7/igt@xe_=
module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-160261v1/shard-bmg-7/igt@xe_module_load@load.html">D=
MESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
60261v1/shard-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-9/ig=
t@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-9/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-160261v1/shard-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-2=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-2/igt@xe_module_load@load=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-160261v1/shard-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bm=
g-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-3/igt@xe_module_load@l=
oad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-160261v1/shard-bmg-10/igt@xe_module_load@load.html">DMESG-WARN</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shar=
d-bmg-10/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-10/igt@xe_module_=
load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-160261v1/shard-bmg-3/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1=
/shard-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-bmg-3/igt@xe_modu=
le_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-160261v1/shard-bmg-8/igt@xe_module_load@load.html">DMESG=
-WARN</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160261v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-lnl-1/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-lnl-2/i=
gt@kms_async_flips@async-flip-with-page-flip-events-linear.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993">Intel =
XE#5993</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-lnl-8/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-lnl-1/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-160261v1/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-lnl-5/igt@xe_exec_=
fault_mode@many-userptr-invalidate-race.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-lnl-7/igt@xe_ex=
ec_fault_mode@many-userptr-invalidate-race.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a=
>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-lnl-2/igt@xe_exec_=
reset@gt-reset-stress.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-160261v1/shard-lnl-8/igt@xe_exec_reset@gt-reset-=
stress.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7023">Intel XE#7023</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-free-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-lnl-5/igt@xe_exec_=
system_allocator@twice-large-mmap-free-nomemset.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shard-lnl-7/i=
gt@xe_exec_system_allocator@twice-large-mmap-free-nomemset.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537">=
Intel XE#4537</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7063">Intel XE#7063</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@flip-vs-expired-vblank@c-edp1:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v1/shar=
d-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac -&gt; xe-pw-160=
261v1</li>
</ul>
<p>IGT_8704: 8704<br />
  xe-4406-af18785a6a8621b1a5805ba8a1b35d290cb4bcac: af18785a6a8621b1a5805ba=
8a1b35d290cb4bcac<br />
  xe-pw-160261v1: 160261v1</p>

</body>
</html>

--===============7856647137276510798==--
