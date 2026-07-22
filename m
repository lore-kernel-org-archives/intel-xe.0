Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BAFC44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 12:33:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8FC10E440;
	Wed, 22 Jul 2026 12:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VilqMemY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70C310E43D
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 12:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784723630; x=1816259630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xNxtw4W/jE4YbNHMGGMf/I0hK+DM/sKOBp8M8f+RncM=;
 b=VilqMemYjRr6dnm+oiyCPANVMD0BwXkbbWuzV3MVyhxD4oXj6vMsRLQv
 RvD8by0vwaY7WGjbal6AphMaC+whCrJtt6pJujem25RDWEBaJQo655KGa
 1OKg2TSrj5ff3dRRz6QXRPaa96DaWA34Fa4uYk2bWGWpWgaJ2GW2Yj9XT
 zmuyq2Q3GrTNl9ZFIjNqV8/PQ6VAoSmhho/Rll3V5e7GsaNrf0BQpOQTi
 1eNhHgHGoOXzANnYbw8EHt3Mv/VqN3906zKQNHAX+a3QRq60ItRoS/9yE
 o9CxZ5/baoiHTGN8agfvkD2ILloq/IQN1SYpKkGc6YqPObK76WckmCo5K A==;
X-CSE-ConnectionGUID: 7I6Os1a1TL+To0guwBkZrg==
X-CSE-MsgGUID: +hLtk7vlRROMUu/JEOPu4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96872758"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="96872758"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 05:33:50 -0700
X-CSE-ConnectionGUID: qwQywr4yTCCO/uOR/sdLYw==
X-CSE-MsgGUID: xTDxJty0Rm+tQFeEG6SvDQ==
X-ExtLoop1: 1
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by fmviesa003.fm.intel.com with ESMTP; 22 Jul 2026 05:33:48 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 1/3] drm/xe/vf: Add KUNIT stub for
 guc_action_query_single_klv()
Date: Wed, 22 Jul 2026 12:33:42 +0000
Message-ID: <20260722123342.339623-6-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722123342.339623-5-satyanarayana.k.v.p@intel.com>
References: <20260722123342.339623-5-satyanarayana.k.v.p@intel.com>
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

Add a KUNIT_STATIC_STUB_REDIRECT() to guc_action_query_single_klv() so
that KUnit tests can mock the GuC MMIO query response and exercise VF
KLV query error paths without talking to real hardware.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 37899fcf5b22..df45cade937d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -10,6 +10,8 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
+#include <kunit/static_stub.h>
+
 #include "abi/guc_actions_sriov_abi.h"
 #include "abi/guc_communication_mmio_abi.h"
 #include "abi/guc_klvs_abi.h"
@@ -387,6 +389,7 @@ static int vf_resfix_done(struct xe_gt *gt, u16 marker)
 static int guc_action_query_single_klv(struct xe_guc *guc, u32 key,
 				       u32 *value, u32 value_len)
 {
+	KUNIT_STATIC_STUB_REDIRECT(guc_action_query_single_klv, guc, key, value, value_len);
 	u32 request[VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_LEN] = {
 		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
 		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
-- 
2.43.0

