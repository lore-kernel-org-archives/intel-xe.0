Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADEECCD194
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BAA10E538;
	Tue, 14 Oct 2025 03:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BSw3gAzS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4CC10E1BF
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412330; x=1791948330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UnZoQ6YSrWXz9C1egGYUkD+2DMWWX3S14hxO5MPQnfs=;
 b=BSw3gAzS8gGY6G/KSAo2mZ3AKKGIjZpRYlGu4MYB6YjMpuHRnvUxDZ+J
 a9o9H3dpMYi2APaFwvRWfPBPyOKZGI7ayaPUlHvRYMxyVmjjd24moOtzN
 +G9YwVikEBELU5RcOENdN06GAyqxZj0jQfGHXbSiWg9s0FBOHVQEPvRJ3
 luNIQ9Hk9JIq+xeJP0/x+w7lAiS58eFdtViJkh36XtRkz8WA2QqdvP7Zx
 LMsVVtsGpvx7dcQDvf51Tc7LIoJ6KKXv0NtC+y/qOm6/tMZki1PCOVqn/
 m0fK5C83ZE96p9Tisn4xUv83uBko/47ksdHWYfVyE95K40q961lif7AjX A==;
X-CSE-ConnectionGUID: qDs9d5YJSGWsC/5tP3V2ow==
X-CSE-MsgGUID: +X86ywXlRwGJkdE1DMquBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414882"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414882"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:30 -0700
X-CSE-ConnectionGUID: VKXvZYqlQ0mFbACXAu1Rbw==
X-CSE-MsgGUID: Aou2elTOTumjeNBK5kwvug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567320"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>, Fei Yang <fei.yang@intel.com>
Subject: [PATCH 18/23] drm/xe/xe3p_xpc: Add L3 bank mask
Date: Mon, 13 Oct 2025 20:24:50 -0700
Message-ID: <20251013-xe3p-v1-18-bfb74f038215@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Fei Yang <fei.yang@intel.com>

Expose L3 bank mask through topology query interface.

Bspec: 74110
Signed-off-by: Fei Yang <fei.yang@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 80ef3a6e0a3b5..14af073783ad3 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -148,7 +148,11 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
 	if (!xe_gt_topology_report_l3(gt))
 		return;
 
-	if (GRAPHICS_VER(xe) >= 30) {
+	if (GRAPHICS_VERx100(xe) == 3511) {
+		u32 fuse_val = xe_mmio_read32(mmio, MIRROR_L3BANK_ENABLE);
+
+		bitmap_from_arr32(l3_bank_mask, &fuse_val, 32);
+	} else if (GRAPHICS_VER(xe) >= 30) {
 		xe_l3_bank_mask_t per_node = {};
 		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
 		u32 mirror_l3bank_enable = xe_mmio_read32(mmio, MIRROR_L3BANK_ENABLE);

-- 
2.51.0

