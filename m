Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C712C87FCA
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 13:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB0110E336;
	Thu, 24 Jul 2025 13:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="U8sKOyck";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677AF10E285
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 13:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=enK6iIj/aLqPq4En2wZny6hcUpryijADqyHRJsG7k7I=; b=U8sKOyckJ3Tf9Y/diqhZ0DBhm6
 YSsX/6h13d9OjzkPGgW7Rz+LzfDONxAaYkcU1VVKeNb12AEvL/9UXsLzGJrCqaIFiz+MsbQsAT3jV
 Idu4+pY3Y35nCxWeA5ZFpvJyFLS90B5XopAuHYCxQ+mJjMCx/DuW4gXXWTjcEZ89A5V0UPL/rdU/S
 Fwlc8koWmnOzteadFr/OVLKR7sB0oFAIMZ9bWWiD0m8dU/gtR1w+9bVU39BopX8na9rB5cZHrMerW
 KMDYY+2j5hq2s/Y0Kcp00YTfxis3KFUfDACvK54xaBsSouci3NSWgctSVCFENZCPY0q7l8MdLo/D9
 UGU7bQtQ==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uevot-003CIp-Nz
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 15:17:11 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 00/13] adl auxcss ci run
Date: Thu, 24 Jul 2025 14:16:57 +0100
Message-ID: <20250724131711.74291-1-tvrtko.ursulin@igalia.com>
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

Checking if the latest AuxCCS work fares any better.. (on BMG!)

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
 10 files changed, 336 insertions(+), 120 deletions(-)

-- 
2.48.0

