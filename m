Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CA8606A31C
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 20:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HVF1e2ai
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCA310E250;
	Mon,  9 Nov 2026 20:37:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A28D10E250
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 20:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794256633; x=1825792633;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bYME9wPMtQD/rhAODinVfmYFGjbWVxSEcDrTIN/HSYg=;
 b=HVF1e2aieD/D1xjqrtRYpuMxelEWJj+0a8VPPPtHNIjiFyGZKYD1P6St
 ICOtp8NtBlUuxBYFlvE4u5IffEyikM4q3Lqwt7ppeytXU0BuPdR7HMq4/
 PD6MtB0cAXKkhzac+dNvRau0PxyWW1ZyUHgiFvlpQosU1yJ3VganSlSWc
 ISy7O5La2LJaeRiDBGN5mWN2Cuo9wgbA7wFcvST2dQ7qVeNKD4j8+DYX5
 IFsK+8BwWP0kn8ETcz97z6sXYCpW4o/4Zq0hS224wsv0Rrn5hlCy1k/m6
 UErTPfv6OCspAtfG/apvWEJrsS4zMT/7/1Zg8Jdt3+fcqRIueXtXrqV5o g==;
X-CSE-ConnectionGUID: wKDhMo9DRMacPwmGFxvUrg==
X-CSE-MsgGUID: OgoKoJgSQ2qfNQOTrGwURg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2889126"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2889126"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 12:37:12 -0800
X-CSE-ConnectionGUID: MIzKwf9/Sx+JMMRXa++BHw==
X-CSE-MsgGUID: VllaX9V4TnGtrvf2ogNd6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7979019"
Received: from cyp07.fm.intel.com (HELO pallavi-cyp07.fm.intel.com)
 ([10.36.54.237])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 12:37:12 -0800
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: gustavo.sousa@intel.com
Subject: [PATCH v3 0/2] drm/xe: Store GMD_ID subunit during GT init
Date: Mon,  9 Nov 2026 12:36:59 -0800
Message-ID: <20261109203701.814007-1-pallavi.mishra@intel.com>
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

Replace the separate GMD_ID and subunit fields with struct xe_gmdid,
then initialize that struct from the value already read during probe.

This is v3 of:

https://patchwork.freedesktop.org/patch/763681/

v2:
- Store GMD_ID in struct xe_gmdid instead of a u32 plus a separate subip field.(Gustavo)
- Initialize the struct from xe_probed_info in xe_info_init() instead of reading GMD_ID again during GT init.(Gustavo)

v3:
- Rebase.

Pallavi Mishra (2):
  drm/xe: Store GMD_ID as a struct
  drm/xe: Initialize GT GMD_ID from probed info

 drivers/gpu/drm/xe/xe_device.c   |  6 ++--
 drivers/gpu/drm/xe/xe_gt.c       |  6 ----
 drivers/gpu/drm/xe/xe_gt_types.h | 17 +++++++++--
 drivers/gpu/drm/xe/xe_guc.c      | 12 ++++----
 drivers/gpu/drm/xe/xe_pci.c      | 50 +++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_query.c    | 11 ++++---
 6 files changed, 68 insertions(+), 34 deletions(-)


base-commit: d72707a042b6aff601449a9cf87e5fe55decbc5c
-- 
2.43.0

