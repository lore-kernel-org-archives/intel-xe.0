Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20535C7EE32
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 21:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE0C10E5FC;
	Thu,  1 Jun 2023 21:52:50 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABF210E5DC
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 21:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685656367; x=1717192367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ga7ssFBmADzMlmFBhQ2Wgi9o/xrY6r1gZcLUCF3P+Ec=;
 b=OALQ/GCNhJXvrM8996blKtCUxq4/MBaBIfrJ+xcmIcHFKYRCVYmMM2F9
 KvL6OXxt5v/BmDILflDSaJMAMRGtNeJZKELVwKzyovAjH0zOOyARyDPFF
 BsqcN6miIB+FzS5rl7KV/Oh8PRNNwUduHZ9MSPy/oWDcjeg7kCOl9BMiJ
 Hcy6SO6qKJ7XZPMRT7mLKPBe4+wkHAyfQqurl/eyzBXumewW/uxoQ2Qbi
 EBC2tCziGwm6G9Eh2dwTBGCWwFp58DH1VOtcZHJm6b60vw74ylVpcW4Cq
 S5wjxeMM8kYeP5ualyr/frympCstjr3roF159C1mH5tLPZl0YszqfbaEz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335313603"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="335313603"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707563581"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="707563581"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 14:52:24 -0700
Message-Id: <20230601215244.678611-12-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601215244.678611-1-matthew.d.roper@intel.com>
References: <20230601215244.678611-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CIv2 11/31] fixup! drm/xe/display: Implement display
 support
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 41540b27775c..39dd97acae08 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -51,7 +51,6 @@ static struct xe_bo *
 initial_plane_bo(struct xe_device *xe,
 		 struct intel_initial_plane_config *plane_config)
 {
-	struct xe_gt *gt0 = xe_device_get_gt(xe, 0);
 	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
 	struct xe_bo *bo;
 	resource_size_t phys_base;
@@ -84,7 +83,7 @@ initial_plane_bo(struct xe_device *xe,
 		 * We don't currently expect this to ever be placed in the
 		 * stolen portion.
 		 */
-		if (phys_base >= gt0->mem.vram.size) {
+		if (phys_base >= tile0->mem.vram.size) {
 			drm_err(&xe->drm,
 				"Initial plane programming using invalid range, phys_base=%pa\n",
 				&phys_base);
-- 
2.40.1

