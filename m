Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40C4C88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 07:12:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F29610E23E;
	Tue, 15 Sep 2026 07:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UoOPCVPe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7CCA10E595
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 07:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789456340; x=1820992340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pZwrYVP5k4Rdu0ZIomEfYIpfD/nJ2XBaLCsR5/5tswE=;
 b=UoOPCVPeUyEFCvU+jZRu9C+02mzXjUo/rrqYixkN9vI/8aP0YD6+iOcQ
 M1jqeWsAciGM4FPNCRsaeJ1sXPAX6doZ9urGYhzxU1usXhb5DUST/CK6x
 3YWp64FzVyT8KrG4WFdR0lhMTlPnck5k1jFBSQNqQhIXKbvk2ZJD3/24R
 M+SThmPFyywxEzcl2nhVzfzELSdFyqL3ZlrAzo+IzPdznI6gtiTEpzXlu
 xD0KRlZGEUUgYOipFIaUKeFj+HYii70AHSHmIA+SZNapZ+aXLuugl5Kjy
 3g5b1MNoS4NdoNUBHKX/9Pj+maLryRpEvcChnHqTWduV0GQvvXsDClXMH g==;
X-CSE-ConnectionGUID: skpf8bT/RGu7yM6PxsCcpA==
X-CSE-MsgGUID: WogXGl70SDaAdf15gmHpqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93511758"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93511758"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 00:12:20 -0700
X-CSE-ConnectionGUID: QqtDOM+JRdCJrq/BzA8hkw==
X-CSE-MsgGUID: 2asXYZ+DSxKHpo3Vq9zY1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1081612"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa012.fm.intel.com with ESMTP; 15 Sep 2026 00:12:19 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v8 08/10] drm/xe/vf: Add alignment check for queried VRAM size
Date: Tue, 15 Sep 2026 12:42:05 +0530
Message-ID: <20260915071159.51402-20-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915071159.51402-12-satyanarayana.k.v.p@intel.com>
References: <20260915071159.51402-12-satyanarayana.k.v.p@intel.com>
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

Add explicit alignment check for VRAM size which can detect and reject
invalid configuration data from a misconfigured or malfunctioning PF,
preventing protocol violations and protecting VF initialization.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 53db4cf9d656..ec79793bd547 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -598,6 +598,12 @@ static int vf_get_lmem_info(struct xe_gt *gt)
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

