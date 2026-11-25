Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C524D606A33B
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JqTEZMLK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C1710E8E2;
	Wed, 25 Nov 2026 13:06:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00EE10E8E2
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 13:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795611999; x=1827147999;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qk3VkBoDf7fzipcOBn0QRoOHWDin7i0tgUm7Dj3j3qg=;
 b=JqTEZMLKrB1RKBZ6sXsDk4Uyj0dFtsx0WuhYZYPju0VRomuuGTmXIlB3
 mlEhtIMUyv/jdzOnC9huS5bsQepV+GT52gOxZANoiNzztU0Wln+5CXo3M
 zHRMzG2bNyVxBz9NJGB52CQi6t/XthEsvEgD7ocIqdqXUWUsq4hPjU1up
 Fd88twrY6KCFGtDlCr4ooUOpJzf078ZnrYskfVEdJ1TQ1YrnL56gHoJp3
 s2IK1Jx5cNiTOAcoH0yGjZo5aesrIpoZVpsBF2Da358yqvR/TM8sCnquX
 4ineAKIXeUFiv3bbBlye0RsllFGEQwY4Vr3i0wgo7dHH3NA5zAqvmkg0Z A==;
X-CSE-ConnectionGUID: wDV4PaQXTdS67V8CHZ5nkg==
X-CSE-MsgGUID: szI1U4SaRCCpgduG8agBEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4507152"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4507152"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 05:06:35 -0800
X-CSE-ConnectionGUID: m8mZUB9UTnWbbakRVqV9NA==
X-CSE-MsgGUID: /t+HaL68TcqmlVZRmQh9Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12291885"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 05:06:32 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, hiresh.kumar.yadav@intel.com,
 rodrigo.vivi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2 0/2] Skip OCODE late bind if already running
Date: Wed, 25 Nov 2026 18:20:12 +0530
Message-ID: <20261125125011.192907-4-sk.anirban@intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

OCODE keeps running across driver reloads and warm resets. Despite
this, the late-bind worker re-uploads it on every probe and resume.
The firmware is not expected to handle back-to-back reloads, and the
extra delay of reloading an active OCODE can lead to firmware issues.

Patch 1 adds the readiness check to the late-bind worker, so the
SysCtrl mailbox query runs asynchronously rather than directly in
the probe or resume path. If the query fails or OCODE is not ready,
the payload is uploaded as before.

Skipping the upload whenever OCODE is ready prevents developers from
testing a replacement OCODE blob on reprobe if the old ocode is
still running, unless the board is power cycled. Patch 2 adds a
debug-only configfs attribute, ocode_force_load, that bypasses the
readiness check at probe.

Comparing the running OCODE version with the payload version is left
for later, when firmware provides a reliable mailbox command to read
the running version.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>

Sk Anirban (2):
  drm/xe: Skip OCODE late bind if already running
  drm/xe: Add debug configfs option to force OCODE load

 drivers/gpu/drm/xe/xe_configfs.c           | 58 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h           |  1 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 11 ++++
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  2 +
 4 files changed, 72 insertions(+)

-- 
2.43.0

