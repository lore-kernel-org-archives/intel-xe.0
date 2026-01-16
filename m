Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44556C982C3
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:12:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CAF10E0F4;
	Fri, 16 Jan 2026 22:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oI0lIBU0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F9910E00E
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601562; x=1800137562;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=YCTkRNe3VTy0kWpMeUjNjZc8LLiWmQ+hw/Vt/EOE518=;
 b=oI0lIBU0eqfO/fhIAT6QZuVJYjQGXF7uWh21TU0A0bg41El9orVHL2NP
 vIaX8OtnQw7LlNDfsFecDdS+zaTTUcNNeVkXwuIulU/crOg9klu+ZB4Q+
 +9GS8VrVSU+5Tyva+y48EyveeECLXo04b0SHLk5jMc0HqtuDyQbLqbYlJ
 MKIGwuYfFza50LDhv1ymVBXRzBoPtrYb6+LAdI9Y9o1RS7JAkrayigpz0
 +LmWXIE3841zHheAwLsJzaxpR+2MKseT1V+R93kU5NXkitWTX5eI5yfW0
 /wc2kQN9Ggp+c1ugstI4WPWRSqSyPjs1s383yso6UIW8O2Vby4ZHpxSor g==;
X-CSE-ConnectionGUID: D+RAlxffR8SUOCP+sxh5Hw==
X-CSE-MsgGUID: vKkFMPyQToqQ68XAb/5eog==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69123018"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69123018"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:42 -0800
X-CSE-ConnectionGUID: 0UcsJqjZSFOJA2q87lzTYA==
X-CSE-MsgGUID: 7wsSK2pvRviWzSDIytbeuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204961769"
Received: from khuang2-desk.gar.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.59])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:41 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 16 Jan 2026 19:12:09 -0300
Subject: [PATCH 01/12] drm/xe: Define CACHE_MODE_1 as MCR register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-rtp-mcr-check-v1-1-d420b9c1a327@intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
In-Reply-To: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

CACHE_MODE_1 is a MCR register for all platforms that currently use it
in the Xe driver.  Use XE_REG_MCR() when defining it.

Fixes: 8cd7e9759766 ("drm/xe: Add missing DG2 lrc workarounds")
Fixes: ff063430caa8 ("drm/xe/mtl: Add some initial MTL workarounds")
Bspec: 66534, 67788
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 24fc64fc832e..bc984dde2773 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -141,7 +141,7 @@
 
 #define XEHPG_INSTDONE_GEOM_SVGUNIT		XE_REG_MCR(0x666c)
 
-#define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
+#define CACHE_MODE_1				XE_REG_MCR(0x7004, XE_REG_OPTION_MASKED)
 #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
 
 #define COMMON_SLICE_CHICKEN1			XE_REG(0x7010, XE_REG_OPTION_MASKED)

-- 
2.52.0

