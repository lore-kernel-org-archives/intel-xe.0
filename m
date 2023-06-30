Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9262EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jun 2023 11:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B3210E458;
	Fri, 30 Jun 2023 11:50:39 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763D610E458
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jun 2023 11:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688125838; x=1719661838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QePURoipKSQ7rsoBYktZODwWyY/Zu/XIUom7fHQUBJk=;
 b=AjvSPQAEPe5iNvvFCR6xZ79/2Smg3l+N5BIJVRXgwrbLHX93ePIQmbBG
 bPBQlqp1VJCCXlsU8vt6lrxePgRsU5PjQtAAV2TgNUSOrbpELRqYget4j
 sG9n2ALG8Zk6bIdO63i8NxOIzjMKF5FWG261nSsd1MxXyoTfQVi82Ru1v
 Ly21DVjotFwF2YVmyThqlEHVAp+DfUDQ5rMDdSRqUskZawq62yz9mE4aw
 wE9m8gjZrD7QHefmBfBAWM6gGtcCw0/7Wc9Tq11YGmZ1moZS0I/5IeGHK
 XU+OcKn7/JZCmPPZf5VsV70vZUOe1WzRBJULHYas2xW5JAW+ah8SUeZEb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="361223357"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="361223357"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 04:50:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="667914100"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="667914100"
Received: from lpascal-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.49.62])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 04:50:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 30 Jun 2023 14:50:16 +0300
Message-Id: <20230630115019.123675-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630115019.123675-1-jani.nikula@intel.com>
References: <20230630115019.123675-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RESEND 2/5] fixup! drm/xe/display: Implement display
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Keep build list sorted.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a92b6cb9e4c1..1c33c1c76303 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -164,9 +164,9 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_ddi.o \
 	i915-display/intel_ddi_buf_trans.o \
 	i915-display/intel_display.o \
+	i915-display/intel_display_debugfs.o \
 	i915-display/intel_display_device.o \
 	i915-display/intel_display_driver.o \
-	i915-display/intel_display_debugfs.o \
 	i915-display/intel_display_power.o \
 	i915-display/intel_display_power_map.o \
 	i915-display/intel_display_power_well.o \
-- 
2.39.2

