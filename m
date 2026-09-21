Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7901C982EE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 09:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AB410E5CF;
	Mon, 21 Sep 2026 09:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LylhbzyI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEEC10E579
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 09:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789982483; x=1821518483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4/okpgSqDzfuQspm1WDZ3XLd6esy5JhZxBknIS+4KtE=;
 b=LylhbzyIg2uI9jNxgaPTAzqkm3sTSnPplm59gNWTyim4bALJJHwruy6a
 Mg0kGUmcDJZ+Ty2bkziFbBp7/N5rDL2K6UJXwZG+ML/YfEFBIBH/9bXBc
 AOCHJSWezhJMOMJfHtA/AbXGGYzUhyTUzk+BAg0qiOBC1RKaEX10TdKFW
 LhGwdNlpmyav/ufnw2bu4Ru0B/ZlitWNLVHv8wTrkFFCbD2jmHazcSrLX
 QMNv4GGOJ7CjNjlx5HI5zWii5AWM6GGnAcEHNI+zQnwSCbAm69ykN2cSo
 rb7DpwIkSRrSyWNpS2zIiAcLYTjpjbY+sdsfxdO2dNhOarZtwAbimKR+P Q==;
X-CSE-ConnectionGUID: tpu7VLWaT7SUeUxLTomtuw==
X-CSE-MsgGUID: 4K7LfdoXTAWhgOZG/j2pmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="90606619"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="90606619"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 02:21:23 -0700
X-CSE-ConnectionGUID: r9xvM9UKRSm6/6Uqz8UjFQ==
X-CSE-MsgGUID: DlY93JetTCGr9ZxfPXNVFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3578435"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa012.fm.intel.com with ESMTP; 21 Sep 2026 02:21:23 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v10 08/10] drm/xe/vf: Add alignment check for queried VRAM size
Date: Mon, 21 Sep 2026 14:51:07 +0530
Message-ID: <20260921092101.1243989-20-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921092101.1243989-12-satyanarayana.k.v.p@intel.com>
References: <20260921092101.1243989-12-satyanarayana.k.v.p@intel.com>
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

Add explicit alignment check for VRAM size which can detect and reject
invalid configuration data from a misconfigured or malfunctioning PF,
preventing protocol violations and protecting VF initialization.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 1d79bde2ad73..37baeb1058b2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -598,6 +598,12 @@ static int vf_get_lmem_info(struct xe_gt *gt)
 		return -EREMCHG;
 	}
 
+	if (!IS_ALIGNED(size, SZ_2M)) {
+		xe_gt_sriov_err(gt, "Unaligned LMEM size %llu, expected %llu\n",
+				size, ALIGN(size, SZ_2M));
+		return -EINVAL;
+	}
+
 	string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
 	xe_gt_sriov_dbg_verbose(gt, "LMEM %lluM %s\n", size / SZ_1M, size_str);
 
-- 
2.53.0

