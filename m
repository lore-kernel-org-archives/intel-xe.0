Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18405C52D7C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 15:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB45110E96B;
	Fri,  9 Aug 2024 15:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YC4mx3HK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7261710E96C
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 15:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723218739; x=1754754739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QCfClXNnQsMrbKF//3MapDETzv0N5Qg6w9r5l/uHjt4=;
 b=YC4mx3HKiKwjkw0RrP4C+lHQv6cOdzRf/7DjOfdsTcCh+d10yN5ZTu7i
 +4ScS7uMrpRPVxetBBguKvHqGPpP+TMbtSlnN7e8xftAVJVBUkpA04u02
 N3qoy05frNPGL1o0WFE5pb5oayYY3o3Gdag50NyrnXpOBk3mFP6uGkj/k
 Z9PC4JyzO1ytP6UfCoeTkD1nisDr3Uzr3PT6zqU1C8Gu5ezUPL/Ej4KR/
 /m3I+B3aG4OJwT5Hz8l7LIT+b6fLB9rGsIobh3jI4f4+DphOTEUgJGM5o
 m+PU8RIOTSmP5q6jrQpFdsq9dveU7fD9CQvgKtsZnxqCUPE92CM1U5aFB Q==;
X-CSE-ConnectionGUID: Jt+M2WhYTI6grtuFgTeZZA==
X-CSE-MsgGUID: zhO2+aNxSjes0ODEc6cS7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21207393"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21207393"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 08:52:18 -0700
X-CSE-ConnectionGUID: DApmxzZzS0SJU+GFMObcmw==
X-CSE-MsgGUID: RvLK7gmEQKyeEg2MTZMUvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="61728807"
Received: from sbutnari-mobl1.ti.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.16])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 08:52:17 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v9 05/11] drm/xe/exec_queue: Remove duplicated code
Date: Fri,  9 Aug 2024 17:51:30 +0200
Message-ID: <20240809155156.1955925-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240809155156.1955925-1-francois.dugast@intel.com>
References: <20240809155156.1955925-1-francois.dugast@intel.com>
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

