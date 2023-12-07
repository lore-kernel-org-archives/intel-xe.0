Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1759EC10DCE
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 09:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB5810E82A;
	Thu,  7 Dec 2023 09:12:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B8710E825
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 09:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701940315; x=1733476315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B8pEtNkmbhp1mnBchPJ0hn/vOovBOhXtbd84EgFFwy0=;
 b=i64IeAAKtfVdOJAGVPnXqDcqgkc2l2G2mE2DrPiizPuqxTXIj/EUst3p
 +XoBCl/ZfV7z+rdyfSOb4fzbJcVXBLgCutIT7G3Cw+lzYQoYxS+hSyo7B
 Q/DtI5g2jvTvy2sTsa0Njrp+IqFWbrGNJg/G+hEsJmS03XkSokiUsyyIO
 0yQkOZNFvVzwPVhvwCjd8QoVTDa7+YGW8Hq5QicCqyuj5YLFO8dSAav7S
 oqSUIoNKgmlHoIM6wcRlThNO52tSuL7GV3MfpldDpFyU8R+lHhS5CHWjU
 tqEn8g3QQnxXl9bMYhApiZ66C1wqaI5QGdvKKZ9rOG1YW01/aOIso29Eu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="391374030"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="391374030"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 01:11:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="895067885"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="895067885"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga004.jf.intel.com with ESMTP; 07 Dec 2023 01:11:53 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Dec 2023 14:49:22 +0530
Message-Id: <20231207091922.1224800-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
References: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 9/9] drm/xe/xe2: Support flat ccs
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

