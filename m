Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EB0C54E4A
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 13:42:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE5110FA00;
	Fri,  8 Mar 2024 13:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PsK2igCw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5901F10F9FE
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 13:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709905329; x=1741441329;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KT38fFPO469/HqRtPI7mm96ebbjuREaq0m+U3qOV86M=;
 b=PsK2igCwMf9Yknu4jR6Ylp9zevS0wMT5qfVy7+XVCg24h9fMyuS2S2pG
 HefBkXY3xS2EomzPMbCnFR4WHjfS1ADM5OqOvrQLT+Hh5A7etib7fI5Vj
 w/CJ0OJrJmrHSNNCL9PWVW9O5rigvuPZ1lMgJShu6OJQSOg4gyP9NU41A
 R4LUKzgg1loraNFwF+JFoczbRVCA8+a2zVBLxOBj0zTvo83nwa5P/n5oN
 uTXSjFIHDOzATwRHaEAZ5E5gq+WqFQzj4sTWxWKle3hhWTwri5ZXqDgkg
 r6AyvBjQIUhIzW6RXtsrtA3GykyTUyDGBN9qHACP7p1nuWqtkKzOSrFRw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="8434862"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="8434862"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 05:42:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="15024339"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 05:42:09 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH xe-for-ci] drm/xe/pvc: fix CI GuC FW path
Date: Fri,  8 Mar 2024 05:42:02 -0800
Message-ID: <20240308134202.901394-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

The new repo flow has the CI firmwares located under the intel-ci/
folder, so we need to update the path in the driver. This messes a bit
with the formatting, but since this is a CI-only patch it doesn't really
matter.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
---

This patch can be squashed in the existing fw definition patch

 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 7751d6ba6ce0..44b8c5f58fd8 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -105,7 +105,7 @@ struct fw_blobs_by_type {
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 19, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
-	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 20, 0))	\
+	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 20, 0))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
-- 
2.43.0

