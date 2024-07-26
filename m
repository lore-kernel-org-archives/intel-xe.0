Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B390C3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 01:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD5F10E871;
	Fri, 26 Jul 2024 01:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZceCE2gx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7191F10E838
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 01:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721957183; x=1753493183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HZUwrTkISWKiEdM/tDcxWAdi+Aw2RSoy5McsMPVaKpU=;
 b=ZceCE2gxgIb0hYciiTBTwAne6J68e+noXEhwCXtVa/nBfvISyvhqvnYB
 toP5geV+vzVpFDyR5xWH20Nln8BC8siHz27qjCcK3b+TOL76aKczigmeJ
 uRdhahaz7M6M6MA8SzSpiHKVto6fUHvNlAFMFHgbgzt+NP9NMW2IvKjdA
 d7LKcjUJzlMWy65nRJG32lZQsRKy1PlhFsSIpzDT8ABp3+Tqpjl15vIyW
 p+BICkK81/KRY1njMsUBq/piqKufWzUGmQ1a59eXBLgjXndz82VnR2aB6
 nIjCNFFY2lG/EYHDSN+E2wuH/I1ueTrQM5MB3XlCQUGSKo3atEwK10KhI w==;
X-CSE-ConnectionGUID: 2wt0n8KFQNi5uyLpa7Enng==
X-CSE-MsgGUID: 8KOI/NwCTRaxRhojwvRVaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="30393935"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="30393935"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 18:26:22 -0700
X-CSE-ConnectionGUID: VgA1jpHaSWeDKOw/WKNLxg==
X-CSE-MsgGUID: nVQmDlz/TL+AY5PLiZeB6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="84081319"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 18:26:22 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 1/3] drm/xe: Drop pre-release GuC definitions for LNL and BMG
Date: Thu, 25 Jul 2024 18:26:08 -0700
Message-ID: <20240726012610.706749-2-daniele.ceraolospurio@intel.com>
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

Now that we have the binaries ready to go to linux-firmware, we can
remove the pre-release definitions as a prep step to add the final
defines in drm-xe-next.

Note that this patch is meant to be squashed with the patch in
xe-for-CI that adds the definitions
("drm/xe/guc: Pre-release GuC firmware v70.24.0 for LNL/BMG/PVC"). We
can't just drop that patch because we want to keep the PVC FW def.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 6b92255a769d..c0ff44e0b0ea 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -105,8 +105,7 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 24, 0))	\
-	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 24, 0))	\
+	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 19, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
 	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
-- 
2.43.0

