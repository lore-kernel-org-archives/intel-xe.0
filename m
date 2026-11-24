Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D84606A321
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 20:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nqJU0BN9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8E110E8C0;
	Tue, 24 Nov 2026 20:36:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEEB10E8C0
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 20:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795552573; x=1827088573;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Oe0q1uJD4D4C/rVrmmjowQwhh9E+TDbzbAXZMNN+4WI=;
 b=nqJU0BN9aWvC3PmV0gJf+xq5FKJs/+v5PSBA+VctLvPclw5XhtrJnDn3
 jo0BaSos59Ec0qkWhV4XbGxJtDb3BmrhTHUNJ3FRGAnfWfKht/SOnvmk1
 ynpvXz1k2TUVTQcxPV4VYDBN7RKwqfTCJly0FSC60i2tTJTRzkEBncNcO
 TT//h3oDXb12MBeSTggFXNopaFRirT1Ssvb9Gh4NyF6SLoB6tECRsqf4u
 mvowk1LGFS0OiWajO+YcUnrhDPJmyYK9LGwbN1Hw+J7ZP1sShQNm9in3X
 7Il2zl205brgI8cL1YG//a4ECVkTDChKfkvGDaJ8xVt5Y2x74LMZ6G/DB A==;
X-CSE-ConnectionGUID: mWiKgfjeScme4HkY+X2Eag==
X-CSE-MsgGUID: U5HjnECtQiWOFzghILkvKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4414820"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4414820"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 12:36:13 -0800
X-CSE-ConnectionGUID: ov1f2uSnRiqPbTcsm87fPA==
X-CSE-MsgGUID: k4OYSmtkRl+1KypXY5unVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="13450022"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 12:36:11 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com, satyanarayana.k.v.p@intel.com,
 tomasz.lis@intel.com, raag.jadav@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v2 0/2] drm/xe/vf: Support PCIe FLR
Date: Tue, 24 Nov 2026 21:36:02 +0100
Message-ID: <20261124203604.467922-1-lukasz.laguna@intel.com>
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

Enable PCIe FLR handling on VFs. After VF FLR, GuC remains unresponsive
for the VF until the PF completes VF cleanup, so VF re-initialization
must wait until the GuC becomes responsive.

Patch 1 enables tearing down exec queues for VFs during FLR preparation,
which was previously skipped.

Lukasz Laguna (2):
  drm/xe/guc: Tear down exec queues on VF FLR prepare
  drm/xe/vf: Support PCIe FLR

 drivers/gpu/drm/xe/xe_guc.c       |  2 +-
 drivers/gpu/drm/xe/xe_pci_error.c |  9 ++++++++-
 drivers/gpu/drm/xe/xe_sriov.c     | 31 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov.h     |  1 +
 4 files changed, 41 insertions(+), 2 deletions(-)

-- 
2.43.0

