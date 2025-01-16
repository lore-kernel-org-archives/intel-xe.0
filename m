Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640D5C02183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 18:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC0510E245;
	Thu, 16 Jan 2025 18:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KHil6vWX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31A810EA08
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 18:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737052534; x=1768588534;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5OXmvVN9mprH+QK+C5FbUOpU+oZzu1RB6nrPlSVGllM=;
 b=KHil6vWX2KyFvxsRh4h2y2zm8J6KvHN5fxAmP763DpjOKa4EElorYpD1
 oQHPWmO+80y1tVYVsofwcx9aJrb3wouSreW1Os/pj7CrFCG8c2iwxFYo1
 4Df6SFBO8QoEYfS8rW6qtPuysTyUDD8MnmWSRHgcLSWN+yoSbjs38iUsF
 RI7O6tY5FNWVloC8Hvb5t9fPA5N5/XtMYwTZsxKUqRM8KSg1Tt8HSoXV2
 VkWC824W7aK1NX5P9yUCLUM7V8xGrofvMbqD7kRVd8/GI4kAGIMkgYwrA
 OZHuaHVHm61Z3rZFQhVurzzz4XJ1450XQAezu4RqltUxBArwLsj9JTd9u g==;
X-CSE-ConnectionGUID: NEPV6xJdRJmxWXAt2MfM5A==
X-CSE-MsgGUID: 705W0+0BR6aqAVX+jO/g7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="25059128"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="25059128"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 10:35:33 -0800
X-CSE-ConnectionGUID: eN1yDl3rRuqkqSCvjDXcBg==
X-CSE-MsgGUID: +QBLVXFNQl+z4Cnk3DzIGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="105541779"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa007.fm.intel.com with ESMTP; 16 Jan 2025 10:35:34 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [topic/xe-for-ci] drm/xe/ptl: Update GuC version for PTL
Date: Thu, 16 Jan 2025 10:31:44 -0800
Message-Id: <20250116183144.378985-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Move to GuC 70.38.1.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 9c14b0adad0c..18e06ee9e23f 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -107,7 +107,7 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 36, 0))	\
+	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 38, 1))	\
 	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
-- 
2.38.1

