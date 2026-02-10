Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02675EA8105
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 12:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA9110E579;
	Tue, 10 Feb 2026 12:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y/2iQkeW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9285210E575
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 12:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770727961; x=1802263961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fttkm0L6Inahdt5ZQj3/9RyfUtHN1cCmR+Rw/UfpM0g=;
 b=Y/2iQkeWDc7hpQo9uxkkTc4iU9RPOGlqizWWaEHxyIpu8ZybsN3mMw4L
 gT0X6w6OBa/N/ExIYv2yztMXn23WILNdd8/5RtM2KChhuoqbDkcsP/IUq
 CueZRDb97VJNsxWaBw2vmMbX8AJLPzbxHDCs3sIa5k4Uzjyx0nJPPBv9f
 0pBqO2r/28PBe6eGt5H/AYT91idjNCTeTDF97gPmDU37aVrmNRoB1++Gq
 cTO4UpnriL+t+nM/R1k07MOOJ85ZV9t9tQxxLy2FJgFQX+AsXWiZrNKcX
 O9jS0umWi2JpOl2vZk4601XOCoaxx/aQk+lozrSdiVnO1hGrHpVHiimv3 Q==;
X-CSE-ConnectionGUID: 3w9+NjRwT7OnsvGWU6BbVg==
X-CSE-MsgGUID: dfQ/7IP9SjiHWqp3yJ5r2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82492524"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82492524"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 04:52:41 -0800
X-CSE-ConnectionGUID: JE00ZeedTDqa7HmmC4fgQg==
X-CSE-MsgGUID: RpytBjdaS6eG4rAkbhbYjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211989296"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 04:52:39 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 2/3] drm/xe/xe3p_lpg: Enable L2 flush optimization feature
Date: Tue, 10 Feb 2026 18:21:23 +0530
Message-ID: <20260210125120.1329411-7-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260210125120.1329411-5-tejas.upadhyay@intel.com>
References: <20260210125120.1329411-5-tejas.upadhyay@intel.com>
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

When set, the L2 flush optimization feature will control
whether L2 is in Persistent or Transient mode through
monitoring of media activity.

To enable L2 flush optimization include new feature flag
GUC_CTL_ENABLE_L2FLUSH_OPT for Novalake platforms when
media type is detected.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c      | 3 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 303f6ae7c418..517672818a2f 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -98,6 +98,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 	if (xe_guc_using_main_gamctrl_queues(guc))
 		flags |= GUC_CTL_MAIN_GAMCTRL_QUEUES;
 
+	if (GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe) && xe_gt_is_media_type(guc_to_gt(guc)))
+		flags |= GUC_CTL_ENABLE_L2FLUSH_OPT;
+
 	return flags;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index a33ea288b907..39ff7b3e960b 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -67,6 +67,7 @@ struct guc_update_exec_queue_policy {
 #define   GUC_CTL_ENABLE_PSMI_LOGGING	BIT(7)
 #define   GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
 #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
+#define   GUC_CTL_ENABLE_L2FLUSH_OPT	BIT(15)
 
 #define GUC_CTL_DEBUG			3
 #define   GUC_LOG_VERBOSITY		REG_GENMASK(1, 0)
-- 
2.52.0

