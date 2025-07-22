Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD471C83F27
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 18:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943AB10E6F1;
	Tue, 22 Jul 2025 18:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V2KvcA2w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9222710E6F1
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 18:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753208796; x=1784744796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z/WTdAZvaT6UTN7GPCzgdEQk8r90S01brFcuh+xJDpo=;
 b=V2KvcA2w2jORJM5WgEnu7OQZDoHVrb8LSG+kRsw++VpXhuDZ19hRGyXt
 9CgLim3wHF6HjZk9RDH3Qlxd6lOFLgoTyrSNajQrqN2Q6Jo2jFjLP/gWl
 XBIZwOsLE6xWp9pSu0NN3eqkn/ZfVHu0+dBiK9Rod5wJ210yXAHbHmW7b
 1koVuVbP7uapD2RvMkkIr57eEQTMNhjU/1m5YK1Kh1FR4ywHryb3QVmPz
 jz4TrHGZrUAcsNYhCzJlhKVCLiOPxPClP91EzPEZvlYusN+X33sCHTafQ
 veFw7hRlOsMYGuPubB1VwFMkAN5TKxwRYcq47p3Qav+J4XcC/H6NnqOfd g==;
X-CSE-ConnectionGUID: MV6MVYj+QwCEHisEzuHGWg==
X-CSE-MsgGUID: Vi/JTTBNRWqkFwna7d8xGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66045768"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="66045768"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 11:26:36 -0700
X-CSE-ConnectionGUID: wk3VmaW7RiuRUCtb5LHl0A==
X-CSE-MsgGUID: Csol5dTvTvqbG9gAE/WMEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="159308241"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 11:26:35 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 4/4] drm/xe: Enable SR-IOV for TGL
Date: Tue, 22 Jul 2025 20:26:18 +0200
Message-ID: <20250722182618.30811-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722182618.30811-1-michal.wajdeczko@intel.com>
References: <20250722182618.30811-1-michal.wajdeczko@intel.com>
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

While we don't have official CI SR-IOV coverage for the Tigerlake
platforms, we were using this platform for the feature enabling
and Xe driver already has all required changes to support it.

Since TGL platforms are guarded by the xe.require_force_probe flag
enable SR-IOV feature on them, like we recently did for ADL/ATSM.

Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 5425a7c213ce..52d46c66ae1e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -169,6 +169,7 @@ static const struct xe_device_desc tgl_desc = {
 	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
+	.has_sriov = true,
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 };
-- 
2.47.1

