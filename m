Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36874CCFA13
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 16:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0ECC10E461;
	Mon, 10 Nov 2025 16:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KPtTTfOU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F4110E461
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 16:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762792904; x=1794328904;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TuWlA+xbGo7Ui/6pR+UV00PPRrcdixoO8k8SmJugueE=;
 b=KPtTTfOUEl9tWPgzpti8K2QqomstX36iaJQw06VhGYug4GnO61faqIus
 q6Jg/WT00peXzcddwEHWNWaonvc5nUQkoDtsRApuDmkMGssuq6iPDU3qQ
 hg6thAUNUHHYYT06Rq+/Ja89lzIcqwtihbykBJAUXGvHLRel1MeWkkCZz
 IO6sqnmsk2oZpeN+C7JEmQgUPS7CW0SLl5MEPjmn+6dHLxkqaXPMn+vQb
 MQGt4EGA83cDlDRElsJeu1IecAA72GL03jhK0A7XWhdTVwu8bp5dT2H3B
 Uo6XEjDHwUN7fdfwkYhy62C9f8h5Zlml1L3GuNI1xxt7pJ1RmIFwcrBVa Q==;
X-CSE-ConnectionGUID: PrDG69Y8T9KE+8PHip5/mQ==
X-CSE-MsgGUID: i1tfKMa+T1Oxptn2enPnLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75138611"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="75138611"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:41:44 -0800
X-CSE-ConnectionGUID: 1wz+VredTA2yl2MgG+WAFg==
X-CSE-MsgGUID: penYBygSQ12lFd2G1URwbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="225975279"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:41:43 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe/pcode: Rework error mapping
Date: Mon, 10 Nov 2025 08:41:08 -0800
Message-ID: <20251110-pcode-errmap-v2-1-cb18c8f54238@intel.com>
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
	add/remove: 0/1 grow/shrink: 2/0 up/down: 190/-4096 (-3906)
	Function                                     old     new   delta
	__pcode_mailbox_rw                           363     465    +102
	__pcode_mailbox_rw.cold                       58     146     +88
	err_decode                                  4096       -   -4096
	Total: Before=7890, After=3984, chg -49.51%

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changes in v2:
- Drop case for PCODE_ERROR_MASK as it's already handled by default
  (Raag)
- Link to v1: https://patch.msgid.link/20251107-pcode-errmap-v1-1-8e564673bf00@intel.com
---
 drivers/gpu/drm/xe/xe_pcode.c     | 40 +++++++++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_pcode_api.h |  6 ------
 2 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 6a7ddb9005f99..0d33c14ea0cf6 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -32,27 +32,39 @@
 
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
+	CASE_ERR(PCODE_ILLEGAL_CMD,           -ENXIO,     "Illegal Command");
+	CASE_ERR(PCODE_TIMEOUT,               -ETIMEDOUT, "Timed out");
+	CASE_ERR(PCODE_ILLEGAL_DATA,          -EINVAL,    "Illegal Data");
+	CASE_ERR(PCODE_ILLEGAL_SUBCOMMAND,    -ENXIO,     "Illegal Subcommand");
+	CASE_ERR(PCODE_LOCKED,                -EBUSY,     "PCODE Locked");
+	CASE_ERR(PCODE_GT_RATIO_OUT_OF_RANGE, -EOVERFLOW, "GT ratio out of range");
+	CASE_ERR(PCODE_REJECTED,              -EACCES,    "PCODE Rejected");
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



