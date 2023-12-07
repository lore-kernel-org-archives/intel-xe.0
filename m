Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA172C10DCE
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 11:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0FD10E885;
	Thu,  7 Dec 2023 11:17:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CB610E884
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 11:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701947850; x=1733483850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LhLwmn39gn7GTxST43evDVqk0kRqWPRZ4hB64LRWCjA=;
 b=NqIKVmpca7RQe2yaqFJbv5MJjsU0M+FOIfv1hct/d0Pk91SrpKY8uHJJ
 Zrk1O4EJdhOvfqwout2abj82B3m25CDKXAVpR0nZQwPg9OXJU5h262QZn
 ueYL+TGs26qNcfCtz3V5x9ohZ75754//qA7vnGYFp1eO6CdD1VoysPDGh
 HmBJvZ2E11bzhiGo9xS1TprsDqL9P84XzR2wjW5696KVLF2sWJLTWqCZE
 zsxm4cDiGxQ4EvoElqx5Qq4NHwvmDKHaak632mCxwuZfot+9IczoLyQ11
 M+XX/driTggBETZhkTrw9bNhOt/sXdAKMiShf/iyVGcUEr1J34FCk69RG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="460704540"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="460704540"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:17:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="837686008"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="837686008"
Received: from rlgreyi-mobl.amr.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.46.17])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:17:28 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/9] fixup! drm/xe/display: Implement display support
Date: Thu,  7 Dec 2023 13:17:01 +0200
Message-Id: <20231207111706.2293105-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207111706.2293105-1-jouni.hogander@intel.com>
References: <20231207111706.2293105-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We need to add i915_gem_object_read_from_page to build intel_display.c.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../compat-i915-headers/gem/i915_gem_object.h | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
index b991069b5cb3..eaab536f465f 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
@@ -17,4 +17,35 @@ static inline dma_addr_t i915_gem_object_get_dma_address(const struct xe_bo *bo,
 	return n;
 }
 
+static inline int i915_gem_object_read_from_page(struct xe_bo *bo,
+					  u32 ofs, u64 *ptr, u32 size)
+{
+	struct ttm_bo_kmap_obj map;
+	void *virtual;
+	bool is_iomem;
+	int ret;
+
+	XE_WARN_ON(size != 8);
+
+	ret = xe_bo_lock(bo, true);
+	if (ret)
+		return ret;
+
+	ret = ttm_bo_kmap(&bo->ttm, ofs >> PAGE_SHIFT, 1, &map);
+	if (ret)
+		goto out_unlock;
+
+	ofs &= ~PAGE_MASK;
+	virtual = ttm_kmap_obj_virtual(&map, &is_iomem);
+	if (is_iomem)
+		*ptr = readq((void __iomem *)(virtual + ofs));
+	else
+		*ptr = *(u64 *)(virtual + ofs);
+
+	ttm_bo_kunmap(&map);
+out_unlock:
+	xe_bo_unlock(bo);
+	return ret;
+}
+
 #endif
-- 
2.34.1

