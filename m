Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61DCC7618D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 22:47:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9177410E2DC;
	Wed,  5 Apr 2023 22:47:43 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8635D10E2DC
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 22:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680734862; x=1712270862;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BrBoL7+2sbElmCtt4VDki0IvDR5pOVhQ36+NEfp0aZc=;
 b=EpcHeJqumPLuVUfGOtTNOr89OXcT1fO9FDGvqLV8EsIHvjMiQCvSVAxp
 LRRrQI1BmoEVJSe/xX5TVfV+XRlwCVbuQLQoWTqQl4IHKZhSBWp7uksNX
 Gz4h+E04nmynR/iUKS4mPUKBRbg5nrCnjq9Nj71p5TkKPUvIwr6MaT2Yj
 reAF+sMyR8oJtzuSbTGy4vFgM4tdGuPk18wTFsBMricrvc2EHDmb/5o+y
 zWLjREwBzf6OY7Vkx8VEITmfC9iYylLWcA8CwX+5Zl5+Z7DyUqFm56YcL
 zK40mCB/DAdwAgIs2lNUHr4qB9feYqDrusbzxsQerA5702kz9fttMR1jd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="405371277"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="405371277"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 15:47:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="830536189"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="830536189"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 15:47:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 15:47:25 -0700
Message-Id: <20230405224725.1993719-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Always log GuC/HuC firmware versions
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

When debugging issues related to GuC/HuC, it's important to know what is
the firmware version being used. The version from the filename can't be
relied upon, also because it normally only contains the major version
(except for the ones under experimental support).

Log the version from the blob after reading the CSS header. Example:

	xe 0000:03:00.0: [drm] Using GuC firmware (70.5) from i915/dg2_guc_70.bin

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index cd3cbc8981a2..1590c9822f91 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -395,6 +395,11 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	uc_fw->minor_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
 					   css->sw_version);
 
+	drm_info(&xe->drm, "Using %s firmware (%u.%u) from %s\n",
+		 xe_uc_fw_type_repr(uc_fw->type),
+		 uc_fw->major_ver_found, uc_fw->minor_ver_found,
+		 uc_fw->path);
+
 	err = uc_fw_check_version_requirements(uc_fw);
 	if (err)
 		goto fail;
-- 
2.39.0

