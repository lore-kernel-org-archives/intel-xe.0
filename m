Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BF1C46CA3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 17:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC55310E79B;
	Wed,  6 Dec 2023 17:14:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D20510E117
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 17:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701882881; x=1733418881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B8pEtNkmbhp1mnBchPJ0hn/vOovBOhXtbd84EgFFwy0=;
 b=GGN3ESU2xxi/MxrJVyNR6BjIvCv2ZENTxjjBvVXuOVGjU2PDZzKvK7jj
 +jbx97UBQl8aum2gm6z4OdhXgOIhXcGfODnQFcy65HtOKEjaEYfFQeoo8
 ITStwLEMovD6NDzatOJBqQ4+34TvqteukPRRa6Iy9+g4SD56tBpPpAxtI
 Fco7xkZAaqbJwrPdkdOJM3+QwHN3+Ooz6x/cvrD0I/I2EUQ3cbrBfqRMZ
 dI/tVTgN3Na8w6fCz1QZzuow+Q9bjhtFIga17/6kgGdzAGgZYTSDKOg6P
 ofFYMdiddxmFaWXvmeWYs8rIe0Wn6SZ691h6vH0GK2tpFqjiwC/6tpbsg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="391262472"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="391262472"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 09:12:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1018632100"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="1018632100"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmsmga006.fm.intel.com with ESMTP; 06 Dec 2023 09:12:57 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 22:50:27 +0530
Message-Id: <20231206172027.1184366-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206172027.1184366-1-himal.prasad.ghimiray@intel.com>
References: <20231206172027.1184366-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 9/9] drm/xe/xe2: Support flat ccs
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
index 2186ebfbe05c..c3032143096f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -164,7 +164,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
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

