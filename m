Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0AEEB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 10:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA62C10E2DF;
	Tue, 27 Jun 2023 10:22:55 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D535410E2DF
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 10:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687861373; x=1719397373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j0G1MTAmoPNKC5/aU8XSPx2sQE090p/8VMH4pv/M72s=;
 b=gXk3lVdKuu9n/AcI0YVww5n8wlusGpul5EA9hSWwXrjmMv2l1J4xcTqj
 OVYDHqKybCarTSac2YvUiGW/dn+LOWkHBiQ0hhN3kLHHzNJUwrXh7end0
 kIkFbT2TdQif+EVOqXDzUFAnWrabIBdpIqo6pCv1RK47YtDHS6dfmli8g
 coLvu09tBAITsNRQhLISbf3DwbUsa8lySyuOfIMEiL8wDs7c4V2jMWVfn
 EtGyqlRn60HxrjQ9ayJqEqyOA153joqw6xQ3ebt20SJQRj6/xbXt6BvZG
 2/Nsw7dHAzGr3O4xoPkRIp5NVwFK6a2r1CuvTYTrnM65bymNosgTU3Ijr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="346295397"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="346295397"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 03:22:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="746146065"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="746146065"
Received: from jwerner6-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.48])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 03:22:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 27 Jun 2023 13:22:20 +0300
Message-Id: <20230627102223.260893-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627102223.260893-1-jani.nikula@intel.com>
References: <20230627102223.260893-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/5] fixup! drm/xe/display: Implement display
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Keep build list sorted.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 081c57fd8632..ac4e58784589 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -162,9 +162,9 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
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

