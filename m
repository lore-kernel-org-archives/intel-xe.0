Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ECBC0015E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 15:06:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872FD10E6FC;
	Thu, 13 Jul 2023 15:06:35 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DAE10E6F8
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 15:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689260793; x=1720796793;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YrLIFIU7Y/gBDZ5pqg3LAf8IT/xB3w3B85s44kZLMcY=;
 b=mlASOPCkz3mur7+iqprtEYvaKIuygCPVWdzclxMgd+NQk2lib9tWcOJt
 xFlT9AdxPvwWgbqwsofP3GhLvhN1mD608cW+CWvzVZVsEqaCQYh4e+K0m
 9fhVjRM2FWrANVTSmB3JJ8x371GamXonwNAjSZbus+zlY4KQx3uU/MVZZ
 w+HeiX9e0dNa331MO4HG7b0OLUY+3Tu82p5oelu6BuOuHVRky4477b/ew
 C908ngWQm1br3XyDMiZi2MVBxlpCi/QN+VBgP1MglhavqSMaR4GHuv3zt
 H+AejCUNU4bNdeB543RkTzri+8ZBwTdA1/xx9ARqj7cPovQ2I9eOdIbps g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="367856906"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="367856906"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:06:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="699285538"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="699285538"
Received: from ineznano-mobl1.ger.corp.intel.com (HELO 8817c471bfcd.intel.com)
 ([10.251.221.219])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:06:31 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 15:06:07 +0000
Message-Id: <20230713150611.7-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230713150611.7-1-francois.dugast@intel.com>
References: <20230713150611.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/7] drm/xe: Cleanup POINTER_LOCATION style issues
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove all existing style issues of type POINTER_LOCATION reported
by checkpatch.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h | 2 +-
 drivers/gpu/drm/xe/xe_lrc.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 5c827beaea28..a64828bc6ad2 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -132,7 +132,7 @@ static inline void xe_device_guc_submission_disable(struct xe_device *xe)
 	for ((id__) = 0; (id__) < (xe__)->info.gt_count; (id__)++) \
 		for_each_if((gt__) = xe_device_get_gt((xe__), (id__)))
 
-static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
+static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 {
 	return &gt->mmio.fw;
 }
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 8f25a38f36a5..ddb1b1d6d00d 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -441,7 +441,7 @@ static const u8 *reg_offsets(struct xe_device *xe, enum xe_engine_class class)
 	}
 }
 
-static void set_context_control(u32 * regs, struct xe_hw_engine *hwe)
+static void set_context_control(u32 *regs, struct xe_hw_engine *hwe)
 {
 	regs[CTX_CONTEXT_CONTROL] = _MASKED_BIT_ENABLE(CTX_CTRL_INHIBIT_SYN_CTX_SWITCH) |
 				    _MASKED_BIT_DISABLE(CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT) |
-- 
2.34.1

