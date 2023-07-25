Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F4EC001DE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 00:34:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0FE10E143;
	Tue, 25 Jul 2023 00:34:42 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80B510E10C
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 00:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690245278; x=1721781278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EqEMuOvl/WhHCtNpvcf3CRzAkxlLSqPEAg19YvrnOrs=;
 b=hvCjCLWmV4PHLMM90K/KRgkUpHRGrPoDgprP4zVjKBOzBRXEANApL7Ns
 xEtSZdDe/UQ12ZaISzxM3DeZ6b6IXgh7aeMBjXIubuGAJaNTvSuKBWPvM
 kWUYos8JBVeCDh0HKI32I37WGnRVDNix3HoWCfnI5z9yGhSIZki4zsxIr
 HU5xa39DexvyDGPViy5ScpU6qvQ+CGsq+SlXh7GfCiWAf9wvAWZ3KbuO+
 qPYthCKs0vCcx6y7XJdXijCr+FFsBublJN2VKajUroJ2BkoQDRgtDtTvg
 Oi23mX8ffpuqkoHkiZ32BcnlmG6Sp6Y1LNdMetXxwgZZNiwc7K4S8zc1a A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="370254972"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; d="scan'208";a="370254972"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 17:34:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="703099685"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; d="scan'208";a="703099685"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 17:34:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 24 Jul 2023 17:34:35 -0700
Message-ID: <20230725003433.1992137-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725003433.1992137-3-matthew.d.roper@intel.com>
References: <20230725003433.1992137-3-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe: xe_engine_create_ioctl should
 check gt_count, not tile_count
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Platforms like MTL only have a single tile, but multiple GTs.
Ensure XE_ENGINE_CREATE accepts engine creation on gt1 on such
platforms.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 59e0a9e085ba..0102dad16e29 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -416,7 +416,7 @@ find_hw_engine(struct xe_device *xe,
 	if (eci.engine_class > ARRAY_SIZE(user_to_xe_engine_class))
 		return NULL;
 
-	if (eci.gt_id >= xe->info.tile_count)
+	if (eci.gt_id >= xe->info.gt_count)
 		return NULL;
 
 	idx = array_index_nospec(eci.engine_class,
@@ -539,7 +539,7 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, err))
 		return -EFAULT;
 
-	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.tile_count))
+	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
 		return -EINVAL;
 
 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
-- 
2.41.0

