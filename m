Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2551D10FC45F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 23:44:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A5F10E6F7;
	Wed,  8 Apr 2026 23:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dMESfDwl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CB210E6FD
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 23:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775691868; x=1807227868;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=EPJwtGj/hBxOZvzf8RHmpVe6ygkyQXW9I00yv3J/1tU=;
 b=dMESfDwlx8aa39FYqpw9u7K1vqv01oXGYoe5aTmQ9TNGrv/lG2De4ova
 7F+z7ScPgH0qjwzBHkJX3eivS3hAijizgsPZzbirT02yzu7777y4RYwb3
 naRwbYuYwV2QfNnzU1iq2bDnCmlSg1rSJ+NIzdwb/0zdpwBDXWUPpj9vq
 hcYkX411aLfNZ25wzjCtlt1UmAYp8JE0Sv0OUrH4+PFfCzlsalbtsaLXq
 +q3vtYp/+Est3rJYt2BXJJaZZDSxOGCEEsHUpjZUNzJ5EAiVpATfQfi0s
 6I1e4yhvBKd3DYeO/fi97RJnUuQBJq3Dcb97htkBadElwG0iUz447/02h Q==;
X-CSE-ConnectionGUID: 8KusUDIsRJi8HVwQDM9smA==
X-CSE-MsgGUID: b0426RW5SF63Mr+ZJrKEiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94272795"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="94272795"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:28 -0700
X-CSE-ConnectionGUID: Xt3edcmwTLOKpLOwDD/qFA==
X-CSE-MsgGUID: 9NaZ7RHfQ3SOPJO+g9OuOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="227616904"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 08 Apr 2026 16:43:00 -0700
Subject: [PATCH v2 01/10] drm/xe/oa: Stop whitelisting non-SAG MMIO_TRG
 registers on non-DG2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-oa-whitelist-cleanup-v2-1-db4a06aae8b0@intel.com>
References: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
In-Reply-To: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4406;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=EPJwtGj/hBxOZvzf8RHmpVe6ygkyQXW9I00yv3J/1tU=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp1uhaGmKD8b8guhaMubuM/aPw5iAJwsXCxqKqs
 +RcSCVyavuJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCadboWgAKCRBNeSQFyHKQ
 BJXbEACSSMVlSL6QjxHVmzH/HY+DTuKuy1Nf/oLVWTHI5O9pOdH1G+xbDo7e8DugvXzz9gDhM+j
 kYMengKsZFPJ6/vuptfo4wTYZXQomir78rIhOEQiFDr2tymz3jB/GuQOa9hOhkzdUQDPiekpW4l
 UTSpLKbmB8RzRPxF7yCooZ71wLFexow0VAN41OWxowTY9/4rL3jhBlMgkuDN28f0JomAZUuZRUf
 nAsmO8SRrgmGSvwGtjDqrNSVnX7dICfYqe633PhY4ZfrioZntCAJCvOADU9keeHmKUNKHIUKKMA
 QJlXwqZ6WWQx+XqrxFud+9wgsQQg3QOHCv+FbDW3XkFG6QzdAwQ7cxpL8bfpOVG/kq+Hq8UoYUj
 Woej/U5RHCldH5wvE2ygpRZxIcDr1rlU1aFlMf9ySS05Le82V8YLSaJZkgV+E9s4jGUSup+huHC
 XFeAt0BqCHfQw/HGnEiK7WQoXfIQ1yQzrLovFz51WXqT501XcEIMHb09dzfOkq6MDosZjHKZOOt
 bxGL16qzsqxsrI1yMvCdOm7Gy7R3hfWP68De4tUUE/aVAVFx6al3KSYQjV/SX3tnCXb4yVJ8cgI
 UXMP4SJ180z8EN65nR/N1I2tdu/8HEbn6Xdjpj/oipsB+3InUcZVhHxnkw3dIWeHZLGxKCdkE6N
 vTXft5J0PIdK2EQ==
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

OAG_MMIOTRIGGER should only be software whitelisted on DG2's Xe_HPG IP
to satisfy Wa_1809940648.  The register did not exist before Xe_HPG (and
thus should not be whitelisted on Xe_LP platforms) and was part of the
hardware's builtin whitelist for all relevant engines/units on the
production steppings of all subsequent platforms.

One exception is the OAM SAG trigger register.  The SAG (system &
globals) instance of OAM pertains to the metrics for the GSC engine and
is only expected to be accessed from that engine.  Since the GSC is not
exposed to userspace, we've been allowing userspace to access SAG on the
VCS & VECS media engines, so to allow continued use on the "wrong"
engines, we need to add an explicit software whitelist entry.

