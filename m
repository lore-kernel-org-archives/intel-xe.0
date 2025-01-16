Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15116C02185
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 00:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35BB10E537;
	Thu, 16 Jan 2025 00:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nvOJThri";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D70F10E84D
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 00:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736986304; x=1768522304;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q3HKMlHaRl8pc4AwQEccl3xb2B0R5jbZyOtavLgUB+s=;
 b=nvOJThriQAgFVA3oHllAH3l0UUg6HykXzwp4BwcIQWLigTnINMmaqKAC
 42cUyQ1Ij23p6xSyurS8+d3eVXO6aOF3OsP54eeHawj0nC2PkWDwG9kPd
 FPPK6VDcjtCqhYT+ChHXlsGD+XqFCgNetBy9ITTAvLR1gW55PYolwQsEJ
 HgrJ0IzPInME8JddRSOQfVr3zY2Qaq2VDRkGEnIgaAXRPGfSSbSvdeVtM
 iqydaniR3kHQiTYqUGYRZbmEBmXiMBtAwI5af1VvCn8EjXWGG++GG0Ptc
 peFlqhXDFMwTLOBZN/U/+eJ6StVA385e70SK93WOtTyyyc8DgH2O31axp w==;
X-CSE-ConnectionGUID: 1QCPSGTgQo+3ASKp3s+nuw==
X-CSE-MsgGUID: uwo+/RPTQEysdIhY58bLgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="47832117"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="47832117"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 16:11:43 -0800
X-CSE-ConnectionGUID: v4YT/AqPSACQEqZIEx73bg==
X-CSE-MsgGUID: OiR+zOMdQSCAnJb1/ySMOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="105073061"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 16:11:43 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v5 13/13] drm/xe/pxp: Enable PXP for MTL and LNL
Date: Wed, 15 Jan 2025 16:11:09 -0800
Message-ID: <20250116001110.4158032-14-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116001110.4158032-1-daniele.ceraolospurio@intel.com>
References: <20250116001110.4158032-1-daniele.ceraolospurio@intel.com>
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

Now that are the pieces are there, we can turn the feature on.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 44f59af94652..c9c88a818b2d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -336,11 +336,13 @@ static const struct xe_device_desc mtl_desc = {
 	.require_force_probe = true,
 	PLATFORM(METEORLAKE),
 	.has_display = true,
+	.has_pxp = true,
 };
 
 static const struct xe_device_desc lnl_desc = {
 	PLATFORM(LUNARLAKE),
 	.has_display = true,
+	.has_pxp = true,
 };
 
 static const struct xe_device_desc bmg_desc = {
-- 
2.43.0

