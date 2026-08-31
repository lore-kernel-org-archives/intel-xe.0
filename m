Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF08C61DFD
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 08:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB4B10E766;
	Mon, 31 Aug 2026 08:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKMcUKlC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4C410E760
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 08:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788165388; x=1819701388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PwlBgZDcHFqWwe+gJQxTDf79Jq9nCETsnjWKWOugX/U=;
 b=QKMcUKlCdbbNi+STfIN/BeCKUeHwfyUgwO8OpzZeDd7O+NmwvqYQd4tL
 qb0RY18ZmYW0IwGIwJ1GTSxhG+9w3rbtSC3HA3s4TYCjOCwhYd7QmZf33
 /So1YxsuR+82HAb6qAaIWD8GXYCHEf2NWrw8LV9FJyE4dMd2O597IU6FP
 vG8JCWCL3DeL5T5jKRC3oU9jMJtaCZ5fJsdy/3dNAcy4BJkngmMiL76nc
 B0djRA+Mwy1ElZ0uw4xVGZ1XEMJuOxDl0MzCMlzL5m4j7eiNJrsx5puBh
 2lvHaqjLn6bGAeGcOH7hqm7uhUCrWbstyR5U8Tc9zzSZ4hQVkfqTfGsbe Q==;
X-CSE-ConnectionGUID: F5kWq17oQdqTmnTTAwSgxg==
X-CSE-MsgGUID: ZJ46/np3R0yjlj57HjshNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106089721"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="106089721"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 01:36:28 -0700
X-CSE-ConnectionGUID: Qcr0VXKXTLGncEKqQf3Czg==
X-CSE-MsgGUID: jKD8ewxNSv6ss7DUv3kDBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="293546363"
Received: from unknown (HELO ksatya-dev.iind.intel.com) ([10.190.229.72])
 by fmviesa001.fm.intel.com with ESMTP; 31 Aug 2026 01:36:27 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v7 08/10] drm/xe/vf: Add alignment check for queried VRAM size
Date: Mon, 31 Aug 2026 14:06:10 +0530
Message-ID: <20260831083605.2115328-20-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831083605.2115328-12-satyanarayana.k.v.p@intel.com>
References: <20260831083605.2115328-12-satyanarayana.k.v.p@intel.com>
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
V6 -> V7:
- Updated commit title (Sashiko, Michal W)

V5 -> V6:
- Return -EINVAL for unaligned LMEM size (Michal W).

V4 -> V5:
- New commit.
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index bad8f1da1213..63ebea9df171 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -589,6 +589,12 @@ static int vf_get_lmem_info(struct xe_gt *gt)
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

