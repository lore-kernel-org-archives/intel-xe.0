Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35476CCD184
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 00:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0D310E6C5;
	Wed, 15 Oct 2025 00:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mo3BKR2Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B21C10E13D
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 00:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760488007; x=1792024007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wT3+fNfP/wvNe3cIxVgQG49xfXK6r422oiybfhTdvQk=;
 b=Mo3BKR2Y6K7ajL4ie3jOG84SKycWn5R5w3qZfyh4iBgvpOJGOjzthPtK
 oxAuqRp7oIRkiZtFraDAvewVS8JtrR8fGZ+l5riI0tR+oKYKecAnY7gf1
 hRr8O65Y3oRjRMRvEz0y8QWPvR3Ukp2EMHYuhAOVk/KDTdbQNrLAMLsgB
 ep//SP3UhvAMC1oj/WshnzwF+O+rlDaTE2jKJprqL3NzS+QgDP3SebX+W
 7G2H12xGMsu3iWsRq86y60WJeBqTfMNRxCww+xu+1AFVbBXo/71mwS7pR
 g6SDgmDLTgEAjZPkn0zyp2pcAgVP7+akAWTSDITzMplPpqttYv5/wQfc0 A==;
X-CSE-ConnectionGUID: hacca+hUQui/F6O3IYaEjg==
X-CSE-MsgGUID: Zg+TozOjRTOn7wVWmA0LDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62551502"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="62551502"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 17:26:47 -0700
X-CSE-ConnectionGUID: wzXRy8VeRXSQQViofbvehw==
X-CSE-MsgGUID: sI5H6ANNR9CZDtPLHrjwGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="181239942"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa010.jf.intel.com with ESMTP; 14 Oct 2025 17:26:46 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 3/4] drm/xe: Assert that VF will never use fixed placement
 of BOs
Date: Wed, 15 Oct 2025 02:27:54 +0200
Message-Id: <20251015002755.720992-4-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251015002755.720992-1-tomasz.lis@intel.com>
References: <20251015002755.720992-1-tomasz.lis@intel.com>
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
would be problematic, as each VF is granted access to a range of
GGTT address space.

So, since fixed addresses of GGTT mapping can only be used on PF,
we can add an assert which makes sure no attempt of fixed placement
will happen for a driver probed on a VF.

The assert will also ensure that VF migration can be properly
performed without a need for special handling of the fixed placement
addresses.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7b6502081873..8e826a4aa574 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2259,6 +2259,12 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
 	struct ttm_place *place = bo->placements;
 	u32 vram_flag, vram_stolen_flags;
 
+	/*
+	 * to allow fixed placement in GGTT of a VF, post-migration fixups
+	 * would have to include shifting the page ranges
+	 */
+	xe_assert(xe, !IS_SRIOV_VF(xe) || !(bo->flags & XE_BO_FLAG_GGTT));
+
 	if (flags & (XE_BO_FLAG_USER | XE_BO_FLAG_SYSTEM))
 		return -EINVAL;
 
-- 
2.25.1

