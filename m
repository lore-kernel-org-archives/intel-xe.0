Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2224AC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 23:20:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C6B1128AE;
	Mon, 15 Apr 2024 23:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GnOb7nOa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A666A1128AE
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 23:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713223204; x=1744759204;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vouhi6wA/nNRkrJT5hCSylgpjmc0xrpkgMcLT9uBelk=;
 b=GnOb7nOaS9fP0v/jliddLorhXoUf7aCCWEBLqpSt6iB4qFABXiS8cVTA
 12Oy+ayHa7XIwV/LMF7q0X8QcHiM7BRPnRTB9lEOeb6FVHsOzbZd9mTf9
 nj0Dx44rP5q7IdosofA0V9W6hQE/TIH53ouFkmqOMpJpOuAR6PhbAnYRd
 FcEbvzR24QeyIXkYosHTYh9r8QVQ37L7TXFgNUDfsuAbzFERICNFiANQ6
 KLaU1vQSIaam+ZxBX3c3fOhmvN5oI+/Wa2uUS7WKkckn7cezZyZlcNwVn
 C/E1cgXkXkFBlSITi12a5x4OPdgcaGaFMuPtbMQnxul46YdfXILmdz5T4 Q==;
X-CSE-ConnectionGUID: B7CscrZnR5aRekfVZtb0MA==
X-CSE-MsgGUID: pzaEayeQSMqjj9OrQQkPkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8496774"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="8496774"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 16:19:59 -0700
X-CSE-ConnectionGUID: trNkRlBAQ8entv/PnSGHRQ==
X-CSE-MsgGUID: JmyCH7QmSmS3MX1HHQiTmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="22141837"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 16:19:57 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 1/3] drm/xe/gsc: define GSCCS for LNL
Date: Mon, 15 Apr 2024 16:19:45 -0700
Message-ID: <20240415231947.1230707-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240415231947.1230707-1-daniele.ceraolospurio@intel.com>
References: <20240415231947.1230707-1-daniele.ceraolospurio@intel.com>
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
index c47ab4b67467..45ed1be584c5 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -209,7 +209,8 @@ static const struct xe_media_desc media_xelpmp = {
 static const struct xe_media_desc media_xe2 = {
 	.name = "Xe2_LPM",
 	.hw_engine_mask =
-		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0), /* TODO: GSC0 */
+		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0) |
+		BIT(XE_HW_ENGINE_GSCCS0)
 };
 
 static const struct xe_device_desc tgl_desc = {
-- 
2.43.0

