Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0905D10FC45F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 23:44:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A7310E707;
	Wed,  8 Apr 2026 23:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GtgsYzRS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E60010E700
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 23:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775691869; x=1807227869;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=URod8dY0FTNC489EsOhgqYRq6Knue20vSzaarYkdjJ0=;
 b=GtgsYzRS3ZqiwdIQJVDxQVxwDLCKsh9N6/L1Aep68BdHZg0xZRZNVaGN
 czGecUBXm/rSKrILALyLbMXHXD1bxJibfXoxMjAYrkIrKKqg6Rxvi7dgo
 Bqg4nbkIn/hUglKumunRC/hRUBh9+I4irAb4hclRZk0O3f71ftRprMbmI
 JCvGPQ9zstonLpH8Y5sdhxeLZNJJYp6GZ906uYfBEP7W20n/lZRM/Ish/
 HNdDc7gNf/eGlYD30d1bHHCMluv6FMxYNikzS4s8a9Pe/NP8TSrYnJv9D
 sjyZnHy1ds2seEWwp2WDNnAzu4yNsbbACmj1+pzIxlIyspCgBFTIU9BXB Q==;
X-CSE-ConnectionGUID: ugJi7aeSTI2r2tb4jnGDzw==
X-CSE-MsgGUID: 5U34T7DAQr6aYMxSuPtdCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94272802"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="94272802"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:29 -0700
X-CSE-ConnectionGUID: frcm5ZWPTQGuJV7KSLDHqA==
X-CSE-MsgGUID: zwAncM3gTvqmgzMXMpFZfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="227616925"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 08 Apr 2026 16:43:07 -0700
Subject: [PATCH v2 08/10] drm/xe/oa: Consolidate RTP entries for OA MERT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-oa-whitelist-cleanup-v2-8-db4a06aae8b0@intel.com>
References: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
In-Reply-To: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1698;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=URod8dY0FTNC489EsOhgqYRq6Knue20vSzaarYkdjJ0=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp1uhbGGIycb+/SDPUYya3dBIiHHzsGyiCm+XKT
 xWaUl9ycgKJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCadboWwAKCRBNeSQFyHKQ
 BNPxD/4uk3oa3anrSZ01NrqN++xziPBQ3bebjT6PkRRAoFYHUCPtmy8yl7f83dCzHLkfYNtsto7
 Y6ABV+TEPCO3JyZGUrblXhIz8doNm5eLQRuM+YGzsDMj52+ruAlyEa4Kh2uwadfmbPssUPvU2Tf
 fVmlJPvOvak99LcYkLu5cW9iAVMRCtrC7wWWdnEdmFEgpbFE7sx6t37QieRWBmUrLVB8r5/YvIb
 RWlf9miNPRGR1YHUkjn9MRUXcg+vqW4IE/NO5yyOIBRYb4PylBYVtdmkl3KgWgi1awWKw/wkn/U
 TVXAiFtk/gPDXIAgoShciXF+NE8KfXPgz2pgkKmRmdUyl0AzJgYKUrE5B7NnonjORASWIr3GVL8
 jLFm2BxhLX0LVYKR75BgxFAexNcijzQMou4VOU6VIUpzV3FmtON4E1DrlkXAyqnvUFTxWnJSiJ0
 IXBLny7b0jYw67g6AtuGJt55O1W/pb/yEQPv5gZS+lv8kYb8ArRSG6rBr0TYNdeezo9Yw2nqgDH
 k5GlPlJFJnPwYVCMVqI5KiE/+ZUE9Xzeq+WMy+LGVwFfwSsO587p/qd4tIPj8NF+d+skY70Dswp
 afSJ8vPrBJH0HwOioIsTe/NpVXEmbVrwdH2aMmxFEz4z44abwVif+LiADAhniShW1UvaqqsEPHf
 5ieUoQzWX3O4Tag==
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

Since we're exposing exactly the same sets of registers on both CCS and
BCS, there's no need for two table entries; we can just use one entry
with a custom match function.

Note that we probably shouldn't be exposing these registers on _either_
of these engines since engine-based access isn't the correct programming
model here.  We'll likely be removing this entry completely in the
future.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index de35f64c71cd..5939ba18b015 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -46,6 +46,10 @@ static bool match_has_mert(const struct xe_device *xe,
 			   const struct xe_gt *gt,
 			   const struct xe_hw_engine *hwe)
 {
+	if (hwe->class != XE_ENGINE_CLASS_COMPUTE &&
+	    hwe->class != XE_ENGINE_CLASS_COPY)
+		return false;
+
 	return xe_device_has_mert((struct xe_device *)xe);
 }
 
@@ -155,12 +159,8 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
 			 WHITELIST_OAM_MMIO_TRG)
 	},
-	{ XE_RTP_NAME("oa_mert_mmio_trg_ccs"),
-	  XE_RTP_RULES(FUNC(match_has_mert), ENGINE_CLASS(COMPUTE)),
-	  XE_RTP_ACTIONS(WHITELIST_OA_MERT_MMIO_TRG)
-	},
-	{ XE_RTP_NAME("oa_mert_mmio_trg_bcs"),
-	  XE_RTP_RULES(FUNC(match_has_mert), ENGINE_CLASS(COPY)),
+	{ XE_RTP_NAME("oa_mert_mmio_trg"),
+	  XE_RTP_RULES(FUNC(match_has_mert)),
 	  XE_RTP_ACTIONS(WHITELIST_OA_MERT_MMIO_TRG)
 	},
 };

-- 
2.53.0

