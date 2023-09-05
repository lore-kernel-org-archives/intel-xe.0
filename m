Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FA8C83F2C
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 14:14:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80E210E52C;
	Tue,  5 Sep 2023 14:14:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2DA10E52C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 14:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693923284; x=1725459284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MKPirzSEC4cHGQbLwoQpZogC13epjDRgr67IRd5678E=;
 b=dH95/zA9pQzL5QgnhRvwmrtQYUHQkrCOKURXewxEaK5xcvbeUeyL0ZYE
 2Q50IN9xmgUQq6Ag/MRcWqbu5yB7OfRolk//P4bFH8xSwXzSCJA7kfNsP
 W0TpQIF335oQ0WNPcO6nbMixxrrrSpgCZAzRCVB6LxM485vkIps9bn4Bh
 ssMB76c1Kj4JT3Gby+htUmTprfLdewksjFDwOUTOA3M8iYPgruBuAH4ok
 4WvlSslfmKnQIIiVVCFGeiVlqJeLUzlfho8idJwiw7Vybqppat3gVAR/L
 SprTElhCQtP4ooBqjlABzkZBcoPNLLbY/6eFdmsyupAHYW3t5n4Wv97Is w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="407794922"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="407794922"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 07:14:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="806626598"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="806626598"
Received: from amyachev-mobl3.ccr.corp.intel.com (HELO localhost)
 ([10.252.60.152])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 07:14:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Sep 2023 17:13:45 +0300
Message-Id: <20230905141347.1027082-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905141347.1027082-1-jani.nikula@intel.com>
References: <20230905141347.1027082-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/5] Revert "FIXME: drm/i915: revert the earlier
 mmio_offset change"
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
Cc: Jani Nikula <jani.nikula@intel.com>, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit ada332ee9c5d65590377719f3d5f6a8b10afdd53.
---
 drivers/gpu/drm/i915/display/intel_display_reg_defs.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
index 2f07b7afa3bf..42199c1dc55d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
@@ -8,7 +8,11 @@
 
 #include "i915_reg_defs.h"
 
+#ifdef I915
 #define DISPLAY_MMIO_BASE(dev_priv)	(DISPLAY_INFO(dev_priv)->mmio_offset)
+#else
+#define DISPLAY_MMIO_BASE(dev_priv)    ((dev_priv) ? 0U : 0U)
+#endif
 
 #define VLV_DISPLAY_BASE		0x180000
 
-- 
2.39.2

