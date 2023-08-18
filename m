Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240BBEE499E
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 22:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCACA10E103;
	Fri, 18 Aug 2023 22:08:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45F110E57E
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692396512; x=1723932512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jf4uI88sxLnj+C2g0523ojfuHCmU0G4gAOfrJKTw0lA=;
 b=IYrqxw+FgnODs0nJnqvE9BewfcM5ntdVyMqAHJ394gqkK97bAAIGcYhv
 Hnzj6ft8xUVAOTBCRalbq2auV4Ulq7ozeTNfgOoKHK6ATCW1sFCO9PFXg
 03vvTNEjHzAwNrvRVBTIBIqlqulbRhXB/AIUY+/2c+6QErA1XYf8CuNQi
 JuF2orAjK2mXaVt3AP1r0S4mhuTklI5tWiNn0068ldLbn5oEJxt3gRXqk
 ETA9c3S1JJA+siJa515TGhuLJKH78H/GZfOlpGjQcPKninM4CNrArjY5A
 SJeLRQhxQDiEM6z2RJavPUjYSaeVWGmGFPhLGWDvlpMvcxmDAqXwIK5fu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="439592996"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="439592996"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="728758215"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="728758215"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 18 Aug 2023 15:08:23 -0700
Message-Id: <20230818220824.700519-15-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230818220824.700519-1-lucas.demarchi@intel.com>
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 14/15] drm/xe/lnl: Add GuC firmware definition
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

Define the GuC firmware to load on the platform.

Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 2e70dd4880f6..dd6a68ed1389 100644
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

