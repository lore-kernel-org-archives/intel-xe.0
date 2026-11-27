Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A9E606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 13:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sg18cyEM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275EA112AC2;
	Fri, 27 Nov 2026 13:02:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB82710E9F2
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 13:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795784548; x=1827320548;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9VYJUmvoqih7UW1Gqrp4W6dcToGt+csoSLkoR6Gij1o=;
 b=Sg18cyEMvHcimqPPS1dqYPwi5E2RN20LRybWqI+JV1VyaDc4qPvzDROJ
 p3u61zQ8Hp5rBmI8QNm1qfEem3M40ZNTaggffDatMUxWutN3bpq0BHMK8
 wQz7I2t5iHPwf8Q610NENMTcHTZwxnfox2sakVuzRTxGG9RFaryO6ZEOc
 J839R9ilODvkX14hyOHJSDeI+MYclwiwMGaY+rDURQJg/nQ4QtM5vkFBD
 wCSBzBl+kZIfZL1bhF7Na7xH8ndRtIaKOUPgyB8ydBa1XEKjlwSqUIWRU
 6KGYTi4J8yWCn0PG0QwWtwhKvDwhoxkBXrA3slmEa+oJ1W1+RZtbtFXq0 w==;
X-CSE-ConnectionGUID: OTkFHVqHRqe4KVmrq+qF+g==
X-CSE-MsgGUID: g9Gw2Dy5TwGMh5BJMaZayg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4694553"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4694553"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 05:02:27 -0800
X-CSE-ConnectionGUID: tpKvdjLkSSuISw3uHJ4lgg==
X-CSE-MsgGUID: 3+JvZ/HDRBaamb1EENWSOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12393705"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 05:02:26 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com, satyanarayana.k.v.p@intel.com,
 tomasz.lis@intel.com, raag.jadav@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v4 0/2] drm/xe/vf: Support PCIe FLR
Date: Fri, 27 Nov 2026 14:02:17 +0100
Message-ID: <20261127130219.1201179-1-lukasz.laguna@intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable PCIe FLR handling for VFs on discrete platforms. After VF FLR,
the PF still has to clean up the VF resources, so VF re-initialization
must wait until GuC accepts VF requests again.

Patch 1 enables tearing down exec queues for VFs during FLR preparation,
which was previously skipped.

v2: Tear down exec queues on VF FLR prepare (Sashiko)
    Log an error when SR-IOV post-FLR actions fail
    Improve xe_sriov_post_flr() kernel-doc
v3: Explain VF FLR flow ordering in commit message (Raag)
v4: Mention that VF FLR is supported only on discrete platforms (Piotr)
    Clarify comment about waiting for GuC in xe_sriov_post_flr()

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

