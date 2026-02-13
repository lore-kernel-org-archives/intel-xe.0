Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C3DEEA87E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 02:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFC610E223;
	Fri, 13 Feb 2026 02:36:49 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C911410E223;
 Fri, 13 Feb 2026 02:36:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6455918166839624444=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Force_EXEC=5FQUE?=
 =?utf-8?q?UE=5FFLAG=5FKERNEL_for_kernel_internal_VMs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Feb 2026 02:36:47 -0000
Message-ID: <177095020776.250939.4803018186625720085@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260211171441.3246686-1-piotr.piorkowski@intel.com>
In-Reply-To: <20260211171441.3246686-1-piotr.piorkowski@intel.com>
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

--===============6455918166839624444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Force EXEC_QUEUE_FLAG_KERNEL for kernel internal VMs
URL   : https://patchwork.freedesktop.org/series/161506/
State : failure

== Summary ==

CI Bug Log - changes from xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37_FULL -> xe-pw-161506v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161506v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161506v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161506v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - shard-lnl:          [PASS][1] -> [SKIP][2] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-lnl-8/igt@kms_vblank@ts-continuation-dpms-rpm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-2/igt@kms_vblank@ts-continuation-dpms-rpm.html

  
#### Warnings ####

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-bmg:          [SKIP][3] ([Intel XE#6886]) -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  
New tests
---------

  New tests have been introduced between xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37_FULL and xe-pw-161506v1_FULL:

### New IGT tests (493) ###

  * igt@kms_cursor_edge_walk@128x128-left-edge:
    - Statuses : 1 pass(s)
    - Exec time: [8.79] s

  * igt@kms_cursor_edge_walk@128x128-right-edge:
    - Statuses : 2 pass(s)
    - Exec time: [6.70, 8.78] s

  * igt@kms_cursor_edge_walk@128x128-top-bottom:
    - Statuses : 2 pass(s)
    - Exec time: [6.78, 8.82] s

  * igt@kms_cursor_edge_walk@128x128-top-edge:
    - Statuses : 2 pass(s)
    - Exec time: [6.79, 8.79] s

  * igt@kms_cursor_edge_walk@256x256-left-edge:
    - Statuses : 2 pass(s)
    - Exec time: [6.74, 8.84] s

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - Statuses : 1 pass(s)
    - Exec time: [8.84] s

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - Statuses : 2 pass(s)
    - Exec time: [6.72, 8.82] s

  * igt@kms_cursor_edge_walk@256x256-top-edge:
    - Statuses : 2 pass(s)
    - Exec time: [6.75, 8.84] s

  * igt@kms_cursor_edge_walk@64x64-left-edge:
    - Statuses : 2 pass(s)
    - Exec time: [6.74, 8.81] s

  * igt@kms_cursor_edge_walk@64x64-right-edge:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_edge_walk@64x64-top-bottom:
    - Statuses : 1 pass(s)
    - Exec time: [6.75] s

  * igt@kms_cursor_edge_walk@64x64-top-edge:
    - Statuses : 1 pass(s)
    - Exec time: [8.85] s

  * igt@kms_draw_crc@draw-method-blt:
    - Statuses : 2 pass(s)
    - Exec time: [2.31, 3.06] s

  * igt@kms_draw_crc@draw-method-blt@rgb565-untiled:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.41] s

  * igt@kms_draw_crc@draw-method-blt@rgb565-xtiled:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.20] s

  * igt@kms_draw_crc@draw-method-blt@xrgb2101010-untiled:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.35] s

  * igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_draw_crc@draw-method-blt@xrgb8888-untiled:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.40] s

  * igt@kms_draw_crc@draw-method-blt@xrgb8888-xtiled:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.20] s

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.97] s

  * igt@kms_draw_crc@draw-method-mmap-wc@rgb565-untiled:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.36] s

  * igt@kms_draw_crc@draw-method-mmap-wc@rgb565-xtiled:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.18] s

  * igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-untiled:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.33] s

  * igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-xtiled:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.17] s

  * igt@kms_draw_crc@draw-method-mmap-wc@xrgb8888-untiled:
    - Statuses : 2 pass(s)
    - Exec time: [0.32, 0.35] s

  * igt@kms_draw_crc@draw-method-mmap-wc@xrgb8888-xtiled:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.18] s

  * igt@kms_draw_crc@draw-method-render:
    - Statuses : 2 pass(s)
    - Exec time: [2.38, 3.00] s

  * igt@kms_draw_crc@draw-method-render@rgb565-untiled:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.33] s

  * igt@kms_draw_crc@draw-method-render@rgb565-xtiled:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.18] s

  * igt@kms_draw_crc@draw-method-render@xrgb2101010-untiled:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.33] s

  * igt@kms_draw_crc@draw-method-render@xrgb2101010-xtiled:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.18] s

  * igt@kms_draw_crc@draw-method-render@xrgb8888-untiled:
    - Statuses : 2 pass(s)
    - Exec time: [0.35, 0.39] s

  * igt@kms_draw_crc@draw-method-render@xrgb8888-xtiled:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.20] s

  * igt@kms_flip@bo-too-big-interruptible@d-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [3.96] s

  * igt@kms_plane_scaling@invalid-parameters:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_plane_scaling@invalid-parameters@less-than-1-height-src:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@invalid-parameters@less-than-1-width-src:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-106x106:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-121x121:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-136x136:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-151x151:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-166x166:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-16x16:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-181x181:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-196x196:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-1x1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-211x211:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-226x226:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-241x241:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-271x271:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-286x286:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-301x301:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-316x316:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-31x31:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-331x331:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-346x346:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-361x361:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-376x376:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-391x391:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-406x406:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-421x421:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-436x436:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-451x451:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-466x466:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-46x46:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-481x481:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-496x496:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-511x511:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-61x61:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-76x76:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-91x91:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-106x106:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-121x121:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-136x136:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-151x151:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-166x166:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-16x16:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-181x181:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-196x196:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-1x1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-211x211:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-226x226:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-241x241:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-271x271:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-286x286:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-301x301:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-316x316:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-31x31:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-331x331:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-346x346:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-361x361:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-376x376:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-391x391:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-406x406:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-421x421:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-436x436:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-451x451:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-466x466:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-46x46:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-481x481:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-496x496:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-511x511:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-61x61:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-76x76:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-91x91:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-106x106:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-121x121:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-136x136:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-151x151:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-166x166:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-16x16:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-181x181:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-196x196:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-1x1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-211x211:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-226x226:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-241x241:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-271x271:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-286x286:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-301x301:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-316x316:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-31x31:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-331x331:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-346x346:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-361x361:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-376x376:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-391x391:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-406x406:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-421x421:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-436x436:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-451x451:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-466x466:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-46x46:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-481x481:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-496x496:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-511x511:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-61x61:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-76x76:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-91x91:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-106x106:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-121x121:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-136x136:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-151x151:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-166x166:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-16x16:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-181x181:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-196x196:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-1x1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-211x211:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-226x226:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-241x241:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-271x271:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-286x286:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-301x301:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-316x316:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-31x31:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-331x331:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-346x346:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-361x361:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-376x376:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-391x391:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-406x406:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-421x421:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-436x436:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-451x451:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-466x466:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-46x46:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-481x481:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-496x496:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-511x511:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-61x61:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-76x76:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-91x91:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-106x106:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-121x121:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-136x136:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-151x151:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-166x166:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-16x16:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-181x181:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-196x196:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-1x1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-211x211:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-226x226:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-241x241:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-271x271:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-286x286:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-301x301:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-316x316:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-31x31:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-331x331:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-346x346:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-361x361:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-376x376:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-391x391:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-406x406:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-421x421:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-436x436:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-451x451:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-466x466:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-46x46:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-481x481:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-496x496:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-511x511:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-61x61:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-76x76:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-91x91:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-106x106:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-121x121:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-136x136:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-151x151:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-166x166:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-16x16:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-181x181:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-196x196:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-1x1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-211x211:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-226x226:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-241x241:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-271x271:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-286x286:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-301x301:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-316x316:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-31x31:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-331x331:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-346x346:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-361x361:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-376x376:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-391x391:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-406x406:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-421x421:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-436x436:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-451x451:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-466x466:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-46x46:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-481x481:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-496x496:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-511x511:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-61x61:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-76x76:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-91x91:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-106x106:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-121x121:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-136x136:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-151x151:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-166x166:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-16x16:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-181x181:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-196x196:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-1x1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-211x211:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-226x226:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-241x241:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-271x271:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-286x286:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-301x301:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-316x316:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-31x31:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-331x331:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-346x346:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-361x361:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-376x376:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-391x391:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-406x406:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-421x421:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-436x436:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-451x451:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-466x466:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-46x46:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-481x481:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-496x496:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-511x511:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-61x61:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-76x76:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-91x91:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-106x106:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-121x121:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-136x136:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-151x151:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-166x166:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-16x16:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-181x181:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-196x196:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-1x1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-211x211:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-226x226:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-241x241:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-271x271:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-286x286:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-301x301:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-316x316:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-31x31:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-331x331:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-346x346:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-361x361:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-376x376:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-391x391:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-406x406:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-421x421:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-436x436:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-451x451:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-466x466:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-46x46:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-481x481:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-496x496:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-511x511:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-61x61:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-76x76:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-91x91:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-106x106:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-121x121:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-136x136:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-151x151:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-166x166:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-16x16:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-181x181:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-196x196:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-1x1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-211x211:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-226x226:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-241x241:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-271x271:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-286x286:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-301x301:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-316x316:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-31x31:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-331x331:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-346x346:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-361x361:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-376x376:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-391x391:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-406x406:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-421x421:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-436x436:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-451x451:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-466x466:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-46x46:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-481x481:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-496x496:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-511x511:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-61x61:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-76x76:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-91x91:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-106x106:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-121x121:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-136x136:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-151x151:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-166x166:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-16x16:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-181x181:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-196x196:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-1x1:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-211x211:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-226x226:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-241x241:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-271x271:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-286x286:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-301x301:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-316x316:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-31x31:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-331x331:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-346x346:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-361x361:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-376x376:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-391x391:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-406x406:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-421x421:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-436x436:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-451x451:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-466x466:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-46x46:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-481x481:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-496x496:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-511x511:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-61x61:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-76x76:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-91x91:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-106x106:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-121x121:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-136x136:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-151x151:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-166x166:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-16x16:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-181x181:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-196x196:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-1x1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-211x211:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-226x226:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-241x241:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-271x271:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-286x286:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-301x301:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-316x316:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-31x31:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-331x331:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-346x346:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-361x361:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-376x376:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-391x391:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-406x406:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-421x421:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-436x436:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-451x451:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-466x466:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-46x46:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-481x481:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-496x496:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-511x511:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-61x61:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-76x76:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-91x91:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-106x106:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-121x121:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-136x136:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-151x151:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-166x166:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-16x16:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-181x181:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-196x196:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-1x1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-211x211:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-226x226:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-241x241:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-271x271:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-286x286:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-301x301:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-316x316:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-31x31:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-331x331:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-346x346:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-361x361:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-376x376:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-391x391:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-406x406:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-421x421:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-436x436:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-451x451:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-466x466:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-46x46:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-481x481:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-496x496:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-511x511:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-61x61:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-76x76:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-91x91:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-106x106:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-121x121:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-136x136:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-151x151:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-166x166:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-16x16:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-181x181:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-196x196:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-1x1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-211x211:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-226x226:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-241x241:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-271x271:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-286x286:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-301x301:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-316x316:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-31x31:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-331x331:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-346x346:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-361x361:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-376x376:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-391x391:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-406x406:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-421x421:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-436x436:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-451x451:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-466x466:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-46x46:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-481x481:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-496x496:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-511x511:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-61x61:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-76x76:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-91x91:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  

