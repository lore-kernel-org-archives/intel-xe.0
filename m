Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B90CC87FCC
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 00:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8EE10E0E4;
	Fri, 25 Jul 2025 00:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PtakuRBY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2ED410E0E4
 for <Intel-Xe@lists.freedesktop.org>; Fri, 25 Jul 2025 00:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753402872; x=1784938872;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/qN6fkPLlPErnIv6Xf16gTjBWAE7tMDI9qIRCakZHRE=;
 b=PtakuRBYHLYS4KPvDCyqQZIsC3Ub+eNdIqEH2LAbfTjgrzihEyT1R9HY
 MHbOoVxv7H4+YDD6JJWgtWGkxwZwgSo2U5LlyqHX4w+FQrAg/7buZBJlH
 nRyTo7UbcL4TMV9RuwQaREP2NdTk9LjRGSvt7U40ul446JglZfhP1Roid
 PEG2ixIbq+WYxaOY27qi8Toto12AA6lRxzibbyWcGzl5DM6Jb080jMoYw
 1++ZDE8uhmFmijaBQwetjE2LCqWDI8FQASbLRd4MHHVCFJ5m2iX5DTZeX
 s+vnZN6umLACzfImMqwghLf//pfVL1jwj3Rui9qNKI1PV2WMd5tHrDn5z Q==;
X-CSE-ConnectionGUID: eDp0uFvwQv6/8Vj9XkyhEg==
X-CSE-MsgGUID: vccQSsb3QPmLR+TYFIiQ0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59549820"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="59549820"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 17:21:11 -0700
X-CSE-ConnectionGUID: UDZX9pBaRg+Ur68o1GD9qA==
X-CSE-MsgGUID: +BVVPFGYQUq+YF1zaeRg7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="191462861"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa002.jf.intel.com with ESMTP; 24 Jul 2025 17:21:12 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 2/4] drm/xe/guc: Add firmware build type to available info
Date: Thu, 24 Jul 2025 17:21:03 -0700
Message-ID: <20250725002111.3906267-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250725002111.3906267-1-John.C.Harrison@Intel.com>
References: <20250725002111.3906267-1-John.C.Harrison@Intel.com>
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
---
 drivers/gpu/drm/xe/xe_uc_fw.c       | 1 +
 drivers/gpu/drm/xe/xe_uc_fw_types.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index c8378f3e0032..d51827c969b8 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -348,6 +348,7 @@ static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
 	compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->guc_info.submission_version);
 	compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->guc_info.submission_version);
 
+	uc_fw->build_type = FIELD_GET(CSS_UKERNEL_INFO_BUILDTYPE, css->guc_info.ukernel_info);
 	uc_fw->private_data_size = css->guc_info.private_data_size;
 
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

