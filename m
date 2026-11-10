Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D30606A204
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 16:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H8eCSVED
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C67610F812;
	Tue, 10 Nov 2026 16:30:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3796910F812
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 16:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794328242; x=1825864242;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=89k9kb0hGms0ThJtTrrHm19NmlCWHYK9mStcJj22toY=;
 b=H8eCSVEDglQrz1G6F3f8J7NlK5kIeDU5ca2YXs1P1PSZe1pb3KPYY9wj
 LZ6e2Y3rkJ9sie8ykWSE6aHoEoLWrkwC0sTceUDzXl4YyGhtEOTsjCudz
 zJtMOq5HiZMP5Apeb7J5GIszrN10vPl5tDtK83p2oBgod0X1bRK3OBrjw
 UtJs4q/OyZDuMJyOZzgq8dAYKZ0u9aOCn+MWyKapl3SVZwej2DyeTf98+
 5EXyOCOA/IigCNNuj/zj3JlNHUo/sv4YQPaj/jImAmC83nJR8YtSy4cAq
 2PpzcAiHiIW3tcCuagH3tlQIAcsrk/bKXANgmA0SAeISXEpJ8KseQcwN6 Q==;
X-CSE-ConnectionGUID: llaeqhQbTPSfYd1T20LJDQ==
X-CSE-MsgGUID: tU/MEaafQwSrKLNfHoNoyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2980263"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2980263"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 08:30:27 -0800
X-CSE-ConnectionGUID: /wGmJqnDRTmzVe9PAf+tew==
X-CSE-MsgGUID: s6KRoHJYSiaLQFaMXgi/HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8629159"
Received: from jagadeesh-ms-7d25.iind.intel.com ([10.190.239.11])
 by fmviesa007.fm.intel.com with ESMTP; 10 Nov 2026 08:30:26 -0800
From: Rachapalli Bandi Jagadeesh <jagadeesh.rachapalli.bandi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: satyanarayana.k.v.p@intel.com, michal.winiarski@intel.com,
 Rachapalli Bandi Jagadeesh <jagadeesh.rachapalli.bandi@intel.com>
Subject: [PATCH] drm/xe/pf: Reset PF scheduling defaults on auto provisioning
 restore
Date: Tue, 10 Nov 2026 21:56:09 +0530
Message-ID: <20261110162609.41234-1-jagadeesh.rachapalli.bandi@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Restoring auto provisioning releases VF configs, but leaves PF scheduling
overrides from debugfs in place. As a result, the next VF enable may skip
fair scheduling reprovisioning, leaving VFs with infinite EQ/PT and
causing VF probe or FLR timeouts.

Reset PF scheduling defaults when switching back to auto provisioning
so subsequent VF enable reprovisions PF/VFs with fair scheduling again.

PF: Tile0: GT0: VF24 resource sanitizing failed (-ETIMEDOUT)
PF: Tile0: GT0: VF24 FLR didn't finish in 5000 ms (-ETIMEDOUT)

ERROR Tile0: GT0: hwe rcs0: emit_wa_job failed (-ETIME) guc_id=1
ERROR SIGID=101 FATAL (-ETIME) PROBE: driver loading failed for device

Signed-off-by: Rachapalli Bandi Jagadeesh <jagadeesh.rachapalli.bandi@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index 7357b9369522..7d8dfce5b268 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -162,12 +162,18 @@ static int pf_change_mode(struct xe_device *xe, enum xe_sriov_provisioning_mode
 		return 0;
 
 	if (mode == XE_SRIOV_PROVISIONING_MODE_AUTO) {
+		int err;
 		if (xe_sriov_pf_num_vfs(xe)) {
 			xe_sriov_dbg(xe, "can't restore %s: VFs must be disabled!\n",
 				     mode_to_string(mode));
 			return -EBUSY;
 		}
 		pf_unprovision_all_vfs(xe);
+
+		/* custom PF EQ/PT/sched_if_idle would block fair VF scheduling */
+		err = pf_reprovision_default(xe);
+		if (err)
+			return err;
 	}
 
 	xe_sriov_dbg(xe, "mode %s changed to %s by %ps\n",
-- 
2.43.0

