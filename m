Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91A7E71080
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4939E10EB3E;
	Sat,  7 Sep 2024 00:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iralfRIl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE8610EB2B
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667678; x=1757203678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8RIEw8W/X7avPsU7KCsMNq58oxYBegrveDyZFs3dkrI=;
 b=iralfRIlFo6MlcF2ltT9PYRxqnBetDvta3+/p+Lq44uHAWO8xZxixd+u
 bIRVJeIBST3WGQDu2Bkoj/3hJRuZIGSSGL1Y2PLmY8U17W0JcOTAKCYxA
 r3aNvgljTYje4CAUIGUIt/i8UeTEsV4nuDeW96PKBDX/7OF5V5FSp4/vr
 kwnJa/cA1jQKOYk0T/wV1ovaz7aI1wB/2X/SVu/yGEieamLpycE6OmhA9
 10buneMQSqdAsYu8LXha3FKgdURF3CDKLyxA/nux0Ws6cesFOSjF0yzit
 oU9fLRmWvPyG70IAgNQKeJtFOAw/6Oc4CeV+imlJi088H8r2wwcByqyfa Q==;
X-CSE-ConnectionGUID: 8kRIF2n3RhCN29uZhvm4+A==
X-CSE-MsgGUID: 32jYiDWFSMi3f7blKYopKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855314"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855314"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: cBFGwqjmR52O1r6b0fK2cw==
X-CSE-MsgGUID: eo6TpAH5TYyNKEfiVxD/nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792690"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 24/43] drm/xe/query: Convert register access to use xe_mmio
Date: Fri,  6 Sep 2024 17:08:13 -0700
Message-ID: <20240907000748.2614020-69-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 28d9bb3b825d..5246a4a2740e 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -91,16 +91,17 @@ __read_timestamps(struct xe_gt *gt,
 		  u64 *cpu_delta,
 		  __ktime_func_t cpu_clock)
 {
+	struct xe_mmio *mmio = &gt->mmio;
 	u32 upper, lower, old_upper, loop = 0;
 
-	upper = xe_mmio_read32(gt, upper_reg);
+	upper = xe_mmio_read32(mmio, upper_reg);
 	do {
 		*cpu_delta = local_clock();
 		*cpu_ts = cpu_clock();
-		lower = xe_mmio_read32(gt, lower_reg);
+		lower = xe_mmio_read32(mmio, lower_reg);
 		*cpu_delta = local_clock() - *cpu_delta;
 		old_upper = upper;
-		upper = xe_mmio_read32(gt, upper_reg);
+		upper = xe_mmio_read32(mmio, upper_reg);
 	} while (upper != old_upper && loop++ < 2);
 
 	*engine_ts = (u64)upper << 32 | lower;
-- 
2.45.2

