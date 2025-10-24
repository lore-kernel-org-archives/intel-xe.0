Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4E5CCF9E3
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 10:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1824B10EA29;
	Fri, 24 Oct 2025 10:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="m7M8cdbR";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28CF10E8FF
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 10:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZPB0AZ6RCe0oCQo9OLaHa/fn8m2uR+q6QTBfFj/1UKY=; b=m7M8cdbRlpPiCFLCbC+rdMltjN
 WtMM9kyPNYLsu/vr8YmU/e//hN8gbMKa7oEFBSZeueKXXWvjzP+ELhCA6t4kxkz5WCWN0GkSMK1G5
 s0qwMVEleiKqNQMJ+c993J3vZPxmPFL9CBB8ORqfQafSrBWdNQ5lw6w+yN5awIIiC4JKhDUvujgBb
 9YUE2JTY4PuscTbfHurVzHzh69XaM69R6i89/E1GwLgvpW8Zj2HrKbmFH286xr8J+FSJt9ULU4GAB
 Y3xzBOaHOtroappTndvJQ46mm9Wo/u8slhsaRAMISEPduePELXqKJux16iSogOEb2n+5lbp9Oca/8
 /x4+LdLQ==;
Received: from [90.242.12.242] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vCFKU-00EicK-3F; Fri, 24 Oct 2025 12:47:30 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v14 00/13] AuxCCS handling and render compression modifiers
Date: Fri, 24 Oct 2025 11:47:13 +0100
Message-ID: <20251024104727.74886-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

A series to fix and add xe support for AuxCSS framebuffers via DPT.

Currently the auxiliary buffer data isn't mapped into the page tables at all so
cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
had to disable the support.

On top of that there are missing flushes, invalidations and similar.

Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:

  [PLANE:32:plane 1A]: type=PRI
          uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
          hw: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=yes, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)

Display working fine - no artefacts, no DMAR/PIPE faults.

All IGTs pass for me locally.

v2:
 * More patches added to fix kms_flip_tiling.

v3:
 * Rebased after some cleanup patches from v2 were merged.
 * Added people to Cc as suggested by Rodrigo.
 * Adjusted last patch title. (Rodrigo)
 * Apply GGTT flushing only to iomapped system memory buffers.

v4:
 * Added patch for potentially misplaced Wa_14016712196.
 * Fixed (hopefully) MAX_JOB_SIZE_DW on Meteorlake.

v5:
 * Split out ring emission changes to smaller patches.
 * Fixed MAX_JOB_SIZE_DW even more.
 * Don't emit MI_FLUSH_DW_CCS on !BCS. This should fix Meteorlake.

 v6:
 * Added AuxCCS invalidation to indirect context workarounds.
 * Also added the indirect context handling and some other workarounds. They are
   unrelated but the series depends on it.
 * Dropped DPT pin alignment reduction since BMG appears not to be liking it for
   some reason.

v7:
 * Rebased on top of recent xe_fb_pin.c refactoring and also the indirect
   context workarounds series.

v8:
 * Rebased for bo->size removal.
 * Corrected PIPE_CONTROL_FLUSH_L3 to bit 30. (Jose)

v9:
 * Fixed fb remapping changes.
 * Dropped two not required patches from the series.
 * Fixed criteria for GGTT flushing.
 * Limit clflush to the compression metadata area.
 * Rebased for indirect context workarounds landing upstream.

v10:
 * Rebase for XE_GT_WA().

v11:
 * Do not use stolen for DPT on IGFX + AuxCCS.

v12:
 * Rebased for some ringbuf and LRC code changes.

v13:
 * Rebased for various upstream changes.
 * Dropped clflush and stolen avoidance patches after merging IGT MOCS 61 usage.

 v14:
 * MMIO 0x4248 and MI_FLUSH_DW_CCS are MTL+. (Matt)
 * Consolidate engine feature checks. (Ville)
 * Brought back the patch to put DPT tables in system memory for 100% CI pass
   rate. It looks like MOCS 61 is not enough to avoid sporadic pipecrc
   mismatches.

Tvrtko Ursulin (13):
  drm/xe: Fix ggtt fb alignment
  drm/xe/xelpg: Flush CCS when flushing caches
  drm/xe/xelp: Quiesce memory traffic before invalidating AuxCCS
  drm/xe/xelp: Support auxccs invalidation on blitter
  drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
  drm/xe/xelp: Wait for AuxCCS invalidation to complete
  drm/xe: Export xe_emit_aux_table_inv
  drm/xe/xelp: Add AuxCCS invalidation to the indirect context
    workarounds
  drm/xe: Flush GGTT writes after populating DPT
  drm/xe: Handle DPT in system memory
  drm/xe: Do not use stolen memory for DPT on IGFX and AuxCCS
  drm/xe/display: Add support for AuxCCS
  drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe

 .../drm/i915/display/skl_universal_plane.c    |   6 -
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 177 ++++++++++++++---
 .../gpu/drm/xe/instructions/xe_gpu_commands.h |   1 +
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   1 +
 drivers/gpu/drm/xe/xe_hw_engine.h             |  27 +++
 drivers/gpu/drm/xe/xe_lrc.c                   |  27 +++
 drivers/gpu/drm/xe/xe_ring_ops.c              | 183 +++++++++---------
 drivers/gpu/drm/xe/xe_ring_ops.h              |   3 +
 drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
 10 files changed, 299 insertions(+), 134 deletions(-)

-- 
2.48.0

