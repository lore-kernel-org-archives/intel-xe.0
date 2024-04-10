Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D581CD1297
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 00:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F03F113036;
	Wed, 10 Apr 2024 00:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b59WoXlP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85777113037
 for <Intel-Xe@lists.freedesktop.org>; Wed, 10 Apr 2024 00:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712708808; x=1744244808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fQJOKVIj1iBIu8cErCfIAge4t6QYtsBoeaaaTC8FhDI=;
 b=b59WoXlPt6bFhC/EBHrfT8kl9/mqwauZa8eKSDxwHNxj0lBfU2w+jvZS
 HzaU6MpsGG4+eMDEC21BKagdbdLttMlPCr2PJt3MXmVtIeG3f0quQ4Sax
 UcEptG0U16DX+BUJQPXz07eTSE1OtRExtk9nL8t0n9F74LdMPdbSKfVZ9
 qmd5sGswgTp46eaFaw8cSUy9+KVApk2P79foG063OlJyNwrY/fuwnQ9Sm
 ebz8+k8sS6MFM1bMBSIYsvIrTiKgPTb+tplBRr7iVGMuXBZczBj+AgEWz
 GKrYEQh4Vyk0n/mMc+Jn+1TXWKq/H+erPpQybt0MO242YiMLtxGcUf4Td g==;
X-CSE-ConnectionGUID: q23FcRBRQhC9IUAkmdftiQ==
X-CSE-MsgGUID: gfp4Q+iOT16URpu/H3uw9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7907003"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7907003"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 17:26:47 -0700
X-CSE-ConnectionGUID: jxD3MgWhSHm+1cZ/tFzDLQ==
X-CSE-MsgGUID: tgVgVgTNS+OMGCkTmWKZ9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="51359636"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa002.jf.intel.com with ESMTP; 09 Apr 2024 17:26:46 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 2/2] drm/xe/bmg: Some LNL workarounds also apply to BMG
Date: Tue,  9 Apr 2024 17:26:46 -0700
Message-ID: <20240410002646.3002394-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240410002646.3002394-1-John.C.Harrison@Intel.com>
References: <20240410002646.3002394-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Enable a couple of existing workarounds for a new platform.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 5759b7bc1b70..eb647d5a1e16 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -21,6 +21,8 @@
 		PLATFORM(DG2)
 14018094691	GRAPHICS_VERSION(2004)
 14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
-18024947630	GRAPHICS_VERSION(2004)
+18024947630	GRAPHICS_VERSION(2001)
+		GRAPHICS_VERSION(2004)
 		MEDIA_VERSION(2000)
-16022287689	GRAPHICS_VERSION(2004)
+16022287689	GRAPHICS_VERSION(2001)
+		GRAPHICS_VERSION(2004)
-- 
2.43.2

