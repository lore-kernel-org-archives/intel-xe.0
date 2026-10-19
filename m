Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B58607D350
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 15:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FfGQSFOY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5C510EE42;
	Mon, 19 Oct 2026 15:03:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECB010EE61;
 Mon, 19 Oct 2026 15:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792422175; x=1823958175;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z4S66IIePQEot79WCSld3KchmLXnvsbU9WVHJjaU5aw=;
 b=FfGQSFOYuDpyerVhZAc2yXve3a29GNOXwMzQGD/h15vOw+zfpRsyST8g
 1l8Pj84hnL5ZnLd0Rl2w3cNOm1TNyiO5RSr8TN27j326yLUWIoLpC8S3s
 KzWWHVUXcu9MloLEOYBfWhJ9WU2OrYujWdju1qqD8zKyPMcv4a2c3Rpi+
 gesaLESPHlqPQs10/Pm0SbiVECQYbzCWOfo1xK+qVSfw+FPEkhakplKCQ
 /LOaRU/BS6sxVXtdm6WMVsZPUtAXRxVMgqN5j5KOJhHhBUshtycXsWSlz
 ok8Ij3dQJXG+UupwTjxUtEtYRY8g1LzEm+bwLxITJQg3KDTPR6v2bL9Zu g==;
X-CSE-ConnectionGUID: vYJzA9FSRLKOmLzVcj0Ccg==
X-CSE-MsgGUID: bMKiriGrQ/SgjJ6lLOOtnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="990994"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="990994"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:02:53 -0700
X-CSE-ConnectionGUID: jc+4rbZRT2WFK/mJOSmPOA==
X-CSE-MsgGUID: lSlIEdwXSKihDJHrlSV2kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2633858"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.250])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:02:51 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v2 0/3] drm/i915/dp: don't touch the AUX engine while it's
 still busy
Date: Mon, 19 Oct 2026 17:52:58 +0300
Message-ID: <20261019150226.734375-1-luciano.coelho@intel.com>
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On NVL_S with an LTTPR dock, the AUX engine can stay busy for 10-20ms
after the TC PLL is disabled.  When that happens, intel_dp_aux_xfer()
re-writes PORT_AUX_CTL and re-triggers the transaction while Send Busy
is still set, which the bspecs forbid.  This causes a series of 10ms
errors and can end in a "not started" WARN, as reported in:

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9090
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9092

The first patch masks Send Busy out of the power-well AUX CH CTL
read-modify-writes, so a power-well disable that runs while the engine
is still busy can't re-trigger the in-flight transaction.

The second patch gives the engine up to 100ms to finish and, if it's
still busy, returns -EBUSY without touching the register, leaving the
retry to the DRM helpers.

The third patch avoids reporting the expected busy state on the retry
as an error, while still reporting an unexpected busy channel.

In v2:

  * Add a patch that masks Send Busy out of the power-well AUX CH CTL
    RMWs, so a power-well disable can't re-trigger an in-flight
    transaction (local sashiko);

  * Move the new AUX busy state into a dp_aux sub-struct in struct
    intel_dp (Jani);

Please review.

Cheers,
Luca.


Luca Coelho (3):
  drm/i915/display: don't write Send Busy back when toggling AUX power
  drm/i915/dp: don't touch the AUX engine while it's still busy
  drm/i915/dp: only complain about a busy AUX engine when it's
    unexpected

 .../i915/display/intel_display_power_well.c   |  17 ++-
 .../drm/i915/display/intel_display_types.h    |   8 ++
 drivers/gpu/drm/i915/display/intel_dp_aux.c   | 100 +++++++++++++-----
 3 files changed, 97 insertions(+), 28 deletions(-)

-- 
2.53.0

