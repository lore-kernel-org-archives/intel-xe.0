Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AD8EF99E0
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C75C10E844;
	Fri, 13 Feb 2026 22:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KaImqqCG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB7910E327
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021958; x=1802557958;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=pKmpuehUBOQqoDyGtrj7uIHqj5qsBZUW+RyP+ZY45fk=;
 b=KaImqqCGn7V5mwD+ZV6ser3DvlrxaSIsXdP2uifhsNvkb+sm6zBYDDDB
 KQ7UC8MuqrVDx94QZx54omRefWoX+8rpRvU7ba+3vqmL+1G09fTgThGPC
 n9jSVXpx+Tj5HEgOsfCE3xEdGhjoWZLy/chyUOLfH16XjoPiUHAqdAjSR
 qpub4B+v5MQQe28SbxIdsPJl0nhpo/dKxxQVp+1loAAKvu3asbH+p+9IF
 oEn2pzzZ8O31Swc3TH0sGPE6lWdq0VbDwdH+zWmKexv9k7y3PS2zcZ7HN
 g86yfn98bm7g/ihK8roCHsyA4o8o/b7zYvA5DUXISQ60qtMUUbcunbf8Y g==;
X-CSE-ConnectionGUID: oe0cNd0+StCZZaHz1mCmLA==
X-CSE-MsgGUID: UQz/oQC1QCO7PNiv0w4wKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654437"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654437"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:37 -0800
X-CSE-ConnectionGUID: XeLmqd7HTMSBc/eV2GtJ3w==
X-CSE-MsgGUID: kLrEVohiSu+8WRzYPY3Vww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705647"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:44 -0800
Subject: [PATCH 09/22] drm/xe: Consolidate workaround entries for
 Wa_16018712365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-9-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=pKmpuehUBOQqoDyGtrj7uIHqj5qsBZUW+RyP+ZY45fk=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aCppbs2nFQ7h89obaH8Dr6/j9pYzV+zN5HQ
 pa17JfzRAyJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mggAKCRBNeSQFyHKQ
 BMeyD/0V7nIgtciDr64Q6JTVSrbE5g0+0zrSXOCpbJv0Ik05cGS+GbbRZHk1YsENFfJaPDVIMmc
 7WqxqkBCknvmN5q49nqW9Dk7eEm06VwaZ7NmQ0cwt6idR/MSIEkrtme9k+v+w8AtYaOOUEOACUV
 9aymJ7y71x6kMfAsAYqVx6LhfoszTvp3zk1Gujmw9Qp1xqQcmpe1iCQws0e5ZBEXV8MhrvWL/CN
 eNh2JlrI8eCl9aDpxVdwLgmhUR4yBXys41ltBMCtFzIQrEbgDIJMsro9Dqflm+BFMUHnvFW/puQ
 ClMivIHiU7oYd6XYdxljD5UUJdA118tcaPjivUiZKSjQX7qUfZxwQ24Pdsh4u9lEOfInYxEK8nR
 3HAQL66xdngIx95P72e/wRcbzzm6NSUrHUQXA//NeI1NdzPEaUMtBVhndsmzezgtzm5wuH0ZN75
 V7EeOt8DbQ+FE1ta4O4Ao8ZFrWbx0GFmkGyumI/OrFJ+CDt/nz0KI1eQ026pd3YV5sFi5vK6ZXA
 q8NUITg/Tkem6iXVAJJpxIWwidG1suAv5qh9o1CIzRWWnqU2Wvg1U/T5ARQwZEBuDQt3UZxujgX
 kBBLhGuPZ+zGo8C0lDQuOLOkvDGpNM1p539fO4xcirKRW45WQ882uBuQt6UnPIbsypIHnTaslMI
 89BFKiJNMUe65zw==
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

Wa_16018712365 applies to all graphics versions from 20.01 through 20.04
(inclusive).  Consolidate the two RTP entries into a single range-based
entry.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index fc5e417bde62a5c81d3af928edefc36deb4b2073..4a7e129f6e603c1fa60fa883c6a6e6c8dbee818e 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -348,6 +348,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
 	},
+	{ XE_RTP_NAME("16018712365"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
+	},
 
 	/* TGL */
 
@@ -485,10 +490,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 
 	/* Xe2_LPG */
 
-	{ XE_RTP_NAME("16018712365"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
-	},
 	{ XE_RTP_NAME("14020338487"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
@@ -532,11 +533,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 
 	/* Xe2_HPG */
 
-	{ XE_RTP_NAME("16018712365"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
-	},
 	{ XE_RTP_NAME("16018737384"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2999),
 		       FUNC(xe_rtp_match_first_render_or_compute)),

-- 
2.53.0

