Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5A2C55176
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 02:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA61810F114;
	Fri, 31 Jul 2026 02:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0zwA60a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55E810E1A2
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 02:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785464686; x=1817000686;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zZ/k5VwLWOhG0bsoKHPz+7v3+O4OVQ9gci+zcZ4hUeU=;
 b=O0zwA60adoR8OjDG5gFVmwr+/4KRpIyiAmgPVu3+095lf+FEbutu1CZu
 qZHNkpVecGCp6zunexL8id/j+buWMTMNrbZdNWu5WGjBMhWY4LIU9L+Gf
 Ly/xSSCtA2TO8/rW3MDlUNtAEIJKA1AJr7uz8cys3bcOC1IYlfniuWt3P
 Slf3jAG8MAd/H1spz61g4ub6vj2b4vmzz+7HdqLPt9H8CtaL9oO6dFnJU
 Vn8lSS0LC8YSYHVvsFWGmEA9e0Vbq521TCyMkid9xths/SVFxyjBwtbjD
 JW2h8gVHOf75rh55RF4yyyFFyjAJBCSKZmYCzoR9P1Qkn7ryvs7us7Vk7 Q==;
X-CSE-ConnectionGUID: 1uQVNghwRaWXaBFW1aIc/Q==
X-CSE-MsgGUID: PP1UTmU1QyKnoBsAzj+Yag==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="88623498"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="88623498"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 19:24:45 -0700
X-CSE-ConnectionGUID: 0HT436FJQ/GcjXJ3zGJyow==
X-CSE-MsgGUID: 4GEide8VQhO5DiMw+kMguw==
X-ExtLoop1: 1
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 19:24:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 7/8] drm/ttm: Increase maximum TTM priorities to 8
Date: Thu, 30 Jul 2026 19:24:38 -0700
Message-Id: <20260731022439.2446486-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731022439.2446486-1-matthew.brost@intel.com>
References: <20260731022439.2446486-1-matthew.brost@intel.com>
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

The current limit of four TTM priority levels is arbitrary. It is
reasonable for drivers to require more than four priorities, while the
cost of supporting additional levels is minimal. The primary overhead is
a slightly larger memory footprint and iteration over a larger number of
priority levels in non-performance-critical paths.

Xe plans to make use of eight priority levels, so increase the maximum
number of TTM priorities from 4 to 8.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm/ttm/ttm_resource.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index a5d386583fb6..51718099a567 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -34,7 +34,7 @@
 #include <drm/ttm/ttm_caching.h>
 #include <drm/ttm/ttm_kmap_iter.h>
 
-#define TTM_MAX_BO_PRIORITY	4U
+#define TTM_MAX_BO_PRIORITY	8U
 #define TTM_NUM_MEM_TYPES 9
 
 struct dentry;
-- 
2.34.1

