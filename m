Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2CECCFA0C
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 18:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CE710E31E;
	Tue,  4 Nov 2025 18:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jXTTCII0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7172210E31D
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 18:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762282319; x=1793818319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ssFHBTsjN/mWmnHvDqjkG7iPjgyTqIYIv2Lst+4MsbM=;
 b=jXTTCII0YV+uiHvY1PcyRzD9PalSYS3cqC/mhlcfdeKfV+GEBhYPyZxz
 uRKAPb2mdjtlOuU6yl+8D2JkxvJUj/FBbj7xXodwReB//ldUFWiczHlA5
 fg3p13EujWCpaiRLNv+cDemyl1odi0wZm8TKC+O1uVJF9kor9kiUBLInp
 do7oGHhKB5h8b8q2dbzOT8kaNTgpTh6hjnmxpHYMouBeVyQjnlE+IS0ay
 PqWQ2kzyRPL+BfCNc4vWC1eGlkfRoQx8GVN4+tF6b52aSFQMg/nJ3psoh
 kXLZfbuPWphfQmEuDBpFriD4GAyLW6PDUpjF76tzs8dXLpkHZqHL56jXK Q==;
X-CSE-ConnectionGUID: SiAoJb8cSBOgXUox56IdAQ==
X-CSE-MsgGUID: TyLt2T/NQ1OXkB0Ruk5eCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68247762"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="68247762"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 10:51:58 -0800
X-CSE-ConnectionGUID: TZ7Ak0BhSRmmEvtBk20p7g==
X-CSE-MsgGUID: m2l09KPzQfGZbqYlg4QSnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="187183114"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 10:51:58 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v2 16/16] drm/xe/multi_queue: Enable multi_queue on xe3p_xpc
Date: Tue,  4 Nov 2025 10:51:50 -0800
Message-ID: <20251104185150.246345-17-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
References: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
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
index 927d3a62c02d..d375f0c0395e 100644
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

