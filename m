Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDACC61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 18:28:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9989710EC60;
	Wed, 26 Aug 2026 18:28:33 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0632F10EB88;
 Wed, 26 Aug 2026 18:28:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0983266116826113135=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/cdclk=3A_cdclk_pc?=
 =?utf-8?q?ode_related_fixes_and_refactoring_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Aug 2026 18:28:32 -0000
Message-ID: <178776891201.87306.2455716941513536712@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
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

--===============0983266116826113135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/cdclk: cdclk pcode related fixes and refactoring (rev2)
URL   : https://patchwork.freedesktop.org/series/168273/
State : success

== Summary ==

CI Bug Log - changes from xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6_FULL -> xe-pw-168273v2_FULL
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

  New tests have been introduced between xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6_FULL and xe-pw-168273v2_FULL:

### New IGT tests (105) ###

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.10] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.10] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.09] s

  * igt@kms_flip@absolute-wf_vblank@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.15] s

  * igt@kms_flip@absolute-wf_vblank@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.12] s

  * igt@kms_flip@absolute-wf_vblank@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.11] s

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.09] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.08] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.10] s

  * igt@kms_flip@basic-plain-flip@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.77] s

  * igt@kms_flip@basic-plain-flip@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.77] s

  * igt@kms_flip@basic-plain-flip@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.80] s

  * igt@kms_flip@blocking-absolute-wf_vblank@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.14] s

  * igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.13] s

  * igt@kms_flip@blocking-absolute-wf_vblank@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.12] s

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.39] s

  * igt@kms_flip@blocking-wf_vblank@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.38] s

  * igt@kms_flip@blocking-wf_vblank@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.40] s

  * igt@kms_flip@bo-too-big-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_flip@bo-too-big-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip@bo-too-big-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip@bo-too-big@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_flip@bo-too-big@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_flip@bo-too-big@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_flip@busy-flip@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_flip@busy-flip@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_flip@busy-flip@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.01] s

  * igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.02] s

  * igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.01] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.82] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.81] s

  * igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_flip@dpms-vs-vblank-race@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  * igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.38] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.39] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.38] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.41] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.40] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.39] s

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.41] s

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.40] s

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.41] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.80] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.80] s

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.03] s

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.02] s

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.02] s

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.06] s

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.05] s

  * igt@kms_flip@flip-vs-modeset-vs-hang@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_flip@flip-vs-panning-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.07] s

  * igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.05] s

  * igt@kms_flip@flip-vs-panning-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.80] s

  * igt@kms_flip@flip-vs-rmfb-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [3.99] s

  * igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.02] s

  * igt@kms_flip@flip-vs-rmfb-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [3.99] s

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [3.09] s

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_flip@modeset-vs-vblank-race@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.83] s

  * igt@kms_flip@modeset-vs-vblank-race@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.87] s

  * igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [1.83] s

  * igt@kms_flip@nonexisting-fb-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_flip@nonexisting-fb-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_flip@nonexisting-fb-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.30] s

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.29] s

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.31] s

  * igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.36] s

  * igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.32] s

  * igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.32] s

  * igt@kms_flip@plain-flip-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_flip@plain-flip-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_flip@plain-flip-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.30] s

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.29] s

  * igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.29] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.77] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.38] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.39] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.38] s

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.41] s

  * igt@kms_flip@wf_vblank-ts-check@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.41] s

  * igt@kms_flip@wf_vblank-ts-check@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [4.41] s

  

Known issues
------------

  Here are the changes found in xe-pw-168273v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@pan:
    - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#2488])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-7/igt@fbdev@pan.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-4/igt@fbdev@pan.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#367])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2887]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][7] -> [INCOMPLETE][8] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2724] / [Intel XE#7449])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2252]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2320])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_legacy@forked-bo:
    - shard-bmg:          [PASS][12] -> [INCOMPLETE][13] ([Intel XE#7774] / [Intel XE#8151]) +1 other test incomplete
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-8/igt@kms_cursor_legacy@forked-bo.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-5/igt@kms_cursor_legacy@forked-bo.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
    - shard-bmg:          [PASS][14] -> [FAIL][15] ([Intel XE#3321])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#301])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7178] / [Intel XE#7351])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#4141])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2311]) +5 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7061])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2313]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1489])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2426] / [Intel XE#5848])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2450] / [Intel XE#5857])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][27] -> [INCOMPLETE][28] ([Intel XE#6321] / [Intel XE#8355]) +1 other test incomplete
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2322] / [Intel XE#7372])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-multi-queue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#8374])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-rebind.html

  * igt@xe_exec_multi_queue@max-queues-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#8364]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@xe_exec_multi_queue@max-queues-close-fd.html

  * igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][32] ([Intel XE#9041])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage.html

  * igt@xe_exec_reset@multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#8369])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@xe_exec_reset@multi-queue-cat-error.html

  * igt@xe_exec_system_allocator@process-many-large-malloc-multi-fault:
    - shard-bmg:          [PASS][34] -> [INCOMPLETE][35] ([Intel XE#8159])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-malloc-multi-fault.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-malloc-multi-fault.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [PASS][36] -> [ABORT][37] ([Intel XE#8007]) +1 other test abort
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3 (NEW):
    - shard-bmg:          [FAIL][38] ([Intel XE#3321]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][40] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][42] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][43] ([Intel XE#301])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][44] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][45] ([Intel XE#2509] / [Intel XE#7437])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2488
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#9041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9041


Build changes
-------------

  * Linux: xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6 -> xe-pw-168273v2

  IGT_9076: 8f42b0189d73d9912ad58c99cfaa4ff46c20fcc3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6: 4a47d4b5bf957bd7e34d8d3ab7096c42161892c6
  xe-pw-168273v2: 168273v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/index.html

--===============0983266116826113135==
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
<tr><td><b>Series:</b></td><td>drm/i915/cdclk: cdclk pcode related fixes and refactoring (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168273/">https://patchwork.freedesktop.org/series/168273/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6_FULL -&gt; xe-pw-168273v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6_FULL and xe-pw-168273v2_FULL:</p>
<h3>New IGT tests (105)</h3>
<ul>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-modeset-vs-hang@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.41] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168273v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-7/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-4/igt@fbdev@pan.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2488">Intel XE#2488</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-8/igt@kms_cursor_legacy@forked-bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-5/igt@kms_cursor_legacy@forked-bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">Intel XE#8151</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@xe_exec_multi_queue@max-queues-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9041">Intel XE#9041</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-9/igt@xe_exec_reset@multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-multi-fault:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-malloc-multi-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-malloc-multi-fault.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3 (NEW):</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168273v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6 -&gt; xe-pw-168273v2</li>
</ul>
<p>IGT_9076: 8f42b0189d73d9912ad58c99cfaa4ff46c20fcc3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5647-4a47d4b5bf957bd7e34d8d3ab7096c42161892c6: 4a47d4b5bf957bd7e34d8d3ab7096c42161892c6<br />
  xe-pw-168273v2: 168273v2</p>

</body>
</html>

--===============0983266116826113135==--
