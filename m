Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DA0C25B74
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 17:11:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB3910F380;
	Mon,  6 May 2024 17:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKVm0qTH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2F71122D6
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 17:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715015483; x=1746551483;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lZpvoCfakSWvhPLDyJ0aqtu6pUuSoS3zGK1FBbeQVSw=;
 b=QKVm0qTHuEMD2w1PlRjsOwbgw8YVWxcSRQyUMQOKqdmge3YDXpFIVR7d
 iCBoZ9Ey8ROAhN62VSWasjA92eh/YUwoq7C4N5SjtsHeqlbeliHuq426Q
 BoNxukvwlTKyyaMC51uSjWrSz4WyMTO09hvq8+/GmszbBxKZlsvv2XI9s
 CxdJ9TngtstIue6B2OfYfJr2aV1U1uYrLC/Zbn9a98N4R0PYOxY9NlEBE
 dsXIjHx7soH/4f9OYKJAU3/4nI84chjdbYXof/vJ9KyoYmu5upDRzJa0W
 Exicfj86wo/upm3J+nq46S21di/DiOy68mxCDec+2A+UcjOBBJFwXBTmA A==;
X-CSE-ConnectionGUID: slOQem3cSD2OqIfVjgXkSw==
X-CSE-MsgGUID: nMF7XkTYSvadbPoQrggE+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21325505"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="21325505"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 10:11:21 -0700
X-CSE-ConnectionGUID: UQXItzjvS/Km2+/y+x1N9Q==
X-CSE-MsgGUID: Cog6rfvhTzyDOKlGoZEl3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="28116390"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 10:11:21 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/xe/xe2: Enable Indirect Ring State support for Xe2
Date: Mon,  6 May 2024 10:11:05 -0700
Message-ID: <20240506171111.16280-5-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240506171111.16280-1-niranjana.vishwanathapura@intel.com>
References: <20240506171111.16280-1-niranjana.vishwanathapura@intel.com>
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
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 8f3e4c563105..c8512571fca8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -166,6 +166,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 	.has_asid = 1, \
 	.has_atomic_enable_pte_bit = 1, \
 	.has_flat_ccs = 1, \
+	.has_indirect_ring_state = true, \
 	.has_range_tlb_invalidation = 1, \
 	.has_usm = 1, \
 	.va_bits = 48, \
-- 
2.43.0

