Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF62C9830B
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 18:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B1610F12B;
	Wed, 23 Sep 2026 18:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="As6PRT5g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B3410E959
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 18:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790188563; x=1821724563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JAJU1Jvoz9vwjkh0kqJFbw8S9sv9+Nesq0eiLy3aUd4=;
 b=As6PRT5gzjWR0FT13SdpTZTv+37GMFCuA+Ib+AkpG334Mlpt/1CDZvEV
 Ipy3zqF6ZxbHSo/ZadBVLdrMFg1qS+cjuL7L1SrfXTpEvsII+cgLidie5
 SkMQbpacP2aqlaMa2/kY/uhKTpu3SLsZHC7Z8W+URKRGV5xrek++RjrUT
 TrEWq1F9/OPX+JD283ZVE5jeCyw8mgDNr/S4Ti+ZA5QTJ89N9DAsi3vD/
 RMKVeEAakpHqnFP20uHjwmz7D3Go5VTE5wuOXt1YMeKXF1oiBMF3e7ktC
 4A+VmzD8+lKiLjetPRsE0wEC6Ic9Q+bH8WNS+s2TA+3feBl/t2zgxgiT+ g==;
X-CSE-ConnectionGUID: w5jaJ+jaTYGqGnJR5vlZiA==
X-CSE-MsgGUID: U6tB+68dR7CbDITyhX62WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="89832141"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="89832141"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 11:36:03 -0700
X-CSE-ConnectionGUID: p4Wsf4B5QLCzZTQmLpQ9EA==
X-CSE-MsgGUID: nPOYloxgQrCcdmjXDUfDbQ==
X-ExtLoop1: 1
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2026 11:36:03 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/2] drm/xe/gsc: Define GSC for NVL-S
Date: Wed, 23 Sep 2026 11:36:02 -0700
Message-ID: <20260923183600.1186943-5-alan.previn.teres.alexis@intel.com>
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

NVL-S is identified by GSC major version 108.
The compatibility version is 0.0.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index e29878b255ba..6edba1401f7a 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -145,6 +145,7 @@ struct fw_blobs_by_type {
 
 /* for the GSC FW we match the compatibility version and not the release one */
 #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
+	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	gsc,	nvl,	108, 0, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
-- 
2.43.0

