Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E50CA1012
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 19:57:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB57C10EAC4;
	Thu,  4 Sep 2025 19:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GB/vqkNA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E56810EAC3
 for <Intel-Xe@lists.freedesktop.org>; Thu,  4 Sep 2025 19:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757015873; x=1788551873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9ayVthohfk7r9mmIvekIc7k+s3kEn3rlOyF2R8MLBMg=;
 b=GB/vqkNAWQjaiSV20nBHutmjt8Z59JwFeW5OmB5Ikrz4F3NVp1hlQwnd
 3UMXOgr0L74aCBhGZx6V7uHjcAy5nW7/p91gverWJVRRQBb7kQEN/RSbn
 /zkz1ePgP6+DTx7pEGQcyQRxDs7n6i3AzaI7XxI2f9/UoCBS8Y2YZkUJQ
 KE43d3Lv6iCQ8VZdVKJAskpky0uCo8qZajyEDgLS2bIpsLYIFSI1JYfZy
 LnAs1fmwwmkBeZs19BjLNSvQvK4IhkwRAd7DgP2IEeDi4ivJKN6fsV8w9
 XRtTLBo2fbc7juzTE3Aw+lfq/hG1KqcqCdheNAm9WTHlXv09p4BzXQAxG g==;
X-CSE-ConnectionGUID: 3mYr3he+Tc6ivDkBWO35Hw==
X-CSE-MsgGUID: 1XViHpN+Q6OCgcomF0Ekhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="46941116"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="46941116"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 12:57:52 -0700
X-CSE-ConnectionGUID: Gjy5DrH9TBmubyTuf5sHnw==
X-CSE-MsgGUID: vOwpvzzHR6KdxWb8LREiew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="176328554"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa004.jf.intel.com with ESMTP; 04 Sep 2025 12:57:53 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 2/2] drm/xe/guc: Fix badly worded error message
Date: Thu,  4 Sep 2025 12:57:51 -0700
Message-ID: <20250904195752.3846138-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250904195752.3846138-1-John.C.Harrison@Intel.com>
References: <20250904195752.3846138-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

If a GuC id lookup failed, the error message was 'Not engine present',
which is bad in multiple ways - incorrect English and 'engines' are
now called 'exec queues' in this context. So fix it.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 89b73f4df5d1..dc23ce9804cd 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2029,7 +2029,7 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 
 	q = xa_load(&guc->submission_state.exec_queue_lookup, guc_id);
 	if (unlikely(!q)) {
-		xe_gt_err(gt, "Not engine present for guc_id %u\n", guc_id);
+		xe_gt_err(gt, "No exec queue found for guc_id %u\n", guc_id);
 		return NULL;
 	}
 
-- 
2.49.0

