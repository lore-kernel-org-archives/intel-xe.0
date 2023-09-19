Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E217CD54AA
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 08:36:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E164A10E002;
	Tue, 19 Sep 2023 08:36:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B8810E002
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 08:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695112606; x=1726648606;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WIUcril0LL3q4d4aJAOCoxZ2Mq3Ue1KHHvrSh9vcN34=;
 b=LJk/EjIlBA9G5p2RlV8q3cON5AzjUesu9InaYCFLrdNhMnhdYAdFHudy
 njAgRV1Sa23D22gsAeqIdXlaYRiK6IGznZSIG7qCJGocf4sWkdOqoeMN+
 hDipSjyZA8MzULVfvch5CmJwm9vse039AQG2cGB2O3UbYH2//nyoZbXss
 UGL9lQAa74Ks1dlYYtO5xVlfO0h/d2+MT3IVONXiWtj9zPGdUFp/xztJf
 bb7Zf8+ZJNVeCVi3n9hui7FHKIQRBf53KAALSeonDsHbvj7Cp6LErOsIq
 QF64I1A0mQ4cwhDLQQrRWkKHmds9dUc+Zi5WShQTc31bfKu5+0JOtPDHt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377197306"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="377197306"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 01:36:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="836349236"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="836349236"
Received: from sorenthe-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.70])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 01:36:44 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 10:36:27 +0200
Message-ID: <20230919083627.10955-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe/display: Implement display support
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

When selecting CONFIG_XE_DISPLAY, the following missing symbols can be
seen unless something else has selected the corresponding configs.

ERROR: modpost: "cfb_copyarea" [drivers/gpu/drm/xe/xe.ko] undefined!
ERROR: modpost: "cfb_fillrect" [drivers/gpu/drm/xe/xe.ko] undefined!
ERROR: modpost: "cfb_imageblit" [drivers/gpu/drm/xe/xe.ko] undefined

Make sure these are included in the Xe Display build.

v2:
- Use "select FB_IOMEM_HELPERS" (Maarten Lankhorst)

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 096bd066afa8..d57181ff47e6 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -45,6 +45,7 @@ config DRM_XE
 config DRM_XE_DISPLAY
 	bool "Enable display support"
 	depends on DRM_XE && EXPERT
+	select FB_IOMEM_HELPERS
 	select I2C
 	select I2C_ALGOBIT
 	default y
-- 
2.41.0

