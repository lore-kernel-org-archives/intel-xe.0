Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF8FCD6E7B
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 23:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A929711ABBE;
	Fri,  5 Jun 2026 23:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AdQoVINP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF19011ABBC
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 23:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780701679; x=1812237679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=INdUSoP3ZFj/1y6SjgGyX/VlPkGfy+KpWDdIasiEbfc=;
 b=AdQoVINPr/Nyc+HBxlhH1Fu4UyvTlCCqp9xpHl1IS2Y+WSznHPRu24FP
 IR+KJBcvLa/pUcLfmJo5m6VD40dU33atyiXyTayXn1tSzsfccaxsatnCs
 eo8xCz1mc/GECw+nSjM6YCQtnediGXQWW32Cju3hvGBvmFvumttU9TZoP
 pxXtiGOwsGUori2KmrFth0i7KbEw6Zng8+M5JexGaRROWGcfYOfnNeFRS
 i34p64fuB2zddJ67uxYqybPDC80z09NmxD7gOuJoEmMZakkYQvKByah8v
 ui8X3SyoCzBRbiQFd9amU5zTCLWdKQBh/JOQToxI3W1yb9Bjsj8nWCWdU w==;
X-CSE-ConnectionGUID: yiyVDr6pSSeZmO4NiRALXA==
X-CSE-MsgGUID: bXZmR//KR5mLCsQwc7M/BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81449677"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="81449677"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 16:21:18 -0700
X-CSE-ConnectionGUID: 6gBKSUD4S4+ucioQiM4TEw==
X-CSE-MsgGUID: wcaODE4bQxqMkEzqM321CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="245018287"
Received: from dut4385arlh.fm.intel.com ([10.105.8.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 16:21:19 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: michal.wajdeczko@intel.com, ilia.levi@intel.com, x.wang@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 alan.previn.teres.alexis@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 02/12] drm/xe: Handle NULL in xe_exec_queue_get_unless_zero()
Date: Fri,  5 Jun 2026 23:21:09 +0000
Message-ID: <20260605232108.674580-16-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605232108.674580-14-stuart.summers@intel.com>
References: <20260605232108.674580-14-stuart.summers@intel.com>
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

The function currently dereferences @q unconditionally. Add a NULL
guard so callers can pass NULL without a crash, which simplifies
call sites that conditionally wrap the call.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/xe_exec_queue.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 0225426c57b0..2624aa676517 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -38,7 +38,7 @@ void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
 static inline struct xe_exec_queue *
 xe_exec_queue_get_unless_zero(struct xe_exec_queue *q)
 {
-	if (kref_get_unless_zero(&q->refcount))
+	if (q && kref_get_unless_zero(&q->refcount))
 		return q;
 
 	return NULL;
-- 
2.43.0

