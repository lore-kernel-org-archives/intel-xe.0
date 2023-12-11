Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9ECC10F05
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 13:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE45810E42F;
	Mon, 11 Dec 2023 13:36:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2076110E438
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 13:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702301786; x=1733837786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nh9V9eJR6KsSNEgyyYlIG26qIpcMAwdcKiBoFfiYb2I=;
 b=UGkIlK+x9awASBNfFYDdpbPjuWjCgqL+/YbDq8UIS4+naxhfRR6SOwrc
 hHiLs1hX+82EhJdoM3Y+8kp9YoJ99MtqU6tUO6MseNoZLOds/l8Wcf/9f
 RShXyNx+oXlWdM0wowdXtNhlUvgdTXdabpLWsVmanCQDf/E/YO1g50Hjx
 bAltoJYvxAfS4ZB14G8KjcceyuKsg7uHhyF1awX5Sbasstsi916jzBn8H
 NR5qVfKMnR6iVU4MR4w919yTeodT3sUIn802eyQkIZ1tCnt7ynz9fwtNV
 tHhEx4vC6Fq8HHatBsNXn3oBlvqixvnPqgKUB/SsdkI5seNZqIxQkPavz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1715625"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="1715625"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 05:36:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="946324838"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="946324838"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga005.jf.intel.com with ESMTP; 11 Dec 2023 05:36:24 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 10/10] drm/xe/xe2: Support flat ccs
Date: Mon, 11 Dec 2023 19:13:56 +0530
Message-Id: <20231211134356.1645973-11-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211134356.1645973-1-himal.prasad.ghimiray@intel.com>
References: <20231211134356.1645973-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Enable flat ccs for XE2_GFX_FEATURES.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 260e8a6034a7..b75b629db886 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -164,7 +164,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 #define XE2_GFX_FEATURES \
 	.dma_mask_size = 46, \
 	.has_asid = 1, \
-	.has_flat_ccs = 0 /* FIXME: implementation missing */, \
+	.has_flat_ccs = 1, \
 	.has_range_tlb_invalidation = 1, \
 	.has_usm = 0 /* FIXME: implementation missing */, \
 	.va_bits = 48, \
-- 
2.25.1

