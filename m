Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218B1E92FE4
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 18:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D115310E556;
	Fri,  6 Oct 2023 18:23:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2023C10E533
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 18:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696616588; x=1728152588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MNX62L3vC74HZVOjNECoQRjGIshhRsyJLe/45cFC24k=;
 b=llQPUY+BGCcQk64lME3iFpa2RXGy4+i+llOzvj+ZeFSJZ8Ohwa6onozF
 YLnJhsh5COfGIgB7af2DCCdno/d947CNtAN1Ottmy/oMgPT1288gWWW/l
 FZpvuwUSieMcqJty4atw56iK8bfVEplIZbEG9q48vK4Ay/Nn8lqFyfSwV
 CoRfU5lfSBc3vLGaCB0WU4HP9mPVomkt5J+2C39Ri1NdNtMyzZ7weUw1Y
 F3Mk4+AAF0lz1pFTXhN6muQS7/9yI/e0LcyXsOY2AxO5KSL8E8Nn9UqCC
 eB0MjaMKTg3Zuyj2rmbufCVNStpSNlTPJZZLaXcMUTIW4pd4DsAT7kHWK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="368884723"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="368884723"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 11:23:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="755945481"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="755945481"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 11:23:06 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 11:23:23 -0700
Message-Id: <20231006182325.3617685-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231006182325.3617685-1-lucas.demarchi@intel.com>
References: <20231006182325.3617685-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 2/4] drm/xe/xe2: Add one more bit to encode PAT to
 ppgtt entries
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Xe2 adds one more bit to cover all the possible 32 entries. Although
those entries are not used by internal kernel code paths, it's expected
that userspace will make use of it.

Bspec: 59510, 67095
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Pallavi Mishra <pallavi.mishra@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 drivers/gpu/drm/xe/xe_vm.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index e5e8173433c3..78da28f4ea13 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -40,6 +40,7 @@
 #define XE_BO_INTERNAL_64K		BIT(31)
 
 #define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
+#define XE2_PPGTT_PTE_PAT4		BIT_ULL(61)
 #define XE_PPGTT_PTE_PAT2		BIT_ULL(7)
 #define XE_PPGTT_PTE_PAT1		BIT_ULL(4)
 #define XE_PPGTT_PTE_PAT0		BIT_ULL(3)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 616df338859e..2a9b698037c3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1223,6 +1223,9 @@ static u64 pte_encode_cache(struct xe_device *xe, enum xe_cache_level cache)
 	if (pat_index & BIT(3))
 		pte |= XELPG_PPGTT_PTE_PAT3;
 
+	if (pat_index & (BIT(4)))
+		pte |= XE2_PPGTT_PTE_PAT4;
+
 	return pte;
 }
 
-- 
2.40.1

