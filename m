Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7297BC7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:39:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C5110E9FE;
	Wed,  5 Apr 2023 15:39:54 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA6C10E9FD
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680709191; x=1712245191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Ra+hdjBSkKKHuqA/8+KFhiAd9YiwAONclYGWKy8oEU=;
 b=DUxZSgbQBdVNvJ/ToaZ05eWPRXlumB7qTKYr25iQNqsQTgsQUu2YdP0T
 xe+bqoeDNbd4zfqciPJEGkgZ5bqvdWemugfTL1PBWbAtQFwrXnrWCM+fB
 jPoIJZXR5ec7GaQFiAdzKrySlRPTewQ3X16piKl+VcwzG9fFqsaztQGAr
 2VRb5brD6x9k6XuwNPedaB135js86irJJO+DW55wq8wHR16xIjpP/klps
 AJ2dqGAdU49efZ7p741tkowxXj4BK3kzpemtDz6b+Oy5z2lKEInXtKNTq
 mHH8VjKKbE2wU0yCQMoMLtExdj3NcNiaO2bt5PlPhwAkKsns/5RaAtWE3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322865055"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="322865055"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:39:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="680327019"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="680327019"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:39:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 18:39:03 +0300
Message-Id: <20230405153920.926583-5-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405153920.926583-1-jani.nikula@intel.com>
References: <20230405153920.926583-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 04/21] fixup! drm/xe/display: Implement display
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
Cc: tvrtko.ursulin@linux.intel.com, Jani Nikula <jani.nikula@intel.com>,
 joonas.lahtinen@linux.intel.com, lucas.demarchi@intel.com, daniel@ffwll.ch,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove intel_lvds.o from xe

LVDS support is not needed on any platforms supported by Xe.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 7e19a15af3dc..7e4892e73dc2 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -177,7 +177,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/intel_hotplug.o \
 	display/intel_hti.o \
 	display/intel_lspcon.o \
-	display/intel_lvds.o \
 	display/intel_modeset_setup.o \
 	display/intel_modeset_verify.o \
 	display/intel_panel.o \
-- 
2.39.2

