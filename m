Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E3BC001DE
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 16:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E0810E6B3;
	Fri, 11 Aug 2023 16:08:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC16310E6B2
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 16:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691770127; x=1723306127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jKxDep7HjTOFFzdaxunOJ0Sm0NDPu3bsWJzZRsUrSgI=;
 b=Pyb9yfNxATeXkg1gF94+tmPanAc8srimaUanhIK8Nt2wR2aXliT0AkoU
 OBT+oe4Y92goASgZ4yLI/rqmhpDNZflDt/FGTifwLplEBdv/QMQdbUbcG
 M4ZiSoIDxBo1rnTc2MgTlow3y3tmCocO0/Y9Y5HcIwJcvZ/shGBoWzvtC
 /4hl8+UA1ZKHMEDu5kVZXdGCmCge9hUr7WTRSPwOCI6qkO2B1Uy6dXwn1
 5Cjs91jw9jeYOU5bY/GJTIEgjSgLxk8ECW311gmHuG9xdPsYBH3VSDpjo
 n1ehCPx1yOrNDefZgJWN+ZWYLgLyLRuHPO7xrdpDBHC+SKDB/aKfKSOb6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438044339"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="438044339"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="726300481"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="726300481"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 11 Aug 2023 09:06:17 -0700
Message-Id: <20230811160618.477297-15-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230811160618.477297-1-lucas.demarchi@intel.com>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 14/15] drm/xe/lnl: Add GuC firmware definition
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

Define the GuC firmware to load on the platform.

Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 2e70dd4880f60..dd6a68ed13894 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -100,6 +100,7 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
+	fw_def(LUNARLAKE,	mmp_ver(xe,	guc,	lnl,	70, 6, 8))	\
 	fw_def(METEORLAKE,	mmp_ver(i915,	guc,	mtl,	70, 6, 4))	\
 	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 6, 4))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
-- 
2.40.1

