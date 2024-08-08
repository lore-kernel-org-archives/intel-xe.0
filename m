Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1B1C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 18:42:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C82810E7D3;
	Thu,  8 Aug 2024 18:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJizFsep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5E010E7D1
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 18:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723142560; x=1754678560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QCfClXNnQsMrbKF//3MapDETzv0N5Qg6w9r5l/uHjt4=;
 b=PJizFsepXX0IMvIdVOZE/g8enE+56hF7GkDRyMmAmnMbI/qQMzcutFA1
 KJVIC0hHiBWKfkE6mzXOs7rCbjmCeIRGPu/zsgQbeF6AOa4hxpbg7PaIZ
 Y7YrZZEPJ4hAEVjSWe7Wxcz+uOUQJB7XV57FimpGRaynYzX2c9OORWYGv
 3KNCkQeXeWn08czh+aPdpsEgBTKcDZ24wHQ/hKIP9BDryThNrvYoWQ2nD
 klr+acnasI3nQqn32f6iZ8ngzXjt5xGlxPqb3pk8q5KurnotQwMhesFNN
 BmT5R/Mf+Ls+hWrKLJKqv56Ca2pNnFfnIj5AdsPSTSA3JrP+z1EJex14C w==;
X-CSE-ConnectionGUID: apoQg+NwSGelGWK3zRxyXQ==
X-CSE-MsgGUID: r8KkvfFiQwySXrhfDGDg3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="31921594"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="31921594"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:42:40 -0700
X-CSE-ConnectionGUID: RGK++/p2QLeLTuHAdBfm7w==
X-CSE-MsgGUID: NKSPJKUxSTWlWslSD28uCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="56975922"
Received: from ettammin-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.209])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:42:39 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v8 05/11] drm/xe/exec_queue: Remove duplicated code
Date: Thu,  8 Aug 2024 20:40:23 +0200
Message-ID: <20240808184220.1715625-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808184220.1715625-1-francois.dugast@intel.com>
References: <20240808184220.1715625-1-francois.dugast@intel.com>
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

This code section is the same as the body of
xe_exec_queue_last_fence_put_unlocked() so call the function instead and
remove duplicated code to make maintenance easier.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 0a0a15ee5e2b..588cf5836798 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -834,10 +834,7 @@ void xe_exec_queue_last_fence_put(struct xe_exec_queue *q, struct xe_vm *vm)
 {
 	xe_exec_queue_last_fence_lockdep_assert(q, vm);
 
-	if (q->last_fence) {
-		dma_fence_put(q->last_fence);
-		q->last_fence = NULL;
-	}
+	xe_exec_queue_last_fence_put_unlocked(q);
 }
 
 /**
-- 
2.43.0

