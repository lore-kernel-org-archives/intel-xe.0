Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4085C44501
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 12:18:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E5110F8A2;
	Fri, 10 Jul 2026 12:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MNcengR0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA3E10F8A0
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 12:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783685910; x=1815221910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8lhIt4xOKpA28xAxBZopNjTLCOV2GjbI3tuqPHpocus=;
 b=MNcengR0VMXu6xV4cfQl6NckWFC56PDKTfqUvHO1J8VygTZywoIVTfFs
 RfC0tJvE43IYI3dQZlHIOdHqRtF0hQ/QR8ci9I21kB+2BOfCxb/1AMhL8
 AuJ76rc1sbx/KiRK2eNk9w4D2WuZUj73PV6xL8nswdYDfy33OLA6AH3dy
 EIVWkiUu8LtnAwkw8thi6zrturICCMblRNGI8VSKUqjjJAVOuLCq3cLPT
 7FOqptYcPto5Sdo/qr4JXx5tS5/zFUcm9lbOufY+5Vj5rxbOD1u7wzEur
 YC/VTQmW4t5TxpfeD9ElCQE0LRaOXgvPdsaMieUtc0gtuAvz2+o+nOvqn w==;
X-CSE-ConnectionGUID: 9/icRh4WQD6GXC+1GxrjwQ==
X-CSE-MsgGUID: eQHtc1cgQai4iTDerW0GeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83360315"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="83360315"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 05:18:30 -0700
X-CSE-ConnectionGUID: ojuZsLsqSuGJ7f1fNbft+g==
X-CSE-MsgGUID: sdzeTT0VS2+8Ds35tN6Ojw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255522159"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by orviesa009.jf.intel.com with ESMTP; 10 Jul 2026 05:18:29 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/2] drm/xe/vf: Add KUNIT stub for
 guc_action_query_single_klv()
Date: Fri, 10 Jul 2026 17:49:55 +0530
Message-ID: <20260710122007.3329932-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260710122007.3329932-1-satyanarayana.k.v.p@intel.com>
References: <20260710122007.3329932-1-satyanarayana.k.v.p@intel.com>
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
index 0cd9d77f3351..802c982ea39b 100644
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
2.53.0

