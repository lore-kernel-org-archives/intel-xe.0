Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B8ACD98ED
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 22:25:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFA210F403;
	Thu, 18 Jun 2026 22:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EPdqfWzx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE0A10F402
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 22:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781821552; x=1813357552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PdoCgPFStnfjTaYRTgCBbGGxol/hPxcr8WxBGlOIBAg=;
 b=EPdqfWzxTTAGKITFjMlTMrswMrFwLE92QRJSJiM/VXWp5PWZLJhznK0E
 cck8xCRIozIVzleTZSpYCrZHOd9ogE3iJD9rRD/wvz9R44tnQPgMXMptN
 ZaSk//pHvWeM7gX8XlcoJfA3IkfgSr5fqV93fXd3+ypmQCd38U5bd2JUw
 sG4xN67iKQhEHoT+dMsR+Epku1n/3Lk/fG1J+PkhEhkGau95+e+kIQ8gQ
 837A9y+L9f3FU8tO700osaCYKwgrHuKpDebleDV470Cob9DWfhMkrk0Hy
 lZhXT2VC9RF+872ShlDDWtFCuTFIMjqv4IsDqgYfEnAfSftRzmw3NnBbx g==;
X-CSE-ConnectionGUID: kdMkNujWQf+eP9Y78Cwchg==
X-CSE-MsgGUID: 7HheGaXoRJql3qLtyRoKaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="81785791"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="81785791"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 15:25:52 -0700
X-CSE-ConnectionGUID: KLK+nvYBS9SFK4DeqX/xrA==
X-CSE-MsgGUID: Xd7QYGsoSzyQhKMd3waDOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="278661340"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 15:25:52 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCHES topic/xe-for-CI 4/6] topic/xe-for-CI: Define GuC firmware
 for NVL-S
Date: Thu, 18 Jun 2026 15:25:31 -0700
Message-ID: <20260618222536.3351750-12-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260618222536.3351750-8-julia.filipchuk@intel.com>
References: <20260618222536.3351750-8-julia.filipchuk@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

Although NVL-S has a similar Xe3 to PTL/WCL, it requires a unique GuC
firmware.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://lore.kernel.org/r/20251016-xe3p-v3-12-3dd173a3097a@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://patch.msgid.link/20260108181956.1254908-9-julia.filipchuk@intel.com
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Link: https://patch.msgid.link/20260529193558.185436-12-daniele.ceraolospurio@intel.com
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
(cherry picked from commit 4e53a9b93ad2f9bdac73a52fc852c5137468e4ee)
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 498c89452779..3ef3b3740e29 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,6 +115,7 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 70, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
-- 
2.51.0

