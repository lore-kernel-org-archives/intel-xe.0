Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E0CC25B7A
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 19:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7E810E1D8;
	Thu, 23 May 2024 19:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WzuSqTZz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9EF10EF62
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 19:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716492182; x=1748028182;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=H/p7lY4/Eq7WATqtb8xy7Kr/r8AvN9bHn3dM/60jguY=;
 b=WzuSqTZz4dH+vzaKi9X/2XYYpX9fpa4263Twa9bPBfmKFs9oRxXX5L66
 1zggaKuiAHlGIpq3g4+ecP6JjbeLhb2HLyCERzcG+fvidf/DabSow3q+x
 XiGtQ4YYfiPDMfRbAgwJk070IhY0kQIFyqlb/goN3T56SJsoPtnvz32j2
 UsCua3yd6eMJCd5f94ciwB7Jw+amNlSZM8mMgiZLdm6K1b+V8sTbaxgdd
 BrfJ+o32wyDCxH3AOBqtr1PbQmhXeIghd9qetrMzwJHV8YvUiWNmLv63m
 lOG6+gtQ7csTwjPUHIQ4zwYgAbcyof5/fnborf+cjaKUvM9Qtu3Cqp+Ub A==;
X-CSE-ConnectionGUID: cElx3Y9gRbmTZ2RNxx8AgQ==
X-CSE-MsgGUID: bF6nupGUTGiUiu6KeE1Oug==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="13023486"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="13023486"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 12:22:59 -0700
X-CSE-ConnectionGUID: vsqWltxbT+GpeovTabBBsw==
X-CSE-MsgGUID: frAClw8BTTKskkhiinTsDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33848871"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 12:22:58 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/6] drm/xe/vf: Treat GMDID as another runtime register
Date: Thu, 23 May 2024 21:22:40 +0200
Message-Id: <20240523192240.844-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240523192240.844-1-michal.wajdeczko@intel.com>
References: <20240523192240.844-1-michal.wajdeczko@intel.com>
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

While the GMDID registers are not part of the runtime register list
shared by the PF driver, we may still return cached values from our
VF specific read32() helper function.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 347ab7060588..66069eb8c5be 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -13,6 +13,7 @@
 #include "abi/guc_communication_mmio_abi.h"
 #include "abi/guc_klvs_abi.h"
 #include "abi/guc_relay_actions_abi.h"
+#include "regs/xe_gt_regs.h"
 
 #include "xe_assert.h"
 #include "xe_device.h"
@@ -764,6 +765,12 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
 	xe_gt_assert(gt, gt->sriov.vf.pf_version.major);
 	xe_gt_assert(gt, !reg.vf);
 
+	if (reg.addr == GMD_ID.addr) {
+		xe_gt_sriov_dbg_verbose(gt, "gmdid(%#x) = %#x\n",
+					addr, gt->sriov.vf.runtime.gmdid);
+		return gt->sriov.vf.runtime.gmdid;
+	}
+
 	rr = vf_lookup_reg(gt, addr);
 	if (!rr) {
 		xe_gt_WARN(gt, IS_ENABLED(CONFIG_DRM_XE_DEBUG),
-- 
2.43.0

