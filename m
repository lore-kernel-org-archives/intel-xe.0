Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F276606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 09:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LRJjHa6k
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4629910E9E7;
	Fri,  6 Nov 2026 09:54:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C3F11204C
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 09:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793958863; x=1825494863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uC+aEs/09lJmPiZvtcj42qH/kQEKVdIPg8zxTtN0pRg=;
 b=LRJjHa6klH2uppNQplLY8ONSmFYJVfW7JQ7zUIpn2g3DaPVVHTZ9M/3T
 em+npJtPjE2rXmT1+xZiVyydnjUSWpEztaQ9stkxSOoJb3UveIN2WJGsw
 9q2tbdCnEtEKt3aFoHC8uLE24TnM18Kou/tFNeXX+R9AyBcChWkeHPVWl
 BAW1A8Ov8cYT0Esut6P6KyzBC8enhXraetpudqLcKFfWsYJEDkwT7X34j
 UKsF0X5NbpGbKt1z56B9OOBm10/1wBajyennsA9tP82Gs4tUZ0oIQWulr
 Y8rDXu8MiyjEv03v8sE16wAri5vRMVYEpULex0PH4subEDZvnv68L/FOx A==;
X-CSE-ConnectionGUID: PjSwcsnYQFamtwq9OuDhBw==
X-CSE-MsgGUID: AhiDQBqTTFGJCGoIIVvmcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2647158"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2647158"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 01:54:21 -0800
X-CSE-ConnectionGUID: u/41BCxfQlO0kuqN+e3MHg==
X-CSE-MsgGUID: 3ihEZaqZQnCs5RAyhc9muw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="9111951"
Received: from gsd-build.iind.intel.com ([10.190.229.108])
 by fmviesa013.fm.intel.com with ESMTP; 06 Nov 2026 01:54:20 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v3 2/2] drm/xe/pf: Use multicast writes for early-generation
 LMTT config
Date: Fri,  6 Nov 2026 09:54:04 +0000
Message-ID: <20261106095403.1790515-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105114923.880265-3-satyanarayana.k.v.p@intel.com>
References: <20261105114923.880265-3-satyanarayana.k.v.p@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The LMEM_CFG register on pre-Xe2 platforms is a MCR register. Use a
multicast write to program the LMTT directory pointer across all
instances.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
---
V2 -> V3:
 - New commit.
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
 drivers/gpu/drm/xe/xe_lmtt.c         | 8 +-------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 90319e3d6046..06d45b1f2218 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -526,7 +526,7 @@
 #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
 #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
 
-#define LMEM_CFG				XE_REG(0xcf58)
+#define LMEM_CFG_MCR				XE_REG_MCR(0xcf58)
 #define   LMEM_EN				REG_BIT(31)
 #define   LMTT_DIR_PTR				REG_GENMASK(30, 0) /* in multiples of 64KB */
 
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 8fba3c01fac2..ea2a3eeefccd 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -220,14 +220,8 @@ static void lmtt_setup_dir_ptr_gt(struct xe_gt *gt, u32 config)
 	struct xe_reg reg;
 	u32 val_read;
 
-	if (GRAPHICS_VER(xe) < 20) {
-		reg = LMEM_CFG;
-		xe_mmio_write32(&gt->mmio, reg, config);
-		return;
-	}
-
 	if (xe_gt_is_main_type(gt)) {
-		reg_mcr = XE2_LMEM_CFG_MCR;
+		reg_mcr = GRAPHICS_VER(xe) < 20 ? LMEM_CFG_MCR : XE2_LMEM_CFG_MCR;
 		xe_gt_mcr_multicast_write(gt, reg_mcr, config);
 		val_read = xe_gt_mcr_unicast_read_any(gt, reg_mcr);
 		xe_gt_assert_msg(gt, val_read == config, "LMEM_CFG_MCR: %#x != %#x\n",
-- 
2.43.0

