Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578E1C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 17:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE33710E8EB;
	Thu,  9 Nov 2023 17:51:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCFF10E8F1
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 17:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699552264; x=1731088264;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lG0Tw4X6za98LgK5AoYerdJ03evYLJ3sUVnLS/4Y8Ds=;
 b=HLwwIJjMINmvptvf2AOAEZftstbmo1KyA1RL0GUf2KucATNa/sJveOhe
 Q50jk0mY08nApJJBG8WWXVLeJAsKUHRfYGK4eI/u90hWRyOe1l8A6EGIH
 M/ssssufm0rArxmbeDKFHJtQgncFso5QU3pSCrU/SXH+6E7OR3D7/GaC9
 xbcAKVtAV4TTs+6+gzCNRQLkrO3TEuVAN5iwkvGEDHStS2yGWkLOYBT1u
 3bO1nuxHn7MJU2JJ16IEv8ZdFMrnUb2XZBeZc4zF5gZeua6hVjm6Cz6Ec
 v18VRlI5AM9tZxB6TZ2ktMw6R1oKNRhttx3MpUWnhVGdvlR7ULE5SXVuM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="3012959"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="3012959"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 09:51:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11219300"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 09:51:03 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 09:51:31 -0800
Message-Id: <20231109175132.3084142-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231109175132.3084142-1-lucas.demarchi@intel.com>
References: <20231109175132.3084142-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] fixup! drm/xe/display: Implement display
 support
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Due to the way we build i915-display for Xe, we can't have both i915 and
xe as builtin, otherwise there will be symbols defined twice. This can
be improved later by renaming the symbols in the source (redirecting via
macros) or during build via linker/objcopy.

For now, just fix alleyesconfig. If i915 was not selected it could
be left builtin, but it'd be a weird dependency on another driver. So,
just make de dependency be "if display is selected, xe must be built as
module".

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index c66c4466e8b8..2fa2d6dacb96 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -47,7 +47,7 @@ config DRM_XE
 
 config DRM_XE_DISPLAY
 	bool "Enable display support"
-	depends on DRM_XE && EXPERT
+	depends on DRM_XE && EXPERT && DRM_XE=m
 	select FB_IOMEM_HELPERS
 	select I2C
 	select I2C_ALGOBIT
-- 
2.40.1

