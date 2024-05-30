Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C12C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 18:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCF711234F;
	Thu, 30 May 2024 18:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENgrCz9c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6D311234F
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 18:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717092664; x=1748628664;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GZhh0vBADHt2ZSkO2BJnVrXtC5zvEKj/7eynGccxPOk=;
 b=ENgrCz9cMQkKu1qdjoEU/ZizJ5Dv9Fm7xhq4NxqNHhBOYaTfP5fde7NB
 wLJDeviQUQ65Us/h0lWmNjB5wICCge1Yv0T+kOFXFwvQ8nx/BRJN62kfq
 qW2w3tFE89aFZ04m1rG71lVo/5RcHVwt0TThJBQ5CU/7ShmzbaUOZuizO
 bE3peFZ0sGT0eO/E3Gq9QIU6L0yn90BbDA25flkukoOIoYyUiGB8SwPuL
 w08CRzkUV5d0hAkRbGG2PWmLL3Rxxf+t+W0NDNNSUHxOf/Bud5qo/UcAO
 xeSxcT9DM35ZmgiQVjx0Hb/DStTaeFkXGDK7rUHRoyj/NXC/xdh3byVZZ g==;
X-CSE-ConnectionGUID: ZTNrR0hcS8CbuuCq2rxsUQ==
X-CSE-MsgGUID: d5IXeQ63R4Kr5+tlEGzRRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13829928"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="13829928"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 11:11:04 -0700
X-CSE-ConnectionGUID: VdpAasrlRMOvd3g5L9Vp/w==
X-CSE-MsgGUID: g7/LMQVtS229t74hO5S4WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="40366848"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 11:11:04 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Add kernel-doc to some xe_lrc interfaces
Date: Thu, 30 May 2024 11:11:00 -0700
Message-ID: <20240530181100.18188-1-niranjana.vishwanathapura@intel.com>
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

Fixes: 264eecdba211 ("drm/xe: Decouple xe_exec_queue and xe_lrc")
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h | 13 +++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 26922e1bac82..215a1c27665d 100644
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
+ * Return pointer to created LRC upon success. Return -ve error code
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

