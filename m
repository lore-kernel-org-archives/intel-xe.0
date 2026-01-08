Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3984FCD585D
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 00:20:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E4910E2E3;
	Thu,  8 Jan 2026 00:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n9m0Pycj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CFE10E2DD
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 00:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767831615; x=1799367615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SeoQPYKURT27JYyJzZCDG9xIyRrY6e6sqDrZZXY/79k=;
 b=n9m0PycjfxYhcyosxLABJc0DT1lGEptdxiIN3f5A9MF1VeoJtv+2Vpnw
 q7RLKNL5W+5cJhnE1hEog6ug56wIo11qe5/PHpVirx6ZiUwIjbzRKNgoM
 mddZlta0CF7Q00AUrZJsP/RhG+dm5Xw1fgZG3/jlOLTgQxllz0tPuFbIz
 FoibL5cvIgBSAXKRJzGXei9F+2ASF1sbNu4bdIDSTCTpKvP/9ganeMhUD
 mETyI68ttk76FfP+5Zqh9X5NJtl3xmrZ4wkRF65shquMdnun+MQCOLVe5
 9wxZRWyoXIGXLLgvdhFOmEXIV8ybnQHntX9zE2XOshFfOImvKC1qvcBXM w==;
X-CSE-ConnectionGUID: SjFtnT8kSqWs2l9UjEUtWg==
X-CSE-MsgGUID: wsk8fLIESO+aPfnNP7KqQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="71785541"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="71785541"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 16:20:15 -0800
X-CSE-ConnectionGUID: IG6GOYeRSkiSXhYuznswaw==
X-CSE-MsgGUID: YtY+t3E8RN+StkgIejNDbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="203501005"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 16:20:15 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 4/4] drm/xe/oa: Stop whitelisting OAG registers after Xe3
Date: Wed,  7 Jan 2026 16:20:05 -0800
Message-ID: <20260108002000.384449-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108002000.384449-6-matthew.d.roper@intel.com>
References: <20260108002000.384449-6-matthew.d.roper@intel.com>
MIME-Version: 1.0
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
index 99956c3574f9..5f8f78f0f1f5 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -107,14 +107,14 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
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
2.52.0

