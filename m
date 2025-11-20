Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCD0CFA45A
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 23:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E396810E7DD;
	Thu, 20 Nov 2025 23:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gSrQkVdM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E1010E7DD
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 23:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763682331; x=1795218331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yWXvewadhxSbP56mCFZ7Gu1Bz8zN0E6g82ICJfdAmgc=;
 b=gSrQkVdM/e1jkljbaKtTtyt0trpYqDiTI9UeF/fPweuFkR/26+DvPSt/
 vWUKEXWwYyPy8WyNtB7ZdSucJYs0+JsCze/NB+Ghyk61N5X981DqesMll
 2svJZF8D4U0TILOEQrqDSm39sY0PH6L+kJeddZhFXczCIEUrIAU7nUavD
 J1M4mPOylg3LRi9fteR0Ab9dQic6U1Ai4npw7OctePlCBEiMCkbuwq5hC
 yXRhVDK0w0nkwVjzy3dMFbqSflrO72YO51coceA6oups3ppqkP3DncbN1
 zVD03/AawZRdns7xsWuTis0jr1Jr2u6T6NXgMbvhKlqZ30hQe5shX0fqa w==;
X-CSE-ConnectionGUID: NW08R48MT963EHsyZkqY5Q==
X-CSE-MsgGUID: /8V15o/NSjaElciGhOgjrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65807609"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65807609"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 15:45:31 -0800
X-CSE-ConnectionGUID: Tlsm5eXTSpyZenizPUAUxA==
X-CSE-MsgGUID: OeDuNAX+TMqLvddDpBKHcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="214877079"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa002.fm.intel.com with ESMTP; 20 Nov 2025 15:45:29 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 2/2] drm/xe/oa: Silence allocation warnings for sync arrays
Date: Thu, 20 Nov 2025 23:42:56 +0000
Message-ID: <20251120234254.427452-6-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251120234254.427452-4-shuicheng.lin@intel.com>
References: <20251120234254.427452-4-shuicheng.lin@intel.com>
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

param->num_syncs comes from userspace and may be large or fuzzed.
When kcalloc() attempts a large allocation, the allocator may emit
noisy warning like below, even though the driver already returns
-ENOMEM safely.

Use __GFP_NOWARN to suppress it.
"
WARNING: CPU: 0 PID: 1217 at mm/page_alloc.c:5124 __alloc_frozen_pages_noprof+0x2f8/0x2180 mm/page_alloc.c:5124
"

Fixes: c8507a25cebd ("drm/xe/oa/uapi: Define and parse OA sync properties")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 890c363282ae..4fdba0c62815 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1404,7 +1404,8 @@ static int xe_oa_parse_syncs(struct xe_oa *oa,
 	}
 
 	if (param->num_syncs) {
-		param->syncs = kcalloc(param->num_syncs, sizeof(*param->syncs), GFP_KERNEL);
+		param->syncs = kcalloc(param->num_syncs, sizeof(*param->syncs),
+				       GFP_KERNEL | __GFP_NOWARN);
 		if (!param->syncs) {
 			ret = -ENOMEM;
 			goto exit;
-- 
2.49.0

