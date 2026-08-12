Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A169C5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 12:41:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E830710EF97;
	Wed, 12 Aug 2026 12:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bokingd9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E04610EF97
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 12:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786538482; x=1818074482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XzBhJi50Xu0Kl8e4iQls3YXNwfkYqyNQBcirnb2fMTc=;
 b=Bokingd9q4T+wxjWkrBhmwniFG+TdvmOS1I08+WINNt6AigFUvqAusFG
 WMKDkRh7pJ4GdIPVQteQ69uK33VlygQSpQ2rDaJ86ZfqFInN/D7N/dykR
 SF5eW0MNhUfa77y2uR0KMupTcDMzosFuB4M0liK2ytsjWtDQXM+QvXEcC
 9JC2RsU9SqgyEDWGc4L8huWZ2nCIjCT/DupI6nvS7CFsW4afcCnwd/NaX
 X+/PkvTLn5GekyoRtfAOgf7yIu5XBLH1RvcNSFseGoPKMa+bb/dgdbYcT
 j2c1DNiUqRv1xWlLXODdAWr0fxtQfZTiqjnRE87hMvR1+EudsPRqnEfQx g==;
X-CSE-ConnectionGUID: 0CB2UhGNTY63KOrURSxZPg==
X-CSE-MsgGUID: +UrRN3jNStuW2e6rn35DBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98238682"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="98238682"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:41:22 -0700
X-CSE-ConnectionGUID: /CSV2qfXT224LqZCywrtUg==
X-CSE-MsgGUID: Ebj2NOaBS6ONfxHpsPPQGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="263674018"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by orviesa007.jf.intel.com with ESMTP; 12 Aug 2026 05:41:20 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v6 1/7] drm/xe/guc: Allow to replace xe_guc_mmio_send_recv()
 with KUNIT stub
Date: Wed, 12 Aug 2026 18:13:13 +0530
Message-ID: <20260812124313.1377582-10-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812124313.1377582-9-satyanarayana.k.v.p@intel.com>
References: <20260812124313.1377582-9-satyanarayana.k.v.p@intel.com>
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

Allow to replace xe_guc_mmio_send_recv() with the stub so we can
exercise more code paths on the fake xe device during kunit tests.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V4 -> V5:
- Fixed review comments (Michal W).
---
 drivers/gpu/drm/xe/xe_guc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 4286bd05c686..82e67e9219bd 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -6,6 +6,8 @@
 #include "xe_guc.h"
 
 #include <linux/iopoll.h>
+#include <kunit/static_stub.h>
+
 #include <drm/drm_managed.h>
 
 #include <generated/xe_wa_oob.h>
@@ -1509,6 +1511,9 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	int ret;
 	int i;
 
+	KUNIT_STATIC_STUB_REDIRECT(xe_guc_mmio_send_recv, guc, request, len,
+				   response_buf);
+
 	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
 
 	xe_assert(xe, len);
-- 
2.53.0

