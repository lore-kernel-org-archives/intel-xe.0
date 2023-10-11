Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB92CD6E5D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 12:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CBC10E782;
	Wed, 11 Oct 2023 12:26:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA9C10E77B
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 12:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697027203; x=1728563203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T2djnvPSmPfA0DNnMA7xMQ+kmDORThxZiz3fR7Au1/k=;
 b=ijkDeFBuSvllaJddHn34H8JYtq4LpkpIdescXmjfd+w6CGWOLcM46G7Y
 t28FCt9orTUGDLGuw9x7O8LZsFJwHjVfU3SaGczQOz3HGSJ+6Dx4v0RTz
 vS7XuYEiuQJwBaUfzOBu/6EB32PYvXwzc+zlVvGqWvqeSYZrriX7/6yLE
 kz1U444M+d/+VksOhQd6Kf38WZRqM/FgJdiOAPsYknHYhIRU+sTWAgF2p
 AlGqVqdrZ1ZmbhaCs+VXn5LOySKLQ0vOAed4576+sTQrTyeKeaDF1DSjz
 JoFpbSB5FZnODGAcgWXYn/LoT88n4v08k5izWuIkWffDZKILuTQjYRTSo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="364010308"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="364010308"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:26:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="844543830"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="844543830"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Oct 2023 05:26:41 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 17:52:11 +0530
Message-Id: <20231011122215.2025850-3-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231011122215.2025850-1-chaitanya.kumar.borah@intel.com>
References: <20231011122215.2025850-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/6] drm/i915: Add wrapper for getting display
 step
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

Add a wrapper around intel_step_name that takes in driver data as an
argument. This wrapper will help maintain compatibility with the
proposed xe driver.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231003065211.1052385-1-chaitanya.kumar.borah@intel.com
(cherry picked from commit 55ce2c37cfb969b7d8bf4a1a5c7956ffada0cae8)
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
 drivers/gpu/drm/i915/intel_step.c        | 5 +++++
 drivers/gpu/drm/i915/intel_step.h        | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 1623c0c5e8a1..63e080e07023 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -309,7 +309,7 @@ static const struct stepping_info *
 intel_get_stepping_info(struct drm_i915_private *i915,
 			struct stepping_info *si)
 {
-	const char *step_name = intel_step_name(RUNTIME_INFO(i915)->step.display_step);
+	const char *step_name = intel_display_step_name(i915);
 
 	si->stepping = step_name[0];
 	si->substepping = step_name[1];
diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
index ee4e5a2c0220..b4162f1be765 100644
--- a/drivers/gpu/drm/i915/intel_step.c
+++ b/drivers/gpu/drm/i915/intel_step.c
@@ -353,3 +353,8 @@ const char *intel_step_name(enum intel_step step)
 		return "**";
 	}
 }
+
+const char *intel_display_step_name(struct drm_i915_private *i915)
+{
+	return intel_step_name(RUNTIME_INFO(i915)->step.display_step);
+}
diff --git a/drivers/gpu/drm/i915/intel_step.h b/drivers/gpu/drm/i915/intel_step.h
index 96dfca4cba73..b6f43b624774 100644
--- a/drivers/gpu/drm/i915/intel_step.h
+++ b/drivers/gpu/drm/i915/intel_step.h
@@ -78,5 +78,6 @@ enum intel_step {
 
 void intel_step_init(struct drm_i915_private *i915);
 const char *intel_step_name(enum intel_step step);
+const char *intel_display_step_name(struct drm_i915_private *i915);
 
 #endif /* __INTEL_STEP_H__ */
-- 
2.25.1

