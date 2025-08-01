Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48453C87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 13:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5FF10E849;
	Fri,  1 Aug 2025 13:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P5088w5j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED1110E849
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754053675; x=1785589675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4g6utLs13HbZizoEBu5z+s4YiBazKL1DBBNUu5WC92c=;
 b=P5088w5j1gaz/WVeqPF9+uLz3jI8NxUSb3m1mdE2h/pC6uGGuWS6EaQ0
 kAjI9ClSasaC1yaTE8aX4Kyob5u+DkBU3dKxAPz5MV0HkFuIgzZ1oYUAH
 eY2GaID0tQaQckJRR4fUXGS/MWmIb9iklLAbM3m2Fl6Ca2LNOIklFdYy3
 +gkJ3y8a7pTSGoOcZBhi0FXWu6DltrK/9cYrcEtKwC7TUKytEEBAUgXBM
 9tPu4YeAeyD/dJmddL1OzNsUIrcwg6SH+TA4tRP0QMcJ2Ox+MQLAibpCB
 VIwX2L8s+w2MhHVHAn2OjJQxdMd93nj8ECiIedd94dAvXWm7IHjZtp8lC w==;
X-CSE-ConnectionGUID: AYAR6ILVSlKXjJxIE/cJEA==
X-CSE-MsgGUID: qOBsyPYeS2SexhGAVWqfGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67762904"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="67762904"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 06:07:55 -0700
X-CSE-ConnectionGUID: bKH2In8DR26aYAvZalF+Ug==
X-CSE-MsgGUID: LxIgpETDQNqx471Fd0w4kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="167743907"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa003.fm.intel.com with ESMTP; 01 Aug 2025 06:07:54 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Re-register CCS save/restore contexts post
 S3/S4 resume
Date: Fri,  1 Aug 2025 18:54:41 +0530
Message-ID: <20250801132441.25463-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801132441.25463-1-satyanarayana.k.v.p@intel.com>
References: <20250801132441.25463-1-satyanarayana.k.v.p@intel.com>
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

After resuming from S3/S4 states, QEMU issues a VF FLR which resets GuC
communication, causing the loss of registered CCS save/restore contexts
with GUC.

VM migration post-resume leads to data corruption since the GuC cannot
save CCS metadata without these contexts.

Re-register the CCS save/restore contexts with the GuC after S3/S4 resume
to resolve the issue.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

---
V1 -> V2:
- Added commit in V2 version.
---
 drivers/gpu/drm/xe/xe_pm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 44aaf154ddf7..5e8126ca8e27 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -209,6 +209,9 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	if (IS_SRIOV_VF(xe))
+		xe_sriov_vf_ccs_register_context(xe);
+
 	drm_dbg(&xe->drm, "Device resumed\n");
 	return 0;
 err:
-- 
2.43.0

