Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D556CD5BC9
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 17:36:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F42B10E223;
	Mon, 25 May 2026 17:36:51 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F5D10E223;
 Mon, 25 May 2026 17:36:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3452862427244439906=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/dp=3A_Add_DSC_virtual_?=
 =?utf-8?q?DPCD_quirk_for_Realtek_MST_branch_device?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 May 2026 17:36:50 -0000
Message-ID: <177973061054.5829.4525600406549167245@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260525125516.2794636-1-imre.deak@intel.com>
In-Reply-To: <20260525125516.2794636-1-imre.deak@intel.com>
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

--===============3452862427244439906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/dp: Add DSC virtual DPCD quirk for Realtek MST branch device
URL   : https://patchwork.freedesktop.org/series/167215/
State : success

== Summary ==

CI Bug Log - changes from xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454_FULL -> xe-pw-167215v1_FULL
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

  New tests have been introduced between xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454_FULL and xe-pw-167215v1_FULL:

### New IGT tests (103) ###

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.37] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.42] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.42] s

  * igt@kms_flip@absolute-wf_vblank@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.45] s

  * igt@kms_flip@absolute-wf_vblank@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.42] s

  * igt@kms_flip@absolute-wf_vblank@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.42] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.18] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.23] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.21] s

  * igt@kms_flip@blocking-absolute-wf_vblank@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.26] s

  * igt@kms_flip@blocking-absolute-wf_vblank@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.22] s

  * igt@kms_flip@blocking-absolute-wf_vblank@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.30] s

  * igt@kms_flip@blocking-wf_vblank@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.72] s

  * igt@kms_flip@blocking-wf_vblank@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.74] s

  * igt@kms_flip@blocking-wf_vblank@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.73] s

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_flip@busy-flip@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_flip@busy-flip@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  * igt@kms_flip@busy-flip@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_flip@dpms-off-confusion-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.20] s

  * igt@kms_flip@dpms-off-confusion-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.23] s

  * igt@kms_flip@dpms-off-confusion-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.22] s

  * igt@kms_flip@dpms-off-confusion@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.21] s

  * igt@kms_flip@dpms-off-confusion@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.22] s

  * igt@kms_flip@dpms-off-confusion@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.21] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.32] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [4.97] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [4.96] s

  * igt@kms_flip@dpms-vs-vblank-race@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.38] s

  * igt@kms_flip@dpms-vs-vblank-race@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [4.95] s

  * igt@kms_flip@dpms-vs-vblank-race@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [4.97] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.64] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.61] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.72] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.66] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.73] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.73] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.78] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.49] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.52] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.85] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.48] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.48] s

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.22] s

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.20] s

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.22] s

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - Statuses : 1 fail(s)
    - Exec time: [1.26] s

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - Statuses : 1 fail(s)
    - Exec time: [1.69] s

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.27] s

  * igt@kms_flip@flip-vs-modeset-vs-hang@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.70] s

  * igt@kms_flip@flip-vs-panning-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.29] s

  * igt@kms_flip@flip-vs-panning-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.29] s

  * igt@kms_flip@flip-vs-panning-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.31] s

  * igt@kms_flip@flip-vs-panning-vs-hang@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_flip@flip-vs-panning@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.30] s

  * igt@kms_flip@flip-vs-panning@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.31] s

  * igt@kms_flip@flip-vs-panning@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.32] s

  * igt@kms_flip@flip-vs-rmfb-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.24] s

  * igt@kms_flip@flip-vs-rmfb-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.21] s

  * igt@kms_flip@flip-vs-rmfb-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.28] s

  * igt@kms_flip@flip-vs-rmfb@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.27] s

  * igt@kms_flip@flip-vs-rmfb@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.21] s

  * igt@kms_flip@flip-vs-rmfb@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.26] s

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [12.58] s

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.11] s

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.07] s

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.04] s

  * igt@kms_flip@modeset-vs-vblank-race@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.04] s

  * igt@kms_flip@modeset-vs-vblank-race@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.05] s

  * igt@kms_flip@modeset-vs-vblank-race@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [5.05] s

  * igt@kms_flip@nonexisting-fb-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.16] s

  * igt@kms_flip@nonexisting-fb-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_flip@nonexisting-fb-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.17] s

  * igt@kms_flip@nonexisting-fb@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_flip@nonexisting-fb@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_flip@nonexisting-fb@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.56] s

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.53] s

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.53] s

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.58] s

  * igt@kms_flip@plain-flip-fb-recreate@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.53] s

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.53] s

  * igt@kms_flip@plain-flip-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.86] s

  * igt@kms_flip@plain-flip-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.87] s

  * igt@kms_flip@plain-flip-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [1.88] s

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.48] s

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.53] s

  * igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.52] s

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.54] s

  * igt@kms_flip@plain-flip-ts-check@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.52] s

  * igt@kms_flip@plain-flip-ts-check@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.53] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.78] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.49] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.51] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.88] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.48] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.52] s

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.73] s

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.72] s

  * igt@kms_flip@wf_vblank-ts-check@c-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [11.73] s

  

