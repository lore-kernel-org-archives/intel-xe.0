Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7A7C982D0
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 22:30:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E9610E4E6;
	Thu, 17 Sep 2026 22:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ds0OlGEC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D31410E4D8
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 22:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789684246; x=1821220246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S3QMFh3111zH7rqpydn63TBSJxqTr5j1AqTHVSEpjik=;
 b=Ds0OlGECqlZ1L/w2QKtuwR8e7Jx70KO6LTcvTs7bps2h1yXMUH27G5AA
 2SJsHSzWJ7fglhY8ej2spuaI5efRvEn/bF+zEyuGlM5tP8lkKooaDJq9N
 bVbjW+M9b9tUi15gOREM//SLYj38K38BhXuB3pFK+InX/6VLpTiN+p53B
 uGVkxYWu/vCoTx2zxOmw5aoQsPYyBFk7zCsiBTTHW6olvsumL1Gdo51fS
 3hcdsED230iFKXVWw3JZhgdOnLB/SaajL2wSqTTWBIhrsms2z3Wn7Pe4X
 eqSCxId6GdZsLrQLdF8HB+0zoYqSP03YMcBnlrClaRilxVeXbJG/TcjcX w==;
X-CSE-ConnectionGUID: ITUq3JEUQ/6lRsIXpaOJFQ==
X-CSE-MsgGUID: hGErDx1nSdewm5clYI1q5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92665117"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="92665117"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 15:30:46 -0700
X-CSE-ConnectionGUID: fdmC2YaJRimm7kD0vtrRvA==
X-CSE-MsgGUID: asP5+JujQY2i7bgI7gaUlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="279297689"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by fmviesa005.fm.intel.com with ESMTP; 17 Sep 2026 15:30:46 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/2] drm/xe/gsc: Define GSC for NVL-P
Date: Thu, 17 Sep 2026 15:30:42 -0700
Message-ID: <20260917223042.715286-5-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917223042.715286-4-alan.previn.teres.alexis@intel.com>
References: <20260917223042.715286-4-alan.previn.teres.alexis@intel.com>
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

NVL is identified by GSC major version 108.
The compatibility version is 0.0.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index e29878b255ba..9cde1fb55d7d 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -146,6 +146,7 @@ struct fw_blobs_by_type {
 /* for the GSC FW we match the compatibility version and not the release one */
 #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
+	fw_def(NOVALAKE_P,	GT_TYPE_ANY,	major_ver(xe,	gsc,	nvl,	108, 0, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
 
-- 
2.43.0

