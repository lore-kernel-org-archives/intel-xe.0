Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FB6ECD9AA
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 23:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97FA310E175;
	Thu,  5 Feb 2026 23:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMRiTjZX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CA910E175;
 Thu,  5 Feb 2026 23:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770334830; x=1801870830;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=+MWo1Pl+syNF/Xj6Q3RXKyus6apvFC4cJQMHB6NvU+U=;
 b=gMRiTjZXLWjFfQSFGtzK9jKGjz6A0X40c/CFHnMwvIK0SrLAC/z/gFpe
 3+IQhDtdMQ7kGOZ9HWhe8DtuJhOHXTtWZwjtHbcLvcKX2UH7XFPvLRFJg
 uoEr807DFXcx5UgUy0gXB2gGtHtjdXWLw+IGwnTFh26EOyNuH5+zO8orQ
 Iu9DlKvZGXrxRS3d3ci1FL/0aN6pw84cx8twNvO5kgGdPMJvArUwKn0dg
 hbdDh/gu8kruVvgtuPDT+qzknbY6qMhgGeG8RSfoqFr/hMtaj4N4GgR/7
 URpW7RE0QF8RlJBOSH6QPe3lLzYKGXm2PB/ee+RmUygJ9ZpBnYchhHI43 Q==;
X-CSE-ConnectionGUID: /b51S4Z5S9Gt7hv3wuebZg==
X-CSE-MsgGUID: XUMgT6+LQ5e+gLSzKN+JQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82658674"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="82658674"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 15:40:30 -0800
X-CSE-ConnectionGUID: v0cZEH5iS6C3U9Rxtcgmkg==
X-CSE-MsgGUID: OddJe5Y0TIKgRtRz+z1fJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210500064"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.82])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 15:40:11 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 05 Feb 2026 20:39:29 -0300
Subject: [PATCH v2 01/15] drm/xe/xe3p_lpg: Add support for graphics IP
 35.10
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-nvl-p-upstreaming-v2-1-9ec14f00cc6c@intel.com>
References: <20260205-nvl-p-upstreaming-v2-0-9ec14f00cc6c@intel.com>
In-Reply-To: <20260205-nvl-p-upstreaming-v2-0-9ec14f00cc6c@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Shekhar Chauhan <shekhar.chauhan@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

From: Shekhar Chauhan <shekhar.chauhan@intel.com>

Add Xe3p_LPG graphics IP version 35.10. Xe3p_LPG supports all features
described by XE2_GFX_FEATURES and also multi-queue feature on BCS and
CCS engines.  As such, create a new struct xe_graphics_desc named
graphics_xe3p_lpg that inherits from XE2_GFX_FEATURES and also includes
the necessary .multi_queue_engine_class_mask.

Here is a list of fields and associated Bspec references for the members
of the IP descriptor:

 .hw_engine_mask (Bspec 60149)
 .multi_queue_engine_class_mask (Bspec 74110)
 .has_asid (Bspec 71132)
 .has_atomic_enable_pte_bit (Bspec 59510, 74675)
 .has_indirect_ring_state (Bspec 67296)
 .has_range_tlb_inval (Bspec 71126)
 .has_usm (Bspec 59651)
 .has_64bit_timestamp (Bspec 60318)

v2:
  - Drop non-existing fields from the list in the commit message. (Matt)
  - Squash patch adding .multi_queue_engine_class_mask here. (Matt)
  - Rename graphics_xe3p to graphics_xe3p_lpg. (Matt)

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b5e8935fff1d..08e0ff9f75e8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -106,6 +106,11 @@ static const struct xe_graphics_desc graphics_xe2 = {
 	XE2_GFX_FEATURES,
 };
 
+static const struct xe_graphics_desc graphics_xe3p_lpg = {
+	XE2_GFX_FEATURES,
+	.multi_queue_engine_class_mask = BIT(XE_ENGINE_CLASS_COPY) | BIT(XE_ENGINE_CLASS_COMPUTE),
+};
+
 static const struct xe_graphics_desc graphics_xe3p_xpc = {
 	XE2_GFX_FEATURES,
 	.has_indirect_ring_state = 1,
@@ -148,6 +153,7 @@ static const struct xe_ip graphics_ips[] = {
 	{ 3003, "Xe3_LPG", &graphics_xe2 },
 	{ 3004, "Xe3_LPG", &graphics_xe2 },
 	{ 3005, "Xe3_LPG", &graphics_xe2 },
+	{ 3510, "Xe3p_LPG", &graphics_xe3p_lpg },
 	{ 3511, "Xe3p_XPC", &graphics_xe3p_xpc },
 };
 

-- 
2.52.0