Known issues
------------

  Here are the changes found in xe-pw-167215v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          NOTRUN -> [FAIL][1] ([Intel XE#7445])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2327])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#7059] / [Intel XE#7085])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [ABORT][4] ([Intel XE#4760])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1428] / [Intel XE#7387])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1124])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#7679])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#7679])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#3432])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2887])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#306] / [Intel XE#7358])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#373])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2252])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#6507])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#6974])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@suspend-resume:
    - shard-bmg:          NOTRUN -> [FAIL][18] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#7642])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2320])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1424])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#309] / [Intel XE#7343])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2244])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1 (NEW):
    - shard-lnl:          [PASS][24] -> [FAIL][25] ([Intel XE#301])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7061] / [Intel XE#7356])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#4141]) +4 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#6312] / [Intel XE#651])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#656] / [Intel XE#7905]) +7 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#6312]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2311]) +5 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7061])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2313]) +9 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#7905]) +8 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7865]) +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#7915]) +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454/shard-bmg-5/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-8/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#599] / [Intel XE#7382]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#3309] / [Intel XE#7368])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#2893] / [Intel XE#7304])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#1489]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1406])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#6503]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_sharpness_filter@filter-basic.html

  * igt@xe_eudebug@basic-close:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#7636]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#7636]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#6540] / [Intel XE#688])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][50] -> [INCOMPLETE][51] ([Intel XE#6321])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@no-exec-parallel-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7482]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_exec_balancer@no-exec-parallel-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2322] / [Intel XE#7372])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#7136]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#7136]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#6874]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#6874]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#7866])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_system_allocator@once-new-bo-map-nomemset:
    - shard-bmg:          NOTRUN -> [ABORT][59] ([Intel XE#8007])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-1/igt@xe_exec_system_allocator@once-new-bo-map-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#7138])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#7138])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#6281] / [Intel XE#7426])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#2229])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#6964]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#6964])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#4130] / [Intel XE#7366])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#7892])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_vm@overcommit-fault-vram-lr-no-overcommit.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1 (NEW):
    - shard-lnl:          [FAIL][69] ([Intel XE#301]) -> [PASS][70] +2 other tests pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1 (NEW):
    - shard-lnl:          [FAIL][71] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][73] ([Intel XE#7915]) -> [PASS][74] +1 other test pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454/shard-bmg-1/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-9/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [ABORT][75] ([Intel XE#8007]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454/shard-bmg-10/igt@xe_wedged@wedged-mode-toggle.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][77] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][78] ([Intel XE#301])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][79] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916]) -> [SKIP][80] ([Intel XE#3544] / [Intel XE#7916])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][81] ([Intel XE#7915]) -> [SKIP][82] ([Intel XE#7916]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454/shard-bmg-7/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870


Build changes
-------------

  * Linux: xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454 -> xe-pw-167215v1

  IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454: 099f0e417d2c6ee41a50c87e1cb9411cceaff454
  xe-pw-167215v1: 167215v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/index.html

--===============3452862427244439906==
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
<tr><td><b>Series:</b></td><td>drm/dp: Add DSC virtual DPCD quirk for Realtek MST branch device</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167215/">https://patchwork.freedesktop.org/series/167215/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454_FULL -&gt; xe-pw-167215v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454_FULL and xe-pw-167215v1_FULL:</p>
<h3>New IGT tests (103)</h3>
<ul>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-modeset-vs-hang@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [12.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.73] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-167215v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445">Intel XE#7445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_content_protection@suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1 (NEW):</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454/shard-bmg-5/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-8/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382">Intel XE#7382</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368">Intel XE#7368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@kms_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_exec_balancer@no-exec-parallel-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866">Intel XE#7866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-bo-map-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-1/igt@xe_exec_system_allocator@once-new-bo-map-nomemset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-4/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-4/igt@xe_vm@overcommit-fault-vram-lr-no-overcommit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1 (NEW):</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1 (NEW):</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454/shard-bmg-1/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-9/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454/shard-bmg-10/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454/shard-bmg-7/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167215v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454 -&gt; xe-pw-167215v1</li>
</ul>
<p>IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5123-099f0e417d2c6ee41a50c87e1cb9411cceaff454: 099f0e417d2c6ee41a50c87e1cb9411cceaff454<br />
  xe-pw-167215v1: 167215v1</p>

</body>
</html>

--===============3452862427244439906==--
