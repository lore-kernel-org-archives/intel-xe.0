Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83F3D3B7FF
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 03:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8949810E4A0;
	Tue,  9 Dec 2025 03:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gVh5hW4e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB9410E48D
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 03:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765250468; x=1796786468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GnskNuJJD0eOjveu/zBpxFNatrkMGoQLkdCB16XOKIM=;
 b=gVh5hW4e75kEUj+W3GYA/yAelPRxmP3BAnpi2LYCyscyvfsTtU15wQ1z
 rshp/X4yrrCVX9F2XF349yVpTc2nh+DKL8tMvUCDH/jx4I7bo2uCNn6Yc
 cPCrlLTVzyCcXMuzzZjkhByXsgsXlXq25FNZfhS/+H09PW614pQ0YadeH
 MXVpLW3a9FJxECmksh6+WO05cOp5r/E/uQ7Gl+tpXrpEbH3Zk9sXuQ6hu
 lQ7ebHo7zeXE8nu9eERcfrA8g3L4jdlqinG1+5Wi1yHfVKCpzzQUCPwen
 6C2F5q3ava14apgk9E9USm4N+2sbtRrVqELeXhyjsADxLrgffvV+Wp8lJ Q==;
X-CSE-ConnectionGUID: C68ZKrFPTZ2r34tpAooPVg==
X-CSE-MsgGUID: ox8qm58YQp+UUmX96Y45pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67254158"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67254158"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:21:07 -0800
X-CSE-ConnectionGUID: WrXTBGdtSne4SDH09UOeRw==
X-CSE-MsgGUID: WHat7b/2T8mbS6V9wjAhRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="200289667"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:21:06 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v4 18/18] drm/xe/multi_queue: Enable multi_queue on xe3p_xpc
Date: Mon,  8 Dec 2025 19:21:08 -0800
Message-ID: <20251209032055.1539229-38-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209032055.1539229-20-niranjana.vishwanathapura@intel.com>
References: <20251209032055.1539229-20-niranjana.vishwanathapura@intel.com>
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

xe3p_xpc supports multi_queue, enable it.

v2: Rename multi_queue_enable_mask to multi_queue_engine_class_mask
    (Matt Brost)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 514b70685d54..0b60314f7a98 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -111,6 +111,8 @@ static const struct xe_graphics_desc graphics_xe3p_xpc = {
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
 		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
+	.multi_queue_engine_class_mask = BIT(XE_ENGINE_CLASS_COPY) |
+					 BIT(XE_ENGINE_CLASS_COMPUTE),
 };
 
 static const struct xe_media_desc media_xem = {
-- 
2.43.0

