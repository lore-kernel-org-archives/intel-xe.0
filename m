Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCCCC43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 22:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F9210E52B;
	Tue,  7 Jul 2026 22:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ToDSL9JO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C9110E520
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 22:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783462109; x=1814998109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m1HB8bsdy88Ocp1r+E9KZiboDjdUlQApSTmzpJHJ+0s=;
 b=ToDSL9JO4g/w0gmXxSBLxoM9tIpwyQnyq6iyhKb0NU+H5OTxJLt2+uFM
 Sz6pNnBr3+BtuwG0I/mep0B1V9OJRhLODl9SFV6Pak+8uceEDa9sq43gd
 4qB7YA/izX+k7a/byXoUcuvIA7HqNz/ZaW+aJvtFV/cpM4Qp8m6Gy8lUD
 H5CDHFiEhA1JfO9eMhcSJI2b2k0NfRK5aDKCBrJHbAQmlTY+jCY6sWE7N
 VWr7UnMpWnmpy0JALKQkIu/i0LmyU/ueqgvKcA5QDoneW20BR6Qy28oEV
 c1HJXT8wQxOCr3UtrptUgmrLT2MJqdlfDohe5msJIYQmQNVOCo2LabhSU w==;
X-CSE-ConnectionGUID: xBaZ+0zVSsSSoPb/LIfkew==
X-CSE-MsgGUID: aDGKixa8R7aqHD15fFR3sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84176514"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84176514"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:29 -0700
X-CSE-ConnectionGUID: 6Iz0TlkPRm6+cQ6KxJihjA==
X-CSE-MsgGUID: mxOXtmf6TBmTrTM973YJ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="278487652"
Received: from ssharm2x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.34.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:28 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v2 02/13] drm/xe/guc: Prepare to print group KLVs
Date: Wed,  8 Jul 2026 00:08:04 +0200
Message-ID: <20260707220816.677-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707220816.677-1-michal.wajdeczko@intel.com>
References: <20260707220816.677-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
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

