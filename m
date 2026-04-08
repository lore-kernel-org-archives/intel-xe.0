Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A8610FC462
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 23:44:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650E110E6FF;
	Wed,  8 Apr 2026 23:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R585frmn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2DA10E6F7
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 23:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775691869; x=1807227869;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=/NBo4cRsMLNthzkWVTPAsrW0fmb1C9uzzXGa7tax2Co=;
 b=R585frmngZxr8aTay1n2vYzWRR8VFQ2dJZmfWmJVl+fEnjOwUpqjMJdU
 eIGljDTsKBYZv2uAcPZSclVA6tXUSshSkEXt8Wgceb9kpuv1OAHYvEKU1
 1yyrhPdqOTHAq1mIBAjxojGXcrgmfyGsFo/Xw/SJcl2nBrw+gPb/a+aii
 ry5KqPBS7Py7j8hyBvodPugCBWYr9g3VzN9TvzchKrWCiwXqLLDa6r+2v
 L8A1obVimwXgHQS6sE0HhIEQeYXFPyS8Thr3isoNRXeiMBO+sTK4geh4s
 XTI8ImL0m4CSg8CN2SPOISHSLxxrkApMve/u0WPRHefp2ohhKPLtLfadz Q==;
X-CSE-ConnectionGUID: d6c9QV7BRdCH2DI/2YsKpQ==
X-CSE-MsgGUID: 9vKr7FtTQTK4k+nste4Kfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94272803"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="94272803"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:29 -0700
X-CSE-ConnectionGUID: lelZ1RTNSXmj3bGMof3R1g==
X-CSE-MsgGUID: hZo+yCJYRauGa7mKj+A0ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="227616928"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 08 Apr 2026 16:43:08 -0700
Subject: [PATCH v2 09/10] drm/xe: Enable all FORCE_TO_NONPRIV registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-oa-whitelist-cleanup-v2-9-db4a06aae8b0@intel.com>
References: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
In-Reply-To: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=/NBo4cRsMLNthzkWVTPAsrW0fmb1C9uzzXGa7tax2Co=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp1uhb1XESCYk+LkakACqBeAVsgWfo/f+/uVVmw
 gG6Dd9Fw3iJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCadboWwAKCRBNeSQFyHKQ
 BNV0D/48lF5LrIxPsrPIVUAVA/mEozyZIOHX8LV1iyCcgVdcxgZzLpA+Gq8p0jgIqWH2ruiJ6lE
 SUm786tJqOmoaOvccG10mmYjJQrTaV8Z3u+TuQXRgkx0jzTS4f9rWLk0yTN+oFnho+JRWAvrxpR
 w4pypjaFSbluDq8e63ISnKofx1T/soBau9pxjAcOmsp9L06p3r1blUqwsSnmEyw49aJQF9KDVQM
 JNwEAh1wQq/AU+dgV3Gex8PCso0bnmSo0DPinM8OvURnMtMEVOw3yKQIKh+3lVh6qqzZBD5DbUh
 dIbATF/FJ5W6USjF/1FkHMI4ybD87RJBaCcTgj6Mu+eDrDLUThY4bkQsKq4tTWkQREnqTSNjfNE
 ifLFYxjEgNPM4jXF7rlXVugsSfwUeVbDgkSv4/8Tt7dWdGQZdUwpjnYjOmA6UXxAwtH649OC1KC
 FG4b4LCQ+NyiYANiI25sBS2+DaTKGjSW5F1xf4YaeHr4vH36r6xkWb3bbFdmU4MshAVZjY6X2S2
 BEG2JbXUwo90PxcsIokKjKdg6ThVqZxG9QmBsUoX1YLkyli9iBNCr3wb7K71a3rONzVZS6/s4Ei
 o72X8dQIBtwTD94+fF0ExvpIWL8NwWNbpc+go6KTOOCbINSMcPT4g8/qouBSiYCxfsqQMuuD4FP
 IzNkWCxzedonx4w==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Intel hardware supported by the Xe driver has 20 FORCE_TO_NONPRIV
registers per engine.  We've only been enabling use of the first 12 so
far because the upper 8 registers are not contiguous with the first 12.
Some upcoming changes are going to require more than 12 entries, so
update the register definition to select the proper offset for all 20
instances and allow them to all be used.

Bspec: 60340
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 1b4a7e9a703d..d8f0915500ec 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -182,7 +182,10 @@
 #define RING_CTX_TIMESTAMP_UDW(base)		XE_REG((base) + 0x3ac)
 #define CSBE_DEBUG_STATUS(base)			XE_REG((base) + 0x3fc)
 
-#define RING_FORCE_TO_NONPRIV(base, i)		XE_REG(((base) + 0x4d0) + (i) * 4)
+#define RING_FORCE_TO_NONPRIV(base, i)          XE_REG((base) + \
+						       _PICK_EVEN_2RANGES(i, 12, \
+									  0x4d0, 0x4d4, \
+									  0x010, 0x014))
 #define   RING_FORCE_TO_NONPRIV_DENY		REG_BIT(30)
 #define   RING_FORCE_TO_NONPRIV_ACCESS_MASK	REG_GENMASK(29, 28)
 #define   RING_FORCE_TO_NONPRIV_ACCESS_RW	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 0)
@@ -198,7 +201,7 @@
 #define   RING_FORCE_TO_NONPRIV_MASK_VALID	(RING_FORCE_TO_NONPRIV_RANGE_MASK | \
 						 RING_FORCE_TO_NONPRIV_ACCESS_MASK | \
 						 RING_FORCE_TO_NONPRIV_DENY)
-#define   RING_MAX_NONPRIV_SLOTS  12
+#define   RING_MAX_NONPRIV_SLOTS  20
 
 #define RING_EXECLIST_SQ_CONTENTS_LO(base)	XE_REG((base) + 0x510)
 #define RING_EXECLIST_SQ_CONTENTS_HI(base)	XE_REG((base) + 0x510 + 4)

-- 
2.53.0