Known issues
------------

  Here are the changes found in xe-pw-161506v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#5993]) +3 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#6054]) +3 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2370])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1407]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2328])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +4 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#2191])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#367]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +5 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#3432])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#3432]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +11 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2724])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2252]) +6 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-10/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#373]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#6973])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-4/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2341]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-9/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#307] / [Intel XE#6974])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2390] / [Intel XE#6974])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2320]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1424]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2321]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2321]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][34] -> [DMESG-WARN][35] ([Intel XE#5354])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-10/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#309])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2286])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#4354])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#4354])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-5/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2244]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#2244]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-3/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4422])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1421]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-6/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][44] -> [INCOMPLETE][45] ([Intel XE#2049] / [Intel XE#2597])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#7178])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#7178]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2311]) +17 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#651]) +6 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#4141]) +11 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#656]) +11 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2313]) +24 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#7061]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7061]) +5 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html

  * igt@kms_hdr@static-swap:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1503])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@kms_hdr@static-swap.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#7130]) +9 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#7111] / [Intel XE#7130]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#7130]) +12 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-5/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#7130] / [Intel XE#7131])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-2/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#7131]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-2/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-5.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#5021])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#4596])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#6886]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#6886]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2938])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#870])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#1439] / [Intel XE#836])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#6814])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1406] / [Intel XE#2893])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1406] / [Intel XE#4608]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#1406] / [Intel XE#1489]) +5 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-9/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1406] / [Intel XE#4609]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1406]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1127])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#3414] / [Intel XE#3904])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1435])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@filter-rotations:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#6503]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-10/igt@kms_sharpness_filter@filter-rotations.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2450])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-8/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#1499])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#6599])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#4837]) +7 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug_online@interrupt-reconnect:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#4837] / [Intel XE#6665]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-7/igt@xe_eudebug_online@interrupt-reconnect.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#4837] / [Intel XE#6665]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][87] ([Intel XE#6321])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#688]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2322]) +7 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1392]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-6/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#7136]) +6 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#7136]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#6874]) +10 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#6874]) +22 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#4837]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-8/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#6196])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:
    - shard-bmg:          NOTRUN -> [ABORT][97] ([Intel XE#7169])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-cm-basic:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#7138]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-cm-basic.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#7138]) +5 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2833])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_module_load@force-load:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][101] ([Intel XE#7145])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-2/igt@xe_module_load@force-load.html
    - shard-bmg:          NOTRUN -> [DMESG-WARN][102] ([Intel XE#7145])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-9/igt@xe_module_load@force-load.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-basic:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#6964]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html

  * igt@xe_multigpu_svm@mgpu-migration-basic:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#6964]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-8/igt@xe_multigpu_svm@mgpu-migration-basic.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2427] / [Intel XE#6953])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#2284] / [Intel XE#366])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-6/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s2idle-mocs:
    - shard-lnl:          NOTRUN -> [ABORT][107] ([Intel XE#7169])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-2/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2284])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-10/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#4733])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-5/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#944]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-8/igt@xe_query@multigpu-query-mem-usage.html
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#944])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-6/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#4130]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-2/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_vram@vf-access-after-resize-up:
    - shard-bmg:          NOTRUN -> [FAIL][113] ([Intel XE#5937])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-6/igt@xe_sriov_vram@vf-access-after-resize-up.html

  * igt@xe_sriov_vram@vf-access-provisioned:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#6376])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-6/igt@xe_sriov_vram@vf-access-provisioned.html

  
#### Possible fixes ####

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          [SKIP][115] ([Intel XE#367]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][117] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][118] +1 other test pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][119] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][120] +1 other test pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-lnl:          [FAIL][121] ([Intel XE#1874]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-lnl-1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-5/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][123] ([Intel XE#6361]) -> [PASS][124] +1 other test pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-7/igt@kms_setmode@basic.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-5/igt@kms_setmode@basic.html

  * igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:
    - shard-lnl:          [SKIP][125] ([Intel XE#5007]) -> [PASS][126] +4 other tests pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-lnl-6/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-6/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge:
    - shard-bmg:          [SKIP][127] ([Intel XE#5007]) -> [PASS][128] +5 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-9/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-7/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][129] ([Intel XE#4943]) -> [PASS][130] +93 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge:
    - shard-lnl:          [SKIP][131] ([Intel XE#4943]) -> [PASS][132] +123 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-dontunmap:
    - shard-bmg:          [INCOMPLETE][133] -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-dontunmap.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-dontunmap.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-bmg:          [DMESG-WARN][135] -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-6/igt@xe_pm@s4-vm-bind-unbind-all.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-4/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@aspm_link_residency:
    - shard-bmg:          [SKIP][137] -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-5/igt@xe_pm_residency@aspm_link_residency.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@xe_pm_residency@aspm_link_residency.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-bmg:          [FAIL][139] ([Intel XE#5937]) -> [PASS][140] +1 other test pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-7/igt@xe_sriov_auto_provisioning@selfconfig-basic.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [FAIL][141] ([Intel XE#6569]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-6/igt@xe_sriov_flr@flr-vf1-clear.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Warnings ####

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [DMESG-WARN][143] ([Intel XE#5208]) -> [INCOMPLETE][144] ([Intel XE#2049] / [Intel XE#2597])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][145] ([Intel XE#5466]) -> [ABORT][146] ([Intel XE#5466] / [Intel XE#6652])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6973]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6973
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7111]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7145]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7145
  [Intel XE#7169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7169
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8749 -> IGT_8751
  * Linux: xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37 -> xe-pw-161506v1

  IGT_8749: 195f101f25a7984686f36f340aa88d44a1716ec6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8751: af788251f1ef729d17c802aec2c4547b52059e58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37: 2938ce73d01357a5816ed7dbd041154b58635a37
  xe-pw-161506v1: 161506v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/index.html

--===============6455918166839624444==
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
<tr><td><b>Series:</b></td><td>drm/xe: Force EXEC_QUEUE_FLAG_KERNEL for kernel internal VMs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161506/">https://patchwork.freedesktop.org/series/161506/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37_FULL -&gt; xe-pw-161506v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161506v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161506v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161506v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_vblank@ts-continuation-dpms-rpm:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-lnl-8/igt@kms_vblank@ts-continuation-dpms-rpm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-2/igt@kms_vblank@ts-continuation-dpms-rpm.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37_FULL and xe-pw-161506v1_FULL:</p>
<h3>New IGT tests (493)</h3>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@128x128-left-edge:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.70, 8.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-bottom:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.78, 8.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-edge:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.79, 8.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.74, 8.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.72, 8.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.75, 8.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-left-edge:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.74, 8.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-right-edge:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-bottom:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-edge:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.31, 3.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@rgb565-untiled:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@rgb565-xtiled:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb2101010-untiled:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb8888-untiled:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb8888-xtiled:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@rgb565-untiled:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@rgb565-xtiled:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-untiled:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-xtiled:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@xrgb8888-untiled:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.32, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@xrgb8888-xtiled:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.38, 3.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render@rgb565-untiled:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render@rgb565-xtiled:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render@xrgb2101010-untiled:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render@xrgb2101010-xtiled:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render@xrgb8888-untiled:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.35, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render@xrgb8888-xtiled:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@d-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters@less-than-1-height-src:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters@less-than-1-width-src:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-106x106:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-121x121:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-136x136:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-151x151:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-166x166:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-16x16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-181x181:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-196x196:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-1x1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-211x211:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-226x226:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-241x241:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-271x271:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-286x286:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-301x301:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-316x316:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-31x31:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-331x331:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-346x346:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-361x361:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-376x376:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-391x391:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-406x406:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-421x421:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-436x436:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-451x451:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-466x466:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-46x46:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-481x481:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-496x496:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-511x511:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-61x61:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-76x76:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-system-vram01-91x91:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-106x106:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-121x121:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-136x136:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-151x151:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-166x166:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-16x16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-181x181:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-196x196:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-1x1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-211x211:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-226x226:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-241x241:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-271x271:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-286x286:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-301x301:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-316x316:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-31x31:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-331x331:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-346x346:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-361x361:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-376x376:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-391x391:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-406x406:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-421x421:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-436x436:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-451x451:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-466x466:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-46x46:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-481x481:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-496x496:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-511x511:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-61x61:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-76x76:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-system-91x91:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-106x106:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-121x121:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-136x136:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-151x151:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-166x166:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-16x16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-181x181:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-196x196:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-1x1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-211x211:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-226x226:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-241x241:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-271x271:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-286x286:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-301x301:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-316x316:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-31x31:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-331x331:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-346x346:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-361x361:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-376x376:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-391x391:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-406x406:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-421x421:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-436x436:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-451x451:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-466x466:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-46x46:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-481x481:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-496x496:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-511x511:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-61x61:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-76x76:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@linear-vram01-vram01-91x91:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-106x106:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-121x121:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-136x136:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-151x151:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-166x166:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-16x16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-181x181:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-196x196:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-1x1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-211x211:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-226x226:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-241x241:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-271x271:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-286x286:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-301x301:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-316x316:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-31x31:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-331x331:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-346x346:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-361x361:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-376x376:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-391x391:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-406x406:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-421x421:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-436x436:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-451x451:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-466x466:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-46x46:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-481x481:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-496x496:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-511x511:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-61x61:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-76x76:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-system-vram01-91x91:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-106x106:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-121x121:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-136x136:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-151x151:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-166x166:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-16x16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-181x181:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-196x196:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-1x1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-211x211:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-226x226:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-241x241:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-271x271:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-286x286:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-301x301:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-316x316:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-31x31:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-331x331:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-346x346:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-361x361:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-376x376:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-391x391:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-406x406:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-421x421:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-436x436:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-451x451:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-466x466:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-46x46:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-481x481:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-496x496:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-511x511:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-61x61:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-76x76:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-91x91:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-106x106:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-121x121:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-136x136:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-151x151:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-166x166:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-16x16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-181x181:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-196x196:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-1x1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-211x211:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-226x226:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-241x241:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-271x271:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-286x286:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-301x301:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-316x316:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-31x31:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-331x331:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-346x346:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-361x361:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-376x376:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-391x391:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-406x406:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-421x421:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-436x436:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-451x451:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-466x466:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-46x46:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-481x481:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-496x496:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-511x511:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-61x61:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-76x76:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-91x91:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-106x106:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-121x121:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-136x136:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-151x151:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-166x166:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-16x16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-181x181:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-196x196:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-1x1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-211x211:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-226x226:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-241x241:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-271x271:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-286x286:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-301x301:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-316x316:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-31x31:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-331x331:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-346x346:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-361x361:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-376x376:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-391x391:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-406x406:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-421x421:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-436x436:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-451x451:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-466x466:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-46x46:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-481x481:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-496x496:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-511x511:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-61x61:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-76x76:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-vram01-91x91:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-106x106:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-121x121:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-136x136:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-151x151:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-166x166:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-16x16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-181x181:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-196x196:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-1x1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-211x211:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-226x226:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-241x241:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-271x271:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-286x286:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-301x301:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-316x316:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-31x31:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-331x331:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-346x346:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-361x361:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-376x376:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-391x391:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-406x406:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-421x421:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-436x436:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-451x451:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-466x466:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-46x46:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-481x481:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-496x496:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-511x511:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-61x61:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-76x76:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-91x91:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-106x106:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-121x121:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-136x136:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-151x151:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-166x166:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-16x16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-181x181:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-196x196:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-1x1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-211x211:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-226x226:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-241x241:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-271x271:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-286x286:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-301x301:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-316x316:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-31x31:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-331x331:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-346x346:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-361x361:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-376x376:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-391x391:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-406x406:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-421x421:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-436x436:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-451x451:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-466x466:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-46x46:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-481x481:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-496x496:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-511x511:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-61x61:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-76x76:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-91x91:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-106x106:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-121x121:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-136x136:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-151x151:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-166x166:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-16x16:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-181x181:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-196x196:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-1x1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-211x211:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-226x226:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-241x241:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-271x271:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-286x286:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-301x301:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-316x316:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-31x31:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-331x331:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-346x346:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-361x361:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-376x376:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-391x391:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-406x406:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-421x421:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-436x436:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-451x451:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-466x466:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-46x46:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-481x481:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-496x496:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-511x511:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-61x61:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-76x76:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-system-91x91:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-106x106:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-121x121:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-136x136:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-151x151:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-166x166:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-16x16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-181x181:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-196x196:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-1x1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-211x211:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-226x226:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-241x241:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-271x271:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-286x286:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-301x301:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-316x316:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-31x31:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-331x331:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-346x346:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-361x361:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-376x376:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-391x391:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-406x406:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-421x421:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-436x436:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-451x451:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-466x466:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-46x46:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-481x481:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-496x496:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-511x511:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-61x61:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-76x76:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-system-vram01-91x91:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-106x106:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-121x121:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-136x136:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-151x151:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-166x166:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-16x16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-181x181:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-196x196:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-1x1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-211x211:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-226x226:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-241x241:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-271x271:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-286x286:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-301x301:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-316x316:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-31x31:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-331x331:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-346x346:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-361x361:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-376x376:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-391x391:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-406x406:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-421x421:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-436x436:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-451x451:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-466x466:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-46x46:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-481x481:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-496x496:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-511x511:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-61x61:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-76x76:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-system-91x91:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-106x106:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-121x121:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-136x136:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-151x151:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-166x166:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-16x16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-181x181:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-196x196:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-1x1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-211x211:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-226x226:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-241x241:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-271x271:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-286x286:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-301x301:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-316x316:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-31x31:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-331x331:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-346x346:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-361x361:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-376x376:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-391x391:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-406x406:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-421x421:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-436x436:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-451x451:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-466x466:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-46x46:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-481x481:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-496x496:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-511x511:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-61x61:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-76x76:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-91x91:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161506v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993">Intel XE#5993</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054">Intel XE#6054</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-10/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-4/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6973">Intel XE#6973</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-9/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-10/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-5/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-3/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-6/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-5/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-2/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131">Intel XE#7131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-2/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131">Intel XE#7131</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814">Intel XE#6814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-9/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-rotations:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-10/igt@kms_sharpness_filter@filter-rotations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-8/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-reconnect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-7/igt@xe_eudebug_online@interrupt-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-6/igt@xe_exec_basic@multigpu-once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-8/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7169">Intel XE#7169</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-cm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-2/igt@xe_module_load@force-load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7145">Intel XE#7145</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-9/igt@xe_module_load@force-load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7145">Intel XE#7145</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-8/igt@xe_multigpu_svm@mgpu-migration-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-6/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-2/igt@xe_pm@s2idle-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7169">Intel XE#7169</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-10/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-5/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-8/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-6/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-2/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-up:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-6/igt@xe_sriov_vram@vf-access-after-resize-up.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-provisioned:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-6/igt@xe_sriov_vram@vf-access-provisioned.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376">Intel XE#6376</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-lnl-1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-5/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-7/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-5/igt@kms_setmode@basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-lnl-6/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-6/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-9/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-7/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html">PASS</a> +93 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge.html">PASS</a> +123 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-dontunmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-dontunmap.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-dontunmap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-6/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-4/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@aspm_link_residency:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-5/igt@xe_pm_residency@aspm_link_residency.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@xe_pm_residency@aspm_link_residency.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-7/igt@xe_sriov_auto_provisioning@selfconfig-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-6/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/shard-bmg-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161506v1/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8749 -&gt; IGT_8751</li>
<li>Linux: xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37 -&gt; xe-pw-161506v1</li>
</ul>
<p>IGT_8749: 195f101f25a7984686f36f340aa88d44a1716ec6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8751: af788251f1ef729d17c802aec2c4547b52059e58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37: 2938ce73d01357a5816ed7dbd041154b58635a37<br />
  xe-pw-161506v1: 161506v1</p>

</body>
</html>

--===============6455918166839624444==--
