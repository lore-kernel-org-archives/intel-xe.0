Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA87CD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 13:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60184113C10;
	Fri,  5 Apr 2024 13:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jl25btjf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5100C113C10
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 13:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712324387; x=1743860387;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oJ/YfPNp+nf4nzcLqjmeGYHpmESlb5mp2ZmftErcbQs=;
 b=Jl25btjfYZheb7qpIk86ISKMrplwex7UuL9P8cmI5Eo7LORYVcSL6dZl
 ztxTxaPNRyLsEXBTv8hNQREq2yltPc3uLMFjZ7CCVI7IMP+uGogDDO0fS
 Sm2uPXMpmRWqq2eUwlTE2XHdhQVMFOq9sh7G3CXKszgLFiZaGW2KhcaZG
 8W8odSz+sXBabUrB2dMHvSt/jiGVsl9CcMipC8hkO9uteF43vOtApUb95
 NGWopYUOwtw5ni0zqmRGMZQjMLVIhCbEH4iy6eeJI0EF00+9gKsEq83Kv
 SOfmyl2ez9/9GKFdp8DrcVQvEFxvi1utfyr44xfIWAErBu/OsKlqx6NSz Q==;
X-CSE-ConnectionGUID: BrmpGgfrScmMLVP7tsFmVA==
X-CSE-MsgGUID: pEPTjl6eR8yZabW3oV8mzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7838169"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7838169"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 06:39:47 -0700
X-CSE-ConnectionGUID: u3pJChV/Tz6MUTbW2DRZgA==
X-CSE-MsgGUID: H8vIQSn7TyKJC8Z4rleoBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19239419"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.143.198])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 06:39:46 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/xe/vf: Don't try to read legacy GuC MMIO notification
 if VF
Date: Fri,  5 Apr 2024 15:39:36 +0200
Message-Id: <20240405133936.891-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240405133936.891-1-michal.wajdeczko@intel.com>
References: <20240405133936.891-1-michal.wajdeczko@intel.com>
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

Legacy SOFT_SCRATCH registers are not accessible from the VF. Any
G2H notification posted there will be handled by the PF driver.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 59fe73770711..240e7a4bbff1 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -591,6 +591,9 @@ static void guc_handle_mmio_msg(struct xe_guc *guc)
 	struct xe_gt *gt = guc_to_gt(guc);
 	u32 msg;
 
+	if (IS_SRIOV_VF(guc_to_xe(guc)))
+		return;
+
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
 	msg = xe_mmio_read32(gt, SOFT_SCRATCH(15));
-- 
2.43.0

