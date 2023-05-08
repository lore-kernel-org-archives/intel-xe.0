Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2CAC77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 14:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF5D10E2DE;
	Mon,  8 May 2023 14:47:09 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C4E10E2DB
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 14:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683557226; x=1715093226;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G/3/gNy+juDtWRRnB7Me84XDc0a8odiJY75eMWk5t0s=;
 b=HpkUjwTi0tSMblhPG0ywkvINEeEEKTFUZQNOe3Mbe5eHQYBd6yH7oTky
 Uvu9FcEv6zf1byfN97AmVnnJ9RyOotcgylHty+g423w+iQbJMnlTLGAXK
 OhiJr+60oqG1/F9IryICxDhpEDkFYR3tDEOimTFzUC+I5bLx+sDl7ahHw
 ZBuji5gIWMiJVSRFGVbcUXYArmSwcjKRhX4qY7irCXKPp4k+Ekbsa381x
 Dh0AhzhZqfyUhY5FD1Ey8ilg1EM7T7lT+nB5P4LewQKNpNq0gEaP4d2jR
 FDHKhPlYwDL3xgUxJGFE7G1rjfzlN3VR44ZPJ69pRwv1H9AF8maIha/EX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="349697756"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="349697756"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 07:47:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="788122215"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="788122215"
Received: from heid-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.62.78])
 by fmsmga003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 07:47:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 17:46:07 +0300
Message-Id: <20230508144618.162140-8-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508144618.162140-1-jani.nikula@intel.com>
References: <20230508144618.162140-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 07/18] fixup! drm/xe/display: Implement display
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove -DBUILD_FOR_XE=1. No longer needed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e5130613a943..b6c41cd7dbe3 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -103,7 +103,6 @@ subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
 	-I$(srctree)/$(src)/compat-i915-headers \
 	-I$(srctree)/drivers/gpu/drm/xe/display/ \
 	-I$(srctree)/drivers/gpu/drm/i915/display/ \
-	-DBUILD_FOR_XE=1 \
 	-Ddrm_i915_gem_object=xe_bo \
 	-Ddrm_i915_private=xe_device
 
-- 
2.39.2

