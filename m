Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D820FC98304
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 18:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC6E10E961;
	Wed, 23 Sep 2026 18:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EEFgwqTp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2B910E961
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 18:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790188564; x=1821724564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0xU8r942OXf0ZOfdS7zirYPygAKvLnifaFFdyUnfIqk=;
 b=EEFgwqTpe7CwHSAZ9qJUyRySSLmXKAeWUR31sGjO+Av6hr6DHgEgLAR3
 SyAiBj2DNnmLsregt8sGcTfbfTB5zZ8yNfxNVtBLQyX/ILDbrfEog/Z0J
 f5TTt8/T23EkuNqVqtcoR0UOV4WrbAalPrG6pQIm/QdtzRwLza3222f9u
 XsM9UL49iCGjLez9ICIiEUI9UGbK68aR3k02YEvMPlnrWplXnuHnkCnAi
 S411MdlLyDzC5uv69aSrs7qmLseAh7VgRI9QBQHb9HQIKHESgRkPa36XP
 tF/Wgn9fWqjdFHgMt8TKooZBlxA9A4PNMeNv4LqnNIMCUFPFY/lWNa3BP A==;
X-CSE-ConnectionGUID: Hyd80FkAStihAQcF4TvkVA==
X-CSE-MsgGUID: MDXpuaXbQuma5Y462ZMPVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="89832142"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="89832142"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 11:36:03 -0700
X-CSE-ConnectionGUID: SxHAayOoQmWeyiF8sHPdsg==
X-CSE-MsgGUID: BJ9eQEQGQ/yCfEYWEdoJGA==
X-ExtLoop1: 1
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2026 11:36:03 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/2] drm/xe/nvl-s: Enable PXP for NVL-S
Date: Wed, 23 Sep 2026 11:36:03 -0700
Message-ID: <20260923183600.1186943-6-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923183600.1186943-4-alan.previn.teres.alexis@intel.com>
References: <20260923183600.1186943-4-alan.previn.teres.alexis@intel.com>
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

Now that the GSC FW is defined, we can enable PXP for NVL-S. The feature
will only be turned on if the binary is found on disk.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d64e873d9e71..94fa9c960235 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -460,6 +460,7 @@ static const struct xe_device_desc nvls_desc = {
 	.has_flat_ccs = 1,
 	.has_pre_prod_wa = 1,
 	.has_sriov = true,
+	.has_pxp = true,
 	.max_gt_per_tile = 2,
 	MULTI_LRC_MASK,
 	.va_bits = 48,
-- 
2.43.0