v2:
 - Continue to whitelist OAMSAG instance since userspace is accessing
   this on the "wrong" engines.

Bspec: 45546, 60151
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 80577e4b7437..045e579ef73a 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -54,6 +54,14 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				RING_FORCE_TO_NONPRIV_ACCESS_RD,
 				XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 	},
+	{ XE_RTP_NAME("1809940648_rcs"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(1255), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(WHITELIST(OAG_MMIOTRIGGER, 0))
+	},
+	{ XE_RTP_NAME("1809940648_ccs"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(1255), ENGINE_CLASS(COMPUTE)),
+	  XE_RTP_ACTIONS(WHITELIST(OAG_MMIOTRIGGER, 0))
+	},
 	{ XE_RTP_NAME("16014440446"),
 	  XE_RTP_RULES(PLATFORM(PVC)),
 	  XE_RTP_ACTIONS(WHITELIST(XE_REG(0x4400),
@@ -90,27 +98,23 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
 	},
 
-#define WHITELIST_OA_MMIO_TRG(trg, status, head) \
-	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
+#define WHITELIST_OA_MMIO_TRG(status, head) \
 	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
 	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
 
 #define WHITELIST_OAG_MMIO_TRG \
-	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OASTATUS, OAG_OAHEADPTR)
+	WHITELIST_OA_MMIO_TRG(OAG_OASTATUS, OAG_OAHEADPTR)
 
 #define WHITELIST_OAM_MMIO_TRG \
-	WHITELIST_OA_MMIO_TRG(OAM_MMIO_TRG(XE_OAM_SAG_BASE_ADJ), \
-			      OAM_STATUS(XE_OAM_SAG_BASE_ADJ), \
+	WHITELIST_OA_MMIO_TRG(OAM_STATUS(XE_OAM_SAG_BASE_ADJ), \
 			      OAM_HEAD_POINTER(XE_OAM_SAG_BASE_ADJ)), \
-	WHITELIST_OA_MMIO_TRG(OAM_MMIO_TRG(XE_OAM_SCMI_0_BASE_ADJ), \
-			      OAM_STATUS(XE_OAM_SCMI_0_BASE_ADJ), \
+	WHITELIST_OA_MMIO_TRG(OAM_STATUS(XE_OAM_SCMI_0_BASE_ADJ), \
 			      OAM_HEAD_POINTER(XE_OAM_SCMI_0_BASE_ADJ)), \
-	WHITELIST_OA_MMIO_TRG(OAM_MMIO_TRG(XE_OAM_SCMI_1_BASE_ADJ), \
-			      OAM_STATUS(XE_OAM_SCMI_1_BASE_ADJ), \
+	WHITELIST_OA_MMIO_TRG(OAM_STATUS(XE_OAM_SCMI_1_BASE_ADJ), \
 			      OAM_HEAD_POINTER(XE_OAM_SCMI_1_BASE_ADJ))
 
 #define WHITELIST_OA_MERT_MMIO_TRG \
-	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_STATUS, OAMERT_HEAD_POINTER)
+	WHITELIST_OA_MMIO_TRG(OAMERT_STATUS, OAMERT_HEAD_POINTER)
 
 	{ XE_RTP_NAME("oag_mmio_trg_rcs"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
@@ -125,12 +129,16 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 	{ XE_RTP_NAME("oam_mmio_trg_vcs"),
 	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1300, XE_RTP_END_VERSION_UNDEFINED),
 		       ENGINE_CLASS(VIDEO_DECODE)),
-	  XE_RTP_ACTIONS(WHITELIST_OAM_MMIO_TRG)
+	  XE_RTP_ACTIONS(WHITELIST(OAM_MMIO_TRG(XE_OAM_SAG_BASE_ADJ),
+				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
+			 WHITELIST_OAM_MMIO_TRG)
 	},
 	{ XE_RTP_NAME("oam_mmio_trg_vecs"),
 	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1300, XE_RTP_END_VERSION_UNDEFINED),
 		       ENGINE_CLASS(VIDEO_ENHANCE)),
-	  XE_RTP_ACTIONS(WHITELIST_OAM_MMIO_TRG)
+	  XE_RTP_ACTIONS(WHITELIST(OAM_MMIO_TRG(XE_OAM_SAG_BASE_ADJ),
+				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
+			 WHITELIST_OAM_MMIO_TRG)
 	},
 	{ XE_RTP_NAME("oa_mert_mmio_trg_ccs"),
 	  XE_RTP_RULES(FUNC(match_has_mert), ENGINE_CLASS(COMPUTE)),

-- 
2.53.0

