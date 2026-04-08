Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B1610F9964
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 17:57:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF6610E6B5;
	Wed,  8 Apr 2026 17:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTgI5mrB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6CB10E6B5
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 17:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775671024; x=1807207024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EexbJJF2jtKb4Aapfzs+1gsTNV5f34rWCm41Wzz4bEA=;
 b=jTgI5mrBEla+PztfOTqsrLeMoce+96CoRiBge+i48S0lMG9xn2+373vm
 uRiAy76DiqGvISncr6XDUsGaKrOeeCn0hDD54jCJ/ilAv+vBtVkHPpJCo
 DlrBmB+JE1wd+LFs5FedqTkX7EacIXFHg9WwZjKvjnBdewvdgTTZE3uya
 izG6chj6BLyYi79B37B+MDSrgAi3FkeedcxD06AoMbtJTKA8A6pAzrt6B
 yRojD6M1nG77wnkQUv5uxxGoGjYDCJyizOXjPWScCCVaJvYQV21DQrSGf
 qVB2L01JR2PKiWAMR1EPI5LFWt8JknJKJ+kiQydtlwkLH5rIYppEF2gMq A==;
X-CSE-ConnectionGUID: mONQwAApTSuf6te+Dw8FjA==
X-CSE-MsgGUID: ALR6TSbzQx2/4e1VRfM80A==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76567684"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="76567684"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 10:57:04 -0700
X-CSE-ConnectionGUID: zUdu8w02Q/CB7i9vSWxsBA==
X-CSE-MsgGUID: g5sshUZKR3utFL92L20OQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="233418800"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa005.fm.intel.com with ESMTP; 08 Apr 2026 10:57:03 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 2/4] drm/xe/bo: Fix bo leak on GGTT flag validation in
 xe_bo_init_locked()
Date: Wed,  8 Apr 2026 17:52:53 +0000
Message-ID: <20260408175255.3402838-3-shuicheng.lin@intel.com>
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

When XE_BO_FLAG_GGTT_ALL is set without XE_BO_FLAG_GGTT, the function
returns an error without freeing a caller-provided bo, violating the
documented contract that bo is freed on failure.

Add xe_bo_free(bo) before returning the error.

Fixes: 5a3b0df25d6a ("drm/xe: Allow bo mapping on multiple ggtts")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4.6
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 26ca878099b9..b3efadbbca00 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2309,8 +2309,10 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 	}
 
 	/* XE_BO_FLAG_GGTTx requires XE_BO_FLAG_GGTT also be set */
-	if ((flags & XE_BO_FLAG_GGTT_ALL) && !(flags & XE_BO_FLAG_GGTT))
+	if ((flags & XE_BO_FLAG_GGTT_ALL) && !(flags & XE_BO_FLAG_GGTT)) {
+		xe_bo_free(bo);
 		return ERR_PTR(-EINVAL);
+	}
 
 	if (flags & (XE_BO_FLAG_VRAM_MASK | XE_BO_FLAG_STOLEN) &&
 	    !(flags & XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE) &&
-- 
2.43.0

