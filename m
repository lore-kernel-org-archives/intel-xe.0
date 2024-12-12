Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697AAE77182
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 23:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B04C10E64D;
	Thu, 12 Dec 2024 23:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RBjFl2hy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B58210E64D
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 23:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734047128; x=1765583128;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O9FlBG/UHmIYWiJ6rV/pBjx2SrF2Af1x0NbGPOtESBo=;
 b=RBjFl2hylHQ2TcOFfuOHsfHqWSxFXNQlIL34bILbbWWdCEA6gMQSUwE4
 yUTc/dVBTpEB3sWviyq6yRyVqwCCzh3KogtTnnbxeoItRueXzX5N5MtWB
 VDYHreU7E+Rx6bbJ4Jifsh3OvC06JjISkSqPddPZucjvkp8VIau5GX8i7
 oYQnbGXn5OBqYj9IcFlcsJMSezyaX2liCmmNhz00t+8+obHQpQAoLbsYN
 IbYW2JmmjicaHeKlwUyKQHP21V7jTwj14iEL7014wB35Y6DUC0WUGVp8T
 A6k95ebJ/FeMzrevOZ2s+c6vC2mvWquD/mHhrmUIQWcEMetCVBc+DANX/ g==;
X-CSE-ConnectionGUID: F+xAnTYlRamZFi5CwO/tzA==
X-CSE-MsgGUID: TtELOwHMTHO4VTZp9yY5EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34632262"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="34632262"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 15:45:28 -0800
X-CSE-ConnectionGUID: v8wVHC6ESvWf64YCOxnyHQ==
X-CSE-MsgGUID: TPhxOcnhQH6BlrHml5aKWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="127378095"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 15:45:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.mrozek@intel.com, balasubramani.vivekanandan@intel.com,
 jose.souza@intel.com, paulo.r.zanoni@intel.com
Subject: [PATCH] drm/xe: Mark ComputeCS read mode as UC on iGPU
Date: Thu, 12 Dec 2024 15:46:06 -0800
Message-Id: <20241212234606.2877233-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

RING_CMD_CCTL read index should be UC on iGPU parts due to L3 caching
structure. Having this as WB blocks ULLS from being enabled. Change to
UC to unblock ULLS on iGPU.

Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: stable@vger.kernel.org
Fixes: 328e089bfb37 ("drm/xe: Leverage ComputeCS read L3 caching")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b19366744148..cc258b2a77c9 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -417,9 +417,14 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 	 * entry is recommended by the spec in certain circumstances on
 	 * specific platforms.
 	 * Bspec: 72161
+	 *
+	 * XXX: According to internal communications bspec is wrong and
+	 * RING_CMD_CCTL read index should be UC on iGPU parts due to L3 caching
+	 * structure. Having this as WB blocks ULLS from being enabled. Add
+	 * bspec link or delete this comment once bspec is updated.
 	 */
 	const u8 mocs_write_idx = gt->mocs.uc_index;
-	const u8 mocs_read_idx = hwe->class == XE_ENGINE_CLASS_COMPUTE &&
+	const u8 mocs_read_idx = hwe->class == XE_ENGINE_CLASS_COMPUTE && IS_DGFX(xe) &&
 				 (GRAPHICS_VER(xe) >= 20 || xe->info.platform == XE_PVC) ?
 				 gt->mocs.wb_index : gt->mocs.uc_index;
 	u32 ring_cmd_cctl_val = REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, mocs_write_idx) |
-- 
2.34.1

