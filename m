Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FE2CCD1AA
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 12:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B6210E5D7;
	Tue, 21 Oct 2025 12:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I8AXXyox";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EAB10E5DD
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 12:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761050309; x=1792586309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H3roKcbFz8ijS1+nSmLd0U3zvYLkK8ubljVk4PSv4qU=;
 b=I8AXXyoxUw+I3CAO+7D/C6Cm5xQqJ5fNmAJWojep+oqrP8DYvhwva4qc
 9yPcyk6KLLcs9mznMCq8cbWncfAFL+ESrGzcqaev/5wdZdKuE5hdeRGTa
 ug6TdxrHmMdA4ZeQZHyeeKtfgC7tQ8NO+1k6GVLi9hZIcbvgezN/YIeew
 ++r/uXLcQtqBbhmgAy/Cq+tvzEki52Akb2It+0xAJAIBeIjFEqmsWTHJo
 hjLVJMnSJEugYTjaeCda4iFZumHakspfJXgEiKp/M4hTJ1FzteYhbwBcW
 doWgCsqtAczG/D4+ehnX15goYG+ORErQlXLZ0iACbzWiORONASe/LXHNP Q==;
X-CSE-ConnectionGUID: SqjAMPk+Rh6Xw/pbfGcV0Q==
X-CSE-MsgGUID: FVd5UbO6TGu6gNqw6/IRwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50747438"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="50747438"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 05:38:28 -0700
X-CSE-ConnectionGUID: te9oIzrgQ8yQI7WFj7uGRg==
X-CSE-MsgGUID: FIeNEcphTfOal340ICSOMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="187850360"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa004.jf.intel.com with ESMTP; 21 Oct 2025 05:38:27 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v5 4/5] drm/xe: Assert that VF will never use fixed placement
 of BOs
Date: Tue, 21 Oct 2025 14:39:42 +0200
Message-Id: <20251021123943.1436375-5-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251021123943.1436375-1-tomasz.lis@intel.com>
References: <20251021123943.1436375-1-tomasz.lis@intel.com>
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

Most BOs do not care at which offset they will be accessed within
GGTT or PPGTT. The few which do care, should be only created
on PF, and mapped within GGTT. On VFs, mapping at fixed offset
is prohibited, as each VF is granted access to a range of
GGTT address space.

Since fixed addresses of GGTT mapping can only be used on PF,
add an assert which makes sure no attempt of fixed placement
will happen for a driver probed on a VF.

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index cbc3ee157218..8a4010294e39 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2276,6 +2276,12 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
 	struct ttm_place *place = bo->placements;
 	u32 vram_flag, vram_stolen_flags;
 
+	/*
+	 * to allow fixed placement in GGTT of a VF, post-migration fixups would have to
+	 * include selecting a new fixed offset and shifting the page ranges for it
+	 */
+	xe_assert(xe, !IS_SRIOV_VF(xe) || !(bo->flags & XE_BO_FLAG_GGTT));
+
 	if (flags & (XE_BO_FLAG_USER | XE_BO_FLAG_SYSTEM))
 		return -EINVAL;
 
-- 
2.25.1

