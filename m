Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0734C54F4C
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 09:50:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C90E10E861;
	Tue, 28 Jul 2026 09:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJ+c/ZGj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E047310E85A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 09:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785232234; x=1816768234;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x/EMMcwzsMxS+UB2Slfys3lC75k3Ford9VImGLvUdjs=;
 b=PJ+c/ZGjNEos87T/OGcKDzexD/DwXCVC/JMTepK9QeAH+jZRIyZBVvdp
 xoQht66nNpZjRGZMFlMGoZK2T002Ez5LrSAIXcIhav6HuW2HvvFsuzGDZ
 kAOqQCtl8TCsZ75KxzpT7V1aDO9Me/psLHtiwse/LtnTo9lvqMXs1L0CT
 SBZbF9WHHGj3t35ZyJUwM6TNvwZuUnLceFTME4ku1LGq9QNDnyI59tNzi
 rPtsLokQipIgJMgQgqGL9Mv+ZAZeyYpZJB4ZsLH1oPyfLYBVJV7O9DrNv
 w0hc1criD5M9m/6//xfXQt2OD4OhQoxjQBjiWiZseybjz4wQhh3desH56 Q==;
X-CSE-ConnectionGUID: pWHYGd8qRuiVcDreoaD69A==
X-CSE-MsgGUID: LaeNVDOXTDSDD4wmLVyP2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="111357395"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="111357395"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 02:50:34 -0700
X-CSE-ConnectionGUID: CU3RfYW0Txy5DmtMqnJ34A==
X-CSE-MsgGUID: 5v0THjdSQo63ges8nqKAjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="258387243"
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by orviesa010.jf.intel.com with ESMTP; 28 Jul 2026 02:50:32 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 1/4] drm/xe/guc: Add KUNIT stub for xe_guc_mmio_send_recv()
Date: Tue, 28 Jul 2026 09:50:27 +0000
Message-ID: <20260728095026.2197333-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728095026.2197333-6-satyanarayana.k.v.p@intel.com>
References: <20260728095026.2197333-6-satyanarayana.k.v.p@intel.com>
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

Add a KUNIT_STATIC_STUB_REDIRECT() to xe_guc_mmio_send_recv() so that
KUnit tests can mock the GuC MMIO query response and exercise VF KLV
query error paths without talking to real hardware.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V3 -> V4:
- Added stub for xe_guc_mmio_send_recv(). (Michal W)
- Removed stub for guc_action_query_single_klv32() and
guc_action_query_single_klv64(). (Michal W)

V2 -> V3:
- Added stub to guc_action_query_single_klv32() and
  guc_action_query_single_klv64().
---
 drivers/gpu/drm/xe/xe_guc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 4286bd05c686..c7e28f5c3b7c 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -9,6 +9,7 @@
 #include <drm/drm_managed.h>
 
 #include <generated/xe_wa_oob.h>
+#include <kunit/static_stub.h>
 
 #include "abi/guc_actions_abi.h"
 #include "abi/guc_errors_abi.h"
@@ -1497,6 +1498,8 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
 int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 			  u32 len, u32 *response_buf)
 {
+	KUNIT_STATIC_STUB_REDIRECT(xe_guc_mmio_send_recv, guc, request, len,
+				   response_buf);
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_mmio *mmio = &gt->mmio;
-- 
2.43.0

