Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF5310FC465
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 23:44:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D168010E706;
	Wed,  8 Apr 2026 23:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XewVMZYa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55C510E6FF
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 23:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775691869; x=1807227869;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=yHUzD4XICBupBY4CF3mhmsILEVynWUSJBkQojD9bQYg=;
 b=XewVMZYabg7reGQ9D68fkF37UQSfJOGf8cwTxyDJHO8COiRktPb7Dg5S
 2vVsS2RNuBsNU/XTTDkIsiVsAnDQCDVdtFBivBRxnd/AqE+maltXW+1R4
 Uf9rNkS1q16fykKHUR0BC92XMUPnfGy9LjoULXbctxUp7S/0Gd6eTKj9w
 dE89dJSihIsVg3H4pzhw+HQj554NWrGAUx4Er3Q/V1qZ8i8xuotEzNKIi
 glOsfwCBCGv5sRvkQY9GWZVKuPtWa9VE727Z8f8yEFrUX9z8VSBc2TC3+
 lH0ALEvWF2/uRrRk6GB2NcfWa8pO7Nh0WOKOq2N6/WQB595hZMYryNHOO A==;
X-CSE-ConnectionGUID: Qw2MXx1pRNO14ICYnxBhPg==
X-CSE-MsgGUID: 9eC8ZPBPTDSyhjwQSfsXYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94272804"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="94272804"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:29 -0700
X-CSE-ConnectionGUID: d7zGLkHKRla/nit9t5Hbpw==
X-CSE-MsgGUID: aYpdFdlFSWS+qZFzwMiNWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="227616931"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 08 Apr 2026 16:43:09 -0700
Subject: [PATCH v2 10/10] drm/xe/oa: Stop whitelisting OASTARTTRIG_COUNTER
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-oa-whitelist-cleanup-v2-10-db4a06aae8b0@intel.com>
References: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
In-Reply-To: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4035;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=yHUzD4XICBupBY4CF3mhmsILEVynWUSJBkQojD9bQYg=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp1uhbhbxrczuL8xnhBj3TQNamxC/9qD3sZCKew
 28geBXPSgeJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCadboWwAKCRBNeSQFyHKQ
 BHKXEACg3pMqGRXNETpdrI85Brg+jjcsxqb2zg80uXSRf5Jcn+tHQxOinifMQjRiIoKhMYW/ydJ
 3DSHlla2hz9iDxV4uuiRG83BYKbVscZOMD7CHzskzG+nMaeyi0trMvSZXHc5Q7XdqYwhkWw5pdq
 jzMpQPM9MxAr4X25NMySl9+vbsrcKe31fjQ354ew9eBLIw9NmVrNwBrTn2UjkD40ClPhIKXcNAe
 D5uNQCZbaKopisT5ZXylEA0PHrGMy/8VjA6zQ/6Wt/HQkiLKC30Ncd4MshpctbSofo36f3UHlxm
 lmNtKPOBHrgQJTtwIZ7aeRijzbX9hN/b1ludn0lp4wobz6NrJcOes8ILCnsrm7iNNZmuDsQMtpw
 xifm6Rg9fPnfxnzh1Hb2P0Za8Uevxfs001Zqg0UU3tx+UzxF/NuKzn1xRTJMTuLkPfj4a46wZmz
 fwTluOcDqRIuq6NQDvdH2WrBFceytTNdg8MWE1It4ljak9OlhKDLWdQL4jC1kExQInP6KmKFWp/
 0JNhNMwKfQFLaAFqYjE61P9eY3lmlGJTL+HZJDkZhXuuk4yP3FUc18WyUgU5k5prXiErtveHWZt
 SuYyxGmYzHLjlARyHnG3CJRALyi/IpzVKfzI3E52md/tgha7/ZCUFWTgYB9uY1z2xrN4Mj+wOX/
 GPKXeFfRDXf8pdw==
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

Whitelisting OAHEADPTR with flag RING_FORCE_TO_NONPRIV_RANGE_4
whitelists not just the intended OAHEADPTR, OATAILPTR, and OABUFFER
registers, but also OASTARTTRIG_COUNTER which is not necessary or
desirable.  Stop using the RANGE_4 flag in cases where we don't truly
want to whitelist four registers.

While at it, eliminate some of the layers of C macros; these are making
it harder to see what registers are truly being whitelisted which isn't
really worth the lines of code being saved.  We can however reduce some
of the duplication of code by consolidating oam_mmio_trg_vcs and
oam_mmio_trg_vecs into a single entry with a custom match function; this
will also make things simpler in the future if we determine that we can
tighten up the specific engines that some of these registers are
whitelisted on.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 40 +++++++++++++++++------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 5939ba18b015..e27854b9d8cf 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -11,6 +11,7 @@
 #include "xe_device.h"
 #include "xe_gt_types.h"
 #include "xe_gt_printk.h"
