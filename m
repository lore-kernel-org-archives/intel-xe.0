Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF38EFF885A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 14:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919AF10EBD9;
	Tue, 28 Apr 2026 14:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8NVMhGR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3DC10EC96
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 14:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777386469; x=1808922469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=twRo6Wl+RnlUv0aG5ZZrbkeWi/EvII5r1Uoh3g4a188=;
 b=h8NVMhGR86xOUWRDmUg+n1isQvWc1UU79zN7Id7K3h/zySBK1wIsHnBq
 e29GYjWKW/KS1NU2oIYWlIQEH8fneLu24kkoFKg7qnQ9qgEvQd3AJ2/vu
 6r7ntz3Xe3Hm0nXScOAhWD888sUsfl3HMShPZ6K+MOgdRH40PGcuFi6jD
 bOi3LdmZ/h+J7b3l/DkSjtqqfUwQn7c5BxlwfWPcOC8dKg/xj3LiUQeV0
 uWwXKSJBKkVM/kZNnfCnef9Mc1T2kjtxhj2lLdCZAqT93orGNuwZd9Hh6
 EwSbePP1+8uwhS/kLVXUiY0qT+y3lbSsEIoD4yq1xHdbw+MN+NkZJUJKi Q==;
X-CSE-ConnectionGUID: 4DUQ+6e3R22JQg11BaN5BQ==
X-CSE-MsgGUID: CEL3Pyh1S6aJAomJPS33Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95862333"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="95862333"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:48 -0700
X-CSE-ConnectionGUID: 9NgQEAZETZWAG/widyQmYw==
X-CSE-MsgGUID: ve3bb7RJTxWbMSZb26392Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238942373"
Received: from orenpaz-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.20.98])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:47 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 09/13] drm/xe/memirq: Introduce helper to calculate source
 page offset
Date: Tue, 28 Apr 2026 16:27:16 +0200
Message-ID: <20260428142722.582-10-michal.wajdeczko@intel.com>
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

We already have XE_MEMIRQ_SOURCE_OFFSET() macro, but it expects
that instance parameter will separately prepared based on the
MSI-X usage. Add memirq_source_page_offset() helper function that
will take care of this.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 519b36ce2020..113b792d373e 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -256,13 +256,20 @@ int xe_memirq_init(struct xe_memirq *memirq)
 	return 0;
 }
 
+/* Return: offset to the source page used by engines' nth @instance */
+static u32 memirq_source_page_offset(struct xe_memirq *memirq, u16 instance)
+{
+	memirq_assert(memirq, instance <= XE_HW_ENGINE_MAX_INSTANCE);
+
+	instance = hw_reports_to_instance_zero(memirq) ? instance : 0;
+	return XE_MEMIRQ_SOURCE_OFFSET(instance);
+}
+
 static u32 __memirq_source_page(struct xe_memirq *memirq, u16 instance)
 {
-	memirq_assert(memirq, instance <= XE_HW_ENGINE_MAX_INSTANCE);
 	memirq_assert(memirq, memirq->bo);
 
-	instance = hw_reports_to_instance_zero(memirq) ? instance : 0;
-	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET(instance);
+	return xe_bo_ggtt_addr(memirq->bo) + memirq_source_page_offset(memirq, instance);
 }
 
 /**
-- 
2.47.1

