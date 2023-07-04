Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E247AEB64DD
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 16:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB23C10E2F0;
	Tue,  4 Jul 2023 16:09:13 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0A810E2F0
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 16:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688486951; x=1720022951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gBTsRb68mKttCYiTblEqeZejqOKSUIvZtYRRUSks1n0=;
 b=Zj8D8yYofwvLKesa7EE96B2DJiENm165eN1PCTNQFmCnVgqwthpFWcdL
 uTk6HubKQFbpr34MlUTbQyenmWbZiiexuPHckd2bAlDVCsvFa7LLTbrZg
 Wb/0uZ+vujW7KsYSuyWjgNZC4hZ11PazsGUpwtmWCd7IXnvlCT0jAafxv
 MVKlBR5ZqzqYCzdcrft8irlRRQAZ/kA5rjp/0+XJo1EXre1fsJYz6gB4t
 tKqd7Z5Z2ZcoJuMQ/VEYYUOvHawtdoef9jVWOumuIL+aYc51jqDLfQgKO
 5AkXNIjEjFWT9Yd8CFfkJ3aBPNSS38QF5tAEUSLRPvgj4SgvDtqwQJ7DA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="426837212"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="426837212"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 09:09:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="718962250"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="718962250"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 09:09:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  4 Jul 2023 09:09:07 -0700
Message-Id: <20230704160907.2173428-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230704160907.2173428-1-lucas.demarchi@intel.com>
References: <20230704160907.2173428-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] fixup! drm/xe/display: Implement display
 support
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Synchronize ext/intel_dram.c with the i915 source.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/ext/intel_dram.c | 40 ++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/ext/intel_dram.c b/drivers/gpu/drm/xe/display/ext/intel_dram.c
index 3e8c413280a5..77b874ef4f22 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_dram.c
+++ b/drivers/gpu/drm/xe/display/ext/intel_dram.c
@@ -464,6 +464,42 @@ static int gen12_get_dram_info(struct drm_i915_private *i915)
 	return icl_pcode_read_mem_global_info(i915);
 }
 
+static int xelpdp_get_dram_info(struct drm_i915_private *i915)
+{
+	u32 val = intel_de_read(i915, MTL_MEM_SS_INFO_GLOBAL);
+	struct dram_info *dram_info = &i915->dram_info;
+
+	switch (REG_FIELD_GET(MTL_DDR_TYPE_MASK, val)) {
+	case 0:
+		dram_info->type = INTEL_DRAM_DDR4;
+		break;
+	case 1:
+		dram_info->type = INTEL_DRAM_DDR5;
+		break;
+	case 2:
+		dram_info->type = INTEL_DRAM_LPDDR5;
+		break;
+	case 3:
+		dram_info->type = INTEL_DRAM_LPDDR4;
+		break;
+	case 4:
+		dram_info->type = INTEL_DRAM_DDR3;
+		break;
+	case 5:
+		dram_info->type = INTEL_DRAM_LPDDR3;
+		break;
+	default:
+		MISSING_CASE(val);
+		return -EINVAL;
+	}
+
+	dram_info->num_channels = REG_FIELD_GET(MTL_N_OF_POPULATED_CH_MASK, val);
+	dram_info->num_qgv_points = REG_FIELD_GET(MTL_N_OF_ENABLED_QGV_POINTS_MASK, val);
+	/* PSF GV points not supported in D14+ */
+
+	return 0;
+}
+
 void intel_dram_detect(struct drm_i915_private *i915)
 {
 	struct dram_info *dram_info = &i915->dram_info;
@@ -478,7 +514,9 @@ void intel_dram_detect(struct drm_i915_private *i915)
 	 */
 	dram_info->wm_lv_0_adjust_needed = !IS_GEN9_LP(i915);
 
-	if (GRAPHICS_VER(i915) >= 12)
+	if (DISPLAY_VER(i915) >= 14)
+		ret = xelpdp_get_dram_info(i915);
+	else if (GRAPHICS_VER(i915) >= 12)
 		ret = gen12_get_dram_info(i915);
 	else if (GRAPHICS_VER(i915) >= 11)
 		ret = gen11_get_dram_info(i915);
-- 
2.40.1

