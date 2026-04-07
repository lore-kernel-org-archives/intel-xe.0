Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9ACFF513C
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 20:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6785910E4BD;
	Tue,  7 Apr 2026 20:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dc8sYB00";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F6510E4BD
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 20:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775593232; x=1807129232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EcrmHavUKndm2lGYIBgasbiFen8md2OQR+b6SHHHeKQ=;
 b=Dc8sYB006r6NGjbXFh8XPa0mO/gpOav8+nsVhhQeHH2BliDRS+uC2Hsa
 28+lCHyibMf14t034Y7fiJdnY99pkrMXcg9FDmdoHfkEJdHI5aYiYhTVb
 WU2ErT9Ov3bBmHIfnazpkK+aD5qFWZ+EEa4dXTy8iLYEv6/+5TmNqlvSB
 baf8nkY3YGwc7uhUVSWJ/pifVWhHn/Xw9P5dQWRzWA7HKB7UvAX1/zISL
 IxuL+gc8hHEtndHn9qIJTdDMnMkrcGyZZFKXrwOXKqBQuNjESy4j+gFmk
 5rHrIUFpvhGEZwdzlKv0cZeClOp055J9cYKJTt9tAG0pq6n6CM0GJYnB4 Q==;
X-CSE-ConnectionGUID: d3hWdysVSpq7qV2N2hNZtw==
X-CSE-MsgGUID: Dkr1VMXRTR+bmR2eXRWKYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87268146"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="87268146"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 13:20:32 -0700
X-CSE-ConnectionGUID: Nkf+RkoQRO+VfxCyksurSw==
X-CSE-MsgGUID: F4HWOUpyTuGoJZKRIZMBTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="233231570"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by orviesa005.jf.intel.com with ESMTP; 07 Apr 2026 13:20:30 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/4] drm/xe/bo: Fix bo leak on unaligned size validation in
 xe_bo_init_locked()
Date: Tue,  7 Apr 2026 20:15:39 +0000
Message-ID: <20260407201542.3396317-2-shuicheng.lin@intel.com>
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

When type is ttm_bo_type_device and aligned_size != size, the function
returns an error without freeing a caller-provided bo, violating the
documented contract that bo is freed on failure.

Add xe_bo_free(bo) before returning the error.

Fixes: 4e03b584143e ("drm/xe/uapi: Reject bo creation of unaligned size")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b70e8396e56f..6e4ebbe72952 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2342,8 +2342,10 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
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

