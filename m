Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7060FD3B7EA
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 19:17:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C77A10E0E6;
	Mon,  8 Dec 2025 19:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="lPBEjouS";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B1110E0E6
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 19:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=32/gvDFmVjYWpClRPQv/F+R7g6+RfFkq6kf8iwX5v9I=; b=lPBEjouSS0BoDusTCmi6bggPVw
 3+9/wlqCL/J3/dkfH074iNVph8S9s/uHmbauwQwkEb0feMKhwySTqgwJnlSUOOMONo5CIHtrbEMfq
 ksIgtRTRlmxouzDq5bvhhCcamx6RV+AcVtJFxHO4lXTVROHS+wrp4Y/sP1jLzlAlaXMmZ4aeqN+Gx
 6VWuEYtUNztixYSexe5D5Yp7xDUXA9mTvmzcJGk5jWnZPtjBsLyUrn0eqXQ3qHQwPzIBVlklDwdn3
 PrHHuwMuygnOl9FIrzod+BivvQAlmvUosMAh8XaWsRLP6ceslhvXNaFM+Ps5Sfhb6hf18jFqr1w5/
 Iy21cHwQ==;
Received: from [86.33.28.86] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vSgje-00AC6s-KJ; Mon, 08 Dec 2025 20:17:26 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v15 00/10] AuxCCS handling and render compression modifiers
Date: Mon,  8 Dec 2025 20:17:11 +0100
Message-ID: <20251208191722.7194-1-tursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

A series to add support for compressed surface scanout under xe with
Alderlake-P.

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

v15:
 * Limited to enabling on Alderlake-P only. (Dropped all Meteorlake patches.)
 * Dropped unrelated GGTT alignment fix. (Sent standalone.)
 * Use display parent interface for probing AuxCCS driver support.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Tvrtko Ursulin (10):
  drm/xe/xelpg: Limit AuxCCS ring buffer programming to Alderlake
  drm/xe/xelp: Quiesce memory traffic before invalidating AuxCCS
  drm/xe/xelp: Wait for AuxCCS invalidation to complete
  drm/xe: Export xe_emit_aux_table_inv
  drm/xe/xelp: Add AuxCCS invalidation to the indirect context
    workarounds
  drm/xe: Handle DPT in system memory
  drm/xe: Do not use stolen memory for DPT on IGFX and AuxCCS
  drm/xe/display: Add support for AuxCCS
  drm/i915/display: Detect AuxCCS support via display parent interface
  drm/xe/xelp: Expose AuxCCS frame buffer modifiers on Alderlake-P

 .../drm/i915/display/intel_display_device.h   |   1 -
 drivers/gpu/drm/i915/display/intel_fb.c       |   3 +-
 drivers/gpu/drm/i915/display/intel_parent.c   |   5 +
 drivers/gpu/drm/i915/display/intel_parent.h   |   2 +
 .../drm/i915/display/skl_universal_plane.c    |   9 +-
 drivers/gpu/drm/i915/i915_driver.c            |  10 ++
 drivers/gpu/drm/xe/display/xe_display.c       |   8 ++
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 131 +++++++++++++-----
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
 drivers/gpu/drm/xe/xe_hw_engine.h             |  24 ++++
 drivers/gpu/drm/xe/xe_lrc.c                   |  27 ++++
 drivers/gpu/drm/xe/xe_ring_ops.c              |  84 +++++++----
 drivers/gpu/drm/xe/xe_ring_ops.h              |   3 +
 drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
 include/drm/intel/display_parent_interface.h  |   3 +
 15 files changed, 247 insertions(+), 71 deletions(-)

-- 
2.52.0

