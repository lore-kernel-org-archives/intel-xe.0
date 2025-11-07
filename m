Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CCFCCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 19:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C466310E011;
	Fri,  7 Nov 2025 19:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqrJLgCa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C2310E011
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 19:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762543314; x=1794079314;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hbVvtNkgyrUfrDhgHBQxyWhqhTXTbfW0zpKsi3IN2PI=;
 b=gqrJLgCaeFj8iNGW17uBgHoanLOXo3tgEYpMogXrEmoLeJzNyuC2bnou
 ofJsjgAriKGA1qjNQGs0w/ubuz/eslVbVoYzL6MU3KnF3VbnyB65ZrurQ
 PrG/FKheXUXkjni36Cdes38eSKXkekuomRTVucfyrZ0X8sWorK1Ywv02U
 0hElUgLTkjj7UQ+Pwe5gAlU05ckMPF4Ln7/7xtL1JXrqam5zyTZs1whwd
 IIchOyl8FaJ6GxXAtb8ZJQpNzoOFKhYauXePat8uezQ0qv/KMm7mRX17g
 bLifcD2rf9RLgIEO/YdpCXzOY9pnI5I29vpGaXxjyf6MVcitZzc/p0qbw w==;
X-CSE-ConnectionGUID: lU3ouwrsQTWzhxTfFExB/g==
X-CSE-MsgGUID: joJlDBCPR8qwAYaRJcXL8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="52262996"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="52262996"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 11:21:54 -0800
X-CSE-ConnectionGUID: wKhol6r1RRiWdz+UUEMLuQ==
X-CSE-MsgGUID: F8laXBPCSy2Y/ete/fXmhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="187761764"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 11:21:54 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH] drm/xe/pcode: Rework error mapping
Date: Fri,  7 Nov 2025 11:21:18 -0800
Message-ID: <20251107-pcode-errmap-v1-1-8e564673bf00@intel.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251107-pcode-errmap-04e1d2ace7e5
X-Mailer: b4 0.15-dev-50d74
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

The sparse array used for error decoding from is unnecessarily big. It
should be better handled by a switch statement that will also allow us
to more easily improve this code.

Add a CASE_ERR() macro to keep the table compact and use it instead of
the 256-entries array, which saves some space:

	$ bloat-o-meter xe_pcode.o.old xe_pcode.o
	add/remove: 0/1 grow/shrink: 2/0 up/down: 222/-4096 (-3874)
	Function                                     old     new   delta
	__pcode_mailbox_rw                           363     480    +117
	__pcode_mailbox_rw.cold                       58     163    +105
	err_decode                                  4096       -   -4096
	Total: Before=7890, After=4016, chg -49.10%

Cc: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c     | 41 ++++++++++++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_pcode_api.h |  6 ------
 2 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 6a7ddb9005f99..dee3165fb37d1 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -32,27 +32,40 @@
 
 static int pcode_mailbox_status(struct xe_tile *tile)
 {
+	const char *err_str;
+	int err_decode;
 	u32 err;
-	static const struct pcode_err_decode err_decode[] = {
-		[PCODE_ILLEGAL_CMD] = {-ENXIO, "Illegal Command"},
-		[PCODE_TIMEOUT] = {-ETIMEDOUT, "Timed out"},
-		[PCODE_ILLEGAL_DATA] = {-EINVAL, "Illegal Data"},
-		[PCODE_ILLEGAL_SUBCOMMAND] = {-ENXIO, "Illegal Subcommand"},
-		[PCODE_LOCKED] = {-EBUSY, "PCODE Locked"},
-		[PCODE_GT_RATIO_OUT_OF_RANGE] = {-EOVERFLOW,
-			"GT ratio out of range"},
-		[PCODE_REJECTED] = {-EACCES, "PCODE Rejected"},
-		[PCODE_ERROR_MASK] = {-EPROTO, "Unknown"},
-	};
+
+#define CASE_ERR(_err, _err_decode, _err_str)	\
+	case _err:				\
+		err_decode = _err_decode;	\
+		err_str = _err_str;		\
+		break
 
 	err = xe_mmio_read32(&tile->mmio, PCODE_MAILBOX) & PCODE_ERROR_MASK;
+	switch (err) {
+	CASE_ERR(PCODE_ILLEGAL_CMD,	      -ENXIO,     "Illegal Command");
+	CASE_ERR(PCODE_TIMEOUT,               -ETIMEDOUT, "Timed out");
+	CASE_ERR(PCODE_ILLEGAL_DATA,          -EINVAL,    "Illegal Data");
+	CASE_ERR(PCODE_ILLEGAL_SUBCOMMAND,    -ENXIO,     "Illegal Subcommand");
+	CASE_ERR(PCODE_LOCKED,                -EBUSY,     "PCODE Locked");
+	CASE_ERR(PCODE_GT_RATIO_OUT_OF_RANGE, -EOVERFLOW, "GT ratio out of range");
+	CASE_ERR(PCODE_REJECTED,              -EACCES,    "PCODE Rejected");
+	CASE_ERR(PCODE_ERROR_MASK,            -EPROTO,    "Unknown");
+	default:
+		err_decode = -EPROTO;
+		err_str = "Unknown";
+	}
+
 	if (err) {
-		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s", err,
-			err_decode[err].str ?: "Unknown");
-		return err_decode[err].errno ?: -EPROTO;
+		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
+			err_decode, err_str);
+
+		return err_decode;
 	}
 
 	return 0;
+#undef CASE_ERR
 }
 
 static int __pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *data1,
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 92bfcba51e199..70dcd6625680c 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -92,9 +92,3 @@
 #define BMG_PCIE_CAP			XE_REG(0x138340)
 #define   LINK_DOWNGRADE		REG_GENMASK(1, 0)
 #define     DOWNGRADE_CAPABLE		2
-
-struct pcode_err_decode {
-	int errno;
-	const char *str;
-};
-



