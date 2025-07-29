Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136E8C87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 12:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4B010E1F8;
	Tue, 29 Jul 2025 12:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L8sfa74p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D3D10E1F8
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 12:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753792514; x=1785328514;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TxMeaZWVHbveDq7c+xbyF2MtocGiRiObI43yBWR5WXg=;
 b=L8sfa74pJq3WyaxqD8RlRrmfEPne6KqPReglGuwrunJwNRwIS6B9G76U
 jz92bWAYP9Z/UHJhiJ8UrlzvY0kt/SbTFjwKHvGGvguHBSCIxbYgsx+MS
 7CENHyMh+cjGtbODF6u1f2yx/KjIqO0lbcN/alrJ5nUuDvVTH1r1bfWvj
 0UK7tc2bGau9oevbXXKNgX29zQ1AbqxxKl15dDtYnqEcT5qy2UtZdVn1Z
 TTUtKyNm6EES/KSHpAaaALP7pGZb8WL5jIey/Y2vDM1IeYbcOX0T1pdwO
 IXtM2qJSXvHobVt6UPnbZQsQoLAjWsh+/4fyKDayxs7nGXt1wF+xQeL1h w==;
X-CSE-ConnectionGUID: mxNY5orpSpyUqh6SdCkpTw==
X-CSE-MsgGUID: bb1CNOVpTkayD3HnYlpyKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56137839"
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; d="scan'208";a="56137839"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 05:35:14 -0700
X-CSE-ConnectionGUID: dAVaoxQxRfuui5N3v5zEkQ==
X-CSE-MsgGUID: DdzSiDy3SZWPSRIPyHP+eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; d="scan'208";a="162725358"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 05:35:12 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lukasz.laguna@intel.com
Subject: [PATCH] drm/xe/vf: Disable CSC support on VF
Date: Tue, 29 Jul 2025 14:34:37 +0200
Message-Id: <20250729123437.5933-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

CSC is not accessible by VF drivers, so disable its support flag on VF
to prevent further initialization attempts.

Fixes: e02cea83d32d ("drm/xe/gsc: add Battlemage support")
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d04a0ae018e6..c754374f1a8d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -682,6 +682,7 @@ static void sriov_update_device_info(struct xe_device *xe)
 	/* disable features that are not available/applicable to VFs */
 	if (IS_SRIOV_VF(xe)) {
 		xe->info.probe_display = 0;
+		xe->info.has_heci_cscfi = 0;
 		xe->info.has_heci_gscfi = 0;
 		xe->info.skip_guc_pc = 1;
 		xe->info.skip_pcode = 1;
-- 
2.40.0

