Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220FDC43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 13:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AD710E86D;
	Tue, 30 Jun 2026 13:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jls/Q6Or";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147DA10E1D9
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 13:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782826006; x=1814362006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kIwPBalD3NEONg41o2dIKotfZ8CiArxXiGC/BWD47w0=;
 b=jls/Q6OrQt4VWe6zWp5Re0RlFAsE3G8E2uTFsotf9E1Bp5RJSAsoCm2o
 cA6xwZrr1dIG6enq7Sm1savFgJ3xwxi4oafljw42D4e9IvGVinQdoWL9A
 YXmHQyA/mIJV034trBOMgrqm9QWlcuprriVh7xVTqo7q8hqOVk+zp79QI
 qUijmQaEmpawDe3bhknr/FihwoQfbvruBGxM9TqPkipl7TOqinHHfpe/p
 e2uoPfgcvmwOB8kCyTkStSlKHJQiRCRbI9nMvNhQ+b5w7iRUV5wXbX2/l
 femXRR3YynyLDmMTLG41MBVca1mglH3BXmMOQdteTYc09VgNmnYk4cUIj Q==;
X-CSE-ConnectionGUID: Hrmjyo1jSnGDDsI1aJ0MsA==
X-CSE-MsgGUID: 7ICRWOTJToq7blHKl9uUIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83623510"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="83623510"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:46 -0700
X-CSE-ConnectionGUID: t9fFO3zcSJ61Dn+Px3sO+g==
X-CSE-MsgGUID: IYQX38PqSNm7oX2D3OkVHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="256182193"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:45 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 02/13] drm/xe/guc: Prepare to print group KLVs
Date: Tue, 30 Jun 2026 15:26:21 +0200
Message-ID: <20260630132633.32804-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630132633.32804-1-michal.wajdeczko@intel.com>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
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

Some future KLVs will be encoded as a group of nested KLVs. Prepare
our KLV printer function to handle such KLVs. List of known group
keys will be updated later, for now just prepare it for testing.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index 3169c7f1eebf..f672f4947768 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <kunit/static_stub.h>
 #include <drm/drm_print.h>
 
 #include "abi/guc_klvs_abi.h"
@@ -12,6 +13,12 @@
 
 #define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
 
+static bool is_group_key(u16 key)
+{
+	KUNIT_STATIC_STUB_REDIRECT(is_group_key, key);
+	return false;
+}
+
 /**
  * xe_guc_klv_key_to_string - Convert KLV key into friendly name.
  * @key: the `GuC KLV`_ key
@@ -89,6 +96,17 @@ void xe_guc_klv_print_one(u16 key, u16 len, const u32 *value, struct drm_printer
 {
 	const char *name = xe_guc_klv_key_to_string(key);
 
+	if (is_group_key(key)) {
+		struct drm_printer gp = drm_line_printer(p, name, 0);
+
+		drm_printf(p, "{ key %#06x : group %u dwords } # %s\n",
+			   key, len, name);
+
+		/* print group recursively */
+		xe_guc_klv_print(value, len, &gp);
+		return;
+	}
+
 	switch (len) {
 	case 0:
 		drm_printf(p, "{ key %#06x : no value } # %s\n", key, name);
-- 
2.47.1

