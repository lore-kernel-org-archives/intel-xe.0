Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C13DC3ABD9
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 13:39:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612E210E638;
	Wed, 14 May 2025 13:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="L65KvjHF";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75BF10E638
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 13:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3LBpiqqU7ozJRuH9N6yDfUXC17TAaoxAVXQUfxQ5M4s=; b=L65KvjHFiPU66/sy9yzgbHiSoX
 BzP5Iv8imrXY3Ns0YZunN0SxhhGQ22OJmOax6i3cX5i+rT6r4L4/RsNy/Ttdl08UZ/NfWUUiWTxR2
 eJwIbXAfmnw9XQ+qQsCNj+rnVtGwq7YKsee4Yh6DDeonOLynAIAvaFnest9sA796YwupkGs4hKvdp
 pz/SXOgMWwK4Vqtbuy7fEAeUj4oeDMtlqlJGFlOsCByIMqtj7GkSM4+qaHLUGay0Iz00flX5zBjDX
 ZRrrfEg8+0f9qYgoArJ5A73UOvMCZHUFSo6K7VrKv+0WROnw077k261cKbRUc6rVgywZs0X/rBroU
 K2ctDLzw==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uFCEc-008AYr-Pl; Wed, 14 May 2025 15:39:08 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v6 00/19] AuxCCS handling and render compression modifiers
Date: Wed, 14 May 2025 14:38:42 +0100
Message-ID: <20250514133904.12131-1-tvrtko.ursulin@igalia.com>
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

Tvrtko Ursulin (19):
  drm/xe: Clarify LRC size when allocating
  drm/xe/xelp: Implement HSDES#16010904313 workarounds
  drm/xe/xelp: Add Wa_1607983814
  drm/xe: Use emit_flush_imm_ggtt helper instead of open coding
  drm/xe/xelpg: Flush CCS when flushing caches
  drm/xe: Flush L3 when flushing render cache
  drm/xe/xelp: Quiesce memory traffic before invalidating auxccs
  drm/xe/xelp: Support auxccs invalidation on blitter
  drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
  drm/xe/xelp: Wait for AuxCCS invalidation to complete
  drm/xe/xelp: Add AuxCCS invalidation to the buffer migration path
  drm/xe: Export xe_emit_aux_table_inv
  drm/xe/xelp: Add AuxCCS invalidation to the indirect context
    workarounds
  drm/xe: Use fb cached min alignment
  drm/xe: Flush GGTT writes after populating DPT
  drm/xe: Handle DPT in system memory
  drm/xe: Force flush system memory AuxCCS framebuffers before scan out
  drm/xe/display: Add support for AuxCCS
  drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe

 .../drm/i915/display/skl_universal_plane.c    |   6 -
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 179 ++++++++++++---
 .../gpu/drm/xe/instructions/xe_gpu_commands.h |   2 +
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   4 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   1 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   7 +
 drivers/gpu/drm/xe/xe_bo_types.h              |  14 +-
 drivers/gpu/drm/xe/xe_lrc.c                   | 152 ++++++++++++-
 drivers/gpu/drm/xe/xe_lrc_types.h             |   5 +-
 drivers/gpu/drm/xe/xe_ring_ops.c              | 206 ++++++++++--------
 drivers/gpu/drm/xe/xe_ring_ops.h              |   3 +
 drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules            |   1 +
 14 files changed, 445 insertions(+), 143 deletions(-)

-- 
2.48.0

