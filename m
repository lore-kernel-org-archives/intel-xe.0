Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85523E67A6C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 05:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4775910E630;
	Tue,  3 Mar 2026 05:31:52 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAA310E62F;
 Tue,  3 Mar 2026 05:31:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8177314248106603944=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Two-pass_MMU_interval_noti?=
 =?utf-8?q?fiers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Mar 2026 05:31:50 -0000
Message-ID: <177251591052.306092.11198495205267744468@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260302163248.105454-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260302163248.105454-1-thomas.hellstrom@linux.intel.com>
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

--===============8177314248106603944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Two-pass MMU interval notifiers (rev2)
URL   : https://patchwork.freedesktop.org/series/153280/
State : failure

== Summary ==

CI Bug Log - changes from xe-4642-8527899064372c5c8f4d8db80024412ff3c02128_FULL -> xe-pw-153280v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-153280v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-153280v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-153280v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  
Known issues
------------

  Here are the changes found in xe-pw-153280v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2887])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2652]) +11 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-1.html

  * igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][4] ([Intel XE#1178] / [Intel XE#3304])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-9/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][5] ([Intel XE#6707])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-5/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2320])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][7] -> [DMESG-WARN][8] ([Intel XE#5354])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4642-8527899064372c5c8f4d8db80024412ff3c02128/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [PASS][9] -> [FAIL][10] ([Intel XE#3321])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4642-8527899064372c5c8f4d8db80024412ff3c02128/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1:
    - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#3098]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4642-8527899064372c5c8f4d8db80024412ff3c02128/shard-lnl-7/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-lnl-8/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4642-8527899064372c5c8f4d8db80024412ff3c02128/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2311])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#5625])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4642-8527899064372c5c8f4d8db80024412ff3c02128/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][18] ([Intel XE#3321]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4642-8527899064372c5c8f4d8db80024412ff3c02128/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - shard-bmg:          [FAIL][20] -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4642-8527899064372c5c8f4d8db80024412ff3c02128/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [SKIP][22] ([Intel XE#4692]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4642-8527899064372c5c8f4d8db80024412ff3c02128/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][24] ([Intel XE#2509]) -> [SKIP][25] ([Intel XE#2426])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4642-8527899064372c5c8f4d8db80024412ff3c02128/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707


Build changes
-------------

  * Linux: xe-4642-8527899064372c5c8f4d8db80024412ff3c02128 -> xe-pw-153280v2

  IGT_8776: 8776
  xe-4642-8527899064372c5c8f4d8db80024412ff3c02128: 8527899064372c5c8f4d8db80024412ff3c02128
  xe-pw-153280v2: 153280v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/index.html

--===============8177314248106603944==
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
<tr><td><b>Series:</b></td><td>Two-pass MMU interval notifiers (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153280/">https://patchwork.freedesktop.org/series/153280/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4642-8527899064372c5c8f4d8db80024412ff3c02128_FULL -&gt; xe-pw-153280v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-153280v2_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-153280v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-153280v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153280v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-9/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-5/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4642-8527899064372c5c8f4d8db80024412ff3c02128/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4642-8527899064372c5c8f4d8db80024412ff3c02128/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4642-8527899064372c5c8f4d8db80024412ff3c02128/shard-lnl-7/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-lnl-8/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4642-8527899064372c5c8f4d8db80024412ff3c02128/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4642-8527899064372c5c8f4d8db80024412ff3c02128/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4642-8527899064372c5c8f4d8db80024412ff3c02128/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4642-8527899064372c5c8f4d8db80024412ff3c02128/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4642-8527899064372c5c8f4d8db80024412ff3c02128/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_tiled_display@basic-test-pattern-with-chamelium:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4642-8527899064372c5c8f4d8db80024412ff3c02128/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153280v2/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4642-8527899064372c5c8f4d8db80024412ff3c02128 -&gt; xe-pw-153280v2</li>
</ul>
<p>IGT_8776: 8776<br />
  xe-4642-8527899064372c5c8f4d8db80024412ff3c02128: 8527899064372c5c8f4d8db80024412ff3c02128<br />
  xe-pw-153280v2: 153280v2</p>

</body>
</html>

--===============8177314248106603944==--
