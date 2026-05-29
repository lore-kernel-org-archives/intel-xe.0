Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF395CD4F54
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 19:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E643112483;
	Fri, 29 May 2026 19:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RN+nELsa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E98112485
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 19:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780083381; x=1811619381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b8zzpIaKliTWyPzMjOCWSEEwQwYoX+eudsc3CNNANKo=;
 b=RN+nELsazgb+KrIYIGMidmNby96IwMZV4u/FH9DmitVjf0WNAdbWvpk0
 gjhwn94APjOIv5/mhQUNTX6JQL2ApkdZwGEln3ldlt6kOTufg5Gsys1SE
 z5VgySJzv61Tc3hDsV63d8umed+fI/AOqHFoUrWzEuNQApHZlq5vEre3m
 ueuMx+E1DUqoTjF2bp56eiqSKP22p+e+u5DwLY9LXBstcwsiKjuWcDSqw
 BbTjKUXg+PqgYe0ImS6MWy5dpPhpAhIPdA/H+6lf/9jzZsTRrdRGgoRZu
 uMMBuiG2t0wIy5yy/vZ1/r5e1SNdsZudBxzB10Hr0wXoHBzCw6FgxSp+Y Q==;
X-CSE-ConnectionGUID: Q/v91FKrRhGq4Vlx68cWhA==
X-CSE-MsgGUID: FYO4Uc72RDGXeRWelgFrwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80969688"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; d="scan'208";a="80969688"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 12:36:21 -0700
X-CSE-ConnectionGUID: xy5cOtx0Qva8r2FU0/jQWQ==
X-CSE-MsgGUID: 6DaQ8MClRVqnRm7fjOH/kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; d="scan'208";a="246943925"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 12:36:21 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 4/6] topic/xe-for-CI: Define GuC firmware for NVL-S
Date: Fri, 29 May 2026 12:36:03 -0700
Message-ID: <20260529193558.185436-12-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529193558.185436-8-daniele.ceraolospurio@intel.com>
References: <20260529193558.185436-8-daniele.ceraolospurio@intel.com>
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
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
Link: https://patch.msgid.link/20260108181956.1254908-9-julia.filipchuk@intel.com
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 498c89452779..70bccbc1af82 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,6 +115,7 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 55, 4))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
-- 
2.43.0

