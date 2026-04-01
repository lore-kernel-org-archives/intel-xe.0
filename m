Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5525F10F9315
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 01:31:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF82310E99E;
	Wed,  1 Apr 2026 01:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JOCUpiIo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0641B10E99E
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 01:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775007082; x=1806543082;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LBBciOesyTS297Y8fKj0ypr3RsztpiUhEWjep+6LKLQ=;
 b=JOCUpiIoKKH0wBkqhbYld4zCXYTkNq1EtcTQ5i6raJbXK2wasnS2bFjP
 ByMIOQ3uKiY02F+jaCVT0ZfuwXMVw6G+McJvXnpHa+XPtIUT1gM/+TkBi
 gjp+AAd9x1aXmhAb/zMZ5LVqMpFEVEz/exC2i87XYAfRcXGoveFeFWXSr
 ThYrbIqc/DxngRDrdp+Kyo+Ncy0QOBDUtKv1VD996UZEkXi1yGBoHpUpb
 MWFt8heLZGJPByK3RFDQfSonzSMIZ4i8EItAKmVyp4wyiHgjSw7jG73jS
 LOxVwbQgrAj5wYDUik2kcuhjzN8TpWenhM2rASBJOpXy2UswgSHDGS+8c Q==;
X-CSE-ConnectionGUID: cz+iPjxGRQ666VBUhOPxMA==
X-CSE-MsgGUID: pGu00+17TqKRzulgIzZxLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="78630477"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="78630477"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 18:31:22 -0700
X-CSE-ConnectionGUID: 4mf858X1TLOsWGwdNOjRwA==
X-CSE-MsgGUID: wXHLFiwPS6Orl23kpPuxsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="230954736"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by orviesa004.jf.intel.com with ESMTP; 31 Mar 2026 18:31:21 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Subject: [PATCH] drm/xe: Fix bug in idledly unit conversion
Date: Tue, 31 Mar 2026 18:27:10 -0700
Message-Id: <20260401012710.4165547-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

We only need to convert to picosecond units before writing to RING_IDLEDLY.

Fixes: 7c53ff050ba8 ("drm/xe: Apply Wa_16023105232")
Cc: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 337baf0a6e87..6dd05fac6595 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -597,9 +597,8 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 		maxcnt *= maxcnt_units_ns;
 
 		if (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)) {
-			idledly = DIV_ROUND_CLOSEST(((maxcnt - 1) * maxcnt_units_ns),
+			idledly = DIV_ROUND_CLOSEST(((maxcnt - 1) * 1000),
 						    idledly_units_ps);
-			idledly = DIV_ROUND_CLOSEST(idledly, 1000);
 			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
 		}
 	}
-- 
2.38.1

