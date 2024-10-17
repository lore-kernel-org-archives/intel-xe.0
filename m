Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCC1D374BC
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 16:23:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781D410E86D;
	Thu, 17 Oct 2024 16:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vyqk2fBq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F2310E86D
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 16:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729182210; x=1760718210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SgPKCGFMm84XpNl1+XwYKxq6QxqcuVodDHEq9D4tDJg=;
 b=Vyqk2fBqbOf3JaV3OaQO+gAtCyTDxpWz6BU873FJNJmGSHxornVOD2KS
 ggZbbgoYRIGEQ7KyoegKKDxF3iW6cxA+8bFeT+AyL9AbR653MPGq16s4T
 YWIM1vUQtOZEXc/U3U9YTsTMsui3nNQgB2cclnb/KJB735FGBV6uqvaEk
 kQfYzJpJpEJq57SEEb/Cyzd3ferlcuV0Wm/lAPHULloaQqOUV+PsXUG4V
 hObSVNn/5b9m0oNf+sqiMP5gPf7X3F5a+o3DVAkcns7aViUYBGtjZikve
 NsthAi46GdW88OI4f6P2vej0CXtHrdRGaJt0j6ogBOhcby49tCEtp2hIl Q==;
X-CSE-ConnectionGUID: dmULYyIiSOi84KBTyvh3Og==
X-CSE-MsgGUID: 1FGh/4TZQ5ylci60OovSdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="32477994"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="32477994"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 09:23:30 -0700
X-CSE-ConnectionGUID: yxTch30cRz2EpIOV09a8nw==
X-CSE-MsgGUID: 8i43gwOuT5KmCB9Oyd7zug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="78489897"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 09:23:30 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Fei Yang <fei.yang@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 1/1] drm/xe: enable lite restore
Date: Thu, 17 Oct 2024 09:27:10 -0700
Message-Id: <20241017162710.942553-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241017162710.942553-1-fei.yang@intel.com>
References: <20241017162710.942553-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

The lite restore is a performance improvement feature which avoids
unnecessary context switch (flush, save and rstore) if the incoming
context has a ContextID matching that of the outgoing context. The
scheduling is done by the Guc firmware, so on the driver side it's
just a matter of setting corresponding GuC_CTL_FEATURE flag.
This is supposed to be enabled by default, thus the flag is set
unconditionally.

Signed-off-by: Fei Yang <fei.yang@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c      | 2 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 76437d42b8a1..04e50eb6e506 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -70,7 +70,7 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
 
 static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 {
-	u32 flags = 0;
+	u32 flags = GUC_CTL_ENABLE_LITE_RESTORE;
 
 	if (!guc_to_xe(guc)->info.skip_guc_pc)
 		flags |= GUC_CTL_ENABLE_SLPC;
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 01e3ab590c3a..08ffe59f22fa 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -105,6 +105,7 @@ struct guc_update_exec_queue_policy {
 
 #define GUC_CTL_FEATURE			2
 #define   GUC_CTL_ENABLE_SLPC		BIT(2)
+#define   GUC_CTL_ENABLE_LITE_RESTORE	BIT(4)
 #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
 
 #define GUC_CTL_DEBUG			3
-- 
2.25.1

