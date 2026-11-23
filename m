Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C70F606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 18:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YpKmbNyk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093A210E146;
	Mon, 23 Nov 2026 18:54:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6141F10E146
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 18:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795460040; x=1826996040;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ATAjtDl4o6TWOZToOkLn9tZTSqawc/Mj+5RfKNvnmps=;
 b=YpKmbNyk3yKGTRbZQkTgzBgJ4emwaRYU93ep7Aa6PciyGgZ6irorE/ay
 uQyjcd+fhNEzsYFHqloPUhg43hAeNYby+vQOeYfP9eCNlgl1m9M4FWarx
 obAUMdbWkRcbGgS5O75fAer6o6N9ROpQJMeMe1C3Y6eQWgf1+SGK8p2nJ
 U/OBGeRtOL7tIqJxgmk8si58sgtuO9Y+fq31j1+ofs4HM6nJckpSquMeT
 BwJZrxEb2nmhNYpKY89X56+s3zcxVmcKN47o8BdJRDu8a3j8WHJgSy/fx
 M0RlHN59BJXcNT3+k6zQslTWv7qYJKdSdizKxZSmU6kTMmV85Ij8WvE1x A==;
X-CSE-ConnectionGUID: 2gjtBh4ASQytu3oQVXu4HA==
X-CSE-MsgGUID: gt2/FgpHTkC3KjKOigGAOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4185323"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4185323"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 10:53:59 -0800
X-CSE-ConnectionGUID: mGx6k0QPTB+udMb4/fyeDw==
X-CSE-MsgGUID: KrcK4mW7Tm+TpXwTerj2fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11684196"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 10:53:56 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 0/2] drm/xe: Skip OCODE late bind if already running
Date: Tue, 24 Nov 2026 00:07:41 +0530
Message-ID: <20261123183740.4002390-4-sk.anirban@intel.com>
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

The late-bind worker currently uploads OCODE at probe and resume even
when it is already running. This series checks OCODE readiness
through SysCtrl and skips the upload when OCODE is already
initialized.

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

 drivers/gpu/drm/xe/xe_configfs.c           | 57 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h           |  1 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 19 ++++++--
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  4 ++
 4 files changed, 78 insertions(+), 3 deletions(-)

-- 
2.43.0

