Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB64C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 16:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5191710E288;
	Fri, 31 May 2024 16:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IhLdlif+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26BC10E288
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 16:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717171999; x=1748707999;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sPliKobfDGfOcQLW9870tLBCrCAee4GRKp2RHTlv6QQ=;
 b=IhLdlif+wvBEcxkkFQQiY0DdbP4+/L212x0eZaV6Ym6ZA5WDD4+uEL2E
 U0HcKcHVYCLYSDw2cUn+yIcbRW9kglz8CI4fQzNjUyjNjRmcpQMWycu4I
 yHMJrsNpgOHQHVEZCq0SGZPtHuD1zuboZTvtHy+W0XQYo27PPUQqmZB49
 ctXysGrXKvUWgNMUvSJ48/qU8Z897QueqBc/oRi3uTrKSGGnrr5DM+rZO
 QamZt2nrv8KVQGpQjjEzXmEiJshrbtvWgMsG8P985vyU1T73zuAJ6oGPQ
 s/X6OCQDV87Qo2sydkfJFE0kvXACsodFf/5HQSb90G5spyqVZob4Qg2Hr Q==;
X-CSE-ConnectionGUID: AKmsOFupS8ax+FzTtBziZw==
X-CSE-MsgGUID: GdXWybDATuu6kQmBaq2b7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="25125179"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25125179"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 09:12:36 -0700
X-CSE-ConnectionGUID: 3gi56NFXROe3KwTdeec+dg==
X-CSE-MsgGUID: qJ4+rMvvRueFdJQG3D2HsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36289458"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 09:12:34 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal.Wajdeczko@intel.com,
	matthew.brost@intel.com
Subject: [PATCH v2] drm/xe: Add kernel-doc to some xe_lrc interfaces
Date: Fri, 31 May 2024 09:12:30 -0700
Message-ID: <20240531161230.32317-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add kernel-doc to xe_lrc_create/destroy and xe_lrc_get/put
interfaces.

v2: Fix kernel-doc for xe_lrc_create(), drop Fixes tag.
    (Matt Brost, Michal Wajdeczko)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h | 13 +++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 26922e1bac82..c1bb85d2e243 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -945,6 +945,17 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	return err;
 }
 
+/**
+ * xe_lrc_create - Create a LRC
+ * @hwe: Hardware Engine
+ * @vm: The VM (address space)
+ * @ring_size: LRC ring size
+ *
+ * Allocate and initialize the Logical Ring Context (LRC).
+ *
+ * Return pointer to created LRC upon success and an error pointer
+ * upon failure.
+ */
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 			     u32 ring_size)
 {
@@ -964,6 +975,13 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 	return lrc;
 }
 
+/**
+ * xe_lrc_destroy - Destroy the LRC
+ * @ref: reference to LRC
+ *
+ * Called when ref == 0, release resources held by the Logical Ring Context
+ * (LRC) and free the LRC memory.
+ */
 void xe_lrc_destroy(struct kref *ref)
 {
 	struct xe_lrc *lrc = container_of(ref, struct xe_lrc, refcount);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index ebe0e362e434..882c3437ba5c 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -26,12 +26,25 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 			     u32 ring_size);
 void xe_lrc_destroy(struct kref *ref);
 
+/**
+ * xe_lrc_get - Get reference to the LRC
+ * @lrc: Logical Ring Context
+ *
+ * Increment reference count of @lrc
+ */
 static inline struct xe_lrc *xe_lrc_get(struct xe_lrc *lrc)
 {
 	kref_get(&lrc->refcount);
 	return lrc;
 }
 
+/**
+ * xe_lrc_put - Put reference of the LRC
+ * @lrc: Logical Ring Context
+ *
+ * Decrement reference count of @lrc, call xe_lrc_destroy when
+ * reference count reaches 0.
+ */
 static inline void xe_lrc_put(struct xe_lrc *lrc)
 {
 	kref_put(&lrc->refcount, xe_lrc_destroy);
-- 
2.43.0

