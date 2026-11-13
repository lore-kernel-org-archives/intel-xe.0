Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA04606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 07:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JLTAV0ga
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E0610E74F;
	Fri, 13 Nov 2026 07:36:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A78D10E74F
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 07:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794555359; x=1826091359;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wgqOdKQKd2DykSAujgWDzDJ94QJFwJOeGCEgIkSmcHA=;
 b=JLTAV0gaH+RVMDPyRg0oyO+WAu3wOlW73iyg0ANhPatgzDAueRHUFjz8
 /u/Je5KXcV5dHDVPOUaj6SdlYoYTV8L31h1LCYJs85+5X61gHC99S+8E5
 lIGqWMBDklQoBZ4M8w3p9Z+nySjtyIZLd/wpDAzTnxRe/tTlRhhnNWgkA
 /Wvd6tU+buS2lThgNzVAxuk7kBKGgSJJmD6dzptdzlaz/SY7PZquDEriq
 SoNiz1qFX0LsUuxNgeqgQBy6O1Mg94iVqCnNOJYdMMPHxCdh0K85hb78I
 sQ99ZbtldS5O2s6+4HYzulMEUv1Y6Piif6vSWKghpHP3zSHjE8cc9Yzjt Q==;
X-CSE-ConnectionGUID: t9GKUhb5T2qfm1n0DM4ibw==
X-CSE-MsgGUID: 41op8aSjS3uowqR1ZzttJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3347931"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3347931"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 23:35:59 -0800
X-CSE-ConnectionGUID: NsEoY/i8QsO+q8NAh6UMRw==
X-CSE-MsgGUID: QttGmXInT8iVLk2hInmjjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9030590"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 23:35:58 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/3] CI-ONLY Fix VM teardown and migration queue recovery
Date: Fri, 13 Nov 2026 13:05:46 +0530
Message-ID: <20261113073549.352746-1-arvind.yadav@intel.com>
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

Arvind Yadav (3):
  drm/xe: Hold a device reference across deferred VM destruction
  drm/xe: Mark VMs as closing before queue cleanup
  CI-ONLY:Defer VM teardown until exec queue cleanup

 drivers/gpu/drm/xe/xe_device.c     |  20 ++-
 drivers/gpu/drm/xe/xe_exec.c       |   9 ++
 drivers/gpu/drm/xe/xe_exec_queue.c |  22 +++-
 drivers/gpu/drm/xe/xe_pagefault.c  |  85 +++++++++++--
 drivers/gpu/drm/xe/xe_svm.c        |   3 +-
 drivers/gpu/drm/xe/xe_vm.c         | 197 ++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.h         |  14 +-
 drivers/gpu/drm/xe/xe_vm_types.h   |  16 +++
 8 files changed, 323 insertions(+), 43 deletions(-)

-- 
2.43.0

