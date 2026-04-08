Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399BF10FC466
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 23:44:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BC210E705;
	Wed,  8 Apr 2026 23:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITdJDOm2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B216310E6F7
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 23:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775691868; x=1807227868;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=ee/qVa9yKmJllymp5461yCOVUrOQypO1icXuFF0pX5g=;
 b=ITdJDOm2Wo2ErX71N3Ga97e/bF+H7PV9TvpkYiDJWZk6DA0QP57flt6a
 gFLcNeKbYOLAo0fqBah+4+sODeOhpiKrfIrtvA0YATPIoNM24JdWSHH3g
 JEYgNz7qD/eGpq6vB0F6da3u++2QyQZHujxg+AtRmkzHVuUpI8vS8njDB
 Ik4Ix4NwJGvvo3nEU0w0lI4Pq2/GUP9oTJg4U+V/kIQCFpPRkEARyuwyB
 xRWOfwv7D3m298ThIUCoWwJvs6mhuQMDyhWuR4mcQOUn5NdjWkP+pgbs0
 pfkE2Ty/i+6g+VqTE/4YmCevL617JqGGh0G1m0XcBnRshLhjeRQrZ2mt+ w==;
X-CSE-ConnectionGUID: DJNk+JjZQMW7hb00ZF0Jug==
X-CSE-MsgGUID: o/srOzKnQe+AfLrglrLQ/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94272796"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="94272796"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:28 -0700
X-CSE-ConnectionGUID: nrgM1n5dQOupliEhTRqneg==
X-CSE-MsgGUID: NzrnbnlVQKy3wejUsUiGZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="227616907"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 08 Apr 2026 16:43:01 -0700
Subject: [PATCH v2 02/10] drm/xe/oa: Stop whitelisting OAG_OASTATUS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-oa-whitelist-cleanup-v2-2-db4a06aae8b0@intel.com>
References: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
In-Reply-To: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1961;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=ee/qVa9yKmJllymp5461yCOVUrOQypO1icXuFF0pX5g=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp1uhaw99pzYNlO8akCGG5TuKmF/4UnQq6VXyM4
 IkFw/kIcvyJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCadboWgAKCRBNeSQFyHKQ
 BL5DD/4u3GQUZHWK2TwNs7yI5mkNeiCMY0mtwZ4fCbQjpKpVF04I3TLlfwq/5MUZWE/PxjaEotj
 90lwzhFg4AqlZxIhDNBcnsdWDEOT/IR0utkIFMqF7T78mO1SOPUSPTnV/iE0m+Ac2f51IlA9CCk
 heLiUIDyr2xlaZHu+m6QAZo76uXWUSjdInEPQBQcHVBEAu6vyr4xqaUWHu0Ub+XHVB7nyGGZ9WK
 mVkLcWRm6RkOrUboGMWM9mse6A2bC4zgaCncqQuIIjJ8Ac+qXi71v+nry1OBKyrq9wZxOorTZA/
 ZEv3qVYvJTKsx9XPolLpT0P2007mFz9+jh9/9uZv//8txHTUgBBRfkjLJvGyiKkOW3UOevyssxd
 fTuFBM3PxTzx524gFf3LTkqz4Ivuuol+TUc3uwLBUQW9UNgTolMDYfDzdtP3edPGOXzjSl1ID1E
 tg0tr9IiS0kYrb3OfFLGzX2i+d9I2mCw0KAZVg8eCvcTn/Dt4xfUvhMRmrQUQ7qEf7qm3fMfnks
 PvF0TQZxDLmpdUM29uftHebwzYJNVhLY2bQ70Eh3yNZ/dGwLi5PJm0/Ng84np8wGVH2NTA31NIu
 8p3jlYSL6Hku5yBJGkWb0dTlhdvejK4Q8b+2ksBtPemwIjia/y0CuQjR0J5tFleFvCwJs+PiOaS
 PYY2SmjI5jQxf+Q==
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

OAG_OASTATUS has always been part of the hardware whitelist and thus
accessible to userspace for all platforms supported by the Xe driver.
There has never been any need to add it to the software whitelist.

Bspec: 45545, 60150
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 045e579ef73a..b0ad89a5ad4f 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -102,9 +102,6 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
 	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
 
-#define WHITELIST_OAG_MMIO_TRG \
-	WHITELIST_OA_MMIO_TRG(OAG_OASTATUS, OAG_OAHEADPTR)
-
 #define WHITELIST_OAM_MMIO_TRG \
 	WHITELIST_OA_MMIO_TRG(OAM_STATUS(XE_OAM_SAG_BASE_ADJ), \
 			      OAM_HEAD_POINTER(XE_OAM_SAG_BASE_ADJ)), \
@@ -119,12 +116,16 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 	{ XE_RTP_NAME("oag_mmio_trg_rcs"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
 		       ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(WHITELIST_OAG_MMIO_TRG)
+	  XE_RTP_ACTIONS(WHITELIST(OAG_OAHEADPTR,
+				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
+				   RING_FORCE_TO_NONPRIV_RANGE_4))
 	},
 	{ XE_RTP_NAME("oag_mmio_trg_ccs"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
 		       ENGINE_CLASS(COMPUTE)),
-	  XE_RTP_ACTIONS(WHITELIST_OAG_MMIO_TRG)
+	  XE_RTP_ACTIONS(WHITELIST(OAG_OAHEADPTR,
+				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
+				   RING_FORCE_TO_NONPRIV_RANGE_4))
 	},
 	{ XE_RTP_NAME("oam_mmio_trg_vcs"),
 	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1300, XE_RTP_END_VERSION_UNDEFINED),

-- 
2.53.0

