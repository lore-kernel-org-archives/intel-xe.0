Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169F7C79F89
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F6D10FAD9;
	Fri,  4 Sep 2026 21:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VNCun7v7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8923210E580
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788556581; x=1820092581;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oavOCoqQIJ7x1Xuf0wOb7Ukn+Rv7ethno0w9tb1gTGE=;
 b=VNCun7v7OlgQ1gx+cRcN63isalt8nTHj4PaC4VikR3tRd5sokbunTuau
 +A22a0q75YoyKBNTsdmnJiyF2aR2RXEuqqSVunWKhjgrfgJYNqfCEE9N9
 eUlZoAocdFGw9VfBhnPOCHf8LaCSA5LCp3A9p/+Rx60d2Ypj5jMp8prLR
 71AJ/wOIGrL3tdXaVgyt5+ehFZ2cGRNU4HLBVs6wG4j0CSsYLSkWxiTtH
 /CllEhcmfzLpWYC7ku/0Kce/K51XALa9ha6iJZQcPVe05JcADTM3KOcJl
 EHROWAIpFpXTx6k4RWP888JP3ljQzZVv6gkWtlCnt//sAZE9CZotq+Efh Q==;
X-CSE-ConnectionGUID: kLFQxmV4SUqv4ijoDLOO2w==
X-CSE-MsgGUID: Rn0UAU4gTsG8ILh2SJmMWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89096803"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89096803"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:20 -0700
X-CSE-ConnectionGUID: 16burRuWR0ClJBVufznRNw==
X-CSE-MsgGUID: zJmaXVdyQu+toAOcbMj9kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="267563421"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 06/24] drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC
Date: Fri,  4 Sep 2026 14:15:55 -0700
Message-Id: <20260904211613.3934307-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904211613.3934307-1-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add XE_BO_FLAG_PUT_VM_ASYNC, which indicates that an async BO put must
also drop an additional reference to the BO’s VM. This is useful when a
kernel BO, one that does not normally hold a VM reference, needs to be
put asynchronously, ensuring the shared dma-resv object does not
disappear before the BO.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-7-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b162753cebb7..aea4b0fee8e3 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -3998,8 +3998,14 @@ void xe_bo_put_commit(struct llist_head *deferred)
 	if (!freed)
 		return;
 
-	llist_for_each_entry_safe(bo, next, freed, freed)
+	llist_for_each_entry_safe(bo, next, freed, freed) {
+		struct xe_vm *vm = bo->vm;
+		bool async = bo->flags & XE_BO_FLAG_PUT_VM_ASYNC;
+
 		drm_gem_object_free(&bo->ttm.base.refcount);
+		if (async)
+			xe_vm_put(vm);
+	}
 }
 
 static void xe_bo_dev_work_func(struct work_struct *work)
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 01975586ee88..2168aac1ed1e 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -54,6 +54,7 @@
 #define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
 #define XE_BO_FLAG_NO_COMPRESSION	BIT(26)
 #define XE_BO_FLAG_NEEDS_1G		BIT(27)
+#define XE_BO_FLAG_PUT_VM_ASYNC		BIT(28)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
-- 
2.34.1

