Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D29FEB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jul 2023 21:27:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDF310E433;
	Tue, 11 Jul 2023 21:27:41 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8034F10E431
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jul 2023 21:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689110855; x=1720646855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nslXefJujrZgjxy86I2lwh47Nra4OLx0VPvlmjrRgLY=;
 b=QNZyiJ26Gcf1YyVweDCU79f536DkMQ40q9BEjCDeUyAVmTRhYbJg8ujM
 q68yEmRE1t6oLBoEYE3QxVDxYmWAkuWCeovqyei2lq420v7bF90AMw0D3
 uaOUvl2bLKj+5qDPV3Qv6YM6N7A48CLdxrzglnlV31qdV00F11wvV0rtu
 48f5DTE/8UlOo3pyj0+dAC8Gh4gX/rM7MzQzrQbnDh3A0+MI095vL1Wdz
 DKqQxYXkBFeiy+CiGwBTcUgY70G/3sage3QXr2rPnMRWih1B2CA6elEPO
 BsuuXQdotZYR2JAEo3ouVD8BSy2DzU3kuRuufQPj5tU/TmF857QJt0cYn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="451102348"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="451102348"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 14:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="786782156"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="786782156"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 14:27:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 11 Jul 2023 14:27:47 -0700
Message-Id: <20230711212748.2029455-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711212748.2029455-1-matthew.brost@intel.com>
References: <20230711212748.2029455-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/5] drm/xe: Combine destroy_cb and destroy_work
 in xe_vma into union
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

The callback kicks the worker thus mutually exclusive execution,
combining saves a bit of space in xe_vma.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_types.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 2a8691a48c55..30beae541aca 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -51,11 +51,12 @@ struct xe_vma {
 		struct list_head destroy;
 	} combined_links;
 
-	/** @destroy_cb: callback to destroy VMA when unbind job is done */
-	struct dma_fence_cb destroy_cb;
-
-	/** @destroy_work: worker to destroy this BO */
-	struct work_struct destroy_work;
+	union {
+		/** @destroy_cb: callback to destroy VMA when unbind job is done */
+		struct dma_fence_cb destroy_cb;
+		/** @destroy_work: worker to destroy this BO */
+		struct work_struct destroy_work;
+	};
 
 	/** @userptr: user pointer state */
 	struct {
-- 
2.34.1

