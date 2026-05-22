Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755C3CD5BB7
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 12:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3751910F739;
	Fri, 22 May 2026 12:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cop6tkWp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5789D10F727
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 12:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779453458; x=1810989458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9fVtdO3rgR2JgefZBDHR5e6hvEiEn30EFgfMumDp7Vk=;
 b=cop6tkWpjRac3PktTX8AKkVyXGoln+NKIRuYK2yjq0/qWXT1+9cd0Via
 sWNOS0cv6qCGvAh6U4KktYT64kEablW2N4hBW3ieISzXZEcShmZZlV+vN
 PFjx+IaI9nFuYX3bWY4TqSYCpUN4o0/zT1BBLVJQTw69ylpq1aNEOHig4
 ojQX8j7xsCPp16Xuwoz4XXjsT1Hl4yaGEL5tn779Ix2TWrJ8AK6MY/ONg
 NHw3l1vwEzNmNq0DkpxtIcw8SHBcOn6DgkJKvSTgJFMVEiFumbUCj8Za8
 VtefgUWUmeigX0RAlarPt7Ik6bfCUeg99n8VZwlV4vMbqqaF9RsfWJFWD Q==;
X-CSE-ConnectionGUID: aGMprGL0TzG+4/imThIvqg==
X-CSE-MsgGUID: Td9N4xWWQQm0OrVlgYxEng==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84264588"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="84264588"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 05:37:38 -0700
X-CSE-ConnectionGUID: RIKFPY04S0Ciimtz/1qLDQ==
X-CSE-MsgGUID: TUuKzkpuTYSgP+HOtganjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="238302148"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.22])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 05:37:37 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 04/10] drm/xe/hw_engine: don't open code is_usm_hwe()
Date: Fri, 22 May 2026 13:37:25 +0100
Message-ID: <20260522123720.39656-16-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522123720.39656-12-matthew.auld@intel.com>
References: <20260522123720.39656-12-matthew.auld@intel.com>
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
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 8c66ff6f3d3c..768b0cd4c16a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1037,8 +1037,7 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
 	    hwe->logical_instance >= gt->ccs_mode)
 		return true;
 
-	return xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
-		hwe->instance == gt->usm.reserved_bcs_instance;
+	return xe_gt_is_usm_hwe(gt, hwe);
 }
 
 const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
-- 
2.54.0

