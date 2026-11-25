Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B599D606A330
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 13:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RJSDQyv3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E5210FBD8;
	Wed, 25 Nov 2026 13:06:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8102010FC05
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 13:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795612001; x=1827148001;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XvhkUBqUuu26TX1sk0FIDOr4rq+ewlp69GMnPZKQzw0=;
 b=RJSDQyv3dawbLem7n92bGOknnacU1lP4En3a3azUyRUNcSwiAhw5HOXc
 DNPs/1+XS05scGT4Pl4DkVnAoJF9Erg04sJcWQK2vZXLZ2OwI2ri89D5s
 +5o9uYy9eyrNDAEYUZnQHFuXHTwV83Zo2yVGKaJty0a44YR6ZRIjUHJpT
 ZoD/Djqm417tX8EUINE2HDruy75j5wLSEr1bRQzPmw5d6SFWCt+3s3Iju
 q5802hNLnrYHHR9bYrK2xg85kLZ8Bq0j1QEhxtWldDRinigQ+N53k1BIx
 HwS6Yk2zTSdJ13jKOfciakBKALvSm3646ME9GYJgu6mpJuODIZsQWFzQC g==;
X-CSE-ConnectionGUID: X7vlIr6HQ0qFe12hmVYhcg==
X-CSE-MsgGUID: 6IJCn195RvCmCH65Kxzy2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4507154"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4507154"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 05:06:38 -0800
X-CSE-ConnectionGUID: a1KDF3vBR1+DtKpVwB4siw==
X-CSE-MsgGUID: qrkFKQlNTdOlUsaqKMV5Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12291890"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 05:06:35 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, hiresh.kumar.yadav@intel.com,
 rodrigo.vivi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Skip OCODE late bind if already running
Date: Wed, 25 Nov 2026 18:20:13 +0530
Message-ID: <20261125125011.192907-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125125011.192907-4-sk.anirban@intel.com>
References: <20261125125011.192907-4-sk.anirban@intel.com>
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

OCODE keeps running across driver reloads and warm resets. Despite
this, the late-bind worker re-uploads it on every probe and resume.
The firmware is not expected to handle back-to-back reloads, and the
extra delay of reloading an active OCODE can lead to firmware issues.

Check the OCODE status through SysCtrl in the late-bind worker before
uploading, and skip the upload if OCODE is already initialized. If the
status query fails or OCODE is not ready, fall back to the existing
upload.

As a result, a newer OCODE blob is only used after the next power
cycle. Comparing the running version against the blob is left for
later, once firmware provides a reliable way to read it.

v2: Update commit message (Rodrigo)

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

