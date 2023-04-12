Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B07BC77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C43710E82A;
	Wed, 12 Apr 2023 14:26:18 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA60D10E835
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309575; x=1712845575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1SQqkhL72hETkpg21oqiPLJ9wDM4Z173lKc/qbr3drE=;
 b=anrFPsHc57lnpv1qsH2epxcBMUC/TgWK+YxwyPNEPhitGqmdT2VctHtL
 goyZedZlrBvuqMWRnjN32OJAbr1gHbDB25nks0pC6HDmJrsA8OBljYq5y
 6WFr9ePlAUoKYFta9GUJ+tDCvRhuVdV7kJxkmgTID3Y0oqxqePg9WAL81
 uMDxUAyB3y7bnDkdnk0YwzXgwjaqjEfyalOL1gh8+4+uDUl9ZDXGka458
 uv9XAaAoSgfWI2OIy9HPs//PeF2sKmhZin1PyjgSq6TMLTeS3C75oK+zD
 POAAAclktUChPbTADLelAkk/kZ84wBevVLGPKS/0A8mPQ8JWApc2ha2nl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="328021566"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="328021566"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="666376010"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="666376010"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:26:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:54 +0300
Message-Id: <20230412142006.877109-30-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 29/41] fixup! drm/i915/display: Remaining changes
 to make xe compile
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

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index fa06b7b78e25..6698e1a47f0f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -1097,9 +1097,8 @@ void intel_display_debugfs_register(struct drm_i915_private *i915)
 	drm_debugfs_create_files(intel_display_debugfs_list,
 				 ARRAY_SIZE(intel_display_debugfs_list),
 				 minor->debugfs_root, minor);
-#ifdef I915
+
 	hsw_ips_debugfs_register(i915);
-#endif
 	intel_dmc_debugfs_register(i915);
 	intel_fbc_debugfs_register(i915);
 	intel_hpd_debugfs_register(i915);
-- 
2.39.2

