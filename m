Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87126C3601A
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491C910E409;
	Mon,  7 Apr 2025 09:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WRDQCzJp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BED10E406
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019614; x=1775555614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fHaNz5Y4Kh0IUDNjChu+hy28eYh7ouE4qEaZ46g5PEI=;
 b=WRDQCzJp8EMlxTJ+7OZcRQoOX8RgmzuC5ouwoCIS1w1YWIJwxKFcT6Lc
 aunBM1Iz4Im6MwjhlLEdUgZUW0eQoPxQGz/asGssAWyPiZyuDQw5LiZXe
 BwYyqnj/vHHCJHMhfZQqM5vBz0OR200c1+IdJ8HrccyeQxNmq8eVHpWg2
 YmJ9Ar8kkqI7iwAHIsBFCsTbvxYgd34WNMtlUFXrmnRuGH06tdUBlGvVj
 Uj+PJqd+PQCmnAXCal7uxpGui9OaZ41/vre7kmgVKn4z9m181QnhLftof
 x4lh6Ro6ANDyp9xmIr2t/kAMqnlIJ9I+gEC5c3+N6DM/XgITDnYhsVZRu w==;
X-CSE-ConnectionGUID: qpohlXtbTpqDCmj6PxktGw==
X-CSE-MsgGUID: pA7wo1RKSnGLvw/RbEjrgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029463"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029463"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:53:34 -0700
X-CSE-ConnectionGUID: e37LRvW5RcGw1ePyYGzTRg==
X-CSE-MsgGUID: eyniUkF6RbGSuLpUbfm98A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778927"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:53:32 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 28/32] drm/xe/uapi: Add flag for consulting madvise hints
 on svm prefetch
Date: Mon,  7 Apr 2025 15:47:15 +0530
Message-Id: <20250407101719.3350996-29-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
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

Introduce flag DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC to ensure prefetching
in madvise-advised memory regions

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 include/uapi/drm/xe_drm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index aaf515df3a83..ab96dee25f6c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1111,6 +1111,7 @@ struct drm_xe_vm_bind_op {
 	/** @flags: Bind flags */
 	__u32 flags;
 
+#define DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC	-1
 	/**
 	 * @prefetch_mem_region_instance: Memory region to prefetch VMA to.
 	 * It is a region instance, not a mask.
-- 
2.34.1

