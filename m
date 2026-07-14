Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260A9C4450C
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 18:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D9110E24F;
	Tue, 14 Jul 2026 18:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EI5KYsZB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DEA10E24F
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 18:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784053756; x=1815589756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=blzc+2O1SY6ySBOgMa4qj2n/nNKCaHGniRIEdFS7BVc=;
 b=EI5KYsZB0EXgHVtVbEbG087EQJE9QN18oTGyBvJLrPIxz5PsSLmsHDTc
 C/46WGSgWTZxWmeV5OH24haEp6Zg/yOkHFrEP/KeMAPdcdefJ+toROAXO
 Ph3n9BU+LV8FfbNodGHClLLnbdPZlITm8lFob3H7WSBgZ5Ru7BL/jEeS9
 nPHcgnY1LXHbhjIhyjcJKPLD1KNPkHcPgS7IBJ92t0Ol/Q7c5t3Q4qPeT
 73HAQUB45E4aV+adxVMqxY/aug0uN9oCy3LovsPabSUFIgfmjpGlO9o2S
 VKkBxA/jguW50yQqfvyxssAu4TWZHVkUGVQhXL8+iM3YJ69rbTJgszAJB g==;
X-CSE-ConnectionGUID: +OPR5E/tSuKnimRQrXOJcg==
X-CSE-MsgGUID: vzMcJ522R66rMH6I02A91Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84880808"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="84880808"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 11:29:16 -0700
X-CSE-ConnectionGUID: C6xSxZJFS9Ca7LbdXrAcWw==
X-CSE-MsgGUID: DuzvA9wQT0yvH09wbMHmSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="260838237"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 11:29:15 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v3 1/5] Revert "topic/xe-for-CI: Define GuC firmware for NVL-P"
Date: Tue, 14 Jul 2026 11:28:39 -0700
Message-ID: <20260714182904.620871-8-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260714182904.620871-7-julia.filipchuk@intel.com>
References: <20260714182904.620871-7-julia.filipchuk@intel.com>
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

This reverts commit b275cb3f07a7ab3ef3bd419db86bd42fa95dcedb.
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index e29878b255ba..f7d3af6b57bb 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,8 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,	nvlpg,	70, 70, 0))	\
-	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	mmp_ver(xe,	guc,	nvlpm,	70, 70, 0))	\
 	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 70, 0))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	guc,	nvl,	70, 71, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
-- 
2.51.0

