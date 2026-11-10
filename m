Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722C7606A326
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 00:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JL1zzLxk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23AE410E8F5;
	Tue, 10 Nov 2026 00:36:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C3610E8F5
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 00:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794270971; x=1825806971;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8sSfUPCvGB81KxyCZkqoi/1ubKQxaKmacnztJlNGn4s=;
 b=JL1zzLxkj/WBI0VmbyfusScIc1W7SKXn7BQrF52PYkMED40j24RJecmv
 JqolMXjoYe5gJs9daThZWUkFJwrI4BMVt9MhHw/a9FlGv0TCRLA6Mwu28
 Cg/cXd4EXm2rDwQvTk7GqAHLJIlXcsxeZzEwSqpF3iFd4SeO0+86leLtO
 gEZzi10YftycAnXQw5fN6cOg1zcDc6BBZVcugBCH1lu0hreKF9rWusKt9
 q6zfj2yeNDHQgsC6Jwjc4tYOdYHlzApn03QBhRUQb/D9kENVIBn/FXJSk
 oT9RU2W/mUGqNV+CBpq8t4c9oJpO/OvPVXY8ycyGN0PuUhKHTobd38nTi A==;
X-CSE-ConnectionGUID: esIILEsTSsK+8tSwopUbFQ==
X-CSE-MsgGUID: MkPXHCeBSLeqQ9DUlkDa9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3042597"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3042597"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 16:36:09 -0800
X-CSE-ConnectionGUID: Hnh9QkFjSXaEZtV3De+tVg==
X-CSE-MsgGUID: 9UvX6j4sT8OkkrUQ2q5Jgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8444402"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 16:36:08 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/4] Define GuC firmware for CRI and NVL-P
Date: Tue, 10 Nov 2026 00:35:54 +0000
Message-ID: <20261110003553.787861-6-daniele.ceraolospurio@intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

70.83.0 is the first official release for both CRI and NVL-P. The
major version-only binaries are already available in intel-staging and
we'll push them to linux-firmware once we go through the CI for this
series.

The first 2 patches of the series are the reverts for the patches in the
for-CI branch and are there to indicate the patches being dropped from
that branch, while the last 2 patches are the proper definitions meant
for drm-xe-next.

Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Daniele Ceraolo Spurio (4):
  Revert "topic/xe-for-CI: Define GuC firmware for NVL-P"
  Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
  drm/xe/guc: Define GuC firmware for CRI
  drm/xe/guc: Define GuC firmware for NVL-P

 drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.53.0

