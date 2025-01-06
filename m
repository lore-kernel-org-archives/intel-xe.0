Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947D2E77199
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 21:12:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656D610EA13;
	Mon,  6 Jan 2025 21:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WROcGu3g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BFB10EA25
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jan 2025 21:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736197961; x=1767733961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rs1klmr/KPKU8K1wVbAQsfqbWK74sXmTMoRkJq68J4Q=;
 b=WROcGu3ghba/2G9IGZTfE3jCYtwQdJX823uI1ukJ1kKG6dZpzhsX8C74
 OWrKysNau3XZEOKGOcTrM84revX7eU4UUR9dGvSYq1+6RCG0EoRwvCdKZ
 BTpwCl67cOQHcVdISrB/+sHmrtXv+7Ukr05s1gORHyI7r3jP98H7DegzO
 yiw+vUf5YgptqCpiJzE5GlgIoC0pQtvZRUqCZZeIp9/ADqbAeVehVe0NF
 jmhFA20tmnrGeQLzff5AT8coFiJEqe/xXQj4ZIflCEF9Nr2CcuakwlyGX
 eidPonNsU/JcXKEKiQLeSmh74LyocK1Cp/rEoMB667Dkrp+ptLrYXZHEM w==;
X-CSE-ConnectionGUID: poRh84c5SYmfyVzQdj/usg==
X-CSE-MsgGUID: lTnRmgAPSEWEjHx7IDlQQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="61734945"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="61734945"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 13:12:41 -0800
X-CSE-ConnectionGUID: pl39m5+KTj64GOfv3HNroQ==
X-CSE-MsgGUID: py3W8CB+QtegWyF5Lzb2Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="107417850"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 13:12:41 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v4 13/13] drm/xe/pxp: Enable PXP for MTL and LNL
Date: Mon,  6 Jan 2025 13:12:10 -0800
Message-ID: <20250106211212.3418231-14-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250106211212.3418231-1-daniele.ceraolospurio@intel.com>
References: <20250106211212.3418231-1-daniele.ceraolospurio@intel.com>
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
index 9c95ecc81b81..b67a6bce0664 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -337,11 +337,13 @@ static const struct xe_device_desc mtl_desc = {
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

