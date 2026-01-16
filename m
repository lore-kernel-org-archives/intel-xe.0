Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5FBC98302
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABB610E0FB;
	Fri, 16 Jan 2026 22:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oj+MWjz9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F5810E00E
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601020; x=1800137020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6aPgXC/KxzuuRSuz7Un9HZ1ooEB+c0Mz9y7XTRzJAmo=;
 b=Oj+MWjz9zSVg8bV73IHLzBOOYAWRAc3rLz8Gl1+VCnRYf+VCfZzdVsHx
 vKXadwdnCV9QgzsQPpZ0KKg4OQzuwBaPhyo7Aswf6vprXAvr+0ckLFYWR
 ZDxLwa1ugibHC6WuxVx8FepFnjjB9nNmB3bRCa/rO7ZcZnGlbjSqmvRJT
 rQXFqRsumFBnxtZO4CLOIlbx4DWCSZFoI3oKn6mTyIY+fudNeIRD/QCin
 7WtEtUPdv5GI5vgrWJ8oLyTDX3+ic45kQAvDuL1BZRcnN1rRVy8jC5ql5
 4hsTaNtbLjxQW5N/i9pvSKti8CmC3qFYngRDS8jy0qN6xiFzPeoNYdcUg w==;
X-CSE-ConnectionGUID: dbt2GwCORIOTJMQyArBGFA==
X-CSE-MsgGUID: 0MuTrjFUQUm8kbX/hi/eng==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="81035380"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="81035380"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:03:40 -0800
X-CSE-ConnectionGUID: btIPz6r+SAqMQ2fp4EHlbw==
X-CSE-MsgGUID: LAaLVwaqTwu+YeIGMYxaXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204959424"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:03:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v3 2/2] drm/xe/multi_queue: Enable multi_queue on xe3p_xpc
Date: Fri, 16 Jan 2026 14:03:33 -0800
Message-Id: <20260116220333.861850-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116220333.861850-1-matthew.brost@intel.com>
References: <20260116220333.861850-1-matthew.brost@intel.com>
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

From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

xe3p_xpc supports multi_queue, enable it.

v2: Rename multi_queue_enable_mask to multi_queue_engine_class_mask
    (Matt Brost)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2c3656126751..405fcf68d5a7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -112,6 +112,8 @@ static const struct xe_graphics_desc graphics_xe3p_xpc = {
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
 		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
+	.multi_queue_engine_class_mask = BIT(XE_ENGINE_CLASS_COPY) |
+					 BIT(XE_ENGINE_CLASS_COMPUTE),
 };
 
 static const struct xe_media_desc media_xem = {
-- 
2.34.1

