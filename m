Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAC3E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 19:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B972E10F049;
	Fri, 20 Dec 2024 19:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ll+xAE63";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C152F10F049
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 19:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734723742; x=1766259742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FPDFqmHv3tSNgHkBDOCKrcrpkFsZbIv2ACBm52d4cE8=;
 b=Ll+xAE63cFszPdrADQZSS6vdjBc8kq54Um0v2jOHhwYCgSiKKEEDI/H5
 8uqs7ij3RBv9exuqZxZn7flJP79HPYe6x6EwJnb6D+x2k63RlKD0VO3b3
 fBAsZiCxK/XWJie4T3o+IWybovlZcQeTKFiziHkCFbfWUOLNZEQwNVef3
 K7F65e5zcS1An0RP9DiUxZu8k2Li6IrBMGurzKEhXKOWg/gyPl8eA6uqj
 6O8Rpd0J0uDuJaTCggUl0qwc0BEN/fSfXpY2YmE12g5oOgK9KUGH7JTH7
 Grn141xS+cLhrvNzPmxeueSTniCBUyjaD+23GNpYPhRIUdsIT63wM8E57 w==;
X-CSE-ConnectionGUID: 7Zx1DZMYQi296loeejAV+w==
X-CSE-MsgGUID: BHfDNSQuSaaqJa1YJ3+JEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38965215"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="38965215"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:42:22 -0800
X-CSE-ConnectionGUID: JiYub6JlT9yfMKm4cDvygA==
X-CSE-MsgGUID: tCbJU8A9Th2XDv/k7mKOBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99075445"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:42:20 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 03/11] drm/xe/sa: Improve error message on init failure
Date: Fri, 20 Dec 2024 20:41:56 +0100
Message-Id: <20241220194205.995-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241220194205.995-1-michal.wajdeczko@intel.com>
References: <20241220194205.995-1-michal.wajdeczko@intel.com>
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

Instead of raw errno value we can print friendly error code and
also print size of the buffer object that we fail to prepare.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index eb314ca75355..0b87599759d7 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -49,8 +49,8 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 					  XE_BO_FLAG_GGTT |
 					  XE_BO_FLAG_GGTT_INVALIDATE);
 	if (IS_ERR(bo)) {
-		drm_err(&xe->drm, "failed to allocate bo for sa manager: %ld\n",
-			PTR_ERR(bo));
+		drm_err(&xe->drm, "Failed to prepare %uKiB BO for SA manager (%pe)\n",
+			size / SZ_1K, bo);
 		return ERR_CAST(bo);
 	}
 	sa_manager->bo = bo;
-- 
2.47.1

