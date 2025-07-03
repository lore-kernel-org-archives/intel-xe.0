Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787E1C83F03
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 14:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF8F10E874;
	Thu,  3 Jul 2025 14:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ROvmzRdd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F2510E86D
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 14:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751554640; x=1783090640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Hrnoos3SlkkNs/UzuSY9G0rlAImptiFSQIwJZO0Sak=;
 b=ROvmzRdd3AmtCNELfR6vmjAP3yKMxOB7e9mz5bFq4rXChqSbzTbPLwuR
 UpSl8esvLdK7RcaFlQTTWXMHhzYJZjE22avfUHNWQHYhv2WWqGxIhxLKG
 cRI9R5hVDToUUJCLaioCgW/pWtRzohbqOInI0QtFJlH3hKWIOFC06HltL
 jPO1pNN20Fnj8mzLd1yjvzTbPJc1oexGxuY0xNTZX0SI2LqAe6LHxUgYk
 n1hAZ/C+oe0cfTS9ZUqTAe5n/vgy1wo2hPMvElad9x3PWptYGVga1UOFO
 xCEO7Bv9fHiNpsz5YpZ9rI1uXkGWiRvYVz6mYOBCaG070owqVONpg72zY w==;
X-CSE-ConnectionGUID: jjNEDn6YRuigYQbPLEutWA==
X-CSE-MsgGUID: d4kcN+fVQq2bFM8H7+jRAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53109755"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="53109755"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 07:57:20 -0700
X-CSE-ConnectionGUID: ER5kJ+c8TXG5JTKnadX1dg==
X-CSE-MsgGUID: sSFB9NJFT2mTVtptZnbk1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="185336036"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.112.168])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 07:57:18 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH v2 2/2] drm/xe/pf: Print configuration KLVs using debug printer
Date: Thu,  3 Jul 2025 16:57:09 +0200
Message-Id: <20250703145709.1832-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250604190021.725-3-michal.wajdeczko@intel.com>
References: <20250604190021.725-3-michal.wajdeczko@intel.com>
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

While we print VF's configuration KLVs only under DEBUG_SRIOV
config, we should be doing it at debug level, not info level.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
v2: update xe_gt_sriov_pf_config_restore (Lukasz)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index d186f780885d..d0cf1d80be07 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -104,13 +104,13 @@ static int pf_push_vf_buf_klvs(struct xe_gt *gt, unsigned int vfid, u32 num_klvs
 	}
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
-		struct drm_printer p = xe_gt_info_printer(gt);
+		struct drm_printer p = xe_gt_dbg_printer(gt);
 		void *klvs = xe_guc_buf_cpu_ptr(buf);
 		char name[8];
 
-		xe_gt_sriov_info(gt, "pushed %s config with %u KLV%s:\n",
-				 xe_sriov_function_name(vfid, name, sizeof(name)),
-				 num_klvs, str_plural(num_klvs));
+		xe_gt_sriov_dbg(gt, "pushed %s config with %u KLV%s:\n",
+				xe_sriov_function_name(vfid, name, sizeof(name)),
+				num_klvs, str_plural(num_klvs));
 		xe_guc_klv_print(klvs, num_dwords, &p);
 	}
 
@@ -2349,7 +2349,7 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
 		return -EINVAL;
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
-		struct drm_printer p = xe_gt_info_printer(gt);
+		struct drm_printer p = xe_gt_dbg_printer(gt);
 
 		drm_printf(&p, "restoring VF%u config:\n", vfid);
 		xe_guc_klv_print(buf, size / sizeof(u32), &p);
-- 
2.47.1

