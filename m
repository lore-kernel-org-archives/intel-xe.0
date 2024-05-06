Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948CEC25B4F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 14:18:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E33D10EBE2;
	Mon,  6 May 2024 14:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEsYQYfF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54B510EBE2
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 14:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715005108; x=1746541108;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9eXGbB79alku/P6zdSB0gvbMbuipICWv6WddZsXR0QI=;
 b=jEsYQYfF4VIQjTTUNID8mpczt4e2gMbgbpPIRVDyzoaovNIbxfb44/HA
 dUfSX0eJCynMNjsEi2Io3AdHCDcIzedzhigPTf+Yf54pX7bs91cQHqERQ
 rr9hIpS3RrVnmdQoHLv4VOSMa+fPSg8n+sSps7tMovcJ/bQ2iyBsxodhR
 d3WteShQQQHINahGAAYmK9jygjat9rnf4uTlrhk0DWXoIBjPQJnFKBk7A
 f2aPhGkjJTVa2R8DW1m8AkkW4pxie/3vRB6AmM7QiZpycyrAlhVeN34GH
 99bmOp7DfwQ7USD8OTcNPxmcMvTMZ+KhbAJRKwc87oqpE6zAgYARGS55B g==;
X-CSE-ConnectionGUID: 2F3+Y7pNT3ikqKrX8x6HTQ==
X-CSE-MsgGUID: PGM39jJHRgm/g6E2ecbcnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="22155166"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="22155166"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 07:18:27 -0700
X-CSE-ConnectionGUID: mPQ7qj2sTv+wUolD65+dzA==
X-CSE-MsgGUID: EUJ44bjXTXmbxsVBwzlPqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="32988209"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 07:18:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 kernel test robot <lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/ads: Use flexible-array
Date: Mon,  6 May 2024 07:19:17 -0700
Message-ID: <20240506141917.205714-1-lucas.demarchi@intel.com>
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

Zero-length arrays are deprecated and flexible arrays should be used
instead: https://www.kernel.org/doc/html/v6.9-rc7/process/deprecated.html#zero-length-and-one-element-arrays

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202405051824.AmjAI5Pg-lkp@intel.com/
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 6a5eb21748b1..b48639cfe955 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -109,7 +109,7 @@ struct __guc_ads_blob {
 	struct guc_engine_usage engine_usage;
 	struct guc_um_init_params um_init_params;
 	/* From here on, location is dynamic! Refer to above diagram. */
-	struct guc_mmio_reg regset[0];
+	struct guc_mmio_reg regset[];
 } __packed;
 
 #define ads_blob_read(ads_, field_) \
-- 
2.43.0

