Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10008D73EA7
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 23:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C406C10E322;
	Thu, 29 Jan 2026 23:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bIrwGDq9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3E610E22E
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 23:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769730103; x=1801266103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HzZk/L5XgEuB5jLr82BBQ2z87Tyv5AqPhbQaNySmcg8=;
 b=bIrwGDq9W/w2yTO55+s7d1lnG5dy+Q7Gn4nnd6VJ1hvFxhA5y65cnfmh
 4uNaqrq3kzkzUZqL5WbMItI5OUpAO9bqz1Zm8TFCZu5JX3JJAsFrRgp08
 L/yESP5FhOBXS2x7vtItOl5oYmbN88P/hPqXQ70ssv9IvJ4p5HyEreac1
 WvyJpQap+aeA5mnQImzJ3skq5j6mWKzytS+R4kq50LvuDqsi9eb8Mhf8I
 07SSUa8vqBM8Z4Y8CT+3yG0K9iBviBcyh36koYyZZZKATO80wVS8k5IHs
 v/0YZX9kGZkpfdKH756orAU/fOBLKp8ND8m76r2F4QKfSx7K2/piVRq7c A==;
X-CSE-ConnectionGUID: ed3usXZeTQCgU2RfEnhHZQ==
X-CSE-MsgGUID: AayxliwdSi+yxqxNu03atw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="58560071"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="58560071"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:41:43 -0800
X-CSE-ConnectionGUID: 2LSBEPIFTJeawXYZj8H5ug==
X-CSE-MsgGUID: Roa4HalIRJW5jEXWbLFwXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="213201743"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2026 15:41:43 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 2/3] drm/xe: Fix kerneldoc for xe_gt_tlb_inval_init_early
Date: Thu, 29 Jan 2026 23:38:37 +0000
Message-ID: <20260129233834.419977-7-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260129233834.419977-5-shuicheng.lin@intel.com>
References: <20260129233834.419977-5-shuicheng.lin@intel.com>
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

Correct the function name in the kerneldoc.
It is for below warning:
"Warning: drivers/gpu/drm/xe/xe_tlb_inval.c:136 expecting prototype for
xe_gt_tlb_inval_init(). Prototype was for xe_gt_tlb_inval_init_early()
instead"

v2: add () for the function. (Michal)

Fixes: db16f9d90c1d9 ("drm/xe: Split TLB invalidation code in frontend and backend")
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 989fe0e7f8ee..933f30fb617d 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -125,7 +125,7 @@ static void primelockdep(struct xe_tlb_inval *tlb_inval)
 }
 
 /**
- * xe_gt_tlb_inval_init - Initialize TLB invalidation state
+ * xe_gt_tlb_inval_init_early() - Initialize TLB invalidation state
  * @gt: GT structure
  *
  * Initialize TLB invalidation state, purely software initialization, should
-- 
2.50.1

