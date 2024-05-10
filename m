Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E83C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 20:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EC410E25E;
	Fri, 10 May 2024 20:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QAryrAPb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6E710E23A
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 20:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715373528; x=1746909528;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3asN3xCW4EXy59/uU+ppQssVMsqvcqhJS09F0jo4lYU=;
 b=QAryrAPbXL6/e35WY9mqQWAG3phZLWGFxGWuruANdc1hy2ufYYA2x1Em
 7QkBgxV7gVIHpk+bdZxeKwyWi2qw0MDsuQ2BW0dmICMPgNb61EAs+Nu8X
 ROQJMApTvFp307P65waPPY3SkcBusXagZp62rz1swG7tkN667v9ggD503
 eGIj3O4hH2050ElxAauVp37kCLXinp5uLohEMMUDCPyyRvTVayDic7nAf
 HXib7FgPfMAq36EmKHXfdO3H//LGaqAA2s3bD6cqA+DT8drn1VQBtV9wW
 jBOhQnBJKBl0c/S/NvSUT8NvlJUBzCF+cr/kAJQZ95LGjxm5JVFx+yVwi A==;
X-CSE-ConnectionGUID: /NaZEj2XQziUQRfxXIjh5Q==
X-CSE-MsgGUID: /DWbTTSZTD+lpLX7uqPbhw==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28886825"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28886825"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 13:38:48 -0700
X-CSE-ConnectionGUID: TBMji/qsSlyFpPz6200e8A==
X-CSE-MsgGUID: bbdmb/EQQlCi0fOc+yAMcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29577958"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.252.59])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 13:38:47 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/2] drm/xe/uc: Reorder post hwconfig uC initialization step
Date: Fri, 10 May 2024 22:38:09 +0200
Message-Id: <20240510203810.1952-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240510203810.1952-1-michal.wajdeczko@intel.com>
References: <20240510203810.1952-1-michal.wajdeczko@intel.com>
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

We want to move the GuC submission initialization to the post
hwconfig step, but now this step is done too late as migration
initialization uses exec_queue that would crash due to a unset
exec_queue_ops. We can easily fix that by small function reorder.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 36c7b1631fa6..644bccc9bf4e 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -434,6 +434,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	err = xe_uc_init_post_hwconfig(&gt->uc);
+	if (err)
+		goto err_force_wake;
+
 	if (!xe_gt_is_media_type(gt)) {
 		/*
 		 * USM has its only SA pool to non-block behind user operations
@@ -460,10 +464,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 		}
 	}
 
-	err = xe_uc_init_post_hwconfig(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
 	err = xe_uc_init_hw(&gt->uc);
 	if (err)
 		goto err_force_wake;
-- 
2.43.0

