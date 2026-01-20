Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E33FD26283
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 18:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B4A10E1CF;
	Tue, 20 Jan 2026 18:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVLqLAJM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90AE010E1CF
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 18:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768934139; x=1800470139;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y0QlVQ54tU44yFRRpdjP/1yM/aObHgudrlF5YJTk7iU=;
 b=BVLqLAJMQPmvR8UYtmn05VOB5pBUr4n4Mrf/r1uc327Sj4suBAJljS01
 wqOKL9tBrwZwfvafK9o0rImjcvCjVfmp26/L19aebjNSsf3i8S5YDx6z0
 xEhUjOVcx7VupbrO1h8qM81a38mSTtPT4JAD7MpUMSxD9tggu40/pi1qa
 2Gwxi9D8S5ee1QYxY5br1Kngy4/cAoaGMSOMNtEBTK1OkY5czAYuLu8PS
 iTVpqlS2tIdsnUHGxlEHthuGUJkcsLSlxwofEdxUZT+cIo/H0yakBVWZN
 r4WF2VcfOrUBOdLTfOLABnGB6aDbehoISXD9H1GUr2c56LXXNbmHAoKG+ w==;
X-CSE-ConnectionGUID: 6Av2CtH4Riq8YwKfLckq+Q==
X-CSE-MsgGUID: oueWygloR+aSeRALZuGgVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="69883263"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="69883263"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 10:35:38 -0800
X-CSE-ConnectionGUID: goAXP/bOQ1m4OpHhVSJhyw==
X-CSE-MsgGUID: XLd0J9DsRbOVkWDMNAInsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206445773"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa008.fm.intel.com with ESMTP; 20 Jan 2026 10:35:37 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v4 0/3] Fix nvm aux resource cleanup
Date: Tue, 20 Jan 2026 18:32:40 +0000
Message-ID: <20260120183239.2966782-5-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

v2: create patch2 to "Fix double-free on aux add failure".
         
v3: drop goto in patch2 and create patch3 to drop the clear of xe->nvm.

v4: re-send series to fix patch apply failure.

Shuicheng Lin (3):
  drm/xe/nvm: Manage nvm aux cleanup with devres
  drm/xe/nvm: Fix double-free on aux add failure
  drm/xe/nvm: Defer xe->nvm assignment until init succeeds

 drivers/gpu/drm/xe/xe_device.c             |  2 -
 drivers/gpu/drm/xe/xe_nvm.c                | 59 ++++++++++------------
 drivers/gpu/drm/xe/xe_nvm.h                |  2 -
 drivers/gpu/drm/xe/xe_survivability_mode.c |  4 --
 4 files changed, 28 insertions(+), 39 deletions(-)

-- 
2.50.1

