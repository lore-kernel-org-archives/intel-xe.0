Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE58C369D3
	for <intel-xe@archiver.kernel.org>; Sun, 27 Apr 2025 09:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9009410E05D;
	Sun, 27 Apr 2025 09:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iR4DR5Bd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C8310E05D
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Apr 2025 09:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745747028; x=1777283028;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Us+6coO3PcbYdNGnS/UaYuggc3qL39wSpIc3URPYVM8=;
 b=iR4DR5BdYEZ4YvIawsvOvyqSA7h3OJ/VPurJFnpbZd1a4+s3UmkH+nWY
 GEQQ8+2ZGzsnfMOEvzd4DeUEH35M69Y92hxVpDCQLHvXxk5wXEO3SG6BS
 8i4cbZFTKdUQ8n+s/FnOhe/ln97Ao69+BRbzshaGkdotB2CfO1BjHJypx
 tZqxZbauWcN/pBcoSLjyVncxXYsLqNO52At4OlvYI3PxHtafo+ciR14zQ
 lZ/ETJ0oL6tePmzCqYo/k7FcG96oVeBBoMtnJwg1EzBDoox2QIJTQHsfx
 iW0VDCrOMTmwkVor462ntJi0RqFa4nQDMhNH9oX8kv1IhpSYJBBkOZU8R g==;
X-CSE-ConnectionGUID: En2oVJDlROSdp8CZj7x6tg==
X-CSE-MsgGUID: q5DyUodoTUiCZfpPs2Urvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="47237651"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; d="scan'208";a="47237651"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 02:43:42 -0700
X-CSE-ConnectionGUID: qemDA9KmSxaV6Tk2TOaWLw==
X-CSE-MsgGUID: fimCuGJfS+KuTpxiEnM5/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; d="scan'208";a="138081609"
Received: from intelmailrelay-01.habana-labs.com ([10.111.11.20])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 02:43:41 -0700
Received: internal info suppressed
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 53R9hWZl1497712
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sun, 27 Apr 2025 12:43:32 +0300
Received: (from dhirschfeld@localhost)
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id
 53R9hWMv1497711; Sun, 27 Apr 2025 12:43:32 +0300
From: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dafna Hirschfeld <dafna.hirschfeld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/gpusvm: set has_dma_mapping inside mapping loop
Date: Sun, 27 Apr 2025 12:42:38 +0300
Message-Id: <20250427094238.1497681-1-dafna.hirschfeld@intel.com>
X-Mailer: git-send-email 2.34.1
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

The 'has_dma_mapping' flag should be set once there is a
mapping so it could be unmapped in case of error.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 30408f2dd370..4e18b201b5e7 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1464,9 +1464,9 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 		}
 		i += 1 << order;
 		num_dma_mapped = i;
+		range->flags.has_dma_mapping = true;
 	}
 
-	range->flags.has_dma_mapping = true;
 	if (zdd) {
 		range->flags.has_devmem_pages = true;
 		range->dpagemap = dpagemap;
-- 
2.34.1

