Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5543606A324
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 02:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g6YjQWU1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7933110F315;
	Tue,  3 Nov 2026 02:18:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7745F10E70A
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 02:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793672292; x=1825208292;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/JDjLkEaQ1204+XpWGehoP6EZ9jCx014Y4vWfXBhqH8=;
 b=g6YjQWU15xgsbhwXR7aPI0zNcHr36ncsK+kqT38JxH2MrLrJIaRRZbgw
 0gVm+uN5l0bKZvAQVITQa4xUJfIW3WXAJiQMoDcK426PW7foZj4pvoxYX
 ml02f0I8OmJHSYHZVH/b0B6I0sldkEKd2p9tM0WENe7nOdI37VmVNN7ci
 7jb8OUO6VSGzLtFFXIfpPtsP71RLD6mDTaD1nzWX3KnEGtfmga8/7gMsS
 KThy3tOCvJoHL2xKzZRX6pdjyJmUGeQy4VKnDQ3xcbH1qfmiS1PKCZvWe
 qbsF7i68flHWFZfF04nyUTRMiJgmi57HraPJ6vFa1XmU1+zqCNdvGHatv g==;
X-CSE-ConnectionGUID: 5cBgHBEPQw6S7R1CI4vZuA==
X-CSE-MsgGUID: K9RUUiqpRBSfruMJ6ogj6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2287132"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2287132"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 18:18:12 -0800
X-CSE-ConnectionGUID: iAxUJMvMQ1qTpKbpxqNs3w==
X-CSE-MsgGUID: B9gBj0svQOiQinqgz95vSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6616065"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa009.fm.intel.com with ESMTP; 02 Nov 2026 18:18:12 -0800
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH 0/2] drm/xe: Fix tile workaround resume handling and enable
 Wa_14028586678
Date: Mon,  2 Nov 2026 18:14:16 -0800
Message-ID: <20261103021418.654723-1-daniel.charles@intel.com>
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

This series implements Wa_14028586678 on Crescent Island using the
existing device OOB rule and per-tile workaround helper.

The first patch fixes general tile-workaround resume handling: wait for
PCODE initialization before applying tile workarounds on system resume,
and reapply them after PCODE initialization on D3cold runtime resume.
Both paths apply tile workarounds before early GT resume.

The second patch enables Wa_14028586678, setting DWNSTRM_ACCESS_MODE
bits [7:6] to 0x3 and [5:4] to 0x0 while preserving all other fields.
The register is programmed on each tile, assuming identical workaround
values across tiles. SR-IOV VFs are excluded by the existing tile helper.

This replaces the previous single-patch v5 submission. Following Matt
Roper's review, the PM changes are now a separate prerequisite patch
with their own explanation and Fixes tag:
https://patchwork.freedesktop.org/patch/764671/?series=177283&rev=2#comment_1411234

The other review comments are also addressed: the class-of-service
macro is named L3_CLOS, and the redundant MERT capability check and
its unused header include have been removed. The device OOB rule
selects the affected platform.

Daniel Charles (1):
  drm/xe/pm: Apply tile workarounds after PCODE initialization

Fei Yang (1):
  drm/xe/cri: Implement Wa_14028586678

 drivers/gpu/drm/xe/regs/xe_mert_regs.h    |  4 ++++
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
 drivers/gpu/drm/xe/xe_pm.c                | 10 +++++++---
 drivers/gpu/drm/xe/xe_wa.c                |  7 +++++++
 4 files changed, 19 insertions(+), 3 deletions(-)

-- 
2.43.0
