Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44FCC7EE23
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 08:05:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728A110E457;
	Wed,  7 Jun 2023 08:05:03 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7699110E457
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 08:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686125101; x=1717661101;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fTjN8DfiYAXSfdIzVcSEIPzoEBHbVGJe+LgNnpcPo8w=;
 b=ibZUAhlzm9793j09k7x+0u8Q9gzYTRfM1BL8LlytaLQDa8vbProYDA4H
 2Oao1XNqU+L0lX1G4bl4ybGNCZWJUd15xALy1eLhByLm7rMcL71epjNbN
 RcfKNOzlhb/HsvoYEeU/hLrSIK52HhfFlteSIECEcOgDZSSr1QD26R166
 xr7hucjrDwd02AD4BfLPswC1PvVmn/Tzs98yFtw7Y6C7BizAF8ABhfTqh
 Y+n6bDdBLe+58tPLZSkPu/SKYSoAFMedlsb+sDEYsGqCPBHxBLo9BLhqO
 II+0EPiZzWImEFnN9sV3YgQEo9MJHQpyaQ0BcaET7sQLBbYyJ/O9UXUs6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="443286241"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="443286241"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 01:04:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="739113826"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="739113826"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 01:04:54 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  7 Jun 2023 13:40:04 +0530
Message-Id: <20230607081004.887428-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Donot apply forcewake while reading
 actual frequency
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
Cc: vinay.belgaumkar@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The registers RPSTAT1, MTL_MIRROR_TARGET_WP1 doesn't fall under
any of the forcewake domain so doesn't require forcewake to be read.
When GT in RC6 frequency reported will be 0.

Fixes: 7dbca224f176 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 67faa9ee0006..d04600b943e4 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -371,14 +371,8 @@ static ssize_t freq_act_show(struct device *dev,
 	ssize_t ret;
 
 	xe_device_mem_access_get(gt_to_xe(gt));
-	/*
-	 * When in RC6, actual frequency is 0. Let's block RC6 so we are able
-	 * to verify that our freq requests are really happening.
-	 */
-	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (ret)
-		goto out;
 
+	/* When in RC6, actual frequency reported will be 0. */
 	if (xe->info.platform == XE_METEORLAKE) {
 		freq = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
 		freq = REG_FIELD_GET(MTL_CAGF_MASK, freq);
@@ -389,8 +383,6 @@ static ssize_t freq_act_show(struct device *dev,
 
 	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-out:
 	xe_device_mem_access_put(gt_to_xe(gt));
 	return ret;
 }
-- 
2.25.1

