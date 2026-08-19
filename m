Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E5AC5DF85
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:15:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B0910EEAF;
	Wed, 19 Aug 2026 19:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e3A9Kh87";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA81F10EEAE
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787166894; x=1818702894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sYENm0ujWtBHWmKN37xQv//ZkSk0jZmB9Vs5WT/Dmkc=;
 b=e3A9Kh875/EcnluNW5hdxomIi/7YqzEH1HSDG4jROsii9mvdNunetAp6
 QknVZwZA/ND9l3VmouYywji7zwHdENLADcZtnY/9X4yvAoxl5ySwYPvvK
 KsKhSAZ2BpL2FZbXkFpA0AXUXTbzCk+tPyRGb6o8Vq6bZ6yy223N7kFuQ
 YrMho5Ni0MPocgPdtDEEDRMxefJsIokUFdN4uilk+AZ41L9Z56pR6qZqj
 /sN7eF/EWpYTf3+5/3p9CrQp/trZ/Kb+FU6IfhMLboOqva1C+nif3XENv
 WEvS50HwiS054NSU6VyIYjYJPMKHzChNQmec2bVLp9fsCb5K4hHBItiDD w==;
X-CSE-ConnectionGUID: kZddN+KvRTaPRWu42ruGwA==
X-CSE-MsgGUID: DWhcSXEuSJCouTzXtIKQ1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="86647291"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="86647291"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 12:14:54 -0700
X-CSE-ConnectionGUID: 8dOUVRRWSvupqAnDQVjv/g==
X-CSE-MsgGUID: QSTUt8RbTC6RmApfZ65pzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="295556754"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa002.jf.intel.com with ESMTP; 19 Aug 2026 12:14:52 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com, michal.wajdeczko@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 05/12] drm/xe/memirq: Report errors using structured xe_log API
Date: Thu, 20 Aug 2026 00:44:34 +0530
Message-ID: <20260819191442.1957986-6-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
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

Replace memirq_err() calls with xe_log_err() using the MEMIRQ
component tag for memory-based IRQ failures

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 9dfe965cb46e..45eae58d418f 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -15,6 +15,7 @@
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_hw_engine.h"
+#include "xe_log.h"
 #include "xe_memirq.h"
 #include "xe_tile_printk.h"
 
@@ -232,7 +233,7 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 	return 0;
 
 out:
-	memirq_err(memirq, "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
+	xe_log_err(xe, MEMIRQ, err, "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
 	return err;
 }
 
@@ -370,7 +371,7 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
 	return 0;
 
 failed:
-	memirq_err(memirq, "Failed to setup report pages in %s (%pe)\n",
+	xe_log_err(memirq_to_xe(memirq), MEMIRQ, err, "Failed to setup report pages in %s (%pe)\n",
 		   guc_name(guc), ERR_PTR(err));
 	return err;
 }
-- 
2.54.0

