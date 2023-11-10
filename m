Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E910C4167B
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 15:42:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD7010E108;
	Fri, 10 Nov 2023 15:42:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2CFA10E108
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 15:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699630932; x=1731166932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DO0tpyt+7vlfNH/pC4Zdgj/s1I5nkrwreaBatFn7+lE=;
 b=exPNz2b+f8TTxAI3hs7OhrEVRv3AaC8Phj5NI7iwycDLBx05CK2sqPEz
 aiVH2rhrakWOJHv49zHv2hXVH874oQaI99eBBinny0Hd9G3bSjOaj28pQ
 9Dehsuw7l0ombxLpJECEkI/TP9gDL6GeprRUsbKETynWMOEzl+uA64Vvd
 4nc8XYMPcHOw7bf0egWzEQfYOPy4AofM9TD8JWvdazh65kSnpeSn0gRIV
 cDvaTz5xDxa9Z9R6GmVc642hK/n87rYrptW0h7tJJKikyW1PAPIGH7KZC
 H/ZNTo3QwrPuVV9NPxR0eY0ajbqRBDoUDaJZxpwwcsnLBcYVn512wDsZH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="394104139"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="394104139"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 07:42:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="937193717"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="937193717"
Received: from jponna-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
 ([10.249.43.153])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 07:42:11 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Nov 2023 15:41:53 +0000
Message-Id: <20231110154156.6-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110154156.6-1-francois.dugast@intel.com>
References: <20231110154156.6-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v1 4/7] drm/xe/uapi: Remove unused inaccessible
 memory region
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is not used and also the negative of the other 2 regions:
native_mem_regions and slow_mem_regions.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 808d92262bcd..0f8c5afd3584 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -360,11 +360,6 @@ struct drm_xe_query_gt {
 	 * they live on a different GPU/Tile.
 	 */
 	__u64 slow_mem_regions;
-	/**
-	 * @inaccessible_mem_regions: Bit mask of instances from
-	 * drm_xe_query_mem_usage that is not accessible by this GT at all.
-	 */
-	__u64 inaccessible_mem_regions;
 	/** @reserved: Reserved */
 	__u64 reserved[8];
 };
-- 
2.34.1

