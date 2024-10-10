Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD79CFC5E7
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 17:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA9210E982;
	Thu, 10 Oct 2024 17:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3KWg59g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE3F10E982
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 17:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728581275; x=1760117275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PRsqw4xbgGOWVc7HhYIZAda1r35P1Eui0KznX4Kt8tU=;
 b=R3KWg59gXJoSpBXWQ/GatbK9TID+UJm3ncSDGW6/xZhL5bJGkXHwngxz
 iMuUp8vE5TNBCvzk/dCqLRiOf8Qx0Siqj7bar9dbYZ0q6IgGwXa/A4vyf
 m9+9Y10XoNZxOHZ1G1OnMZZjqKMbjRVXmEo0MNjMdm2knDaUuULH2hOuv
 JisCrtTtuYizpAXnADrqRV7Mt84TdOMBRpnCaSLSxYjj/l4XNF8nEGuJo
 useOkYSHJFAQR7LEqMENOr1tBAJeq9TeDfz+MJ2IN/3xKG6ZPXvsAbS2E
 W0AfDmLDxTw/TLcsaw9ki1PQuL9XYeCs/i1RupQqD7xLxxZRSGLl0PoRj g==;
X-CSE-ConnectionGUID: 566HSNTwQvCDYqG3Bbg7pw==
X-CSE-MsgGUID: ca6V1Oa9SAG0NrzL7eUqQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="39352855"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="39352855"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 10:27:55 -0700
X-CSE-ConnectionGUID: Cm1xwq+fRu+CRCwW5FAdfw==
X-CSE-MsgGUID: vaVhFQPcRh+p7huU2sno4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="77144889"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 10:27:55 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Fei Yang <fei.yang@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 1/1] drm/xe: enable lite restore
Date: Thu, 10 Oct 2024 10:31:42 -0700
Message-Id: <20241010173142.425498-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241010173142.425498-1-fei.yang@intel.com>
References: <20241010173142.425498-1-fei.yang@intel.com>
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

The lite restore feature is supposed to be enabled by default.

Signed-off-by: Fei Yang <fei.yang@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c      | 2 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 8570b1218287..fed30f2872f7 100644
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

