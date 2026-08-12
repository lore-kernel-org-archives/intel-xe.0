Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B433AC5CFDB
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 12:41:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A1310EFAE;
	Wed, 12 Aug 2026 12:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K8eJfbPW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D4A10EFA9
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 12:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786538488; x=1818074488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=grWsDrFw26+3fjE1dfTDqE+gvblDZ0q0GWrys5nIAfU=;
 b=K8eJfbPWogbpTZdXguvbcGbVL4KPUTMg9zZm/VEqI9NNPmXi2U1sF2fU
 W+ZWtueSKCbn1foPYHfW6CSVzCWOlYYtYwTYEUmadFsR7ILP6uqZHCBLU
 s2WT1MRTCEMdiFNmBy/CXbMqj0cRawVTpfbybkTxc0VLFHwwtasLEzD+j
 OhpJ/WFVSPsVlwLBQcrDA8o1YqWzLPJVjv8Vw0BNZjmnpitdyXkvwVnyH
 zvbwzYmzUwBK0YBWdLH02s2Fv1cjKyTAU6XqhH3ocrOaz9lBiQl0gUVkC
 p781HMe5rEhN3aU6GobmQ+li2Bwf//UnfsF7N1h5zE59xeh3Od1x5zlNX A==;
X-CSE-ConnectionGUID: OKeSypC/R8Wu4bdvMQtGTQ==
X-CSE-MsgGUID: UvZMQ9bqTwuLG6vEz5DIPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98238709"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="98238709"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:41:28 -0700
X-CSE-ConnectionGUID: 1PG0kFAzSamYaymE0NXhMQ==
X-CSE-MsgGUID: 0rO9099oQKO2UlCtRh7zDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="263674080"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by orviesa007.jf.intel.com with ESMTP; 12 Aug 2026 05:41:27 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v6 6/7] drm/xe/vf: Add bounds checking for queried VRAM size
Date: Wed, 12 Aug 2026 18:13:18 +0530
Message-ID: <20260812124313.1377582-15-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812124313.1377582-9-satyanarayana.k.v.p@intel.com>
References: <20260812124313.1377582-9-satyanarayana.k.v.p@intel.com>
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

Add explicit bounds checks for VRAM size which can detect and reject
invalid configuration data from a misconfigured or malfunctioning PF,
preventing protocol violations and protecting VF initialization.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V5 -> V6:
- Return -EINVAL for unaligned LMEM size (Michal W).

V4 -> V5:
- New commit.
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index d805c064377c..be932ebe6a8d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -574,6 +574,12 @@ static int vf_get_lmem_info(struct xe_gt *gt)
 		return -EREMCHG;
 	}
 
+	if (!IS_ALIGNED(size, SZ_2M)) {
+		xe_gt_sriov_err(gt, "Unaligned LMEM size %llu, expected %llu\n",
+				size, ALIGN(size, SZ_2M));
+		return -EINVAL;
+	}
+
 	string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
 	xe_gt_sriov_dbg_verbose(gt, "LMEM %lluM %s\n", size / SZ_1M, size_str);
 
-- 
2.53.0

