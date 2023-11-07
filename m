Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25D4C04A95
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A40710E4C5;
	Tue,  7 Nov 2023 05:26:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEB110E4B4
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334757; x=1730870757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k4xnv45rC4JblgeLsOBXA8M+RnYqsV2DKcyDOTfMeLY=;
 b=mGcEJ1UZVXyCKNcEUBYuovtITy5Znx1Q/QynbG0dIqUulRzXsGcohIVI
 BQ3VejGXmi6GF6u5W03bf9T6xU8oXavpwuFcHToaTG854bpWGaprSemhG
 vcSGbdhDMbNjjLnck9ZxQYW8cuv8RI4lcgcxkxK0L7E49Upc3KZ8YHQe6
 cyjzeEWTDavtEP/RbmV1rbHfDfN6mRAW9V8hzfeTO6PxTVNfhe7pJ0MYP
 8rri0hfvnA1UbLaaKgcuFH3LEqNuGsiHJs+0p4IUz2f30+YH+T/Jr/U0+
 CQ30LyvGVP38byLCGjuBytuQAPJkOONr0n8icy7l4M9sDF9GRFnDCC03g g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769526"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769526"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689857"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689857"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:25:50 -0800
Message-Id: <20231107052603.124361-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 14/27] drm/xe: Drop rebind argument from
 xe_pt_prepare_bind
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

This is unused, drop it.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 31afab617b4e..f06ceaea98cf 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -914,8 +914,7 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
 
 static int
 xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
-		   struct xe_vm_pgtable_update *entries, u32 *num_entries,
-		   bool rebind)
+		   struct xe_vm_pgtable_update *entries, u32 *num_entries)
 {
 	int err;
 
@@ -1271,7 +1270,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 	       "Preparing bind, with range [%llx...%llx) engine %p.\n",
 	       xe_vma_start(vma), xe_vma_end(vma), q);
 
-	err = xe_pt_prepare_bind(tile, vma, entries, &num_entries, rebind);
+	err = xe_pt_prepare_bind(tile, vma, entries, &num_entries);
 	if (err)
 		goto err;
 	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
-- 
2.34.1

