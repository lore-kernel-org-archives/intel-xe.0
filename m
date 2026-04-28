Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD74EFF8868
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 14:28:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0A810EC92;
	Tue, 28 Apr 2026 14:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V76LBrT3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A372110EB1E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 14:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777386470; x=1808922470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N2cI9Uwtu5+szarvCTeIe1my/HkNjhX9ooHPuwHYqz8=;
 b=V76LBrT3NXAmTuH+NhUUJy/KNM+7u7nWjmyYyvdd+uwW1vpKgH5gqlqN
 94HgZUSmV0uF/77mCrC0Hd0oL3do6HSlv33Ua0/FUc9pDZVAFDAevlhS9
 K6DcEpj5EcluTwIzSel0xUR23KE5v1D+4TuKxaNq+71v9HFcojD9p6He7
 5TsQmtr7jIxxJwYCKdpT8mHEURkalQEBR8MmNUvb69O/Pl6OsCjFNM33l
 XW+iwfzalteAyzXnUDxyFP7N0kH6GTWHMb0cfp9OGdXtS7bk2uYx13Lpv
 xs8Np4LnO71Y/luq0YvlSpUJQQkt/rBK7N21hwygbzJE4ZcDk2Sqy3BlK w==;
X-CSE-ConnectionGUID: Tp1B3VoJRcqOlpVl4kabIA==
X-CSE-MsgGUID: R68j0ONqR0WRhAULlFuUyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95862336"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="95862336"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:50 -0700
X-CSE-ConnectionGUID: XFEzTXUCTgqI8EVvXK4jig==
X-CSE-MsgGUID: LstVlHH7TcGJJHex5huEKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238942379"
Received: from orenpaz-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.20.98])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:48 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 10/13] drm/xe/memirq: Introduce helper to calculate status
 vector offset
Date: Tue, 28 Apr 2026 16:27:17 +0200
Message-ID: <20260428142722.582-11-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428142722.582-1-michal.wajdeczko@intel.com>
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
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

We already have XE_MEMIRQ_STATUS_OFFSET() macro, but it expects
that instance parameter will separately prepared based on the
MSI-X status. Add memirq_status_vector_offset() helper function
that will take care of this and by using engine specific offset,
return an offset to the engine's status vector bytes.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 113b792d373e..f5e139f4525b 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -289,13 +289,25 @@ u32 xe_memirq_source_ptr(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
 	return __memirq_source_page(memirq, hwe->instance);
 }
 
+/* Return: offset to the status vector used by the given @source's nth @instance */
+static u32 memirq_status_vector_offset(struct xe_memirq *memirq, u16 source, u16 instance)
+{
+	memirq_assert(memirq, instance <= XE_HW_ENGINE_MAX_INSTANCE);
+
+	instance = hw_reports_to_instance_zero(memirq) ? instance : 0;
+	return XE_MEMIRQ_STATUS_OFFSET(instance) + source * SZ_16;
+}
+
+static u32 memirq_status_page_offset(struct xe_memirq *memirq, u16 instance)
+{
+	return memirq_status_vector_offset(memirq, 0, instance);
+}
+
 static u32 __memirq_status_page(struct xe_memirq *memirq, u16 instance)
 {
-	memirq_assert(memirq, instance <= XE_HW_ENGINE_MAX_INSTANCE);
 	memirq_assert(memirq, memirq->bo);
 
-	instance = hw_reports_to_instance_zero(memirq) ? instance : 0;
-	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_STATUS_OFFSET(instance);
+	return xe_bo_ggtt_addr(memirq->bo) + memirq_status_page_offset(memirq, instance);
 }
 
 /**
-- 
2.47.1

