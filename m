Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909E5CD343F
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 23:47:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A7310EA06;
	Mon, 18 May 2026 23:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CQHYRUd8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BAC310E35E
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 23:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779148050; x=1810684050;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5CfDr+kUSQfTFRpKwBS331jIGn9PgElegmsZrQnD6Tc=;
 b=CQHYRUd8aYqYQVEIqnLTX2FB11IIgyicA6szkQftIb1f/61cPFMEWk7M
 if/6T3QHwKTYt6EhhwBzD0RvMW8gsqJmD07q0Kx5khlSKrfWVEBpWjWHQ
 q36tkcxwuxxQbeZTS2Zj8G/naSCCjF8R+VzzqPZ47jb+/umJqwBbYfTdy
 it6lpX91rC1KK0lr+6tAssnor0xG0HhH7GbLc6UlTAoLRI2MmufAxSUD5
 31Cbw3bAqgAUhfFk5wVFf7KCn9Zd3kG9Q9Qk5ohEntIpj0Q5xlm1q8wgQ
 7vUB6yeVTY+LYmcsxW2Mhj277g4izlNLPh+mBPXxZTvWhuNadju8jiGWM w==;
X-CSE-ConnectionGUID: MaZ4xWX5Tnqd2sFhpUbhvg==
X-CSE-MsgGUID: IRrRvfk2Sz+a3t6umwJxeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79866824"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="79866824"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 16:47:20 -0700
X-CSE-ConnectionGUID: bnrNA2FdQlCDqQbG2ihRow==
X-CSE-MsgGUID: kn82RzIuTv23Zm/BwFGXMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="236959320"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 16:47:20 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/9] drm/xe/rtp: Add RING_FORCE_TO_NONPRIV_DENY to OA
 whitelists
Date: Mon, 18 May 2026 16:47:08 -0700
Message-ID: <20260518234716.1540123-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
References: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
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

Unconditionally whitelisting OA registers is a security violation. Set
RING_FORCE_TO_NONPRIV_DENY bit in OA nonpriv slots, so that OA registers
don't get whitelisted by default after probe/reset/restart.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index fb65940848d7a..d6a5d499373bc 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -105,9 +105,10 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 	},
 
 #define WHITELIST_OA_MMIO_TRG(trg, status, head) \
-	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
-	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
-	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
+	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW | RING_FORCE_TO_NONPRIV_DENY), \
+	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_DENY), \
+	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4 | \
+		  RING_FORCE_TO_NONPRIV_DENY)
 
 #define WHITELIST_OAG_MMIO_TRG \
 	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OASTATUS, OAG_OAHEADPTR)
-- 
2.54.0

