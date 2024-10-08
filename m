Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAA4CF042A
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 23:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B75E10E60E;
	Tue,  8 Oct 2024 23:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WJwU9cGM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC6B10E60E
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 23:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728430031; x=1759966031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tPFTpDGqBUV4UGBM0D17Qq6vERwcCEUgbEmVBN3jZyg=;
 b=WJwU9cGM2GL23lHFUjSML5ECaJqFZurrBOsMoXHGYnzxAJFeeqT5qBQi
 +JFQZ6K1uruqrPg/NYzTFIRe3pxtclAX04GUFwuWyHYgfBsT9W9ckKxYn
 I+5/IsVp3FT1BqRUxEV7ClQg9WgvLTuLEK7MV4zFo4xvBw3nuZiJ/NF1U
 IhEpQEGGPTZFcHgnvFgYAsxZkN/lEkzi8ppI5yjzCU3PTUiY1VDIAxwRP
 ndg2u6xhdpycDimnLw5Tvz9c7N9HtQUREcylm+ieOl/hUMeHfxG5RWylx
 5GgWIszkMEEgIZVbVijPEwxlVWNEZYrXYSKmRZrqHeksFkiymj6Xim8Qh Q==;
X-CSE-ConnectionGUID: pOEs9OUjQQKnsl+Ah2eK3A==
X-CSE-MsgGUID: n98lYLgZRsO0wP2Gc7acYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="39077898"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="39077898"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 16:27:11 -0700
X-CSE-ConnectionGUID: wNVsGIu4R4uj2SvpJliQrA==
X-CSE-MsgGUID: 6vve7i/0TbaerTwQYfA8hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="76382144"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 16:27:10 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Fei Yang <fei.yang@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 1/1] drm/xe: enable lite restore
Date: Tue,  8 Oct 2024 16:30:59 -0700
Message-Id: <20241008233059.125021-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241008233059.125021-1-fei.yang@intel.com>
References: <20241008233059.125021-1-fei.yang@intel.com>
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
 drivers/gpu/drm/xe/xe_guc.c      | 2 ++
 drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 8570b1218287..e1dad02b0770 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -75,6 +75,8 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 	if (!guc_to_xe(guc)->info.skip_guc_pc)
 		flags |= GUC_CTL_ENABLE_SLPC;
 
+	flags |= GUC_CTL_ENABLE_LITE_RESTORE;
+
 	return flags;
 }
 
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

