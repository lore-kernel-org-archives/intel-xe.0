Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE14FF8861
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 09:33:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5388C10E63B;
	Mon, 27 Apr 2026 09:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6z9vTPu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D85410E63B
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 09:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777282386; x=1808818386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JNc32/Mowqzzy+cs5PGINQOW6287fCnlBkWEmXPBeVQ=;
 b=S6z9vTPuIaDpcIqPsfz8iSJ/Rb0SHvxKmYO6uueoxX5sGMJGyaC05GCP
 EUjWNqsOPiWiXAZ6Rce15L772/BkLS6kEi04PZAuwrg7ntZitZ5qJuslT
 Yi2WnYhb3K5JOQHY/uqtLRSIG5fPuI2uGaJI4qUjoOMvVLb3FJzTXQ6uH
 zCllj3kjt083d/oJI92I6/7bnvo40EAanx6zF8xKHOaSNTy4fzqO8Z81O
 Xsab/hUUhNBLwG7S5tWDwoB3/dNuN3kzMtKdWCzjlOPR42Pu/HlR+/2MY
 Q41RQdRqTmfxZQZIHuy3C+OL44FLkhcCveZcLIywBKm3l93dXfaxvGt7c Q==;
X-CSE-ConnectionGUID: mXwP2tGqSuCICsnX66m+fw==
X-CSE-MsgGUID: 4dbbmq0fQriSEMGPcqV/kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78082633"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="78082633"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 02:32:56 -0700
X-CSE-ConnectionGUID: MF7AuUs+SxmF6EFwau5cOg==
X-CSE-MsgGUID: YcZC8e3JTM2EkeOlZImNBg==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 27 Apr 2026 02:32:54 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, vinay.belgaumkar@intel.com,
 badal.nilawar@intel.com, sk.anirban@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 3/3] drm/xe/gt: Drop redundant forcewake
Date: Mon, 27 Apr 2026 14:59:28 +0530
Message-ID: <20260427092928.1181893-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427092928.1181893-1-raag.jadav@intel.com>
References: <20260427092928.1181893-1-raag.jadav@intel.com>
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

xe_gt_suspend_prepare() doesn't perform any MMIO operation that requires
forcewake in it's code path. Drop it.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Expand commit message (Rodrigo)
---
 drivers/gpu/drm/xe/xe_gt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3c031175f737..e5065f46c748 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -1027,7 +1027,6 @@ void xe_gt_reset_async(struct xe_gt *gt)
 
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
-	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_uc_suspend_prepare(&gt->uc);
 }
 
-- 
2.43.0

