Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43804C88CB2
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 17:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1AA10E2BD;
	Mon, 12 Jun 2023 17:14:50 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82FF10E2B9
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 17:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686590086; x=1718126086;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ER/B6WMUrx3He6eQ7HDDsoArG8D11GcZHKHmo3aBjXo=;
 b=l0Ci6z4/MYyNH6MHHV1M3Z6zRAXtYNpJTJanvLRcHDtNeQMkA7joc+tg
 9AmTScRULOg4AwyGFqRkKvU6timq4U2/9V2sFWo23Fz8YorLKiO0WqKft
 fkEs8EdK1+ID5KEWMAd4mnZ1qRqGycNqsElYPa/3Uw+Fknyi5M838+Wjf
 hphSLVZJGMdTtKzR/8xcaD+GH4id2nm5OMpmidF5q4ZZqGc5of0aCm/JX
 XUNpPqgyL5KvmgTGjconwKcFOc0XtWrHSZMTdtfR53opyFAMxnaB9Jmnl
 DT1odEpcyCNmvWCUB+ErnBiIlSun0mUelOMCOFw7Z2lQrNLE8pH/zkisG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="342792778"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="342792778"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 10:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="688715218"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="688715218"
Received: from mgutier2-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.22.12])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 10:14:45 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 12 Jun 2023 18:12:20 +0100
Message-Id: <20230612171225.88689-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612171225.88689-1-matthew.auld@intel.com>
References: <20230612171225.88689-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v11 07/12] drm/xe/display: use mem_access
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
2.40.1

