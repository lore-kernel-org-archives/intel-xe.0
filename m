Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6216FEB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 10:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CE910E1F0;
	Mon, 26 Jun 2023 10:51:16 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC8A10E1E8
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 10:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687776674; x=1719312674;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xmGdYKKfAsD3pUGCu0bnS3vLs9xxIOJKsm0/WrifBac=;
 b=YtrMrQokzh8s3NrsRF08NCR0OA1EqjgACP2s3KUxRnnyrcLkEqC9sbdW
 fWDXO7Hf1ztArNZ5Cikpf+My/dhVFvmaHREbDOhdWvzxALkaKyO630dp9
 DVN6bsetTZ1EsMY+yLFfcyzGgtStOMkvaWmXRKsy8ufvTNCHrbOq02Tm0
 yi9ezaNLSs5jf+y7g9aMzINUFa+WS5bxoSNwuu8Fi32bYzonZHbzEcxmL
 hw38Y4ATbzxz2wRAxT5OgHhOIuezbY/PX6FHsWSl/0PDxrVB0Jo87eAd0
 BRCq61XEgSWv0/LkaGXKZZaRnUJoo8/TnOpn90jm3OMPVIr+AnnACDeS4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="361279992"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="361279992"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="829182804"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="829182804"
Received: from cbrady5x-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.8.226])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:51:13 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 11:50:46 +0100
Message-ID: <20230626105037.43780-23-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626105037.43780-15-matthew.auld@intel.com>
References: <20230626105037.43780-15-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v12 08/13] drm/xe/display: use mem_access
 underneath
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

There are places in the display code (i915) doing mmio access.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 59bf1d4a61d6..7a43f3af1796 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -151,6 +151,7 @@ static inline bool intel_runtime_pm_get(struct xe_runtime_pm *pm)
 		xe_pm_runtime_put(xe);
 		return false;
 	}
+	xe_device_mem_access_get(xe);
 	return true;
 }
 
@@ -158,14 +159,14 @@ static inline bool intel_runtime_pm_get_if_in_use(struct xe_runtime_pm *pm)
 {
 	struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
 
-	return xe_pm_runtime_get_if_active(xe);
+	return xe_device_mem_access_get_if_ongoing(xe);
 }
 
 static inline void intel_runtime_pm_put_unchecked(struct xe_runtime_pm *pm)
 {
 	struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
 
-	xe_pm_runtime_put(xe);
+	xe_device_mem_access_put(xe);
 }
 
 static inline void intel_runtime_pm_put(struct xe_runtime_pm *pm, bool wakeref)
-- 
2.41.0

