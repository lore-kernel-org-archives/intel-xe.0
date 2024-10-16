Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6585D2A53D
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 18:53:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29A710E181;
	Wed, 16 Oct 2024 18:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OuL6QHM4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916FF10E754
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 18:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729104825; x=1760640825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZKnGh99VbTyxIh5CXs5BBYiHAnm/FCFj7uVYefwpQx0=;
 b=OuL6QHM4nQzx7HorVzhKHPqN5l3MSMDvO4K/7jFTTuIGh72CF81YU+hU
 92MLJhH99rUQh5h5soWSFwfEx/oKP+AoiFtyfmMdKLH62QDe3w2O6QMOS
 uZfaXIYyGVBTQwIAJsswRENHv79jqNyZ9/SaawybQNfz5FpcT0GJtg6sB
 oef2sf3vzeZQPhmdaWErw1wnzgpcbaPDOYXrfwEvQHCaQFCC1Hf0HTPkr
 gv8L4srORypg7t49SXh9OVgbnGnK/dHQr/CM3uFjN2wJesMtOYza6JzbY
 y4voC22ZXjyVV5SDOAJ1dNSTzdbCM/xkjWJhkMAnDi1a0OhrmoCd8nf3B g==;
X-CSE-ConnectionGUID: iETYc0kGQbaBLPZHdU7nSA==
X-CSE-MsgGUID: AmP3nZ9jQfSCbedYuiNaHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="28660710"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="28660710"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 11:53:45 -0700
X-CSE-ConnectionGUID: oVhxAMcUS3qqdIuLVSrbLQ==
X-CSE-MsgGUID: XD2o7PfmS16TJkp6wMHEZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="77971667"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 11:53:43 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 Fei Yang <fei.yang@intel.com>, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 1/1] drm/xe: enable lite restore
Date: Wed, 16 Oct 2024 11:57:26 -0700
Message-Id: <20241016185726.907844-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241016185726.907844-1-fei.yang@intel.com>
References: <20241016185726.907844-1-fei.yang@intel.com>
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
unnecessary full context save and restore if the task been switched
in is the same as the one been switched out. This is supposed to be
enabled by default.

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

