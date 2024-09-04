Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1624FCD37B9
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDFB10E640;
	Wed,  4 Sep 2024 00:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z0Z3OcpJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF8710E63E
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409275; x=1756945275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a2CmNc1XHvs/iJW2NIHiACvG4qbKzUgHRih7fJ8SUVE=;
 b=Z0Z3OcpJlv1YWO2FxCSvIhLJisxOXimxwViRKCWg9ExfPH/6+7SSbdrM
 2SjMLgPrBYdv2d+DwLg30cfjmVgz5yT9sFjy2jRIuBoqXt0Q1GY2em7UR
 rqP/PoXBaqTqUrF3GHdeeQY9d6EAfiHY3f+RM0SQDlIyyqp4H6I0SBgtv
 gnsZt0QEjUYNJbeevnDnqP+fu2i3YzBpuV5l7tTHUUw4na7I/Mf+656gc
 QQV1KSMFBb7s5y6ELab9wYZP87UyAu/4niB32fzPN3hPD+hKp5nSB6+wX
 k2Ja92l697ssZ9cW5Hf8M2IKXne0lemdw51K7m9qzbkFbNi8Pjat6JWmr A==;
X-CSE-ConnectionGUID: /N7eCTM0RM2PWC6+TcjTnA==
X-CSE-MsgGUID: Ljfo6J6XTLWAmqsQliR3xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904799"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904799"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:15 -0700
X-CSE-ConnectionGUID: gWQQMfcCQHGn6NbPHutrAA==
X-CSE-MsgGUID: CAKUzjywTQeJNkta5gPZUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944228"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 11/43] drm/xe/pcode: Convert register access to use xe_mmio
Date: Tue,  3 Sep 2024 17:21:12 -0700
Message-ID: <20240904002100.2023834-56-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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

