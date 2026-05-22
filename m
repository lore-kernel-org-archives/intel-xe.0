Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8809ACD5BB3
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 16:30:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4573C10E24F;
	Fri, 22 May 2026 16:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBg/0nho";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E346410E24F
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 16:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779467403; x=1811003403;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1E2m6YnEqSXcXMgpUSvwUVCcyGxC7Z/7cJyR78BCZEM=;
 b=VBg/0nhoWJ+UHSzCRL2JB6Dl6XcSDJZCyidQtJbScl40jrbTJt33b6zN
 NN5GHsHD9F4q2TDLIBMaWgL4p/eqo/QFBjYDFn1QLhUiOSCbFmiCiw07s
 af6cwyNHPgX4SzclNEuNcVQxrua1xBtBRsfd+/IBkwLRWQq7olHXKakJa
 HV4yZYgYX8tmU37v/GQaoO2TdczaN0KaHQVlVGpBrtljnZYu2K1UTbi3K
 xlvcBtWGggJaXzMIkbXaDUrL/txSAEnA2YkKJKY6M3I6QWF6ZmUv9eLEa
 /OZ1jIi5L3YHizNW4LQfSzYwLyC880QcH2jave6+1sQa2m5ISK4vRVQZh A==;
X-CSE-ConnectionGUID: bRYgJWWiR32eT16yrStemQ==
X-CSE-MsgGUID: kFnp70r1Qref00Gybpufbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80580330"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="80580330"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 09:30:02 -0700
X-CSE-ConnectionGUID: IVnn4ZtpToGfREH30KcHdw==
X-CSE-MsgGUID: LjBwq+NAQE+USjapJWzbkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="246033852"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 09:30:01 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH] drm/xe: Restore IDLEDLY regiter on engine reset
Date: Fri, 22 May 2026 22:05:32 +0530
Message-ID: <20260522163531.1365540-2-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
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

Wa_16023105232 programs the register IDLEDLY. The register is reset
whenever the engine is reset. Therefore it should be added to the GuC
save-restore register list for it to be restored after reset.

Fixes: 7c53ff050ba8 ("drm/xe: Apply Wa_16023105232")
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

---
 drivers/gpu/drm/xe/xe_guc_ads.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index d15a17db3299..e9ceae17c794 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -787,6 +787,11 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 		}
 	}
 
+	if (XE_GT_WA(hwe->gt, 16023105232))
+		guc_mmio_regset_write_one(ads, regset_map,
+					  RING_IDLEDLY(hwe->mmio_base),
+					  count++);
+
 	return count;
 }
 
-- 
2.43.0

