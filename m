Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CEFC0018A
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11D110EA09;
	Fri,  3 Nov 2023 14:35:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3C610EA03
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022129; x=1730558129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nfWujyqXb5pFEARvm0IA6IRARx8tt6fBkfY8mjO6qRU=;
 b=Id1YMV58rW6phPqg1sNBShTMaOwLZQVWgtobva0U+jO2+xP1ebUTtllr
 o/2KuYhCvrBarmIixnNR5pEGDgYmD6n5RvIdDletfoEK08trkPC+TmE2+
 EvGwK1uVGC7VobJ3Okh0lFe2RgNuhGA3XhBNd5NiLZle6kmv0crc8/Ifu
 H2+YQYNHDOjmoEWEC5KolsF/Efz7W4rbjwHnnZRtyIEhvd29Qkfa6Z3iz
 2nLCIDX7/2aQjpFWA+mcmuwx85bFIxT+7Sj3BdiD0l5jfnI1E502s0/Qd
 Q/gV+cbtoZofU/kVaSm0tNsf/C3ijbhVj9Ue7F4qFf0YGGkvAkSjT9Npr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843369"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843369"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832459"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832459"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:28 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:22 +0000
Message-Id: <20231103143456.7-17-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 16/50] drm/xe/uapi: Remove unused inaccessible
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
index a688691458f9..d8bc29c8f059 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -393,11 +393,6 @@ struct drm_xe_query_gt {
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