+#include "xe_hw_engine_types.h"
 #include "xe_platform_types.h"
 #include "xe_reg_sr.h"
 #include "xe_rtp.h"
@@ -121,26 +122,11 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 #define WHITELIST_RO(reg) \
 	WHITELIST(reg, RING_FORCE_TO_NONPRIV_ACCESS_RD)
 
-#define WHITELIST_OA_MMIO_TRG(status, head) \
-	WHITELIST_RO(status), \
-	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
-
-#define WHITELIST_OAM_MMIO_TRG \
-	WHITELIST_OA_MMIO_TRG(OAM_STATUS(XE_OAM_SAG_BASE_ADJ), \
-			      OAM_HEAD_POINTER(XE_OAM_SAG_BASE_ADJ)), \
-	WHITELIST_OA_MMIO_TRG(OAM_STATUS(XE_OAM_SCMI_0_BASE_ADJ), \
-			      OAM_HEAD_POINTER(XE_OAM_SCMI_0_BASE_ADJ)), \
-	WHITELIST_OA_MMIO_TRG(OAM_STATUS(XE_OAM_SCMI_1_BASE_ADJ), \
-			      OAM_HEAD_POINTER(XE_OAM_SCMI_1_BASE_ADJ))
-
-#define WHITELIST_OA_MERT_MMIO_TRG \
-	WHITELIST_OA_MMIO_TRG(OAMERT_STATUS, OAMERT_HEAD_POINTER)
-
 	{ XE_RTP_NAME("oag_mmio_trg"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 3099), FUNC(match_has_oag)),
-	  XE_RTP_ACTIONS(WHITELIST(OAG_OAHEADPTR,
-				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
-				   RING_FORCE_TO_NONPRIV_RANGE_4))
+	  XE_RTP_ACTIONS(WHITELIST_RO(OAG_OAHEADPTR),
+			 WHITELIST_RO(OAG_OATAILPTR),
+			 WHITELIST_RO(OAG_OABUFFER))
 	},
 	/*
 	 * We really shouldn't be whitelisting OAM SCMI registers on engines
@@ -157,11 +143,25 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3099), FUNC(match_has_oam)),
 	  XE_RTP_ACTIONS(WHITELIST(OAM_MMIO_TRG(XE_OAM_SAG_BASE_ADJ),
 				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
-			 WHITELIST_OAM_MMIO_TRG)
+			 WHITELIST_RO(OAM_STATUS(XE_OAM_SAG_BASE_ADJ)),
+			 WHITELIST_RO(OAM_HEAD_POINTER(XE_OAM_SAG_BASE_ADJ)),
+			 WHITELIST_RO(OAM_TAIL_POINTER(XE_OAM_SAG_BASE_ADJ)),
+			 WHITELIST_RO(OAM_BUFFER(XE_OAM_SAG_BASE_ADJ)),
+			 WHITELIST_RO(OAM_STATUS(XE_OAM_SCMI_0_BASE_ADJ)),
+			 WHITELIST_RO(OAM_HEAD_POINTER(XE_OAM_SCMI_0_BASE_ADJ)),
+			 WHITELIST_RO(OAM_TAIL_POINTER(XE_OAM_SCMI_0_BASE_ADJ)),
+			 WHITELIST_RO(OAM_BUFFER(XE_OAM_SCMI_0_BASE_ADJ)),
+			 WHITELIST_RO(OAM_STATUS(XE_OAM_SCMI_1_BASE_ADJ)),
+			 WHITELIST_RO(OAM_HEAD_POINTER(XE_OAM_SCMI_1_BASE_ADJ)),
+			 WHITELIST_RO(OAM_TAIL_POINTER(XE_OAM_SCMI_1_BASE_ADJ)),
+			 WHITELIST_RO(OAM_BUFFER(XE_OAM_SCMI_1_BASE_ADJ)))
 	},
 	{ XE_RTP_NAME("oa_mert_mmio_trg"),
 	  XE_RTP_RULES(FUNC(match_has_mert)),
-	  XE_RTP_ACTIONS(WHITELIST_OA_MERT_MMIO_TRG)
+	  XE_RTP_ACTIONS(WHITELIST_RO(OAMERT_STATUS),
+			 WHITELIST_RO(OAMERT_HEAD_POINTER),
+			 WHITELIST_RO(OAMERT_TAIL_POINTER),
+			 WHITELIST_RO(OAMERT_BUFFER))
 	},
 };
 

-- 
2.53.0

