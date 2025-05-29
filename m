Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B76C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 16:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A4A10E109;
	Thu, 29 May 2025 16:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XeXjS7DR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6BB10E109
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 16:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748536930; x=1780072930;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w+J0cF0RnfzzSw28877KFTArKBIoN5WicfNc66Rr8h0=;
 b=XeXjS7DRlkn0qvyF1VfLG0jKqRfqrvcGh+gk5uTXSAdPSJZlQp5jUraC
 ROailN7FhRvr31xRPCJXQF4AiQAYCESPmIgBadnXayGpdzSU4AYi2MoiB
 i7iS6aOPS2C3WlgfMRWSCrXvM0keE3JsDMvR0FzgH0nCYOOm1x8f5IykZ
 DT16aAOhJXyZeuNCRBYSp9MV0z/7Uduch2bae3KEsPvRfUWISGzItB9Q6
 SW5q3Jn3TZYbL9FOJtF3Bmiw3Pok3Apr3ZzqCaHtls+GV0vSrcfp5Qh8q
 PNbZFW4SOvhlbfvcw2Sn5h+5PucfAkcr/OE3JOxRPPDCdV26gLjJd9eGY A==;
X-CSE-ConnectionGUID: PY5lEKLsQG2gm1MGDwIoTg==
X-CSE-MsgGUID: UBBsg6lWRtym9etgvLVZ5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50496273"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50496273"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 09:42:09 -0700
X-CSE-ConnectionGUID: LW0cUKB8SPud19m8uefmeg==
X-CSE-MsgGUID: 95liCq9wSnijjUmdiTMyxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="148766774"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 09:42:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH] drm/xe: Do not warn on SVM migration failing because of 64k
 requirements
Date: Thu, 29 May 2025 09:43:38 -0700
Message-Id: <20250529164338.1745515-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

On platforms which only support 64k VRAM pages, it is expected that 4k
faults will not migrate. Do not warn on this, rather print a debug
message.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 871ac81bb04a..f27fb9b588de 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -821,7 +821,7 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 	}
 
 	if (preferred_region_is_vram && range_size <= SZ_64K && !supports_4K_migration(vm->xe)) {
-		drm_warn(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
+		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
 		return false;
 	}
 
-- 
2.34.1

