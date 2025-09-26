Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2FCCAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 15:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35E810EA8F;
	Fri, 26 Sep 2025 15:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bNof8uYM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5BD8951B
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 15:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758902391; x=1790438391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lrq13594kOh6nTkiP2P+iSUP0RlCz+yhN8YbqE74LDI=;
 b=bNof8uYMRU4cBJ6aYjKgbZb6L3sYWkvnqYZwX4eFaHDua5FSzfm3S3aN
 ypC+T3A6Of68QE/C/1YTX3ntA3Q/b1NNP/ZZgGhUX7EBbVrMZq3xObzwo
 FtlPvIAE2Q6xjHfkPyIw4YBrn9s4Qs7xJJWGymURVhtsHqYU3KleIvJf5
 8Mm2Btjvu281hRtAGmxaq73J3HGQHBfu8P5zbKF7ci7P3FajPLShSDhjX
 es+OH3M+XDooWdHJOkJPy3lAaXF9U6f8n2LSkJCK8D7mujQ16Xl8m6eI1
 Lur2imgGV/Yb08k407ibl6wqU8OMLM3kVZEzTNMoJDnnfcVDKKX3txODG Q==;
X-CSE-ConnectionGUID: hYST4+K7SiaNNZUT9B92HA==
X-CSE-MsgGUID: bElvyDECSNmhg85T/tXjGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="63872190"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="63872190"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:59:50 -0700
X-CSE-ConnectionGUID: oUnsKqA3SriQcFjHGkLwgg==
X-CSE-MsgGUID: PFlmiNnCS8qppi/tmCkPFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="182914425"
Received: from dut4086lnl.fm.intel.com ([10.105.10.69])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:59:50 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH 4/5] drm/xe: Guard against NULL GT in xe_guc.c
Date: Fri, 26 Sep 2025 15:59:53 +0000
Message-ID: <20250926155948.145934-11-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926155948.145934-7-jonathan.cavitt@intel.com>
References: <20250926155948.145934-7-jonathan.cavitt@intel.com>
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

Static analysis reveals the following issue:
xe_device_get_gt is theoretically able to return NULL in some cases, but
several use cases don't check the return value before performing a
dereference, resulting in a NULL pointer dereference.

Use xe_root_mmio_gt instead of xe_device_get_gt to prevent this in
xe_guc.c

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index d5adbbb013ec..0bf1402c61a0 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -466,7 +466,7 @@ static int guc_g2g_alloc(struct xe_guc *guc)
 		return 0;
 
 	if (gt->info.id != 0) {
-		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
+		struct xe_gt *root_gt = xe_root_mmio_gt(xe);
 		struct xe_guc *root_guc = &root_gt->uc.guc;
 		struct xe_bo *bo;
 
-- 
2.43.0

