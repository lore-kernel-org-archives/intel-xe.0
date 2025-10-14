Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3047DCCD190
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E233B10E52E;
	Tue, 14 Oct 2025 03:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gb3pDkLM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C0410E1B0
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412330; x=1791948330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9RAcTZZ7sl/hg6Qg51g5sApdIP1vyIlx/gy5t3rhUbY=;
 b=Gb3pDkLMut7FtE6y0RicFkan4/XdUr21dK1s0+V409SyvuP/5IUKcmIQ
 uDD4znQaAfwWheHEoVHbR/t1lpm+umDyv7kSFnX0Hid9VBdhlc/JSEnCo
 8FEGCKp6PmqMsVFQ46VvHadg0waUeTnzfccSt+vu8Acghvl9GO1S8w8Gr
 y9M9J8e06KGrDEkQGuou6mcbVwHZ2zY6XUwp5EmuJVu8nJna4xBZGh46Z
 yEkIbjfgUMwrLUB5JU8XIFGISnTqNBoghWpWuppWERGwgBz5p9ADIH98g
 XSaSJ2QV84dZy9dlTYAov3LA8jqHcNIrpRbDztflIIlTs+pz0xh25IpOy Q==;
X-CSE-ConnectionGUID: QOj+pRRfQQC0lpQiiGlxZQ==
X-CSE-MsgGUID: 3XzJU55hTF6oV/RN8xKmew==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414876"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414876"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
X-CSE-ConnectionGUID: 80L9VTIySKWyJtuCEGFaiQ==
X-CSE-MsgGUID: BlJgHVbhRzyTCAYItbBCow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567299"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH 11/23] drm/xe/xe3p: Enable L2 flush optimization feature
Date: Mon, 13 Oct 2025 20:24:43 -0700
Message-ID: <20251013-xe3p-v1-11-bfb74f038215@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Tejas Upadhyay <tejas.upadhyay@intel.com>

When set, the L2 flush optimization feature will control whether L2 is
in Persistent or Transient mode through monitoring of media activity.

To enable L2 flush optimization include new feature flag
GUC_CTL_ENABLE_L2FLUSH_OPT is used when media gt type is detected.

Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c      | 3 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index ecc3e091b89e6..3296f28803593 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -94,6 +94,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 	if (xe_guc_using_main_gamctrl_queues(guc))
 		flags |= GUC_CTL_MAIN_GAMCTRL_QUEUES;
 
+	if (GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe) && xe_gt_is_media_type(guc_to_gt(guc)))
+		flags |= GUC_CTL_ENABLE_L2FLUSH_OPT;
+
 	return flags;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index c90dd266e9cf9..c42572306158d 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -115,6 +115,7 @@ struct guc_update_exec_queue_policy {
 #define   GUC_CTL_ENABLE_PSMI_LOGGING	BIT(7)
 #define   GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
 #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
+#define   GUC_CTL_ENABLE_L2FLUSH_OPT	BIT(15)
 
 #define GUC_CTL_DEBUG			3
 #define   GUC_LOG_VERBOSITY		REG_GENMASK(1, 0)

-- 
2.51.0

