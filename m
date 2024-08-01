Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423F7C3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 12:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131C310E962;
	Thu,  1 Aug 2024 12:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XKa2Vf/e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB6810E95F
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 12:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722517096; x=1754053096;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qj/SWDr0Ze3V3ah5bf1QwJCejcVXI8mD2neXW5aVJVo=;
 b=XKa2Vf/eUYeyzEnE9Ran2DweCAQiugj1Atw0v6RDtykuGsISajaIRpSZ
 zM3AkhUzXEQwFVAI56FQJ5q04IQrfY6GN5UYd2WJDG4kKx0B3/WHpoe1+
 waxY7ILe5yeWfNfhyuSGSmNInavcfLKGL9jAdlzFnlG3zUmgkrfwEUXNJ
 q0S7IQreRAkZfgUg0LPoM9KxPyD9/7R316e4S6s8V59uV0mriyIcDiBgw
 TsSVbZaoHA95BQELIIsUu9HkimagTp7Ios817PoKQbG7P0raBwxAJGEf4
 Hs1o7Vg8xnVHGb1bFjqg6VP/8nUCcH/FxieYj6XtcfJVh8bip93gLjST3 g==;
X-CSE-ConnectionGUID: JMu4EKKNRv6ShpnCNL86bQ==
X-CSE-MsgGUID: xs3c8L63SOGgmqp6s+4kgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20357138"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20357138"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:58:16 -0700
X-CSE-ConnectionGUID: LdDzcZqCQL+uF5Sgzwe43g==
X-CSE-MsgGUID: vuJi0UibSQa5fcIRpxDrNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55110079"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.243])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:58:14 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v4 05/13] drm/xe/exec_queue: Remove duplicated code
Date: Thu,  1 Aug 2024 14:56:46 +0200
Message-ID: <20240801125748.355078-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801125748.355078-1-francois.dugast@intel.com>
References: <20240801125748.355078-1-francois.dugast@intel.com>
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
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 77edb20aa21c..85da2a30a4a4 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -833,10 +833,7 @@ void xe_exec_queue_last_fence_put(struct xe_exec_queue *q, struct xe_vm *vm)
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

