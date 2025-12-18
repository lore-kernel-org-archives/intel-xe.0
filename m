Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B09D66B87
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 01:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EEF910E064;
	Thu, 18 Dec 2025 01:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LsyxFYJv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C29710E064
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 01:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766022987; x=1797558987;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=plsq0yMFY7+g43znGWRbQ4/xM5N6otmXpQ3GYBjBPxE=;
 b=LsyxFYJv8PIUYs4Jx974CPseyhQKWDRx7AD3YjELllVn44z09aeL977B
 s9RLwYR2p/wqyqVrhARKZaxkiOkUFMq/Syky2tT0zJ2yd/CclfIIKSl9b
 GYaQqSt9Ffrbu6Mr/14D9sr60DEfpTQMacSoFsAbARdN9OA6tJWwAc87/
 2wvCTXh75BtYjnLsZkZ0smAejhD5+YUFud5qrR1bUxf4xVvsy9EFx/9kL
 xz03D3z0y6hXXkusPYnyJ3dkNxPEFgCK+qXRJoDo7Wd3aj2kAvXpORZmP
 +SdvZAWvvRJ3KULw+z06WKBY8vrqyqSzNwCfll66P40MkjJtS2x1pJnhS Q==;
X-CSE-ConnectionGUID: uEyT30lPTsah/t+xH4Q/ZQ==
X-CSE-MsgGUID: FXX+MEXSRDuvUgQ3ilSC+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79341709"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="79341709"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 17:56:27 -0800
X-CSE-ConnectionGUID: YIP0smytRn+NemOwJGDPuA==
X-CSE-MsgGUID: 4dKjLodoTXqe/quy9UryJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="235873990"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by orviesa001.jf.intel.com with ESMTP; 17 Dec 2025 17:56:26 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v3 0/2] drm/xe: drm/xe: Separate out GuC RC code
Date: Wed, 17 Dec 2025 17:53:38 -0800
Message-Id: <20251218015340.3800280-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This allows us to independently toggle GuC RC feature.

v2: Address review comments (Michal W)
v3: Add info about guc_rc, guc_pc and gtidle interaction (Michal W)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (2):
  drm/xe: Decouple GuC RC code from xe_guc_pc
  drm/xe: Add a wrapper for set/unset params

 drivers/gpu/drm/xe/Makefile    |   1 +
 drivers/gpu/drm/xe/xe_guc.c    |   5 +
 drivers/gpu/drm/xe/xe_guc_pc.c | 110 ++++++----------------
 drivers/gpu/drm/xe/xe_guc_pc.h |   3 +-
 drivers/gpu/drm/xe/xe_guc_rc.c | 164 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_rc.h |  23 +++++
 drivers/gpu/drm/xe/xe_oa.c     |   9 +-
 drivers/gpu/drm/xe/xe_uc.c     |   8 +-
 8 files changed, 236 insertions(+), 87 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h

-- 
2.38.1

