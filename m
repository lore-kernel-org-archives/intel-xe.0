Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBAACA0EED
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 08:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D621310E344;
	Tue, 19 Aug 2025 08:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qmbxptoN";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605DC10E344
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 08:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q9W4+Tp8XnWKgo/jQ6NSDYNUEwzuzt7JhRWAwtrpxs8=; b=qmbxptoN2EBbuSD8Lvz+dqeTJc
 I0rnuQWuuByu1j3mvpQgpbI35SVoP2j9WGHn6nELL0orQPdeAqWABzPkdIOW686R8BR2rLWm/ZO27
 2JpfNNgtTDIvpzz7znV8RC2qKWlohCXg0x+6wuWss5W27kmgRs2//UeNK9CaNIPHTLVLolWV5Cyyt
 CkRDzcA9fELLh2TAdZcK5CVB1QJ2wEeu+Le8GBdbps20fJmNn+kUcB4a32Wie2XExG/Xr2IrI7Zly
 G2J4HX5oFThr5yy0iYELRpd5hsVbbY2VlvjQNccNJuFsf9YXjFYw5YDAqsyhNkllcLDfGj1yxMN8p
 m5m9+ZPA==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uoI82-00GD6r-LN
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 10:55:38 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 00/13] auxccs late flush
Date: Tue, 19 Aug 2025 09:55:21 +0100
Message-ID: <20250819085537.97902-1-tvrtko.ursulin@igalia.com>
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

i915 sets up the async flush which triggers when the atomic commit waits
on the fences. That is later than straight after the pin so lets try
that since we are desperate...

Tvrtko Ursulin (13):
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
  late flush
  drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe

 drivers/gpu/drm/i915/display/intel_display.c  |  15 +-
 .../drm/i915/display/skl_universal_plane.c    |   6 -
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   5 +
 .../compat-i915-headers/gem/i915_gem_object.h |   2 +
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 183 +++++++++++++++---
 .../gpu/drm/xe/instructions/xe_gpu_commands.h |   1 +
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   1 +
 drivers/gpu/drm/xe/xe_bo_types.h              |  14 +-
 drivers/gpu/drm/xe/xe_lrc.c                   |  47 +++++
 drivers/gpu/drm/xe/xe_ring_ops.c              | 161 +++++++--------
 drivers/gpu/drm/xe/xe_ring_ops.h              |   3 +
 drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
 13 files changed, 328 insertions(+), 118 deletions(-)

-- 
2.48.0

