Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D7910FC463
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 23:44:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7285110E700;
	Wed,  8 Apr 2026 23:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GN34g4iW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4990F10E6F7
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 23:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775691869; x=1807227869;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=X8YRrOnzAhLDzgkRQbTGCgvVtGegzupK85ap6j5dtaE=;
 b=GN34g4iW28Ry5WeFjEKeAbGwY9eADFacf6BpmO3tFRgcK2tnunjg+c3P
 2dJsQvT3LGdUbr8Q3VmJFSI5GbwUutYwYKa6bGs9bKhE2Gj6XbnWZ/YZ8
 U5YbUwRQeFWZdMMC8w/S7ABm9nvna+zNaPSAE+EZwObvUZ2GGa1iGkAqr
 X/N4A7cEjXpSv4dwify6AIlzyDjR37ItQ0TUZrU28oLr7X6teXJIcy0qg
 A54xnhPZXD4t/1jN1GU397D1LD6pTLcYlAMpBNTInFyNsvj3z8x6DUt2H
 I/FS84pWonww82okYNpZLgo5uKmIsRBU+rS79OYlTo941pW8iaHGTlOMZ Q==;
X-CSE-ConnectionGUID: zxi9+wR9QLK62sXEwx82yg==
X-CSE-MsgGUID: rWh0MpVmRfm2l85fN6Ec4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94272800"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="94272800"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:28 -0700
X-CSE-ConnectionGUID: yH9Qb+tsR8yKU+acK5UYCw==
X-CSE-MsgGUID: bTG/WJlgSTWhbUWOg5334Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="227616919"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 08 Apr 2026 16:43:05 -0700
Subject: [PATCH v2 06/10] drm/xe/oa: Consolidate RTP entries for OAM whitelist
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-oa-whitelist-cleanup-v2-6-db4a06aae8b0@intel.com>
References: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
In-Reply-To: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2924;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=X8YRrOnzAhLDzgkRQbTGCgvVtGegzupK85ap6j5dtaE=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp1uhbhfIf6zBNpjcqULO8R7Sf3/TcemKw/fH2q
 8m8ZYCf7v6JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCadboWwAKCRBNeSQFyHKQ
 BEw+D/4m6oJAL8SHbQRsUUByMSA6QxWR+dr9/tg2L0KusM8XxA3WeQmcrGFC5uMh9OJBRiIEtkA
 QIQ2sc0beul4Hl0gSKrld0hJhaSSHRe0fNYwDvZwPRkTGcrut+zOw66K7QGWu+9NpQBvzi+cVba
 LU7BYsmqDGWeKWvmDcjbVpQKe628UsWSNTspvI77M2UlUEEree+TpLp6EhJMbNu77so0/uLflA2
 Kgbs95EQ3uiI/M4WhP5x2K0/4XWdgNqsMy5kPvZHnYL9Ic5vNJME5HrH8ChgyTWc9V+Bpi9CFBP
 K//n2wENPbA5K1smR3+w+5PlybuKYkGXRG9eD7nQ87v7S+K2vo/x70eHi5HC8Joh6HP/LUoQcz5
 QBF8QiiKAH6c29XH3m4BwPR5xyXDgqko3mIF4UrYGqxy888C5T3hku48fo8By4P8bjcQf4KIGDV
 EkOMkYp9eBKFQ3DPWgyL4KjHI/1lzygWQ5cazQSeCSOLMzLGUlYZufJtSNrm3+buqTs5Da7bWkv
 n5g3xukbgYQaeABDu3iS1hcxyxsDq3dGk/pJTL5Xryi9vwKvxLp8xH2P/8aD8DtWqQJQldkDGOk
 zIf1W7QggGaRyIIJ2LuIqueHJeiGrPgI3D/l0BBrJ5PXYUGPyMHbhFukG3Bl4BZuABARVEtqk4s
 p7oswb65qW7f8LQ==
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

Since we're exposing exactly the same sets of registers on both VCS and
VECS, there's no need for two table entries; we can just use one entry
with a custom match function.

The fact that we're exposing all of the registers on all of the media
engines is actually incorrect and we should correct this in the future
once we verify that userspace hasn't grown an unwanted dependency on
this misbehavior.  When the time comes, it will also be easier to update
our match function to make engine-appropriate changes (e.g., only expose
OAM SCMI registers on the engines that belong to the SCMI).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index d6f8f907ddaa..82a2091904fc 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -26,6 +26,14 @@ static bool match_not_render(const struct xe_device *xe,
 	return hwe->class != XE_ENGINE_CLASS_RENDER;
 }
 
+static bool match_has_oam(const struct xe_device *xe,
+			  const struct xe_gt *gt,
+			  const struct xe_hw_engine *hwe)
+{
+	return hwe->class == XE_ENGINE_CLASS_VIDEO_DECODE ||
+		hwe->class == XE_ENGINE_CLASS_VIDEO_ENHANCE;
+}
+
 static bool match_has_mert(const struct xe_device *xe,
 			   const struct xe_gt *gt,
 			   const struct xe_hw_engine *hwe)
@@ -130,16 +138,19 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
 				   RING_FORCE_TO_NONPRIV_RANGE_4))
 	},
-	{ XE_RTP_NAME("oam_mmio_trg_vcs"),
-	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3099),
-		       ENGINE_CLASS(VIDEO_DECODE)),
-	  XE_RTP_ACTIONS(WHITELIST(OAM_MMIO_TRG(XE_OAM_SAG_BASE_ADJ),
-				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
-			 WHITELIST_OAM_MMIO_TRG)
-	},
-	{ XE_RTP_NAME("oam_mmio_trg_vecs"),
-	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3099),
-		       ENGINE_CLASS(VIDEO_ENHANCE)),
+	/*
+	 * We really shouldn't be whitelisting OAM SCMI registers on engines
+	 * belonging to a different SCMI instance, but that's how things
+	 * have been handled until now.  If we confirm that userspace is
+	 * only accessing the OAM_SCMI registers on the VCS/VECS belonging
+	 * to that SCMI, then we can tighten up the logic here in the future.
+	 *
+	 * Similarly, we really shouldn't be whitelisting OAM SAG at all, but
+	 * we can't remove these entries until we confirm that userspace hasn't
+	 * developed any unwanted dependency on them.
+	 */
+	{ XE_RTP_NAME("oam_mmio_trg"),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3099), FUNC(match_has_oam)),
 	  XE_RTP_ACTIONS(WHITELIST(OAM_MMIO_TRG(XE_OAM_SAG_BASE_ADJ),
 				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
 			 WHITELIST_OAM_MMIO_TRG)

-- 
2.53.0

