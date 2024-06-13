Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EF4C27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 15:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4581210E00B;
	Thu, 13 Jun 2024 15:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PRcDevME";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17AC10E00B
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 15:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718292898; x=1749828898;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xVdapJFfVD6ft6VLKByUjCSykynQuV7ub7ec/cX6OUU=;
 b=PRcDevMEY4OYaNV6DTrTb98GTv3nziKdxgqr2ZTdBe17J+CVFpwLmf+F
 1gteMbJ+GO1IOuC4iKHomd8qwTToxxOqkrqNJ7MPCOygtfIems+BGnuJZ
 GbNddAWrBRxVb3xmI8lI6TUy91O2j5s6HPVCZpsnUQ2XOustrnFknSW78
 Y8ivynMkJXwRx22tcqVM56BbKBflA/bOORt2zE7lPs7D5QX9PB7RJaXM0
 5yGV/dVpAqgqetua9UZuLsBWv5VY7AYAMDuOnPe6buI+pwPKsb04LXIJG
 DdoI++LrYkjMQ8IHxYEMCu9dmMURbe/j12Kw8KpJ+Jm8bgfb4Bh+wq9JE g==;
X-CSE-ConnectionGUID: E4cBOeb+SRuv+6SwFiruTw==
X-CSE-MsgGUID: IsxsyK9+SrOl4btn6nTjFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15291055"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="15291055"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:34:57 -0700
X-CSE-ConnectionGUID: T3HuXEshQq252FyefP60GQ==
X-CSE-MsgGUID: kXpCrvzEShWOxdF6XERgbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40829646"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:34:55 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/uc: Fix and start using xe_uc_fw_sanitize()
Date: Thu, 13 Jun 2024 17:34:24 +0200
Message-Id: <20240613153424.2120-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Helper xe_uc_fw_sanitize() was defined but never used. First fix
it by properly exiting also from the LOAD_FAIL state, then use it
in GuC and HuC sanitize code.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c   | 2 +-
 drivers/gpu/drm/xe/xe_huc.c   | 4 +---
 drivers/gpu/drm/xe/xe_uc_fw.h | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 0bf6e01b8910..0e1a5674ef13 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1094,7 +1094,7 @@ void xe_guc_irq_handler(struct xe_guc *guc, const u16 iir)
 
 void xe_guc_sanitize(struct xe_guc *guc)
 {
-	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
+	xe_uc_fw_sanitize(&guc->fw);
 	xe_guc_ct_disable(&guc->ct);
 	guc->submission_state.enabled = false;
 }
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index b039ff49341b..6238fb354914 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -295,9 +295,7 @@ int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
 
 void xe_huc_sanitize(struct xe_huc *huc)
 {
-	if (!xe_uc_fw_is_loadable(&huc->fw))
-		return;
-	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOADABLE);
+	xe_uc_fw_sanitize(&huc->fw);
 }
 
 void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
index 35078038797e..c108e9d08e70 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
@@ -158,7 +158,7 @@ static inline bool xe_uc_fw_is_overridden(const struct xe_uc_fw *uc_fw)
 
 static inline void xe_uc_fw_sanitize(struct xe_uc_fw *uc_fw)
 {
-	if (xe_uc_fw_is_loaded(uc_fw))
+	if (xe_uc_fw_is_loadable(uc_fw))
 		xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_LOADABLE);
 }
 
-- 
2.43.0

