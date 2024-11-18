Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EDCD60CE5
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 21:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD1210E293;
	Mon, 18 Nov 2024 21:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l9NZ/17Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B66610E293
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Nov 2024 21:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731965842; x=1763501842;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i0DEWH/SZ2DXNvp89E1qaWnaBmMr7UCQra50jR5CCbA=;
 b=l9NZ/17QkVG4dbYyDpS/q89jMwAGzm+ltGH2DWd2enGZlFP6iyWtFDKu
 X62lLJBCDgBIzhf9qe4ee/7MccY9hdtLPGCTNfLRBizU+DcUsbY5pVccD
 Y9cFQp187doBRw11vK05S1IdntIgKKmvETlyZdY5DVHdRwsQ5rMZnbppe
 F9tq24VlID4ligw94jkeKm//TK+2rvtMIdico/JLj2/5MVKwva373Wh9h
 +UaSjkT9go7TZ4JND0oqGh4KP/jiKfX0+LkMaBqx7IhkjTjQezV7KoxZ4
 SlzVl1sESBMpZ2oRdgqiLX6xupDa4nuvQ7twmBA3lDyWVDFuXnVQEG8IO w==;
X-CSE-ConnectionGUID: b3p2+Kj2TCSw8AdD9jRxXg==
X-CSE-MsgGUID: ezAXlpKvRyCgo6P51LExuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="42574484"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="42574484"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 13:37:22 -0800
X-CSE-ConnectionGUID: i//H9/N8RKCLOCFwxHs2lw==
X-CSE-MsgGUID: YGRScT+vQxWSEdMOoHP/Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="94423619"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.109.3])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 13:37:21 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH] drm/xe/ptl: Update PTL GuC revision
Date: Mon, 18 Nov 2024 13:37:13 -0800
Message-ID: <20241118213713.71017-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
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

Update PTL guc version to 7.36.0.

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index b0deb082ab2b..9c14b0adad0c 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -107,7 +107,7 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 33, 2))	\
+	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 36, 0))	\
 	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
-- 
2.45.0

