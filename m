Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20AB606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 08:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ft1YpaBG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B677A10E226;
	Wed, 25 Nov 2026 08:06:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B0D10E226
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 08:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795593997; x=1827129997;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+21BaAJwuvlNi+II1gA3L9WVcWQX+Y5rCP2G7MpoIH0=;
 b=Ft1YpaBGEJxLryiqU+h5ANYo45KB2NHXe2KJppIL1u/it4bmBUJ+Rfuy
 ngffJsX3x0puAPetxVqtgZFgwK4aRvvcekdYqwtIQ1sjZscwb5NJ7jXym
 V8xhH2qhJiCM6z1QzP58tWT3Zn/5w7EU7bKKgzz3WAKojAOTCI+Qf4KVb
 VsUBMmFC5UqkjJ5Ttvnxgtkmq1YUF6frzMMwmwUtXG7QOhS6t0JqIf5ks
 f+nkJ0IOTxlKPvmwGNy++uDbar+j0Y5U5Gja+tEpQPpLlWvapjDSFZZJi
 09j/P8Q+NQCyNzjT5uAblROd1DvWl2mmU9iWkVRA0SRym6l7ua4BN6WRM g==;
X-CSE-ConnectionGUID: gCYpPmCeSzajeQT6Hu7/hg==
X-CSE-MsgGUID: zZq+3ADWRHyLd66XJ/Qpzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4541881"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4541881"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 00:06:37 -0800
X-CSE-ConnectionGUID: hz2LfKCFQWG8LM1XwileBg==
X-CSE-MsgGUID: CpCocXShRCi7ivqk+bwEzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="11997039"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 00:06:35 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com, satyanarayana.k.v.p@intel.com,
 tomasz.lis@intel.com, raag.jadav@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v3 0/2] drm/xe/vf: Support PCIe FLR
Date: Wed, 25 Nov 2026 09:06:18 +0100
Message-ID: <20261125080621.599255-1-lukasz.laguna@intel.com>
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

Enable PCIe FLR handling on VFs. After VF FLR, the PF still has to clean
up the VF resources, so VF re-initialization must wait until GuC accepts
VF requests again.

Patch 1 enables tearing down exec queues for VFs during FLR preparation,
which was previously skipped.

v2: Tear down exec queues on VF FLR prepare (Sashiko)
    Log an error when SR-IOV post-FLR actions fail
    Improve xe_sriov_post_flr() kernel-doc
v3: Explain VF FLR flow ordering in commit message (Raag)

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

