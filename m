Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83224CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 12:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5346D10E4D6;
	Thu, 12 Oct 2023 12:58:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6EA10E4CB
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 12:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697115522; x=1728651522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T2djnvPSmPfA0DNnMA7xMQ+kmDORThxZiz3fR7Au1/k=;
 b=lxmkROBxqOBh5B1I4aDyL6TvmJZhy5S8erKMI3XY9ZgF2P3ntu9IQksf
 Vudkf6SqH84iauzGheECkxXlDMyYES1h5Dg/AUwEm0U8XkfXVy8lriALQ
 P2ayYyiDiYKnKXGdhdxcDycz/z7VE+W4XvTEJw5IDpI1+M3uPFeLyLTUE
 wfU77D2loW5Kzz+seDGZ3bAVBcfpc3nVaqBKw1TnYbHkCWq5DRo8EM56m
 7VMyikZBRxf7VMpYHz9mqs5QzvdPbTpjlgzv2bnHOy+BSDbXbt3F3ptyr
 fYa0H7ju2jooYhIZBXZ+MXuFbT2dlfZHx3Ul3mMbDPRaoxl8f6nl/n82W Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375259067"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="375259067"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 05:58:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001541470"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="1001541470"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmsmga006.fm.intel.com with ESMTP; 12 Oct 2023 05:58:40 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 12 Oct 2023 18:24:06 +0530
Message-Id: <20231012125410.2127337-3-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231012125410.2127337-1-chaitanya.kumar.borah@intel.com>
References: <20231012125410.2127337-1-chaitanya.kumar.borah@intel.com>
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

