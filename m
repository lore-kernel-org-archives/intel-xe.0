Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3ECC001B2
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD7A10E8E4;
	Thu,  9 Nov 2023 15:46:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A8F10E8E1
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544768; x=1731080768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FsU7wXudYSyQq/S48J2HEQuD33wH1AzBJLvI11wOFz0=;
 b=UgTP5fGQgHUbF5fGiYWaIWLYWnHnELNHL4llCZKgEEBA7mDPdTPFxN+U
 K6wtv/hkvWsJaDArcB40/BNF3TRFaSLwSQpuznqrjFKyT+LZ4Y4/DT6md
 FpPz/RLmZ6O8o84VCFR/7uV8RXEaqGPVkrjMWrsodPkC3+5KfRGUf+wMM
 /5sF9sCjFuDpCcBQjC5gkSoDesT4Fb3TxHSiBjovwW3UW7GnTWlXtC1L4
 rgGsiEkCyQmmS47pgD0D/UCyvVq6IUof6lVrncqf61iYcJibbvE57idsY
 WwB3F/ADW/ylNAgJBJ7OlB0exIU/vr/kceOgxK1V6njh9d7WGWLFry9a1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556704"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556704"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936886008"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936886008"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:29 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:28 +0000
Message-Id: <20231109154457.7-15-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 14/43] drm/xe/uapi: Remove unused inaccessible
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
index 3685eeff4b8d..549db8cb4e21 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -396,11 +396,6 @@ struct drm_xe_query_gt {
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

