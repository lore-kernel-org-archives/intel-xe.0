Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D067C87FD2
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 23:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEBB610E2C6;
	Tue,  5 Aug 2025 23:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHqryal3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB52010E2C6
 for <Intel-Xe@lists.freedesktop.org>; Tue,  5 Aug 2025 23:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754437377; x=1785973377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j5m1IeLyj5EAx3s+Yr4uD8R+tdrDSNFW55wqE9GOYr8=;
 b=mHqryal3IyTOmb5VFQ0qUtCygTfZi3zyQNaCNXg8QxBD2rDCp+zDfRo0
 6TAix4suu4xm+SgV/SqcCbz2MCi3HJjBpCgFX/bSL9Wj2uqize8il0MMp
 xPeB67ibQvY68uS2QZenKo6ebVIX/1jGzoZOH1VcFiBJfNIM0du1td8s7
 a4JQf+l+YOTUXX6IME8uwL0xlBt4SQN7f4U1ZyABxZc/R0by/Lp6C15IS
 eJd9QIvCb8C3lv4Q/Wwmpqcz1AtcNKh0oiDzkRRq7Q7Vok0bU5mcU8ao9
 wuQFMx9ax0tJlogRcb+woLxvrUuRmIeMGLyqPtJXX8doEmbU2qH0hYbfh g==;
X-CSE-ConnectionGUID: Q+ZVDFkyS/uhf8ESba3/BA==
X-CSE-MsgGUID: 4YZqffF4RcSr2J3EZIhSaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="44340228"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="44340228"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:57 -0700
X-CSE-ConnectionGUID: yliVEFLGTeW8QH5AoUBlqQ==
X-CSE-MsgGUID: Xwi57I4DSciV/bhAC/XvSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="163862596"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa006.jf.intel.com with ESMTP; 05 Aug 2025 16:42:57 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 2/4] drm/xe/guc: Add firmware build type to available info
Date: Tue,  5 Aug 2025 16:42:53 -0700
Message-ID: <20250805234256.1021020-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250805234256.1021020-1-John.C.Harrison@Intel.com>
References: <20250805234256.1021020-1-John.C.Harrison@Intel.com>
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
index f037571865ad..ae8963556c0c 100644
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

