Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBAC606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 00:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BUVDD3pk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1664A10E37A;
	Wed, 28 Oct 2026 00:21:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE8010E37A
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 00:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793146857; x=1824682857;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eRc1617QC3M48Y4bcfmvq51gx+Xd8/+dU+xClMD6e0g=;
 b=BUVDD3pkUHwfpL1u+0mJjzzmQJ1xq+1x5TDijE3jZ3Z7B9LGw25I5Fw/
 YkEzTDHIvRg7zAGaKAJfeQIamsqbjrACxe/xInQfAHYvu+rROSelfvxSW
 F9yezdgI7v9SqSxCP85Wd4TJLRlCfpFBnfo65E/Y4k3I6LjH8GSb4/n4o
 iRktO9ucj9bgF7Y91htF2LJ0cuoo4mNa4838Wk1NitXnanabvPbfFJmcc
 hE+stEHTbguvT0Q/1WDwGgVzMnhHkEunSUYYHGrCxD7hCYAUCWIKDu1dj
 786DTkBKH7yAqoKZ8YgL8ZTlu/SIWB/V/ueicDh2yMyQEQt2m2vzKdALc g==;
X-CSE-ConnectionGUID: rizlNeN/RKyEIe0FZynPDQ==
X-CSE-MsgGUID: O8tvn1NBRgKMfBlVFGN1Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1860073"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1860073"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 17:20:57 -0700
X-CSE-ConnectionGUID: F20mCsG/S6qfLcamklu/QA==
X-CSE-MsgGUID: GCezcFLIQA2krI5eb+qmSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6454367"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by fmviesa012.fm.intel.com with ESMTP; 27 Oct 2026 17:20:56 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v4 0/3] drm/xe: Some d3cold related fixes
Date: Tue, 27 Oct 2026 10:43:52 -0700
Message-ID: <20261027174351.619929-5-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.53.0
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Toggle d3cold allow flag and wait for pcode init before accessing
MMIO.

v3: Add fixes to the GT MMIO patch (Anshuman)
v4: Some comments (Daniele)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (3):
  drm/xe: Toggle the D3Cold enable flag at runtime resume
  drm/xe: Access GT MMIO after pcode init
  drm/xe: Memset g2g buffer on resume

 drivers/gpu/drm/xe/xe_gt.c  | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_gt.h  |  1 +
 drivers/gpu/drm/xe/xe_guc.c | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h |  1 +
 drivers/gpu/drm/xe/xe_pci.c |  3 +++
 drivers/gpu/drm/xe/xe_pm.c  | 12 ++++++------
 drivers/gpu/drm/xe/xe_uc.c  | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_uc.h  |  1 +
 8 files changed, 55 insertions(+), 6 deletions(-)

-- 
2.53.0

