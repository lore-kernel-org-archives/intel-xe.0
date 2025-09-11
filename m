Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEBBCAC587
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 21:05:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DED10EB8D;
	Thu, 11 Sep 2025 21:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oG1b0RSr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABA010E0A0
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 21:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757624720; x=1789160720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xrloen6OLKbIvBuYB2Wom07h0FUyDuH0bAGxALZ5LUQ=;
 b=oG1b0RSr9BSiDycOJKG044RF+LUfDPlltf2WRVefyTxhwVU1S3pwuTAm
 uT3J1SvpFjSLCb+JZuuVtE3LMy46UMyAAyWhiAwMwb3nVkbF3uf55R/bW
 ymDtOiImPU0bVrV7oXbJHiQwfcukoYR8bUJkwvtNeGpKADENP7zGK+eDu
 mNYftwk0K7iudn02qMMHFUNqNDu4eXYnowZxbgkaL8ioTcTzHAKmpsjx6
 0SEAEL2hlfsAsFxMgTVIxJVioSlZ8Zd0sdIQEhLZ69kBvJaQSf4LLHPNU
 +E4IWoheP31cOW8OUNNEbuw6KWO3nWU0DP/kCaCQnstlk/q5A1SeJ1bSr w==;
X-CSE-ConnectionGUID: nCDNfLR9SzKcG4pRIBmPyQ==
X-CSE-MsgGUID: UmD5VxlGRUeHCnJn5qKrVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="71070351"
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; d="scan'208";a="71070351"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 14:05:20 -0700
X-CSE-ConnectionGUID: zIScT0BbRqGTDTKrLvh5uw==
X-CSE-MsgGUID: VQpEZmM/RWuUawSZgViIGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; d="scan'208";a="173361329"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa007.fm.intel.com with ESMTP; 11 Sep 2025 14:05:19 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 2/3] drm/i915/display: Add definition for wcl as subplatform
Date: Fri, 12 Sep 2025 02:35:13 +0530
Message-ID: <20250911210514.389014-3-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911210514.389014-1-dnyaneshwar.bhadane@intel.com>
References: <20250911210514.389014-1-dnyaneshwar.bhadane@intel.com>
MIME-Version: 1.0
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

Update the device definition structs for adding wildcat lake as
subplatfrom of pantherlake.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 13 +++++++++++++
 drivers/gpu/drm/i915/display/intel_display_device.h |  4 +++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index 65f0efc35bb7..1b9c921290e1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -1379,6 +1379,11 @@ static const u16 mtl_u_ids[] = {
 	0
 };
 
+static const u16 wcl_ids[] = {
+	INTEL_WCL_IDS(ID),
+	0
+};
+
 /*
  * Do not initialize the .info member of the platform desc for GMD ID based
  * platforms. Their display will be probed automatically based on the IP version
@@ -1406,6 +1411,13 @@ static const struct platform_desc bmg_desc = {
 
 static const struct platform_desc ptl_desc = {
 	PLATFORM(pantherlake),
+	.subplatforms = (const struct subplatform_desc[]) {
+		{
+			SUBPLATFORM(pantherlake, wildcatlake),
+			.pciidlist = wcl_ids,
+		},
+		{},
+	}
 };
 
 __diag_pop();
@@ -1482,6 +1494,7 @@ static const struct {
 	INTEL_LNL_IDS(INTEL_DISPLAY_DEVICE, &lnl_desc),
 	INTEL_BMG_IDS(INTEL_DISPLAY_DEVICE, &bmg_desc),
 	INTEL_PTL_IDS(INTEL_DISPLAY_DEVICE, &ptl_desc),
+	INTEL_WCL_IDS(INTEL_DISPLAY_DEVICE, &ptl_desc),
 };
 
 static const struct {
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 6e87b763fe7c..dcc010caa423 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -101,7 +101,9 @@ struct pci_dev;
 	/* Display ver 14.1 (based on GMD ID) */ \
 	func(battlemage) \
 	/* Display ver 30 (based on GMD ID) */ \
-	func(pantherlake)
+	func(pantherlake) \
+	func(pantherlake_wildcatlake)
+
 
 #define __MEMBER(name) unsigned long name:1;
 #define __COUNT(x) 1 +
-- 
2.51.0

