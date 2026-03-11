Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B550D1125839
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 14:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7271210E8B0;
	Wed, 11 Mar 2026 14:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iW/p+XLG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD3610E291;
 Wed, 11 Mar 2026 14:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773238720; x=1804774720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kg4MrGpWlR+LO1U0ZFfn7UPACmzllVM920/Nejs9CZw=;
 b=iW/p+XLG4HguQQWewWtRPaKGElZzjVVLV05JO1hz0xlegXDieF8wQ+jQ
 2CVdyVgPgXED4HnCO2DB8N7mrJ8w/fQo/SS7yBwtW8QHiAKKtiixMduZA
 3jA2X935k0wnBQIcOLYsVIJHol6a8vBkmoVkKqaErGRgdi4MNrd64Qfgr
 3EFajexIqQcNW8Br1PUQidtox4Vnrh3CPsJu6WCnDF2/ZTkfjx3KJq4LF
 79upeHGatBUHt/EJblXKrTggsTTuN1SFcjKie8huBi35g0xtcAaFPJENB
 OKuT5B5nl/5NxlinsKKgDIh/ZzO257J1PntfS3ENrNSXDSjIwz17XryMl A==;
X-CSE-ConnectionGUID: wQwxew0TSxGuJ3cLeIeRBg==
X-CSE-MsgGUID: i2NG+CnNRHm2//MRcW1dkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74427371"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74427371"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 07:18:36 -0700
X-CSE-ConnectionGUID: ikpsoH9FTGavGlJG7DcowQ==
X-CSE-MsgGUID: oVZcw6Z+SMmQs9TdJAQCSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="219729412"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 07:18:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 2/5] drm/xe: rename intel_bo.c to xe_display_bo.c
Date: Wed, 11 Mar 2026 16:18:15 +0200
Message-ID: <2f73eda5117462407f12113ce096496282ee3fcc.1773238670.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773238670.git.jani.nikula@intel.com>
References: <cover.1773238670.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Follow the xe_ prefixed file naming in xe. With xe_bo.[ch] already being
a thing in xe core, use xe_display_bo.c.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile                                | 2 +-
 drivers/gpu/drm/xe/display/{intel_bo.c => xe_display_bo.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/gpu/drm/xe/display/{intel_bo.c => xe_display_bo.c} (100%)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 50608312bc66..aeede4423680 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -211,10 +211,10 @@ $(obj)/i915-display/%.o: $(srctree)/drivers/gpu/drm/i915/display/%.c FORCE
 
 # Display code specific to xe
 xe-$(CONFIG_DRM_XE_DISPLAY) += \
-	display/intel_bo.o \
 	display/intel_fb_bo.o \
 	display/intel_fbdev_fb.o \
 	display/xe_display.o \
+	display/xe_display_bo.o \
 	display/xe_display_pcode.o \
 	display/xe_display_rpm.o \
 	display/xe_display_wa.o \
diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/xe_display_bo.c
similarity index 100%
rename from drivers/gpu/drm/xe/display/intel_bo.c
rename to drivers/gpu/drm/xe/display/xe_display_bo.c
-- 
2.47.3

