Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B37E60A2613
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 16:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fg9JY9ap
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5330389D60;
	Wed, 18 Nov 2026 16:28:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D7489D60
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 16:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795019306; x=1826555306;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iDlRzO9nlp47waA/uGLuVOnpXdueRygc5JKfkYUJyx0=;
 b=Fg9JY9ap1LAqm18/6zgiN3gaIdiJGW/LpXmN/SjHwcBQ0LZy8tuzKHUj
 r4ZhVqqefrknyNjcJF5xLL/0YsnmTw5IsN7zYtXjA2M+qwI0yBO/T2Kf7
 rk8Tn9PX+7rfOKOHfxERjEP/QU6tLvch7ZH5166TROHO2YstG4gBoz4zY
 Qe3DlVkQbQy8Xz4A95PlkKG+6UBvP3uGuNSEOwk0ZKWsKBfK6QhyC0H2R
 R9YIUaKCtlet+sE8nD7TvJZz9A0lcJeabRmyXU97e6hXea1pHFns3iUYg
 Ft/wJyH6J1YDEuAeoK2gbeE1TZWck1Nd36Kshk6rYkeTBCiDhsP8qStbW A==;
X-CSE-ConnectionGUID: mANB8v83QIimYej8cP16zw==
X-CSE-MsgGUID: HtNhUhzXQJ2bgeCkuO1arw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3729330"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3729330"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 08:28:18 -0800
X-CSE-ConnectionGUID: d5vz0qiDTZutTKgvfUPJdw==
X-CSE-MsgGUID: jvY9cEc0T1mK/BGHzL6aPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10407617"
Received: from jagadeesh-ms-7d25.iind.intel.com ([10.190.239.11])
 by fmviesa002.fm.intel.com with ESMTP; 18 Nov 2026 08:28:17 -0800
From: Rachapalli Bandi Jagadeesh <jagadeesh.rachapalli.bandi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com,
 Rachapalli Bandi Jagadeesh <jagadeesh.rachapalli.bandi@intel.com>
Subject: [PATCH v2] drm/xe/pf: Reset PF scheduling defaults on auto
 provisioning restore
Date: Wed, 18 Nov 2026 21:53:46 +0530
Message-ID: <20261118162346.1204457-1-jagadeesh.rachapalli.bandi@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fixes: 4af7fae27dc66 ("drm/xe/pf: Split the provisioning mode change function")
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Rachapalli Bandi Jagadeesh <jagadeesh.rachapalli.bandi@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index 7357b9369522..598fd77c230f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -162,12 +162,19 @@ static int pf_change_mode(struct xe_device *xe, enum xe_sriov_provisioning_mode
 		return 0;
 
 	if (mode == XE_SRIOV_PROVISIONING_MODE_AUTO) {
+		int err;
+
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

