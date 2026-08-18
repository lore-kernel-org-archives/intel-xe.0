Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E83EC5DF70
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 07:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC9410EA40;
	Tue, 18 Aug 2026 07:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QzlxQJhr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792B710EA3F
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 07:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787039212; x=1818575212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zpZV86KAlLtGHqfqlnowFNCkOb519A8JbZGffSfGGP8=;
 b=QzlxQJhrAgF0wcLB/0Q1GF4PaW/l/YPgGi1bhDVPVWmcxKMzZMHzntzF
 9OYiknKSwvVMUlhVo/SjFIFaPDw9eO2PUTurlaVP5/VIO40eUGQIDzhWp
 L9CrmL5oRKC3MExETyV92GqnkojQ3qAzYe2UIwtJJ2zNDK51td3/HU5Mb
 iZKSA6tzRjjgr96IT3vLIM/BHtPuH75n2LpHVc3LJMZL1u8zmYWmUDnPb
 P9Na5TrcUwE8oFfuKX1vlZAV2buBReOv0eb77ZDUl64rjR4GFCgaDEHbK
 ZlMcTbCa1FGgOM9asNXFDUt1fbJYZ3Tuk2iVQqKf9pys/DrNrwrOqyvYe Q==;
X-CSE-ConnectionGUID: aIJFnYQFRluqWl1D4/My8A==
X-CSE-MsgGUID: skzA+DsgTyW6s94eBbw+uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98886528"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98886528"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 00:46:51 -0700
X-CSE-ConnectionGUID: 4Lq3ynh7TXGVp+DUq2d50w==
X-CSE-MsgGUID: LvJf71y7Q9OG0jDTAO3r6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="265180960"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 00:46:50 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, raag.jadav@intel.com,
 riana.tauro@intel.com,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] drm/xe/xe_drm_ras: Enable CONFIG_DRM_RAS
Date: Tue, 18 Aug 2026 13:24:55 +0530
Message-ID: <20260818075454.1508724-2-balasubramani.vivekanandan@intel.com>
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

Xe RAS functionality needs DRM RAS support. Enable it.

Fixes: b40db12b542f5 ("drm/xe/xe_drm_ras: Add support for XE DRM RAS")
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 4d7dcaff2b915..6c584f918edf2 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -42,6 +42,7 @@ config DRM_XE
 	select DRM_GPUSVM if !UML
 	select DRM_GPUVM
 	select DRM_SCHED
+	select DRM_RAS
 	select MMU_NOTIFIER
 	select WANT_DEV_COREDUMP
 	select AUXILIARY_BUS
-- 
2.43.0

