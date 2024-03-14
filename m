Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0177CC54E67
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 03:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A495610F88F;
	Thu, 14 Mar 2024 03:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NEwQb9Qs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5260E10F82F
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 03:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710386628; x=1741922628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cEAEKOpUwOrf990KLD1pksvdKZuYxpiPbn8BjuK80zY=;
 b=NEwQb9QscwCH2CRjyenpHPoQv5w66rROPCic+dtUMVn+ka0a85BmY/Hk
 HGn8cwaQ+V4B68Ase/yjcx/ooI34VXJTPgIFeYFgGNl3ez5O0DKaaZ200
 94a8GPGYsP+NKMtIxgH/oMxvGj5DK94HQibMNJ18R+TsQ7Wi5jqLN68Qb
 fVRW3u4yWEtljTb0pH3uJRpiXDr5Wv48EMQ49gMokq+2YdJBd6rV6tfxf
 cfo6K0iF6SOIUjbRW+kqPr691iVW4sJVQUUy63dcB/XVmL/USu/61qlDj
 SQ0LMrIv2upbmScaQQp7C1X6miFxYfZgrEKLYhfKpYW9R+SuC+ZCbXf06 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="8966480"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="8966480"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 20:23:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="12084623"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 20:23:48 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, matthew.brost@intel.com, airlied@gmail.com,
 brian.welty@intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH 3/5] drm/xe: Helper to get dpa from pfn
Date: Wed, 13 Mar 2024 23:35:51 -0400
Message-Id: <20240314033553.1379444-4-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240314033553.1379444-1-oak.zeng@intel.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
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

Since we now create struct page backing for each vram page,
each vram page now also has a pfn, just like system memory.
This allow us to calcuate device physical address from pfn.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bbea40b57e84..bf349321f037 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -576,4 +576,12 @@ static inline struct xe_tile *mem_region_to_tile(struct xe_mem_region *mr)
 	return container_of(mr, struct xe_tile, mem.vram);
 }
 
+static inline u64 vram_pfn_to_dpa(struct xe_mem_region *mr, u64 pfn)
+{
+	u64 dpa;
+	u64 offset = (pfn << PAGE_SHIFT) - mr->hpa_base;
+	dpa = mr->dpa_base + offset;
+	return dpa;
+}
+
 #endif
-- 
2.26.3

