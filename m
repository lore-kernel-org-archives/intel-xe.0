Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C75C982E1
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 10:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6375210F2C6;
	Fri, 18 Sep 2026 10:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ctM25Qer";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1703E10F2BF
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 10:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789725955; x=1821261955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l3jbaLuVDVcKQvMlElRVR0npD7MnNCb5vYImDGbWu8E=;
 b=ctM25QerXAcalCtk++bGC5I+Bz/Tj72wL0Z4OiFjJmjxhV/7ZDZITZOZ
 ooWWbKQBRQ663qx8sS4Ngl4cpu2siQDZnSkD5skYqB6hlnHzX4su0MdOl
 +/tdblAZETL7jRP91SIuuYvmBhYhJzsDhZCKhQDOCJifrYZANLjW4mNX7
 fcaPr7Byw/aky+7v0ZT3/i8Le6kdYfBTzBC75vlQDBj9bfVXmXry2Baoa
 /Sk4ft4Fyp6XMnMreydg0Owh/pREjIEDJDcz7HW+Xbr98ShaRbAH53OcL
 INELAgWuS/t5bRk/FOF589wz+cFoZ+iqocgv6glXEfgHiQhO7+OmnLDLP g==;
X-CSE-ConnectionGUID: 5SCuJhJ6Q7agwx0IFuFRkA==
X-CSE-MsgGUID: 5mmeYtqnTy+2xpTNEu7biA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="737237"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="737237"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 03:05:54 -0700
X-CSE-ConnectionGUID: RMbsxWaLS/qwPBQroTOtVw==
X-CSE-MsgGUID: GroLDfPAQ6CsVBr3aOBDMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271003584"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa007.fm.intel.com with ESMTP; 18 Sep 2026 03:05:53 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v9 08/10] drm/xe/vf: Add alignment check for queried VRAM size
Date: Fri, 18 Sep 2026 15:35:32 +0530
Message-ID: <20260918100533.567225-20-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918100533.567225-12-satyanarayana.k.v.p@intel.com>
References: <20260918100533.567225-12-satyanarayana.k.v.p@intel.com>
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
index 500d5adb86bf..08ed6ebcaa43 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -599,6 +599,12 @@ static int vf_get_lmem_info(struct xe_gt *gt)
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

