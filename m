Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17466C83F04
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 22:31:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF37D10E79D;
	Wed,  2 Jul 2025 22:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PbwRSPTi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B1410E79D
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751495460; x=1783031460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BDFs6IpAGlq59xPfRKl64gYUyn3J0z3IorcK3L/Td1Y=;
 b=PbwRSPTieAaDgwNGOD56w6OIcd5+oTY7Q024NaNchgp29WEhVPG2C/mF
 Hmklb+qJDHbOCDsKy3pB9ypvkfgDamGksZTH5EHT/LLEvJQ/lqTGGooS1
 A2P9SPLsT9B3nonZ6TiqJf9DnV/CW3hWrD0E54hl4Mzzhpin/oVH12nLT
 dPvVNXhqInF1BeUFLhp8lYXhsAc50aqacJGII4T56cgj7gAClk/VcooRp
 W4s7zOiIFw3HPU0Lv1U2hmHzQMv65fQ9shlILEPvtfz3QuyIY0ZWaGNE9
 tVTaY+mNmLrgJ0ZtpnFz3vmaDTdubhVOi4HMRr/ky6DGUB225GGOB5EOf w==;
X-CSE-ConnectionGUID: FVfVu+drRAC6NQNz+7GrUw==
X-CSE-MsgGUID: RTjBZap1RS2L7E/c8tFPww==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53737238"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="53737238"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 15:31:00 -0700
X-CSE-ConnectionGUID: 2CRBmMrhRc+FdAlM9pvG0A==
X-CSE-MsgGUID: Er3G5TmkTQmKpDNFMslLaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153645303"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.112.168])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 15:30:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH 3/3] drm/xe/pf: Invalidate LMTT after completing changes
Date: Thu,  3 Jul 2025 00:30:41 +0200
Message-Id: <20250702223041.1700-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250702223041.1700-1-michal.wajdeczko@intel.com>
References: <20250702223041.1700-1-michal.wajdeczko@intel.com>
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

Once we finish populating all leaf pages in the VF's LMTT we should
make sure that hardware will not access any stale data. Explicitly
force LMTT invalidation (as it was already planned in the past).

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index a75ef4007a1e..a1b916e80fdd 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1327,7 +1327,17 @@ static int pf_distribute_config_lmem(struct xe_gt *gt, unsigned int vfid, u64 si
 
 static void pf_force_lmtt_invalidate(struct xe_device *xe)
 {
-	/* TODO */
+	struct xe_lmtt *lmtt;
+	struct xe_tile *tile;
+	unsigned int tid;
+
+	xe_assert(xe, xe_device_has_lmtt(xe));
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	for_each_tile(tile, xe, tid) {
+		lmtt = &tile->sriov.pf.lmtt;
+		xe_lmtt_invalidate_hw(lmtt);
+	}
 }
 
 static void pf_reset_vf_lmtt(struct xe_device *xe, unsigned int vfid)
-- 
2.47.1

