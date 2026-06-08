Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCAECD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:54:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FF410F76C;
	Mon,  8 Jun 2026 16:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNS7ggDI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95F110F768
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780937687; x=1812473687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wMVI31gyWdy5xcNH8hqcNjV258aE8gs1IqcHCuZe97Q=;
 b=HNS7ggDId2GqpT13LFn8c9FcMDvmePyOo+EUwNAWCZ0rK7piPCPXxAug
 2OVHTn2J4mdW0/x/+8NGOJMhbtOx3DcE49YUCLMlr6cMniS1y2xw7xAoi
 t9Rqn896Ex49NriZmt9eOkBHpx6g6LETuIaCsIcWgoTGUH38IRdfp8gJl
 1aPJuWyLCrtxka5q5DN6alXPs/ExAkHmwH20TG3oSH7hyIDfX1RFct4b+
 YahfwbbZCC+Dygnxv3KuaNiiMma6kFSn76G7/Hch3yQh3Z0zFrdtvXfeC
 n/F4cnnh0dw6gdrVXs+EvgtW63BYXPbn2XmXUspieM3Q2YLwo1UV0wZv2 Q==;
X-CSE-ConnectionGUID: lYftqcsPRkm8UkTSQj7EAg==
X-CSE-MsgGUID: 7DjKjV4lS2Wfajhg8xnHjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81744533"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81744533"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:44 -0700
X-CSE-ConnectionGUID: Hsfk+0duSEiwcZW+popUQQ==
X-CSE-MsgGUID: wVyLsGzFR0WeQYcnAmL4wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247467530"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:42 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 03/16] drm/xe/mmio: Add check for minimal BAR size
Date: Mon,  8 Jun 2026 18:54:16 +0200
Message-ID: <20260608165429.587-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608165429.587-1-michal.wajdeczko@intel.com>
References: <20260608165429.587-1-michal.wajdeczko@intel.com>
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

We initialized the root tile's xe_mmio structure with a new size
of 4MiB without sanity checks to see if mapped GTTMMADR_BAR was
actually at least that size.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 51db46d13757..bdfcc698caf9 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -100,13 +100,18 @@ int xe_mmio_probe_early(struct xe_device *xe)
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
-	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
 	xe->mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
 	if (!xe->mmio.regs) {
 		xe_err(xe, "Failed to map GTTMMADR_BAR\n");
 		return -EIO;
 	}
 
+	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
+	if (xe->mmio.size < SZ_4M) {
+		xe_err(xe, "GTTMMADR_BAR is too small: %zd\n", xe->mmio.size);
+		return -EIO;
+	}
+
 	/* Setup first tile; other tiles (if present) will be setup later. */
 	xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
 
-- 
2.47.1

