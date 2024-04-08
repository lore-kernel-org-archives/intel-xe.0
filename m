Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AE9C67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 17:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23E61128CC;
	Mon,  8 Apr 2024 17:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZt7XT9r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A259C1128CC
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 17:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595939; x=1744131939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6WGdwOlspgi+kVN01Piu3EGpbq0ktydWmViwiS4XzeU=;
 b=UZt7XT9rfkr+2ZchuhMvWjI2RbWB/X6+FltmdSjv2imWu85/AU1B7FD4
 LJB7RQZpxOtnQbQA+b6eQOMIvmxXlw+g+fosXInuY3uHyfYrx/TDxgvJD
 9xFgjgyOCsHhBRe9WjHwun0jzbkRDy3M7eda+RSxE7+aw+CRrw3QWM4ky
 /sGR1WiDBua4v4vZiCHZkxXBEWTpCsYkXNng0KB3ODRWRI6zQsXaDLh1v
 OiRXFjItltHvAQO4WQfkY98L8tghOjyxyt+DFQzzJSivCNUbz3qfrsk01
 R17kTXbCnlbbEulKogmfREtlE/FEjU2w2y3bXzf6YkWXY2YbnR8lQ+/oN w==;
X-CSE-ConnectionGUID: u5xsO+dNSGaeQNZPOwP+yg==
X-CSE-MsgGUID: 0HU9mSPKSEe2MDeWIin5Tg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11679159"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="11679159"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:39 -0700
X-CSE-ConnectionGUID: F9nOIAEhTd2+ynhGt+X0eQ==
X-CSE-MsgGUID: gH+AOBkmSEqcfWiynFZtIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24733872"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:37 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v3 07/11] drm/xe/xe2hpg: Remove extra allocation of CCS pages
 for dgfx
Date: Mon,  8 Apr 2024 22:35:41 +0530
Message-Id: <20240408170545.3769566-8-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
References: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
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

From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

On Xe2 dGPU, compression is only supported with VRAM. When copying from
VRAM -> system memory the KMD uses mapping with uncompressed PAT
so the copy in system memory is guaranteed to be uncompressed.
When restoring such buffers from system memory -> VRAM the KMD can't
easily know which pages were originally compressed, so we always use
uncompressed -> uncompressed here.
so this means that there's no need for extra CCS storage on such
platforms.

v2: More description added to commit message

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6166bc715656..fdeb3691d3f6 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2201,6 +2201,9 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 
+	if (GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe))
+		return false;
+
 	if (!xe_device_has_flat_ccs(xe) || bo->ttm.type != ttm_bo_type_device)
 		return false;
 
-- 
2.25.1

