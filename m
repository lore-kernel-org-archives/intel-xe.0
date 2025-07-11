Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC6FC83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 19:33:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D4710E3C6;
	Fri, 11 Jul 2025 19:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VAdNiAzr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B05410E3C5
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 19:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752262419; x=1783798419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X1Iln+XyrRxMPMkXGWJDgoTiLN/CFKrkuBo44V9yR2g=;
 b=VAdNiAzrqT17N4qHHBUR+MFChiF3IvrJc0JsMK8gzzuo3ApNq0m/fIMG
 bGNasvTFFIqA5KZCBgiSbTFer2pP45uaRp95yWJrdVJywo6DLhZE0VeOe
 2TKxXNKvIc0HGQmzVdOslraf5uSGTlEkJoOnBksvyIEAPpjwnGUnRXhnk
 znLLeoq2yVay83cKTtBTvXtUQBjx0J1KyH4QU8pdjxR2gBWDFlbDr9Ie8
 FD/sn7Q+EB/vOsWtCjB6zapMxZ2YIbrGUShP3o1FaKv5ut94Z9Vn+jnTI
 JkEGTqyKV1Y0FI5l5qgwXWAMRdDrZBZUpF+eiZIwqFBJWgBn0Fx+5J2Ga A==;
X-CSE-ConnectionGUID: E/M0jlOKRImr04mRFJjdOA==
X-CSE-MsgGUID: XRCMsrmtRlWB2/Z3kRAJUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54651052"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="54651052"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 12:33:39 -0700
X-CSE-ConnectionGUID: jvt8VMSIQpW2Rhm+CTwYLg==
X-CSE-MsgGUID: lKH4JHyzQ+esIO8UoMikxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="160462039"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 12:33:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v4 6/6] drm/xe/pf: Invalidate LMTT after completing changes
Date: Fri, 11 Jul 2025 21:33:16 +0200
Message-Id: <20250711193316.1920-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250711193316.1920-1-michal.wajdeczko@intel.com>
References: <20250711193316.1920-1-michal.wajdeczko@intel.com>
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
index 86dade6f1083..0e1c1c19e011 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1347,7 +1347,17 @@ static int pf_distribute_config_lmem(struct xe_gt *gt, unsigned int vfid, u64 si
 
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

