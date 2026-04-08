Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA8A10FC468
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 23:44:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFE410E709;
	Wed,  8 Apr 2026 23:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KSrjJO+L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E1010E6F7
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 23:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775691869; x=1807227869;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=02z9kHLvmGX7TYwk0kd8B8YijjPmhL95kNRU3FZNVzM=;
 b=KSrjJO+Lk4C2p4ckF9UnP6zPYjbemYzlDIKLcDrVQeYzSTF0G4vsqI7n
 yyzDJhnSHC2TtQb1mchw47T5i2HIOxsXQcSh5l2PPx3hKNpOAFjvDX7BH
 MnnjDWxZtdW0HiSnkb1Z1ichk8m1qajNuEi/nlsao0AeCa/CBIXa0xeBZ
 zXVwcj0K4HXqRSk4ZYhLxPTqvlx4/ULOgd/Yq7NQR7Ud7F0M3iBxQBL7B
 KWIFIxdswAX+HPwi8GZRQerCO30tHN3xV4AoQwhg1vrRNDi06aY92RPEh
 dqVfwDSE5NZ+wipChn7mgWMcFnHnax/oNHqEYAZDEUroe0mrI5ywsGtXc A==;
X-CSE-ConnectionGUID: c/AVpoiLRbe+wO0+867Z4w==
X-CSE-MsgGUID: sGMzoadQQ8CAYK6ldtKG/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94272798"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="94272798"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:28 -0700
X-CSE-ConnectionGUID: ytF0OrPJRJa/qV70NMzr6Q==
X-CSE-MsgGUID: 0BTyHI1+RV6GAqglFmkMFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="227616913"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 08 Apr 2026 16:43:03 -0700
Subject: [PATCH v2 04/10] drm/xe/oa: Stop whitelisting OAG registers after Xe3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-oa-whitelist-cleanup-v2-4-db4a06aae8b0@intel.com>
References: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
In-Reply-To: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1841;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=02z9kHLvmGX7TYwk0kd8B8YijjPmhL95kNRU3FZNVzM=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp1uhaGCPUbi8GXJD8l4UIG9IYsWUDIN4jVc+tm
 RAmRP2FEbeJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCadboWgAKCRBNeSQFyHKQ
 BKhgD/9Mral0n0FztGGaFm+ck4yazKBrCoZwUmIcYUrofBgyfU+KOIZ1LydY2nIwbzTCHdwlhL2
 A4UPZA9nqKpHQ3/3HIB22ke5qUbFcT4GhRMhxrys5ZaQekZYpRJuE7r8GGkjG2o1wQKUdGyNalo
 N4NNCGg+Y8GGLDQCDF7l6E+hjVoX2Tgt+PqcGzR5whznEC7oHUBcRL5p4SQ3CCzzNakCfz3hPab
 HkAI0yQm/wTBYfc6ZTXEXv3gm0/SrERZWtI+M8gNjvGjnjkHXb2b5w9XWFuzrgV2YdzM6i3eAxr
 p5cfJz7AmPEQm49IwFwBRZx/s9D/mcC1ssAWVexQm2SHk+Mj5z19zVCQqRn5xWSq3ka/9jYkmQn
 JQkzj5DuFVBC46GxHqu1MrqRFdNAUfLbNM/ZQkwC9SvUXq4sIOnRA6bajeSA7gvaaUmjre+a9Jt
 W6Dt4UOKmWDop50uwXRDpDiljwmDAHtAdFbCclmTdfpjRxALqu2vEsiyXKLL+fX6AZJQ1C/EWuZ
 m0MZnEipGv4w4EfIsiSMVy0ERKPzWQT6WolmhV7SrQUXKYFBZYcLAAkIif+fqS7+EvO1meZMVij
 wrv86KGmusB0GVc2X5i/ZhLRsawPePKpeG0Auf5UIkdHtNlyHgfUrravm3mp8zFot/RYqLAz6s8
 EY2g/kAULwt9Syg==
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

According to Xe2 and beyond's hardware design, userspace does not need
access to OAG_OAHEADPTR, OAG_OATAILPTR, OAG_OABUFFER, or
OAG_OASTARTTRIG_COUNTER; the hardware deliberately blocks userspace
access to these registers and adding them to our software whitelist was
a mistake.  However since they're already on the software list, it's
possible that userspace software has developed an unwanted dependency on
them and that removal of access now could break userspace.  So while we
investigate further to determine whether removal is safe or not, let's
add an upper bound to prevent the mistake from spreading further past
our current Xe3 platforms.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 457702de53e4..423370afab73 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -114,14 +114,14 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 	WHITELIST_OA_MMIO_TRG(OAMERT_STATUS, OAMERT_HEAD_POINTER)
 
 	{ XE_RTP_NAME("oag_mmio_trg_rcs"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 3099),
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(WHITELIST(OAG_OAHEADPTR,
 				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
 				   RING_FORCE_TO_NONPRIV_RANGE_4))
 	},
 	{ XE_RTP_NAME("oag_mmio_trg_ccs"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 3099),
 		       ENGINE_CLASS(COMPUTE)),
 	  XE_RTP_ACTIONS(WHITELIST(OAG_OAHEADPTR,
 				   RING_FORCE_TO_NONPRIV_ACCESS_RD |

-- 
2.53.0

