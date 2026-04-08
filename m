Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2738A10F9964
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 17:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79BF10E6B3;
	Wed,  8 Apr 2026 17:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NsWUWMYF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897C510E6B3
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 17:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775671022; x=1807207022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VNnwW4W7hKnznqq5a4Sxm1x1GKOexhllyjN1PzVXWwA=;
 b=NsWUWMYFywlGoKquP8Z9545sdQecao9Uq19H2yRAGIN0//EXw4QBw5FN
 ywpvYXFVVcZXnousW6WM/TAtFsmBQ9DymSCH4+1SzKp42zV2ADtlq+Rsk
 tQnqc48Z8W20UlRj0dmrKI4CeJLiGVxVmF+DPRYaVCI6kQizYpHA4fOnQ
 t2IkiI7VktRBGHAurt7L50XpxH4XZZ40O3jICQIOQDd4SCx/4w/Lgrb0J
 x3Md/JIGDrLF7gnr9woJk7AOKO0gurtnQ+ciB+rJptso2+F/L0jZJ/Rq3
 VIRmcQT7SZrvcgK4t/yZAZjg10Ujt9T0+xTHQyqhyNMqn4Zs+sFVMFlXw w==;
X-CSE-ConnectionGUID: m0jxft5hTsqAc26TkxFd9w==
X-CSE-MsgGUID: eP/bpOOwQSyqIUqkIger/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76567679"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="76567679"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 10:57:02 -0700
X-CSE-ConnectionGUID: 74kqzZKwRmmSMVUZ/hq7YQ==
X-CSE-MsgGUID: j1Zzfn2GSzWW0PWc3m5HUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="233418792"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa005.fm.intel.com with ESMTP; 08 Apr 2026 10:57:00 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 1/4] drm/xe/bo: Fix bo leak on unaligned size validation in
 xe_bo_init_locked()
Date: Wed,  8 Apr 2026 17:52:52 +0000
Message-ID: <20260408175255.3402838-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260408175255.3402838-1-shuicheng.lin@intel.com>
References: <20260408175255.3402838-1-shuicheng.lin@intel.com>
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

When type is ttm_bo_type_device and aligned_size != size, the function
returns an error without freeing a caller-provided bo, violating the
documented contract that bo is freed on failure.

Add xe_bo_free(bo) before returning the error.

Fixes: 4e03b584143e ("drm/xe/uapi: Reject bo creation of unaligned size")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4.6
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 1db2486b7cee..26ca878099b9 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2329,8 +2329,10 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 		alignment = SZ_4K >> PAGE_SHIFT;
 	}
 
-	if (type == ttm_bo_type_device && aligned_size != size)
+	if (type == ttm_bo_type_device && aligned_size != size) {
+		xe_bo_free(bo);
 		return ERR_PTR(-EINVAL);
+	}
 
 	if (!bo) {
 		bo = xe_bo_alloc();
-- 
2.43.0

