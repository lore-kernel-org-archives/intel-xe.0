Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF161C10DC1
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 07:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A7510EA0C;
	Fri,  8 Dec 2023 07:56:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5052D10EA0A
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 07:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702022201; x=1733558201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HGIAvFHoML2XiIoU5g91Pk0GW6HyTsgBmBwcsh5zlF8=;
 b=KhGFzN2JIlQMqHbuiWkENbM0ogrO6Tpfx4kTGkEQOOz6z5JJxVdvezfI
 o/lxks2BI5Q6cff4niaDZx2tLb7k08TDdrecA45JH4TQTFOGf6Vq214b2
 LkG8TbFxuyHs8q+uo+gBHQ/EcDoXS7kd81YMTpU7TqD4C4YcTtrj3YN7/
 fbKTRwZGRrHiak/9Ns91hNWL1ehcqzPyMiOQPekiCdwM9mA2UZkGFUajw
 DBPrsZ+eFvSOQvEDhGb50l+q9Zml/p9EVlbe2Ez7PHO/3mtxx7YaiUGn2
 YLLlsxf5pA2yuKoA7YUopAJkqRdY0kYisUkoGWr4X/aNSBveC0VhqKz77 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="391542411"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="391542411"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 23:56:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="838044729"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="838044729"
Received: from cannonro-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.63.126])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 23:56:39 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 4/9] fixup! drm/xe/display: Implement display support
Date: Fri,  8 Dec 2023 09:56:05 +0200
Message-Id: <20231208075610.3005795-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208075610.3005795-1-jouni.hogander@intel.com>
References: <20231208075610.3005795-1-jouni.hogander@intel.com>
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
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../compat-i915-headers/gem/i915_gem_object.h | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
index d226c29f0e6a..5f19550cc845 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
@@ -31,4 +31,35 @@ static inline bool i915_gem_object_is_userptr(const struct xe_bo *bo)
 	return false;
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

