Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FEDC5AC82
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 10:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF7110E7A6;
	Mon, 10 Aug 2026 10:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YBuItwdy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573E210E798
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 10:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786356760; x=1817892760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dOS8l5iewPhc57ANxn1H7ExGkHtn4dvU8+02SrjjHAk=;
 b=YBuItwdy3kiXiTeMmNMFycnngYY/YTjh1YvedjqluXw/iOaVnf35chJb
 hZKowZ97R2D1aXsqTluHcILAJqgsj8IT2vmHml22fQcjy2r1s/XtvKVQL
 FJzzzVcESO/svkr+Fb5U4/IzIpyPujEurJHUwRfpX06sQdmdY5vtO64c0
 pLXEVnHEvnhYXc2SXThTOoAMS969DeFuZaSP/rmimyfJ65N+ro4GPBYb9
 tGAENy/Rh9rSpg4mZT9Guy1h/qA0rCpI44myV1GNj7Jywxv4dzY1Ztwok
 5NylNF1jqnzLVHFJx3qd/fD5fnSb5NV4ZHr2PpBvJkOTLObOo/5LtRl0b Q==;
X-CSE-ConnectionGUID: AuozenZAQOGMisWU8YuLhw==
X-CSE-MsgGUID: JfWT9eGjRLu/BKHK+Bf7Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="86893649"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="86893649"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 03:12:39 -0700
X-CSE-ConnectionGUID: ch4Ql1XNTMKyA3/g0QwN5g==
X-CSE-MsgGUID: AQJeE4gmQqOxqHCfLZ7cnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="301227537"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by orviesa001.jf.intel.com with ESMTP; 10 Aug 2026 03:12:38 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v5 1/6] drm/xe/guc: Allow to replace xe_guc_mmio_send_recv()
 with KUNIT stub
Date: Mon, 10 Aug 2026 15:44:28 +0530
Message-ID: <20260810101428.1009573-9-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
References: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
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

