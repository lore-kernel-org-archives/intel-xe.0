Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CD5C46CD4
	for <intel-xe@archiver.kernel.org>; Fri, 29 Dec 2023 04:36:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E33310E240;
	Fri, 29 Dec 2023 04:36:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC0B10E154
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Dec 2023 04:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703824573; x=1735360573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pANvwmME5Zw0rDDBybBOynptC97l9my/uoQUxdFZ7jA=;
 b=dPnE3ea3qe5DEhTAJDypJX78ldcH8ro2yImV6wGxUkg9ttPuCJ5EJCnD
 lLbZpElkCGMLjVk4xU4qm/bQYPCf8YMxWztQlAB4ZUEjb/4iYk2qK85FS
 AhktyYTLXXf0qlU9ZnEApW+DwE1zHbOph21MhF5PaK2WQGPt2+4VJla11
 KtVnXi1DRhmZEnxU5loFbAoT9d1X18fWi2Rs8bKq5QK2Ckvvz0QEmCb3P
 M/u4epQLbeZ6YQP3673N/MGw2DoP8mDHUxDSXGiAa5GtZlPZrf9oFJTCj
 /bBTXj9SGon3YsiRbor/dMisDDRMYB4beDX/uBTgWDU1KAFtuYHRDcTng A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="3916609"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; 
   d="scan'208";a="3916609"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 20:34:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="902140275"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; d="scan'208";a="902140275"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 20:34:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/xe/guc: Flush G2H handler when turning off CTs
Date: Thu, 28 Dec 2023 20:35:07 -0800
Message-Id: <20231229043507.1002411-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229043507.1002411-1-matthew.brost@intel.com>
References: <20231229043507.1002411-1-matthew.brost@intel.com>
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

Make sure G2H handler is not running when changing the CT state to drop
messages or disabled. This will help prevent races in the code ensuring
that G2H are not being processed after changing the state.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 8c91d189d859..24331d20ddf8 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -328,14 +328,21 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	return err;
 }
 
+static void flush_g2h_handler(struct xe_guc_ct *ct)
+{
+	cancel_work_sync(&ct->g2h_worker);
+}
+
 void xe_guc_ct_disable(struct xe_guc_ct *ct)
 {
 	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
+	flush_g2h_handler(ct);
 }
 
 void xe_guc_ct_drop_messages(struct xe_guc_ct *ct)
 {
 	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DROP_MESSAGES);
+	flush_g2h_handler(ct);
 	xa_destroy(&ct->fence_lookup);
 }
 
-- 
2.34.1

