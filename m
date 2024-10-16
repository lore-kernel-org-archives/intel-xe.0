Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5422D1AD2E
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 09:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C5E10E6C0;
	Wed, 16 Oct 2024 09:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kgfi2zgk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F5B10E035
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 09:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729069516; x=1760605516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fDv7TPxBWmzlpbReQAWSlKddStSYovHmmS8GdysswRg=;
 b=kgfi2zgkpMrW2yO+G+xiaYlnUb/mVsumKuK+KWxy/jJRU/HZf8SFd/z7
 M0adFjbrJiz8DJWxS50KLCt23DUm0iYpFUccTNfdSlxS/O1drc39b0yon
 ouMzMcwb6SLscgXXQ0xvpDC1Xm1Xo+G36KsQmYuWe01lmJioYHPE47yZp
 NcXdgRwBrrzYn8wMPmXl0uwdQXpU/3naakQnSfi+9192k6Q9DyPSNV450
 PfQFLPXPxBrGYjLtFGVMIHSnYGCi4NHfoy2Nacaw2D+fiWdr+0dURK8Qz
 cJjfWC8WvpZgoBYh7GKgB3CSD4S+6CM64zWvn08eI1F3y3wItOJIXMviq w==;
X-CSE-ConnectionGUID: Sx9bUS3aTyS1U5fKTVfmdA==
X-CSE-MsgGUID: 3kCQdYrdRb2MERkdsounAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27978395"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="27978395"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 02:05:15 -0700
X-CSE-ConnectionGUID: GJpKJudDSdaW9safznioOw==
X-CSE-MsgGUID: Bfeout44SXirXBQ6UC6FGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="78998367"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 02:05:14 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 1/2] drm/xe/ufence: Prefetch ufence addr to catch bogus
 address
Date: Wed, 16 Oct 2024 10:23:03 +0200
Message-ID: <20241016082304.66009-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241016082304.66009-1-nirmoy.das@intel.com>
References: <20241016082304.66009-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

access_ok() only checks for addr overflow so also try to read the addr
to catch invalid addr sent from userspace.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index c6cf227ead40..2e72c06fd40d 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -54,8 +54,9 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 {
 	struct xe_user_fence *ufence;
 	u64 __user *ptr = u64_to_user_ptr(addr);
+	u64 __maybe_unused prefetch_val;
 
-	if (!access_ok(ptr, sizeof(*ptr)))
+	if (get_user(prefetch_val, ptr))
 		return ERR_PTR(-EFAULT);
 
 	ufence = kzalloc(sizeof(*ufence), GFP_KERNEL);
-- 
2.46.0

