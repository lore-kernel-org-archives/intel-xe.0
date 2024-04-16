Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FD2C04FFF
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 22:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAF6112EB1;
	Tue, 16 Apr 2024 22:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8SDOYB6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470D010F3DC
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 22:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713306130; x=1744842130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iczzbWCrErVOxa7WVRRqg60zu+4wTxrH7h2Xk+5vHb8=;
 b=m8SDOYB67m+W6gIrK0RRNXl0yonlgB5iVHBoOIQ6vz45BzQ6Cchnknx1
 2rqawljEp+dmCnXZNFsAuFwosdtZX6xnerBBRNzyzq2raRRIgOGtRwIPN
 NxqBFWlHdQOIOYirYkfgXyzjCiLiLY4Umm25vrvLYSsFmxaSqSLBeixdS
 WrscriHqaUhiCdwk/+dAzg8drpoa3PAD4ma2J1jXHdkao2wKyQdJPrta+
 WdMelbrAzOrEa1SjBE3kcmTWdezFHxyDeJg3yZaGsgoVQM/0ZKmlNNAle
 fGsJQgFUuZJT/B9jJDHMvoZwCeIZd7HrWA0raKgOqrB6O1FLb/2voRbUd Q==;
X-CSE-ConnectionGUID: cqP0ESUPTqe2R9Olsui7Dg==
X-CSE-MsgGUID: xrEX02+rSWi3b2vDUVuwFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="11719797"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="11719797"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 15:22:10 -0700
X-CSE-ConnectionGUID: B33JjSxCRtuk7Nsuq1pWCg==
X-CSE-MsgGUID: qSOP8ADCRU6rCzQILDsdlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="22463209"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 15:22:10 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 1/3] drm/xe/gsc: define GSCCS for LNL
Date: Tue, 16 Apr 2024 15:21:57 -0700
Message-ID: <20240416222159.1332619-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240416222159.1332619-1-daniele.ceraolospurio@intel.com>
References: <20240416222159.1332619-1-daniele.ceraolospurio@intel.com>
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

LNL has 1 GSCCS, same as MTL. Note that the GSCCS will be disabled until
we have a GSC FW defined, but having it in the list of engine is a
requirement to add such definition.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3b30353dbc09..ad46ed6a2de7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -209,7 +209,8 @@ static const struct xe_media_desc media_xelpmp = {
 static const struct xe_media_desc media_xe2 = {
 	.name = "Xe2_LPM / Xe2_HPM",
 	.hw_engine_mask =
-		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0), /* TODO: GSC0 */
+		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0) |
+		BIT(XE_HW_ENGINE_GSCCS0)
 };
 
 static const struct xe_device_desc tgl_desc = {
-- 
2.43.0

