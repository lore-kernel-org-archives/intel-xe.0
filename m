Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D4A606A33C
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 18:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I6JH3F1+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8B510E17A;
	Mon, 23 Nov 2026 18:54:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BA710E17A
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 18:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795460042; x=1826996042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lfr1r7VEF6RoBS7ObEoOoLFnwrq8bG69QQNrv0fr3Hg=;
 b=I6JH3F1++r/Ep57+r6UkGA/Y4caJYOJDh9ErVo2UcyCWNt5PQhV3wiTt
 8LEaLxP0YAahQ9YClceuMMQAYCA/lpPiJWrIRbB5AhSAmMP0gXfUqrnjs
 KpDaUyoe/CLBHXBQWxrwonaTAoUbAH3rEGKcsfvoCS8jp/ihLN0V6QMS8
 mfG93ZyPAfh6Z4WhGVonVSrH8RUsCRR60t9jZjj7HpJtmss4p5K8QYuit
 lS1iMgztQkcLN+jIKlA7UkuQT9S+XtmuC5D7DNwFh6noZBxWZ/vKU+v5e
 7aAcTetEVGjJLMCqiOsHe/Ga6WatpcUo3t8UTyLvV2n0qLHQxX5GcYB9I g==;
X-CSE-ConnectionGUID: bkdzrYQ7SSuNgU6qRQ6B0w==
X-CSE-MsgGUID: QhqbMRYtSNqqkJGgW+Bi5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4185328"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4185328"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 10:54:02 -0800
X-CSE-ConnectionGUID: RPDGVXhoQxSxo2+JViCJqQ==
X-CSE-MsgGUID: 0MBn7e9PTYu/VLvftehB0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11684206"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 10:53:59 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 1/2] drm/xe: Skip OCODE late bind if already running
Date: Tue, 24 Nov 2026 00:07:42 +0530
Message-ID: <20261123183740.4002390-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123183740.4002390-4-sk.anirban@intel.com>
References: <20261123183740.4002390-4-sk.anirban@intel.com>
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

Check OCODE readiness in the late bind worker and skip the upload
at probe and resume when it is already initialized.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 355d7c841871..dfff1693bf1f 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -258,6 +258,13 @@ static void xe_late_bind_work(struct work_struct *work)
 
 	xe_device_assert_mem_access(xe);
 
+	/* TODO: Compare the running OCODE version at probe when available. */
+	if (lbfw->type == INTEL_LB_TYPE_OCODE && xe_sysctrl_is_oobmsm_fw_ready(xe)) {
+		drm_dbg(&xe->drm, "%s firmware already loaded, skipping\n",
+			fw_id_to_name[lbfw->id]);
+		goto out;
+	}
+
 	/* we can queue this before the component is bound */
 	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
 		if (late_bind->component.ops)
-- 
2.43.0

