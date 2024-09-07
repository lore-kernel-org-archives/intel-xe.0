Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C56E6FE4E
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:07:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3744310EB25;
	Sat,  7 Sep 2024 00:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IqIlZzBq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B2110EB2B
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667678; x=1757203678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YLUvD9hGQY95WPezKBjcv5ATj2Mz4TVd/gztF4CqaQ4=;
 b=IqIlZzBqL8Ym5axa6EqMKvr6rZKtG6hyr0cGCXTZhWyXfCKvwKWWjyHt
 huS9SwCyNIGFBs4LfMsenmPvolXwzW3j/DTEt0YrWSX1+o3D0vwRWey3Y
 O54nvPg208D6v8YZp2+eyGDmyWmENOeYoEqnQbAv2QsNjVwwKKTFm0jGB
 fl1x4i3b+tbxYhM4698g7PJwYFpB3oPNp0yi+DeTkkQkpO+aUHVIzaRHr
 eQN/QoVzio72x3SohM0OglPeXsbeRqcPlxRz8hPvQ75oEO6TLnmgQz9lb
 AXESD71ZdB08wRapfWjK/siNEt4FL4XYsPXZuTjV+IZc+vv3kFda9fqS4 w==;
X-CSE-ConnectionGUID: e6JxibjUR3qwEMiV9mIQ6g==
X-CSE-MsgGUID: PFigxmklR0K1JWxrC9fI3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855301"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855301"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: ZhhDRl8cS4ui19GaV2QsTg==
X-CSE-MsgGUID: zZgAokO5TuSL6Lq3CSwLCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792649"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 11/43] drm/xe/pcode: Convert register access to use xe_mmio
Date: Fri,  6 Sep 2024 17:08:00 -0700
Message-ID: <20240907000748.2614020-56-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

