Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA97C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 03:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A498710E8F8;
	Thu,  3 Apr 2025 03:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5JpfFVg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBD410E8F8
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 03:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743651750; x=1775187750;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7BPfDaTKtL3w9ES+L1bb0ICpTiXj5FIcJM1vySARJGU=;
 b=f5JpfFVgr8PU+qH3uE/pksrl5gzNy9SUVcuZah3XEiKL7NgCfNO2k4UP
 MIp/i8WUkJjiYTIbWU/e7nGG4s+t3NbuRx1wYD1BlVF440wOonrGbYd1I
 KqIKJhj0FW16xXpOEgAyWlIQTJAvebUUKM0REAPyPD8URjiEDaQYTednm
 6yGtBSxgoVQW0wK7QwPu8L/rjQef7mSQGsbEd3pBpIKY/rdAPrBMoYX49
 uAKymUxe3UgHks4ZmhzRnLd1KfTv2gb/UROWyMwPAmrS0/Xz9sso/myxu
 BnrRLewRWNzUOxuvFXZzKkyvF5woPALIjxkbqNlaxhoN/OJkrcuNa3SJR g==;
X-CSE-ConnectionGUID: Vl/linRaSUOThp95STW5Kg==
X-CSE-MsgGUID: w3w7YlwURBKYv2nElJI/pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56416432"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="56416432"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 20:42:29 -0700
X-CSE-ConnectionGUID: ta7HoHBDRCeX5YPysiyQWw==
X-CSE-MsgGUID: idJBScI/Q1inPLawRDNtlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="127796342"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.96])
 by orviesa008.jf.intel.com with ESMTP; 02 Apr 2025 20:42:28 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3] drm/xe: remove unused LE_COS
Date: Thu,  3 Apr 2025 03:42:01 +0000
Message-Id: <20250403034201.332395-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250401205703.4179906-1-shuicheng.lin@intel.com>
References: <20250401205703.4179906-1-shuicheng.lin@intel.com>
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

value is missed for LE_COS.
The value for this field is universally "0" for every MOCS entry on
the old Xe_LP platforms, and the whole field has been removed from
Xe_HP onward. Just delete the line so that we don't have an unused
definition.

Suggested-by:: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index da1f198ac107..c1590e322ef3 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -62,7 +62,6 @@
 #define   LE_SSE_MASK				REG_GENMASK(18, 17)
 #define   LE_SSE(value)				REG_FIELD_PREP(LE_SSE_MASK, value)
 #define   LE_COS_MASK				REG_GENMASK(16, 15)
-#define   LE_COS(value)				REG_FIELD_PREP(LE_COS_MASK)
 #define   LE_SCF_MASK				REG_BIT(14)
 #define   LE_SCF(value)				REG_FIELD_PREP(LE_SCF_MASK, value)
 #define   LE_PFM_MASK				REG_GENMASK(13, 11)
-- 
2.25.1

