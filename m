Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F0CCD5BD1
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 23:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58E0113B75;
	Tue,  2 Jun 2026 23:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JRuqCTHq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB529113B75
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jun 2026 23:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780441752; x=1811977752;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ER9XGp541+bCZAZ64LzfbPH5/rKO3IV+Jn+HA3+9Vdw=;
 b=JRuqCTHqhgL9OpI42atxtvy/jA0knTM2H4yywH4x0hAcyOIsNxDZxYP5
 W+XJWAoAGVjFUZtREK+k39YPlcZ2LTUkQjX6reUNKiVY/IlVw53/s6otD
 XxAvJghNipfQVFRbtQJE2VSbbswUKjwM03pAXLPt3BcbBNIOyED+AFdSr
 kYISofN6WsH8lmHTOt1tRPKOHglNXkh48Vel8rMGnRpeatuGMKbA84X4w
 Ooc5ESl53b6yPk6I+r6MCOWABEtZZ+OcByoALSufmWUp+eAbWsAQuavZd
 2kWztwGpXtg0oY92fwJIem+G5xZa4ZF8m3FRDCmDQe29LD8G3xpNvI0dz A==;
X-CSE-ConnectionGUID: /e3/rH1XRi2cvqhyrsqYlw==
X-CSE-MsgGUID: zQNNIrpXQoiicwijYBoyWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81215046"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="81215046"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 16:09:12 -0700
X-CSE-ConnectionGUID: UIpjclxhRKqys6eNZ2ktFg==
X-CSE-MsgGUID: 6BoarpzmRm2qxyMkIFdWYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="244154621"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 16:09:12 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 1/2] drm/xe/oa: Rename last argument of WHITELIST_OA_MMIO_TRG
Date: Tue,  2 Jun 2026 16:09:07 -0700
Message-ID: <20260602230908.2350117-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602230908.2350117-1-ashutosh.dixit@intel.com>
References: <20260602230908.2350117-1-ashutosh.dixit@intel.com>
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

OA head pointer registers are not used by UMD's and do not need to be
whitelisted, the last argument of WHITELIST_OA_MMIO_TRG is actually used
for whitelisting tail pointer and OA buffer registers. Rename the argument
to tail_buf to highlight this. OA head pointer is sometimes provided to the
WHITELIST_OA_MMIO_TRG to have the correct register offset alignment (16)
for RING_FORCE_TO_NONPRIV_RANGE_4.

Fixes: ed455775c5a6 ("drm/xe/rtp: Refactor OAG MMIO trigger register whitelisting")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 2e84b1c49f374..a17ebacc1455b 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -104,10 +104,10 @@ static const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(
 				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
 	},
 
-#define WHITELIST_OA_MMIO_TRG(trg, status, head) \
+#define WHITELIST_OA_MMIO_TRG(trg, status, tail_buf) \
 	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
 	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
-	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
+	WHITELIST(tail_buf, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
 
 #define WHITELIST_OAG_MMIO_TRG \
 	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OASTATUS, OAG_OAHEADPTR)
-- 
2.54.0

