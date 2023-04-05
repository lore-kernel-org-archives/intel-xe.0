Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C412DC761A6
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CE010E9FD;
	Wed,  5 Apr 2023 15:41:00 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFE010E9FD
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680709259; x=1712245259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B0O19iJyJSqtxsllDg0LpaMQIM6KbEpCL4gIlWtZ1sw=;
 b=WA3gJoYbU2k2S/UYv/JGom0Blz+SWGxLOhml27qujBTsf9cZVBtg60f3
 qXA+7ThO38IeqN31KsROjp/eXhxoe6Rh/D58B573GuRjf1Z4JTmx03sml
 knsTEcV8RfYEQUBsvtU2VyG0jQ81eyWmIWJBZ3Jk4h1Q0UkE9Hb0qTjLL
 Nc2ETvwDcSS/MFTVw80HRdO51DIzLwurDKgExGUDnWbFsfc3vQul59lQd
 ntSh/OlgpR8rzDBQU9DrLu2QtI6z5f+W2YBYWf1WK14pV4LTPKGsksEB1
 2bW1Cg7pZFriGS28cHCgEI4qUSzTfGTomWHjCxw/aPWcB3ryJPSOMsi9D Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="342501146"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="342501146"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="756033533"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="756033533"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 18:39:17 +0300
Message-Id: <20230405153920.926583-19-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405153920.926583-1-jani.nikula@intel.com>
References: <20230405153920.926583-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 18/21] fixup! drm/xe/display: Implement display
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

Remove intel_sprite.o from xe

The legacy sprite support is not needed on any platforms supported by
Xe.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 7e4892e73dc2..aceca651de57 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -186,7 +186,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/intel_qp_tables.o \
 	display/intel_quirks.o \
 	display/intel_snps_phy.o \
-	display/intel_sprite.o \
 	display/intel_tc.o \
 	display/intel_vblank.o \
 	display/intel_vdsc.o \
-- 
2.39.2

