Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF622606A32A
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 14:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZIScMEFV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BC410F672;
	Tue, 24 Nov 2026 14:18:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5372A10E875;
 Tue, 24 Nov 2026 14:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795529909; x=1827065909;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7vezgsZvJU8VccN+LnErQpXwtEhMdPlTCFO/3Ak4NM0=;
 b=ZIScMEFValE7h54o+4+g3xr6K3ZaXdo4VPC3w/3JgjJ0TLxHMsQX4Avm
 +CdcjV9/XeI5A1QOfhvnZZi6PsHpgZ58BOvvm73/7r7/6KeQokG+iejeo
 J2WofUZEK3lF70VkWNk25bHbdRn+3pkLNsM3lmLwBdHrUMUUikn49gNC0
 Rxpdnq1XZR6Yxc4LcEzlHJMMYEkaMXpcsfEvJqxBf9ctD+aPYse5Ch33a
 YFtN4pqpg1p4MYhkzxquGLbA8fEksWRoSouRcdfNWwRcrytfCK+Abf0BI
 UeKemvaQoqC2EKmJ1EzTZcPLxz5xeHHNMs4gVsFbbmBDIYgPGmOJG857B Q==;
X-CSE-ConnectionGUID: AtCcX268TAmJifkiDJD9OQ==
X-CSE-MsgGUID: V58TJWjkSu+nu/wRJ9T5kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4389691"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4389691"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 06:14:55 -0800
X-CSE-ConnectionGUID: Gr9V0pqaShuuNRtIysBmqQ==
X-CSE-MsgGUID: jn+Z1do9R6GMqBCIVLSuMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11569617"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa007.jf.intel.com with ESMTP; 24 Nov 2026 06:13:01 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 0/3] drm/i915: Enable flip queue with PSR2 and Panel Replay
Date: Tue, 24 Nov 2026 14:12:57 +0000
Message-ID: <20261124141300.2600962-1-mika.kahola@intel.com>
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

Enable flip queue commits with PSR2 and Panel Replay on Xe3+. The pipe DMC
sends the frame-change push after executing the queued DSB. PSR1, older
platforms, and joined-pipe configurations remain on the existing path.

Also account for flip queue execution time in the DC3co exit latency.

Mika Kahola (3):
  drm/i915/flipq: Let the DMC send the PSR frame change
  drm/i915/flipq: Allow flip queue commits with PSR2/PR on Xe3+
  drm/i915/cmtg: Include flip queue exec time in the DC3co exit latency

 drivers/gpu/drm/i915/display/intel_cmtg.c    | 13 +++++-
 drivers/gpu/drm/i915/display/intel_display.c |  5 ++-
 drivers/gpu/drm/i915/display/intel_flipq.c   | 47 +++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_flipq.h   |  4 +-
 4 files changed, 57 insertions(+), 12 deletions(-)

-- 
2.43.0

