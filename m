Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE20C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 04:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542C210E670;
	Wed,  6 Dec 2023 04:23:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A6310E67A
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 04:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701836637; x=1733372637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=99YL6yI48dFvgph7lskp+NTZx5Po1QDLiCr5WAtBAB0=;
 b=P2VGtigt+o7DcgjC8XMcp7gngIjqTpRdzanJC2fn+WJGp/FQZd8FZUVg
 g7hPKIeOdVSloGvOy5KsWzpjo7J+HLPH0RUydeYu/OyEcnvbT3nxOoUFk
 3n4CTjIX060tq7nbYMwJazhReK/GkN7s6xH9DErce8f6RtZ3J8keR1k0L
 Vxw6YBYnVnVgsMnhF2+p0QV8CV+UEtKZ0xZ5SCAPD5Zboo4h8Hx0QEM7U
 bx7i7W/CxeN70dIAGqEFrL5+Kf0dTMpwIfPiyHXDZza915/1oB51ROLcq
 ZTUVtOIdNReb4ILP16ehFG8MxblquI/glXdSflHMTKWroe0TMchbiuNyh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="458326782"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="458326782"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 20:23:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="12556345"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa002.jf.intel.com with ESMTP; 05 Dec 2023 20:23:56 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 10:01:26 +0530
Message-Id: <20231206043126.984049-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
References: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 9/9] drm/xe/xe2: Support flat ccs
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

Enable flat ccs for XE2_GFX_FEATURES.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 076e9dc85838..4a56c2f7a6ac 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -163,7 +163,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 #define XE2_GFX_FEATURES \
 	.dma_mask_size = 46, \
 	.has_asid = 1, \
-	.has_flat_ccs = 0 /* FIXME: implementation missing */, \
+	.has_flat_ccs = 1, \
 	.has_range_tlb_invalidation = 1, \
 	.supports_usm = 0 /* FIXME: implementation missing */, \
 	.va_bits = 48, \
-- 
2.25.1

