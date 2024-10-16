Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0638D2F7D2
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 22:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCD910E068;
	Wed, 16 Oct 2024 22:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vt5n+KBZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5502510E27F
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 22:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729118028; x=1760654028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1q/JX48eQCZFRrz2jGsaPp95K1RRoVbA2siERocsiuc=;
 b=Vt5n+KBZpp7IJ0Nq8oASxgdY/1vdi5ecyoajj7pNwJzfdFNazKrL8HwS
 fbvkfuTo7MglLyQqxvQNDO+Sqh16BVCbYOAW3Yuq2+PTs+MzrrqVWB6jB
 IyeC4RHiDFD2/4KOoLtJOjaEcibd+rIfuxW8gRQQRtGT+KMRjRTIkaDPe
 gnhDZNx81RGF6zgSCuMsaEkcPNMEAsAir/dtc7BQCS0bhDxGphBvFs8L3
 9MaSwJ/n/BcrYlwwODXoDnhzRy84/CrYElEV8/Kst8SEfSeRpm9pVu76D
 D44Lb69iPSgLdJMtJ5nzU8g0kvV1Ca3ti6dGlFBsb1SN9EZkNTdGJ0MHg Q==;
X-CSE-ConnectionGUID: cmAygXa7THaL0/Xz/Hu9WA==
X-CSE-MsgGUID: 5xene1o9SeaeSPpXBp5YWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28539474"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28539474"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 15:33:47 -0700
X-CSE-ConnectionGUID: g5jyKq7ZTHaQiEmaHKqRNw==
X-CSE-MsgGUID: SCry1H5vTQK66lpjDTCJUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; d="scan'208";a="109120411"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 15:33:47 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 Fei Yang <fei.yang@intel.com>, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 1/1] drm/xe: enable lite restore
Date: Wed, 16 Oct 2024 15:37:30 -0700
Message-Id: <20241016223730.921963-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241016223730.921963-1-fei.yang@intel.com>
References: <20241016223730.921963-1-fei.yang@intel.com>
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

