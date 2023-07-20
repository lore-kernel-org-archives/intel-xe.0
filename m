Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD0FC0015E
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 21:44:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D884110E19F;
	Thu, 20 Jul 2023 21:44:41 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADEE10E19F
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 21:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689889479; x=1721425479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qplJXpNP6LLMBj1ViCOHT/texsqf/se6h65KQzIkwMQ=;
 b=cLR1E+HybACyhBU4PbncaOf1drnJ5f6a+VgUwHifz+W5IWjzmmHu4qZU
 4QjNfBNioEzuWHHATXMogX+q4s3+70lHeDrjr54rbjRb7S6jty59PpztV
 2Nb7yRA2rJt72sgw/nmQLeoFGsgAJF0slD+OyLolBHi1+h8WaMxkSIUpO
 pjFMWH7QFA5y0VYA08HhrKO01iCLJ/J7FuQfNSN8P9MmmOnB6m7lzoZHx
 pSYdekLIuZscPnJOxQfHxCGrhYE7JBdKPYXTbviz3PIGffjQn5OxKqcJT
 Dljsx0T2yurECBEWdbK+YbgN+/+fISfy8xLaAG4M0LFkGIcoJPRSRdKw+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="433093171"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="433093171"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 14:43:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="814693487"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="814693487"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 14:43:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 20 Jul 2023 14:43:44 -0700
Message-Id: <20230720214345.203464-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720214345.203464-1-matthew.brost@intel.com>
References: <20230720214345.203464-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/7] drm/xe: Combine destroy_cb and destroy_work
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The callback kicks the worker thus mutually exclusive execution,
combining saves a bit of space in xe_vma.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_types.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 93004b1901e2..0f584bca3020 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -61,11 +61,12 @@ struct xe_vma {
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

