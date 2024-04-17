Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E89C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 21:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEAE10F8AA;
	Wed, 17 Apr 2024 21:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DDK0+b8k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C291710F8AA
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 21:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713388356; x=1744924356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qZ7qyLhIB4yXY1KuejmRFCi2ndECysr/W6wvmiZbrFk=;
 b=DDK0+b8kNmHfVCpo0WxVidGbNGlI51cb0xT+hn/xB/4CNylvBsVkjjs4
 Yx3jlON9oqEkpPfOZ1Ke25qWTdlwbmxSEzVJHHZ2Xfu7bci2e8Pe8i4xe
 rl58Lk38LnoxDLln59vkxgIC2Nd/YAQESu4pqafeCpcv96eFOoZcfnu0T
 WUV7AkHn5HY9FaXT6IBGH3EoSv/ASyX118YeK09wo0oBq57Q0r/J35xsD
 sAcuvlevDbeUNewggqDswM/miJWiUM68zhAOnLQGDfsT8CsgxBrk9HmZ7
 2FH3Ealjv2BDGsiZcDuaSkgc922zfBYxEPEb30VFI2/uz9J2zc22E0vl3 g==;
X-CSE-ConnectionGUID: sE2XrvDfS+2jOenzTHqcmA==
X-CSE-MsgGUID: LK0Pv3TpRPquDEGHumNx/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="26412683"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="26412683"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 14:12:36 -0700
X-CSE-ConnectionGUID: xrp5mP9/T5mbA6zAsLvWkQ==
X-CSE-MsgGUID: pAHZrFRqS4WWAj8ZR2FQUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="22793422"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 14:12:35 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/2] drm/xe/gsc: define GSCCS for LNL
Date: Wed, 17 Apr 2024 14:12:24 -0700
Message-ID: <20240417211224.1359313-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240417211224.1359313-1-daniele.ceraolospurio@intel.com>
References: <20240417211224.1359313-1-daniele.ceraolospurio@intel.com>
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
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

