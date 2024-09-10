Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B74CEE020A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0BF10E95E;
	Tue, 10 Sep 2024 23:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jSpdp6Y7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210A910E93C
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012047; x=1757548047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K7V3hb1lyQ1E9Y7BU1nyrS6e7MOQyVDz0YqRZhY/3d0=;
 b=jSpdp6Y7H/IEzBO0jfz3Kxd0S/RMcbXktPzfhGddRWGG5DZjoDI7SSa8
 HKg58TD6iB12UBkfFT5JI18AeMMuS/SUJh2pIt25zUoF86tqndKiiWhgR
 Rtagu9Cdkbv4z8LfLxFJ4ZYaRIjoCTDJiJX0/dzllf8NSBm2fj5wqh/Cb
 zI74PdhK65fPiebfrHpmjTEorFuajtF5GRHg36Ftn3pjUwmu8ql9CFJ19
 oLvlykNXPsQfvqXL711ZsqNrFO7VQ+ENPosPGVNDhg9xKGGvdGDr/9ySA
 +c5+bR7x6WWEQv/4AjwGfYE9h09l1rZ4+fRyaaSCOPQpDms2QB74tRCYS Q==;
X-CSE-ConnectionGUID: IUXLpMQ+Rj6vTFS3I/Aiiw==
X-CSE-MsgGUID: 0oKq0Dl0S1q7FN4JHDCrRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144302"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144302"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:26 -0700
X-CSE-ConnectionGUID: ceiu3nhuQu2XrnA+Duf1xA==
X-CSE-MsgGUID: WqgI7kl7SzG+Qaq9F4SMag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989568"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 11/43] drm/xe/pcode: Convert register access to use xe_mmio
Date: Tue, 10 Sep 2024 16:47:31 -0700
Message-ID: <20240910234719.3335472-56-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910234719.3335472-45-matthew.d.roper@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.  Although some of the pcode
mailboxes are related to GTs, pcode itself (and the register interface
to access it) are outside the GT and should be accessed through the
tile's MMIO.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 7397d556996a..d95d9835de42 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -44,7 +44,7 @@ static int pcode_mailbox_status(struct xe_tile *tile)
 		[PCODE_ERROR_MASK] = {-EPROTO, "Unknown"},
 	};
 
-	err = xe_mmio_read32(tile->primary_gt, PCODE_MAILBOX) & PCODE_ERROR_MASK;
+	err = xe_mmio_read32(&tile->mmio, PCODE_MAILBOX) & PCODE_ERROR_MASK;
 	if (err) {
 		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s", err,
 			err_decode[err].str ?: "Unknown");
@@ -58,7 +58,7 @@ static int __pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *d
 			      unsigned int timeout_ms, bool return_data,
 			      bool atomic)
 {
-	struct xe_gt *mmio = tile->primary_gt;
+	struct xe_mmio *mmio = &tile->mmio;
 	int err;
 
 	if (tile_to_xe(tile)->info.skip_pcode)
-- 
2.45.2

