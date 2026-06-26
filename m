Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41786CDE00C
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 11:15:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04ACB10E390;
	Fri, 26 Jun 2026 11:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZbK1PvKQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA1E10E390
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 11:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782472539; x=1814008539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ukxGSbk9yWbxaS6QkZH95xAeUfdKl8S6PIBk9VlHO8U=;
 b=ZbK1PvKQRPKHXgOyV5VBlPX9iYlFyMQO4kEMz0t5RThYicfEx+uzaIs+
 p7Kpq/E7FdPokf16Yzywzz0HbLN5n+2ZPwUMLfoiqwdQbksDS+28mAoQL
 /PFq5FZr342UZchg09yOkqVZ9tFNyVqKTvT4yY/zCCbmd8MEz2ZjYQmfV
 83rGXN6pTeZMO+SL7B0ueVI3ZDOCYSkDVhG4HSmUKlGuQj6mgIldX5mHb
 oDP2/5XY50gaFgh5F5xO9N1otpFwRIjNckCRKwiYZIEp8iQf+t8bRCcHW
 aiDzJckb07sdphMZ79yqmuBaz5WQvBqWglF/zT8L2Ps2i97S7zSW5kcNC g==;
X-CSE-ConnectionGUID: nzk1cZ1tR6yMzKMTR2cudQ==
X-CSE-MsgGUID: qe9YqmGzQwWR+x9JU1kVCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="100694986"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="100694986"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 04:15:39 -0700
X-CSE-ConnectionGUID: jwze6y3PRQS7vaLA2e5GaQ==
X-CSE-MsgGUID: rt/7MFCwSoO7tMo9D/W3Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="253214350"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.49])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 04:15:38 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v7 04/10] drm/xe/hw_engine: don't open code is_usm_hwe()
Date: Fri, 26 Jun 2026 12:15:25 +0100
Message-ID: <20260626111520.487997-16-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626111520.487997-12-matthew.auld@intel.com>
References: <20260626111520.487997-12-matthew.auld@intel.com>
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

Prefer is_usm_hwe() here.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 76aee461bcbe..68db0ce4aa1a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1045,8 +1045,7 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
 	    hwe->logical_instance >= gt->ccs_mode)
 		return true;
 
-	return xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
-		hwe->instance == gt->usm.reserved_bcs_instance;
+	return xe_gt_is_usm_hwe(gt, hwe);
 }
 
 const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
-- 
2.54.0

