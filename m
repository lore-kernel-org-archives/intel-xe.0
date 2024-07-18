Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15521C3DA61
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 20:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B1F10EB0B;
	Thu, 18 Jul 2024 20:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PFSZA+vf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA8110EB0B
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 20:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721334729; x=1752870729;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F4Lw2WKTYc2T1IaNGcAtLwVLRQ5hZOJnFVmY2OZrZTE=;
 b=PFSZA+vf0zJFCfyd/UErVv2krE2C+TLV6hOylhzVSORLDvdwLvRvEdgO
 MTNoMUtwiHinyma6Tbx/TFeC2SkbZJyoKDX/dehqQFIO5LZJ1tq+US9X3
 +OU8SgxQA9Z8ZLqKAHWuEy+RGiJNlAp/inLJWqUtBhQ2aPtWroR+A/S6o
 GLeaClWyRKXorDWYG1y0cIY2zcwgkVVZ4nR6tQ6S0UwlD5Ovw/iVeS+8C
 FljNUoakQVg+UERTRxh87I2G0UOE1ckJCAy+d9Ai5SgQbR1VXIuYAcqMl
 zkyZ6qyZrU5R9sqXYJIK/1IqQ23xKFRUEZT0fe0Ic7zFP/hEMQqmyBlgI g==;
X-CSE-ConnectionGUID: nXTrKpqZQpuVMQLdhcQy6Q==
X-CSE-MsgGUID: KWYaD7LcQ2qR+KHHHOEerQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="44347746"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="44347746"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 13:32:09 -0700
X-CSE-ConnectionGUID: hfKOvsa6QY+f3SdtbPhC7A==
X-CSE-MsgGUID: pq6rP7KaSke2gF5gpAdU1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="50760731"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 13:32:07 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/vf: Fix register value lookup
Date: Thu, 18 Jul 2024 22:31:55 +0200
Message-Id: <20240718203155.486-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

We should use the number of actual entries stored in the runtime
register buffer, not the maximum number of entries that this buffer
can hold, otherwise bsearch() may fail and we may miss the data and
wrongly report unexpected access to some registers.

Fixes: 4edadc41a3a4 ("drm/xe/vf: Use register values obtained from the PF")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 6a87d31c44e6..47222bd9988d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -850,7 +850,7 @@ static struct vf_runtime_reg *vf_lookup_reg(struct xe_gt *gt, u32 addr)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
-	return bsearch(&key, runtime->regs, runtime->regs_size, sizeof(key),
+	return bsearch(&key, runtime->regs, runtime->num_regs, sizeof(key),
 		       vf_runtime_reg_cmp);
 }
 
-- 
2.43.0

