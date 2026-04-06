Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6AEFB5166
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 21:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221D410E2F6;
	Mon,  6 Apr 2026 21:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aIROpgrk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1F210E2F6
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 21:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775510315; x=1807046315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6b/7MMT7E5BmqNMRn2ggxHpnpNTHdtCqIdzz1AzYvPw=;
 b=aIROpgrkOxdOTuvicA2mXSPaiRwT8+4X3DL0RaDy8PUWFWcDUMaxLQcS
 2sG4A0xF1xpx6oqqzJ77ZpSMWVsDOgvcF3kbaH36QKewvEZ2h00Z1SivT
 tZgLrLHvpAuFRvaWUsn3Dlby55eW0wa+bMDap9QpkJO3XMYy9mwpfhLQT
 pv4XhRzTOl6jYPmoTKeRSsOby37XDrBI47w0ounzxhKHmCV6WBKC7rszi
 GEY4kgcAYoaJyxO45Caj1Dp/81zcNc9jGU6B6v+GyK2MvrQ0rQP2yNHM6
 OqoMX9NrjwsIELGVsNECcCPPiG5+YwwLtnj6+6/ZBP3dhqAdA+7oyF3oc g==;
X-CSE-ConnectionGUID: SDmrtFbiShKISK/PbKczgA==
X-CSE-MsgGUID: njcSVMq4SkK2FiVWB5JoxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76653355"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="76653355"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 14:18:34 -0700
X-CSE-ConnectionGUID: T+aRNCgbR7WjQmgmbBlnVA==
X-CSE-MsgGUID: 0QuHKeZFRVCLUtYKqK/tyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="227888193"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 14:18:34 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 3/7] Revert "drm/xe/nvls: Define GuC firmware for NVL-S"
Date: Mon,  6 Apr 2026 14:17:27 -0700
Message-ID: <20260406211759.817577-12-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406211759.817577-9-julia.filipchuk@intel.com>
References: <20260406211759.817577-9-julia.filipchuk@intel.com>
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

This reverts commit 4e88de313ff4d1c67b644b1f39f9fb4089711b71.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 70bccbc1af82..498c89452779 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,7 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 55, 4))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
-- 
2.51.0

