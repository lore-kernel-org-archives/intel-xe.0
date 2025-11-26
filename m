Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9114CD111B7
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 23:02:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBC910E727;
	Wed, 26 Nov 2025 23:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCtiivu4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E36210E71A
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 23:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764198128; x=1795734128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ml0mNsY+F5j1YWd1Zu9NSRiwa+Pzg8zyiut7e3rzW+Q=;
 b=DCtiivu4smVwH7Kn0vKkl+CP4yO396gD0OIyn2BUDUGw/f70ELAEuHcT
 esc1MqihqJy2AbIESfBysWkncWKSVJ7JIaITRit/FNsmUteCvttyKhYQJ
 OeTWeSb2R+MjBbG8gFFmzlTDmQ6qzWyWn7T0kWTqBgpP/Qi8Cf6aCmmcj
 ZBVgjz9z/N7YPydR+QURBwnH7PoH8jn8TW17aCJZFdMhzRXyZ6sQaIpiR
 SY3sECEs31mcCq6I7upsshAYHGAOi+OmYSUGckDicCrXz9Wimd5zCxmpM
 GmwVZA/pjkqXxjF2F0OT4GfKIafLeJbD3FFV8O/Kxwi+2eQkEW4gnoAsW Q==;
X-CSE-ConnectionGUID: mz/YGhbFTn6TnzngkcR3OQ==
X-CSE-MsgGUID: Igy6tec7TQS2WVG0e60cOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66284500"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="66284500"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 15:02:07 -0800
X-CSE-ConnectionGUID: mBAfW9frSxSPmj81UnQGGg==
X-CSE-MsgGUID: fWP8zqHVSVKyOcq0rHM7yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="224028482"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2025 15:02:06 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com
Subject: [PATCH v2 01/11] [DO, NOT,
 REVIEW] drm/xe: Do not forward invalid TLB invalidation seqnos to
 upper layers
Date: Thu, 27 Nov 2025 07:02:02 +0800
Message-ID: <20251126230201.3782788-14-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251126230201.3782788-13-brian3.nguyen@intel.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
MIME-Version: 1.0
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

From: Matthew Brost <matthew.brost@intel.com>

This is a dependent patch for the page reclamation patch series
taken from another patch series by Matthew Brost, currently under
review: https://patchwork.freedesktop.org/series/156874/

Page reclamation takes the same idea of using invalid seqno to indicate
the initial H2G actions of the in progress tlb invalidation.

Review and comments for this patch should be done in the original patch
series.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 3 ++-
 drivers/gpu/drm/xe/xe_tlb_inval_types.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 848d3493df10..f10ecfb49735 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -234,7 +234,8 @@ int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(len != 1))
 		return -EPROTO;
 
-	xe_tlb_inval_done_handler(&gt->tlb_inval, msg[0]);
+	if (msg[0] != TLB_INVALIDATION_SEQNO_INVALID)
+		xe_tlb_inval_done_handler(&gt->tlb_inval, msg[0]);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
index 8f8b060e9005..7a6967ce3b76 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
@@ -80,6 +80,7 @@ struct xe_tlb_inval {
 	const struct xe_tlb_inval_ops *ops;
 	/** @tlb_inval.seqno: TLB invalidation seqno, protected by CT lock */
 #define TLB_INVALIDATION_SEQNO_MAX	0x100000
+#define TLB_INVALIDATION_SEQNO_INVALID	TLB_INVALIDATION_SEQNO_MAX
 	int seqno;
 	/** @tlb_invalidation.seqno_lock: protects @tlb_invalidation.seqno */
 	struct mutex seqno_lock;
-- 
2.52.0

