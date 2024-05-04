Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF064C4345F
	for <intel-xe@archiver.kernel.org>; Sat,  4 May 2024 23:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8052510FFCC;
	Sat,  4 May 2024 23:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HLx2/KOh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B6410FFCB
 for <intel-xe@lists.freedesktop.org>; Sat,  4 May 2024 23:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714865708; x=1746401708;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=PoHtlZnBt0z8bP9pdP7QlUuasKnU+Dm5WGxiDydbq1g=;
 b=HLx2/KOhhdhgSf4c0/NfaQhc57L2Klh5vh5PLRJhXhY68ZoSKJoNJw+a
 /JNCDogMEQg4JrLwVKG1R1bOzvPkGBx9E7lFbG0yxBxrz0UbrYDMlqr02
 SnvA3hONfAMtJ+IMe7V1R0ZJTTgLMss86L8UblWeGKUBqscwW1DHbkx2g
 NJxKMavl6SMQOFuSciaNozk2dOyRaV2Jtoies82mOFH3jW3UqZGAmrITg
 3lzPYJIkWB+wdWHqYvGfN3yxw9OB2hAaaRcx4Jtfbt3ZOKYyx4HTf105C
 bbFQt48i9TQoWvwGgaxsZUZnREBYNZl4+uL4Dd4QX7a2YRr16itxr7sq8 A==;
X-CSE-ConnectionGUID: aH0f5UioR+Wu8yORd9ua/Q==
X-CSE-MsgGUID: fHKfQcUOT7avEHItqmrTBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21196781"
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; d="scan'208";a="21196781"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2024 16:35:08 -0700
X-CSE-ConnectionGUID: XjVcD/OITXabjJZ5AKwaFg==
X-CSE-MsgGUID: 95VlIgO8SXq2T2k15wgjDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; d="scan'208";a="32606617"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2024 16:35:09 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/4] drm/xe/xe2: Enable Indirect Ring State support for Xe2
Date: Sat,  4 May 2024 16:35:01 -0700
Message-ID: <20240504233503.16095-5-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504233503.16095-1-niranjana.vishwanathapura@intel.com>
References: <20240504233503.16095-1-niranjana.vishwanathapura@intel.com>
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

Indirect Ring State is the recommended mode for Xe2 platforms,
enable it by default.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 5bf94abf84cc..9f66c41067d3 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -164,6 +164,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 	.dma_mask_size = 46, \
 	.has_asid = 1, \
 	.has_flat_ccs = 1, \
+	.has_indirect_ring_state = true, \
 	.has_range_tlb_invalidation = 1, \
 	.has_usm = 1, \
 	.va_bits = 48, \
-- 
2.43.0

