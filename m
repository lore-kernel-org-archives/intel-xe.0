Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F4EC3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 01:26:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB7510E838;
	Fri, 26 Jul 2024 01:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uw1ZAwen";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C48E10E838
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 01:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721957185; x=1753493185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xGmyU4iqhbA0ri6Sn/pOfiqfDn327TJJe8QWwjFKhvs=;
 b=Uw1ZAwenvQYHmmyDn2YuLMfLiQv5MQW/2h1UpgJOlCOYlP/XYf3EOCQV
 BCEe6aBHvIV9ePvjTgH9JNORd1tiF0Di5gtK+VCkdu1KodOy+kr/NlTd+
 9YP0jsRuEMzLumZ/Sby+iRHM1IPPnfM0AFICJr8NdSm06zKE4dG3h4333
 Z/ju5dgEAzqEFvXz+pAc36Z2/WadKvnD3Y/Xdv0TH4UbLvyWjbw/wkfx9
 eNZc9VwVBqLyepBy/vBhEE0vGqBbzGmMm/g9o7e6+qE4W8uaFmOEyjAF7
 MGY8TA4UjqWvjEKIuQLDoMNhqtcIz/LWhv8D6SVVrZ24imxafVVWkfNvv A==;
X-CSE-ConnectionGUID: UhpmCMRURbevtfHuMX21Zw==
X-CSE-MsgGUID: k5sbaxDaSp2dcxM4y1eCWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="30393939"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="30393939"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 18:26:25 -0700
X-CSE-ConnectionGUID: hZ25c+7DSlaAdJRLdmhsoA==
X-CSE-MsgGUID: avl/LksfQKmcuw3IPLGwPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="84081324"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 18:26:25 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 2/3] drm/xe/guc: Bump LNL GuC recommended version to 70.29.1
Date: Thu, 25 Jul 2024 18:26:09 -0700
Message-ID: <20240726012610.706749-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240726012610.706749-1-daniele.ceraolospurio@intel.com>
References: <20240726012610.706749-1-daniele.ceraolospurio@intel.com>
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

This is the release that includes all the fixes and WAs required on LNL.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index c0ff44e0b0ea..cc84484d3372 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -105,7 +105,7 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 19, 2))	\
+	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 1))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
 	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
-- 
2.43.0

