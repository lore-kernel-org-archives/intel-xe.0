Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DABFF513B
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 20:20:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF8810E4BF;
	Tue,  7 Apr 2026 20:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jBZcwQmW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2561B10E4BF
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 20:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775593234; x=1807129234;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xVWpfY0ybCfivnB88p7FWK+T+pO4OJ4spNkild+3ifw=;
 b=jBZcwQmWbubxSlc7pYgWyzeIxCGk3x1gVi0fBKjHCLD32maSZvtrrQs9
 sx94zyAlboHiExSWUQDMXmiqgDSSKzxo5JKPca+PXqZMsMMMSQHowTa1t
 g28Kl4qOBza56C++uZqW+7SvnPFq3T/XUcGjeBv9cdoZuwNIXi/Bpte6V
 ind/BnLzKVFuoQW6ZfguSMKXs8QbKd8fUclUnnr1iXWGOX2H3G7349drK
 gOe6x3c62uddFPo4MuKV8SL07GaDZ+fkYZEaRgmWPsUmfJsWNZuZLVMbR
 ekYWWc1c1/0xSmS+jrYOe9BlqSa/H9328hq9VqB7G4fMmSMiKiJlrlA1E g==;
X-CSE-ConnectionGUID: 3wpnZ0V6TnSujpYuVpSwzg==
X-CSE-MsgGUID: 6IGsXIUuQlCq9YvgE9+xQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87268151"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="87268151"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 13:20:34 -0700
X-CSE-ConnectionGUID: eCXutEecQWC8Il7jNN84TQ==
X-CSE-MsgGUID: 7qncaPO5TQ65N153ZySU9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="233231578"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by orviesa005.jf.intel.com with ESMTP; 07 Apr 2026 13:20:33 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/4] drm/xe/bo: Fix bo leak on GGTT flag validation in
 xe_bo_init_locked()
Date: Tue,  7 Apr 2026 20:15:40 +0000
Message-ID: <20260407201542.3396317-3-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260407201542.3396317-1-shuicheng.lin@intel.com>
References: <20260407201542.3396317-1-shuicheng.lin@intel.com>
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
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6e4ebbe72952..d09e96b996b9 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2322,8 +2322,10 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
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

