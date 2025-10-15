Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CC1CCD1A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 22:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030FD10E906;
	Wed, 15 Oct 2025 22:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e4k8aIeR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F7110E8FF
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 22:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760566032; x=1792102032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/2RGFDWjD6n011QCfbRslPeg61riZsBvDWbqh2HnB6k=;
 b=e4k8aIeRWsWfaiqb1R+O/6deJ2KpD6XerRSAzc7SKoca+pidQiafltuo
 o5sJUr7+nDrobKYXZ/mJTjVgrrNmvQFB+R3KtU4BTT9l0V7jBGefbi3a3
 wz5UOXvJz1QUHaGu56pZG5ifSNEt0XqsPuUIhWVKOg1c91QgFCBAgAfMn
 1600GndBvw/xJCB8zZt8Y64ERnQRYoAr6jmAc6L4zrj7amXkS5BzgsGuD
 LEInWt4f/jQWj/PuNucgYbIsvxkYrrRFTob8KZ2r8JXIoPAjuuVr34/4M
 INhoA09Yaxg8T39vZUAWR8L/KA1K4LH6foBb11LaNrqyjmG1QDI8Bu3dt Q==;
X-CSE-ConnectionGUID: U+B4GvWgQfemh9HVE9SvKA==
X-CSE-MsgGUID: Es0ayV2UT3KgOaTHRTW6Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62794060"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62794060"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
X-CSE-ConnectionGUID: CykPQ/PKSIKOn/KqacOpgA==
X-CSE-MsgGUID: DJlIHCMWQG6zLR3eRJ/5wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="186298306"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>, Fei Yang <fei.yang@intel.com>
Subject: [PATCH v2 15/22] drm/xe/xe3p_xpc: Add L3 bank mask
Date: Wed, 15 Oct 2025 15:06:30 -0700
Message-ID: <20251015-xe3p-v2-15-b9189b3056a2@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Fei Yang <fei.yang@intel.com>

Expose L3 bank mask through topology query interface.

In Xe3p_XPC, MIRROR_L3BANK_ENABLE represents the full L3 bank mask (not
just a per-node mask), and each bit represents a single bank. With that
there's no extra complexity to calculate the L3 bank mask like there was
in previous platforms.

Bspec: 73439
Signed-off-by: Fei Yang <fei.yang@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: Better commit message (Matt Roper)
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 80ef3a6e0a3b5..14af073783ad3 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -148,7 +148,11 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
 	if (!xe_gt_topology_report_l3(gt))
 		return;
 
-	if (GRAPHICS_VER(xe) >= 30) {
+	if (GRAPHICS_VERx100(xe) == 3511) {
+		u32 fuse_val = xe_mmio_read32(mmio, MIRROR_L3BANK_ENABLE);
+
+		bitmap_from_arr32(l3_bank_mask, &fuse_val, 32);
+	} else if (GRAPHICS_VER(xe) >= 30) {
 		xe_l3_bank_mask_t per_node = {};
 		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
 		u32 mirror_l3bank_enable = xe_mmio_read32(mmio, MIRROR_L3BANK_ENABLE);

-- 
2.51.0

