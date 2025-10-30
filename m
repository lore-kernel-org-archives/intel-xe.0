Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08756CCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 15:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7F010E9DB;
	Thu, 30 Oct 2025 15:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HIhEYxUr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8B410E9DA
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 15:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761837070; x=1793373070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1EqXYOIKHGVNEz9bjFwzUlCXCawy1YuW2IV8ZAGbxSk=;
 b=HIhEYxUrSt+tzBpZ1QuYLJO0w4ctUcGlJbmrSEEEFKoLRmiEq3eGjGxu
 hEuxpIli4cVbSU4PSItY7R4KVHNUk0M06sRLD7iiOkdMhCwTjyPBL5lpo
 qTznjxVvLDQOZ8zcNTv/ruOhwsEkZLNVuhHoaXxQNsOEXUVNee0Bq6QUZ
 ubmd3kQ+/ZN3TDyYtWNzgv9vcpC/9p2rAK20MGJpxJ7DEzFHtv9UBsx3I
 xWW844OGdKtB0KvXh9OlcE3RnuUS5nhrfm8vQ+hcx3dKz14SVgJkSpu4F
 wz8xhsJV+QJZm3Yqmko4G4oNn4UXDgIuB9omQ2nhRQJEGif5jamqOp5io w==;
X-CSE-ConnectionGUID: KlLu2TrhS42Xs0YOI7CwXA==
X-CSE-MsgGUID: ou3AzBCKRhmBexfvnCsXow==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="89448430"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="89448430"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:11:09 -0700
X-CSE-ConnectionGUID: 7kYKrQ4nTJaF/lV73kZ8Ig==
X-CSE-MsgGUID: aPTJx45cSpyxsdo/K5162g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185638994"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:11:09 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 1/2] drm/xe/gt: Synchronize GT reset with device unbind
Date: Thu, 30 Oct 2025 20:41:24 +0530
Message-ID: <20251030151122.3021436-5-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030151122.3021436-4-balasubramani.vivekanandan@intel.com>
References: <20251030151122.3021436-4-balasubramani.vivekanandan@intel.com>
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

When unbinding wait for any GT reset in progress to complete. Unbinding
will release the mmio mapping but mmio operations are performed during
GT reset causing Kernel panic.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
v2:
 - Use the managed resource release function to wait for GT reset during
   unbind (Lucas)
---
 drivers/gpu/drm/xe/xe_gt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 89808b33d0a8..d0f8c40bc51e 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -607,6 +607,8 @@ static void xe_gt_fini(void *arg)
 	struct xe_gt *gt = arg;
 	int i;
 
+	disable_work_sync(&gt->reset.worker);
+
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
 
-- 
2.43.0

