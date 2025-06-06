Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74C7C61CE8
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 10:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD0310E34A;
	Fri,  6 Jun 2025 10:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AnmeGNzd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BF410E34A
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 10:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749206764; x=1780742764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qXK/Pec3ts9s2S4G47/MrdTjAEaxTbRhoLzSxXSrD+4=;
 b=AnmeGNzdXiBzbelXv4lvY2JiZ/sFytSXlCUkJecer+18X3VZOCoQlP1f
 WsE7MFtQjRHjk1rZBnt6PUcZzlg3EOAh+6Fg855UG/4Ol0zJnnaNsw+8n
 H1E/snmH5eU9GyeLorXtPf2vHYA3j+fJTbrqieMv6EBmdtC//IGicsv92
 QSeWvBIyOo2PnVHGGD/u6K+6hxajNyzBGgysbJMIyYxpEVkF+m9Oay7cI
 6qhwZMuhRQLxikv8OqsDLvZQQhZfhZ2f5kNGCwnHz5mE3OpH6PujTGetm
 UJU4n9pPcb+XHyenWeKlb+sj7Xj09uq358GAbVNziAnBbDLWI5euj5tFC w==;
X-CSE-ConnectionGUID: EsrkvSkgRACil9eysck3gQ==
X-CSE-MsgGUID: dTTSynudSI+YUFqF8vmE3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="50582341"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="50582341"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 03:46:04 -0700
X-CSE-ConnectionGUID: hLL9ssjDTXSBAK1EpqAlxQ==
X-CSE-MsgGUID: goRUD85cTqmc2z9B7yuzJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="146384867"
Received: from johunt-mobl9.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.52])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 03:46:03 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 2/2] drm/xe: move DPT l2 flush to a more sensible place
Date: Fri,  6 Jun 2025 11:45:48 +0100
Message-ID: <20250606104546.1996818-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606104546.1996818-3-matthew.auld@intel.com>
References: <20250606104546.1996818-3-matthew.auld@intel.com>
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

Only need the flush for DPT host updates here. Normal GGTT updates don't
need special flush.

Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: <stable@vger.kernel.org> # v6.12+
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 461ecdfdb742..b16a6e3ff4b4 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -165,6 +165,9 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 
 	vma->dpt = dpt;
 	vma->node = dpt->ggtt_node[tile0->id];
+
+	/* Ensure DPT writes are flushed */
+	xe_device_l2_flush(xe);
 	return 0;
 }
 
@@ -334,8 +337,6 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	if (ret)
 		goto err_unpin;
 
-	/* Ensure DPT writes are flushed */
-	xe_device_l2_flush(xe);
 	return vma;
 
 err_unpin:
-- 
2.49.0

