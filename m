Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BEFC87FC5
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 10:27:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D53910E7A4;
	Wed, 23 Jul 2025 10:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PDG8Rb5y";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A39A10E7A3
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 10:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bma9z3Jcr48xqGBFuYcxFkaOebGPmPxIFdx+z1F9hUg=; b=PDG8Rb5yM6EydAspBWVZb9UXX0
 PFx2MsHLacxvmFcnmsMvHoUqogjrt/cQ/+4wQWHNei42R8zZMoD+Nxe5O8jCv2Bauu8m+jCwzboQB
 l6wNRs+ZQQV73KmEtg0qH8/12wkId6ibZ5+LmJvafcbMyw5rWIQsC1FnC6Vts+I92bT+UeDbG41Lg
 Oau87o/+TnoNv+FNamaHEdA97jnE2eg65exVpt681sS01DeOytplqP0gb6chwpeevOWo3P3gV1fcu
 L21m6t9bPItUXZ3H8KBDJp2wBidigTjzR+jEjsDndcms49zep5ZSORO9231KDd73aysxZfK9aEFgj
 h5Qtv0fQ==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ueWhI-002XyE-Bs
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 12:27:40 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 00/14] adl auxcss ci run
Date: Wed, 23 Jul 2025 11:27:22 +0100
Message-ID: <20250723102739.50425-1-tvrtko.ursulin@igalia.com>
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

Checking if the latest AuxCCS work fares any better..

Aakash Deep Sarkar (1):
  drm/i915/display: Fix dma_fence_wait_timeout() return value handling

Tvrtko Ursulin (13):
  drm/xe: Use emit_flush_imm_ggtt helper instead of open coding
  drm/xe/xelpg: Flush CCS when flushing caches
  drm/xe/xelp: Quiesce memory traffic before invalidating auxccs
  drm/xe/xelp: Support auxccs invalidation on blitter
  drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
  drm/xe/xelp: Wait for AuxCCS invalidation to complete
  drm/xe: Export xe_emit_aux_table_inv
  drm/xe/xelp: Add AuxCCS invalidation to the indirect context
    workarounds
  drm/xe: Flush GGTT writes after populating DPT
  drm/xe: Handle DPT in system memory
  drm/xe/display: Add support for AuxCCS
  drm/xe: Force flush system memory AuxCCS data before scan out
  drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe

 drivers/gpu/drm/i915/display/intel_display.c  |   3 +-
 .../drm/i915/display/skl_universal_plane.c    |   6 -
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 207 +++++++++++++++---
 .../gpu/drm/xe/instructions/xe_gpu_commands.h |   1 +
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   1 +
 drivers/gpu/drm/xe/xe_bo_types.h              |  14 +-
 drivers/gpu/drm/xe/xe_lrc.c                   |  47 ++++
 drivers/gpu/drm/xe/xe_ring_ops.c              | 169 +++++++-------
 drivers/gpu/drm/xe/xe_ring_ops.h              |   3 +
 drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
 11 files changed, 338 insertions(+), 121 deletions(-)

-- 
2.48.0

