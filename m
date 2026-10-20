Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09929606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 00:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QALz9kfH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DE110F841;
	Wed, 21 Oct 2026 00:18:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42D510F841
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 00:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792541900; x=1824077900;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JchZafRdlw2Ha5bqnuOJr+OJw6P0nfrdp+//laMIsMA=;
 b=QALz9kfHEv1/cWniB5Si+QXCYXoGxUmhaKG0BlgsdUQETrHVnvWEVAYA
 28OMHTZMrPbg59mCvQJ/NKk4+oPKW8iUw5TyyZj00NjgzMkciotnkku3T
 vxWRqLgR4jVIB08pfIHOLv2/9rNRyYRVCfTtxlKp23Mtczv8RqXUgH0Dh
 srF0Zp5ScMhwrX5Ny1K5OsUjjkK+A01xwXlF1Zbm3u8+Hnt+2zn1axq5r
 8YsdXKt8fC0QCc/84iyY6fUJiOJkTCOYGUAG1rH/zRgYibbvARuU/8IAa
 3NL0jXyLe6bbBJxNbYouViO8UJmpoiF+gU+geCzlqpQMvkXhVjM/HUx6u A==;
X-CSE-ConnectionGUID: WxsSuciLS1SBtybOKRJhTw==
X-CSE-MsgGUID: I10RPCCUQqO5feFGpd65mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1132510"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1132510"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 17:18:20 -0700
X-CSE-ConnectionGUID: r595fgXLS8ypGy5yOTPcKA==
X-CSE-MsgGUID: RRbr9cGISaqNl8OIrbYr4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2955613"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by fmviesa004.fm.intel.com with ESMTP; 20 Oct 2026 17:18:19 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v2 0/3] drm/xe: Some d3cold related fixes
Date: Tue, 20 Oct 2026 10:39:44 -0700
Message-ID: <20261020173943.669600-5-vinay.belgaumkar@intel.com>
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
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Toggle d3cold allow flag and wait for pcode init before accessing
MMIO.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (3):
  drm/xe: Toggle the D3Cold enable flag at runtime resume
  drm/xe: Access GT MMIO after pcode init
  drm/xe: Memset g2g buffer on resume

 drivers/gpu/drm/xe/xe_gt.c     | 14 +++++++++++++-
 drivers/gpu/drm/xe/xe_gt.h     |  1 +
 drivers/gpu/drm/xe/xe_guc_ct.c | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h |  1 +
 drivers/gpu/drm/xe/xe_pci.c    |  3 +++
 drivers/gpu/drm/xe/xe_pm.c     | 12 ++++++------
 drivers/gpu/drm/xe/xe_uc.c     | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_uc.h     |  1 +
 8 files changed, 56 insertions(+), 7 deletions(-)

-- 
2.53.0

