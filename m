Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CD8CD5BAC
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 14:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEAD10F36F;
	Thu, 21 May 2026 14:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUAE0qlU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBE510F36F
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 14:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779374948; x=1810910948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gRupezAzEX8x9vdh7+uED7/KXkKE6ROWvUgRYrRboEA=;
 b=lUAE0qlUKtYEPQDxySV5EHh8Iso0bORIOBCCP8U2g2MHelOi/pta6Cxe
 dSfkwqnTlcNCPy2R78Zp4npbP4n7I2h3KBWEVyUJa9w0r6vYi01GMOBYL
 SybNiBKmaYPSKZtSx//9SOf13ZMth4eK3cxkwjC5OxLnQGBQ11wHTrFT/
 WGnIdORRtaxD1poHbJq7833wlUtLgjOFImB0ksGWa6G80w7ZVELXjSXmw
 MWG8kNCSqPQ05QPN6XTYznLmvufv05m5czyewvUwh9hbBTKyXrf2meorh
 kHTxRFGEb5HH+5qhyQkKXuXtTYtsDg9pL29SANCcZFvHNTH0DkSWnxy4v A==;
X-CSE-ConnectionGUID: UUp4LPD/RJSidKe5zPRrxw==
X-CSE-MsgGUID: jqpFPLCgSeyl6/FgYWsRoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80194435"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="80194435"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:49:07 -0700
X-CSE-ConnectionGUID: ujLuT2sOR9KPwDIhWMl8lw==
X-CSE-MsgGUID: o6HKg4O1S2WN2zraMMZJ5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="270893337"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fedora)
 ([10.245.244.105])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:49:05 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 3/4] drm/xe: Restore userspace LRC BOs early on resume
Date: Thu, 21 May 2026 16:48:36 +0200
Message-ID: <20260521144837.7363-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521144837.7363-1-thomas.hellstrom@linux.intel.com>
References: <20260521144837.7363-1-thomas.hellstrom@linux.intel.com>
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

When GuC registers a context (REGISTER_CONTEXT G2H action), the LRC
buffer object must already be present in VRAM with valid content.
Userspace LRC BOs currently carry XE_BO_FLAG_PINNED_LATE_RESTORE, which
defers their restore to xe_bo_restore_late() — a blitter copy that runs
after xe_gt_resume().  However, xe_gt_resume() itself calls
xe_guc_submit_start(), which drives guc_exec_queue_start() ->
xe_sched_resubmit_jobs() -> guc_exec_queue_run_job() ->
register_exec_queue(), all before xe_bo_restore_late() has had a chance
to repopulate the BO.  The result is that GuC reads LRC state from
uninitialised VRAM and raises an exception.

Fix this by dropping XE_BO_FLAG_PINNED_LATE_RESTORE from the userspace
LRC BO flags.  Without that flag, the BO lands in the
pinned.early.kernel_bo_present list and is restored by
xe_bo_restore_early() via CPU/BAR copy before xe_gt_resume() is entered.
By the time any context registration fires the LRC VRAM is valid.

xe_bo_create_pin_map_novm() already adds XE_BO_FLAG_NEEDS_CPU_ACCESS and
XE_BO_FLAG_PINNED, satisfying the requirements of the CPU copy path.
Dropping XE_BO_FLAG_PINNED_LATE_RESTORE also makes force_contiguous()
return true for these BOs (PINNED without LATE_RESTORE), which is already
required for the GGTT mapping they carry.

Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index a4292a11391d..c9ea5a3e5365 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1661,7 +1661,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
 		   XE_BO_FLAG_GGTT_INVALIDATE;
 
 	if ((vm && vm->xef) || init_flags & XE_LRC_CREATE_USER_CTX) /* userspace */
-		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
+		bo_flags |= XE_BO_FLAG_FORCE_USER_VRAM;
 
 	bo = xe_bo_create_pin_map_novm(xe, tile, bo_size,
 				       ttm_bo_type_kernel,
-- 
2.54.0

