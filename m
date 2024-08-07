Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1333C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 21:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C7310E57E;
	Wed,  7 Aug 2024 21:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JjA7vy4z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0996010E50D
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 21:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723065078; x=1754601078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lZIpF9gU8u2dRrxhy4n+NVVqa+2VrIb6qPGjN7PLCW8=;
 b=JjA7vy4zip3qLgDUYL2EqMhXJx6sVnj5UttCFBpOIAjZ0MqZbyf7uh6W
 ZoZmxPE6glEvjpTxf/RCDM1a6ZCbxD2iyIrIWVCtSwsRY4X0XCXPDgyEk
 njJ62OFwr6wiqwMkmoRBBCD+m735Wj05i+57me9Uh72QEHsCyrq87+Dfw
 f0gcz0UlgQgGGEnYiB48ai4ZNCyCu09Rs+xK1e5AURRGLsqmnLez/q73S
 Z2Kt/a8ifKsgmfmD8w/1pzHfO5OqSwuTWlgd/LKG5B2dtl7YM4RlreLrN
 04vLqggv23duD2qiN9HjAqpkx9n3gVir/gMGSrEaju6oVnFZ3fmkgaPAY g==;
X-CSE-ConnectionGUID: uRnsasilQMGWDMfjMD96hw==
X-CSE-MsgGUID: USjvNzdXTH2cS7GBhK2hSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="31832838"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="31832838"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 14:11:18 -0700
X-CSE-ConnectionGUID: cx/3EAB3R6yX3pHBMcut6w==
X-CSE-MsgGUID: OS6P4xIESgulyeIDU+KGpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="61817909"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 14:11:18 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 2/2] drm/xe/bmg: extend WA 14018094691 to BMG
Date: Wed,  7 Aug 2024 14:11:06 -0700
Message-ID: <20240807211106.1322197-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807211106.1322197-1-daniele.ceraolospurio@intel.com>
References: <20240807211106.1322197-1-daniele.ceraolospurio@intel.com>
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

The WA applies to BMG as well, with no changes compared to LNL

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 40354fb01737..2da7c9a65aaf 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -20,6 +20,7 @@
 		MEDIA_VERSION(1300)
 		PLATFORM(DG2)
 14018094691	PLATFORM(LUNARLAKE)
+		PLATFORM(BATTLEMAGE)
 14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
 18024947630	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
-- 
2.43.0

