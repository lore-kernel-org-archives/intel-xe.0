Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5B9C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 21:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C7310E06E;
	Tue, 28 Nov 2023 21:36:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4B910E334
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 21:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701207395; x=1732743395;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=/VIIU1R5xYVfH8kdsbxWHOD5VKzcqunbGkYRwz8Awqw=;
 b=ijvFziNbRRvvqQp/LSLU+vG4pvzv4ezFDlWFQ42zwguqK60WVZTt73ry
 N3MU/Q+38P6hBokaDG0Chwp7iFyYt7Grwc5NzvwrQm5Je/oZgI/GNkvOL
 4gXcJStBdH6yvvLv+vj3YExbPFnaUderUB1vb1nhVKezsqshsWkWcZ2IV
 3jn7h84E3s9N8QsG/e01a8T4qwT1L773Aw6CnWTDIAd0J2qSG3jZelZkK
 ZSETvm5spQKiBsHdb6MVFmwnOWoxyRp2ceQu2nLs1YgLo0SqQ1GTRdwiV
 0ZD2DEDqYkCfoUvrQ4wvDUBvHpuETUu12cnAL4UXMZQ5N6LhEgBbdZLcj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="390193765"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="390193765"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 13:36:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="886587848"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="886587848"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 13:36:34 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 13:36:34 -0800
Message-Id: <20231128213634.3633-3-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20231128213634.3633-1-brian.welty@intel.com>
References: <20231128213634.3633-1-brian.welty@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe/xe2: Respond to TRTT faults as
 unsuccessful page fault
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

SW is not expected to handle TRTT faults and should report these as
unsuccessful page fault in the reply, such that HW can respond by
raising a CAT error.

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 959ea50c04db..2ee7005d7e39 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -33,6 +33,7 @@ struct pagefault {
 	u8 engine_class;
 	u8 engine_instance;
 	u8 fault_unsuccessful;
+	bool trva_fault;
 };
 
 enum access_type {
@@ -137,6 +138,10 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	int ret = 0;
 	bool atomic;
 
+	/* SW isn't expected to handle TRTT faults */
+	if (pf->trva_fault)
+		return -EFAULT;
+
 	/* ASID to VM */
 	mutex_lock(&xe->usm.lock);
 	vm = xa_load(&xe->usm.asid_to_vm, pf->asid);
@@ -281,6 +286,7 @@ static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
 			(pf_queue->data + pf_queue->head);
 
 		pf->fault_level = FIELD_GET(PFD_FAULT_LEVEL, desc->dw0);
+		pf->trva_fault = FIELD_GET(XE2_PFD_TRVA_FAULT, desc->dw0);
 		pf->engine_class = FIELD_GET(PFD_ENG_CLASS, desc->dw0);
 		pf->engine_instance = FIELD_GET(PFD_ENG_INSTANCE, desc->dw0);
 		pf->pdata = FIELD_GET(PFD_PDATA_HI, desc->dw1) <<
-- 
2.38.0

