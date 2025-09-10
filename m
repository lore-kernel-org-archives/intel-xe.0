Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A578DCA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 21:02:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1A410E9E4;
	Wed, 10 Sep 2025 21:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="htigYGYS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA5510E9E4
 for <Intel-Xe@lists.freedesktop.org>; Wed, 10 Sep 2025 21:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757538159; x=1789074159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WMdzQaqb74LFlccGFctQhwUGeCdtpYXeUk35FBsGPgw=;
 b=htigYGYSV1riq32hT6tuH6zYa3vs4fOOTdg9zQhgCdlJVY1tE1Zyuyyx
 PY5r3lNXU662og9h4DI6mAjMAjdCPTJTXym5tGZ9jDbqORDIh0ivd0yBk
 YeB8h0eyZB/ONOX7SKtWVedj9eGY/ysnb4xtSPtv60AijNmG7gENk/QcG
 3t5GCQpynMXRrUVqnHHj6DPQHw1NPpX/B/79tRRMYDDsjLtF8Jn43rC1f
 m6md4z28o/E0f1yeNwyUC5TL5I56XXbmCzEgDSTr3WB/AMWy+bB3YaXJO
 35HpJotMX2B8L0x7Ni1LjC/RjRwjO8LA7yReACxdFkOoM9szrjNKpdZ6I Q==;
X-CSE-ConnectionGUID: 4DRZ63VHQ1CWzEW6SYqjJg==
X-CSE-MsgGUID: 0AMbBbHMT7q8yc/T0sB5fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70958644"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="70958644"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 14:02:38 -0700
X-CSE-ConnectionGUID: P09efxg9TZyGt+dD+ML33g==
X-CSE-MsgGUID: jopTHoHgSwSFkfoIP1MRsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="174311954"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa010.fm.intel.com with ESMTP; 10 Sep 2025 14:02:38 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v3 2/4] drm/xe/guc: Add firmware build type to available info
Date: Wed, 10 Sep 2025 14:02:33 -0700
Message-ID: <20250910210237.603576-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250910210237.603576-1-John.C.Harrison@Intel.com>
References: <20250910210237.603576-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Some test features are not available in production builds of the GuC
firmware. So add the build type field to the available information
that tests can inspect to decide if they should skip or run.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c       | 1 +
 drivers/gpu/drm/xe/xe_uc_fw_types.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 8957990846bb..6056ecd0b92f 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -348,6 +348,7 @@ static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_guc_info *guc
 	compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, guc_info->submission_version);
 	compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, guc_info->submission_version);
 
+	uc_fw->build_type = FIELD_GET(CSS_UKERNEL_INFO_BUILDTYPE, guc_info->ukernel_info);
 	uc_fw->private_data_size = guc_info->private_data_size;
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
index 914026015019..77a1dcf8b4ed 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
@@ -147,6 +147,9 @@ struct xe_uc_fw {
 
 	/** @private_data_size: size of private data found in uC css header */
 	u32 private_data_size;
+
+	/** @build_type: Firmware build type (see CSS_UKERNEL_INFO_BUILDTYPE for definitions) */
+	u32 build_type;
 };
 
 #endif
-- 
2.49.0

