Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEE3C83F22
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 20:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F2610E95F;
	Thu, 10 Jul 2025 20:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VryVbmRn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B741310E952
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 20:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752179725; x=1783715725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=beLt9o37iAOeDiYDFecAxL/bSX1L1j50AIccPUd43DA=;
 b=VryVbmRnRxeqQqJcozgMxDAtdMBWt24AyDZA+0QS4ji82dxCHLYN1C94
 sWlmG0UaUf/fSjcAEmks+uH0rwGfz7XrIl3QqhvpHgxS0v5q3F/hPQEeG
 UO8pmhs72Yrina0afYqJF2McH49hWMo1DoEIZbIL6hjRJZX23QKwE3NzP
 04mmGe/xhhAfXtQbbuv/6KL3G52FfuL/s28UVnJWKylva7d6nftec2pM+
 FMg8rIIrY+DuEpGtW9tmDGcNjrXaQggsYlrpaBrUK35EeV9a5NP06qRl6
 zmU6Zicz0g3PMDeHQJ1b6VjJ/3WjK8+VrQ/7SXxjqXa52mYdonoqDdiaE w==;
X-CSE-ConnectionGUID: 040L2bmbSwm3bwxF3KCwcA==
X-CSE-MsgGUID: dssFcNYhRSeci8K9mDveEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="79908479"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="79908479"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:35:25 -0700
X-CSE-ConnectionGUID: 1yQ3CZgbSsyqygfEBK24wg==
X-CSE-MsgGUID: K4msZNz7SGeNaVya1fj6Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156744257"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:35:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 5/7] drm/xe/lrc: Remove leftover TODO/FIXME
Date: Thu, 10 Jul 2025 13:33:50 -0700
Message-ID: <20250710-lrc-refactors-v2-5-a5e2ca03f6bd@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710-lrc-refactors-v2-0-a5e2ca03f6bd@intel.com>
References: <20250710-lrc-refactors-v2-0-a5e2ca03f6bd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-858c0
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

There isn't anything to set for CTX_TIMESTAMP handling in the empty
LRC: that is set on every LRC init since it should always start from 0
rather than the value saved in the image after first submission.

The FIXME about perma-pinning also doesn't make much sense as we will
always going to pin the lrc and the GGTT mapping has nothing to do with
VM bind.

Nuke these leftover comments.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: Also drop the FIXME (Matthew Brost)
---
 drivers/gpu/drm/xe/xe_lrc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 75f4678cb090a..8b240144829e9 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -603,8 +603,6 @@ static void set_context_control(u32 *regs, struct xe_hw_engine *hwe)
 	if (xe_gt_has_indirect_ring_state(hwe->gt))
 		regs[CTX_CONTEXT_CONTROL] |=
 			_MASKED_BIT_ENABLE(CTX_CTRL_INDIRECT_RING_STATE_ENABLE);
-
-	/* TODO: Timestamp */
 }
 
 static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
@@ -1083,10 +1081,6 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (vm && vm->xef) /* userspace */
 		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
 
-	/*
-	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
-	 * via VM bind calls.
-	 */
 	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, bo_size,
 				       ttm_bo_type_kernel,
 				       bo_flags);

-- 
2.49.0

