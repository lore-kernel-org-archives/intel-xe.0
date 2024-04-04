Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588F3CD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 16:14:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC6F113224;
	Thu,  4 Apr 2024 16:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NlTybMhP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63063113245
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 16:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712247267; x=1743783267;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E3Xk8BFZldR59uUK7DpKqnC0afmJCMWEgml57cax3fE=;
 b=NlTybMhPVijvg9b2YxUeBZktITsk/CQqMq47Ss7ov+utx5K7gWbSiuVb
 uww6VNx8HLsqz/ysZNSgOLtyg7Q02/VSYTCejp+/O/1evIYu3ZwBQrDW4
 L7YhwtUc0awZPo7U58RQFEAP2WlqzJ8tYK5ZLuTKw6oG6ihfpD0/chRe0
 dFQF3UL6UZBR4UNtBxWOTv2ODEr4HZPSzmxwLcMzHAJKwzTSy9eCTUJm2
 +DrlhFBSvTKXI0btIGGa/M+b8yuTklHGarqPw/6ILZtNH+kTIcagsHQfn
 XcSMumVzkQ08mBvDLA1fA49QzJRf6QODYDCdJmaKZvjRp9J7huWtG5qKS w==;
X-CSE-ConnectionGUID: Z9qWHylFRkGqEH/T/VetbQ==
X-CSE-MsgGUID: fHAyo514Q4ekUSKa51Nsnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7408532"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7408532"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 09:13:02 -0700
X-CSE-ConnectionGUID: 97T2UvhUSKuZraBWux4tvw==
X-CSE-MsgGUID: wzcUtmjLQMC/dLd9NHkH3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18880359"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 09:13:00 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: Label RING_CONTEXT_CONTROL as masked
Date: Thu,  4 Apr 2024 09:12:56 -0700
Message-ID: <20240404161256.3852502-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

RING_CONTEXT_CONTROL is a masked register.

v2: Also clean up setting register value (Lucas)

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 2 +-
 drivers/gpu/drm/xe/xe_lrc.c              | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index a08528d9c76b..af71b87d8030 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -122,7 +122,7 @@
 #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
 #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
 
-#define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244)
+#define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
 #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
 #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 552ebf6eeee7..615bbc372ac6 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -543,9 +543,8 @@ static const u8 *reg_offsets(struct xe_device *xe, enum xe_engine_class class)
 
 static void set_context_control(u32 *regs, struct xe_hw_engine *hwe)
 {
-	regs[CTX_CONTEXT_CONTROL] = _MASKED_BIT_ENABLE(CTX_CTRL_INHIBIT_SYN_CTX_SWITCH) |
-				    _MASKED_BIT_DISABLE(CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT) |
-				    CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT;
+	regs[CTX_CONTEXT_CONTROL] = _MASKED_BIT_ENABLE(CTX_CTRL_INHIBIT_SYN_CTX_SWITCH |
+						       CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT);
 
 	/* TODO: Timestamp */
 }
-- 
2.41.0

