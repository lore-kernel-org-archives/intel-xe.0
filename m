Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54615C52D70
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 19:28:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2166210E3F1;
	Tue,  6 Aug 2024 19:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZf46zWB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA2210E3F1
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 19:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722972485; x=1754508485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qj/SWDr0Ze3V3ah5bf1QwJCejcVXI8mD2neXW5aVJVo=;
 b=SZf46zWBQGMt8vD/PxVP3yGMTvXpahi9dhslrVI+8Kl/UA3g0GchGaeo
 xE7ymrOKN/EIUEpBafObwo0jNasS8zNzZT6GGtETfgIDvYsj9FmSRzAsB
 bJV2PVG5joU4RUx88NpCNNCOh0G27flHBG8OGGF/kwBw+LKDi553sv1oa
 +IszmpJcpC/AxcYRwcPfEVTuKpXsF+LKLdzanzLzmno1vRhY2w3HFWdV9
 pVlVR7ZNjzpbT1eCYncHe1aaeZYRx4G+NF6E8QManKLEOCrpZ++kwS3uT
 xQiJv0uR+lfjDl1fyCkPzHGPC4G7lBhn9JIgy4ToqL8MFhgw/1fKKzLOp Q==;
X-CSE-ConnectionGUID: bpH27S1yTEWaFzVhwOzrSw==
X-CSE-MsgGUID: JXpgnYr1TMOJnJ7JZCo6xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="31682126"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="31682126"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 12:28:05 -0700
X-CSE-ConnectionGUID: /oXW9cBjT3aggLfpmiyb8Q==
X-CSE-MsgGUID: QEgkfiFYQHW5lgol1076oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="56585048"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.51])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 12:28:03 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v6 05/13] drm/xe/exec_queue: Remove duplicated code
Date: Tue,  6 Aug 2024 21:27:03 +0200
Message-ID: <20240806192739.1076344-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806192739.1076344-1-francois.dugast@intel.com>
References: <20240806192739.1076344-1-francois.dugast@intel.com>
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

