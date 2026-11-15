Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C600D606A31F
	for <intel-xe@archiver.kernel.org>; Sun, 15 Nov 2026 10:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hQfUZDdR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1F710E067;
	Sun, 15 Nov 2026 10:19:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A48D10E067
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Nov 2026 10:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794737985; x=1826273985;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EDTOPu9QL5fHwJnDh/H0cv/VApn4xpwbTA8nxY75oCA=;
 b=hQfUZDdR1x16tl6XZp2H9mc1bLDnD97PhbRUyMAIo1CPXPZ2FSMljnAd
 676ORUv8eP2VZkRGFKPtGzC1+a5Hi1Kb9R+qK/WWtTrUj1Sc5b4AVjLAL
 6lYQ8KIcurKJU9/JW/+rWqNefl1FQQQ5Co8WdKlVewzUznfHmOriH46q7
 Ikgezpt/6jzBO9tED/6nXja6Enc5jiBPiDamTtZVLnbkK3/Zpa4P3/Moi
 J5qtsxf/pnxREp6vqxDg9Vg1kxr9/jvmIS5xWWF8chQd9/g8w+9JBTAgX
 +qO6MdbiRCKUove51w5ahQ/8ysol3LL+G2BTgRe8X+seXIDS1vNZpNg8v Q==;
X-CSE-ConnectionGUID: ohSn7OJjRK2vVBFbkD8J0A==
X-CSE-MsgGUID: +nwCc8qZRS+6uwtcGKrH2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3526727"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3526727"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 02:19:44 -0800
X-CSE-ConnectionGUID: 4yu7qnRXRS6t5hqqbHFirg==
X-CSE-MsgGUID: k77rwuu5Ruapw4G7av2RUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9243957"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 02:19:44 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 0/3] CI-ONLY Fix VM teardown and migration queue recovery
Date: Sun, 15 Nov 2026 15:49:30 +0530
Message-ID: <20261115101933.1163260-1-arvind.yadav@intel.com>
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
  CI_ONLY Hold a device reference across deferred VM destruction
  CI_ONLY Mark VMs as closing before queue cleanup
  CI-ONLY:Defer VM teardown until exec queue cleanup

 drivers/gpu/drm/xe/xe_device.c           |  24 ++-
 drivers/gpu/drm/xe/xe_exec.c             |   9 ++
 drivers/gpu/drm/xe/xe_exec_queue.c       |  39 ++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  11 ++
 drivers/gpu/drm/xe/xe_pagefault.c        |  87 +++++++++--
 drivers/gpu/drm/xe/xe_svm.c              |   3 +-
 drivers/gpu/drm/xe/xe_vm.c               | 191 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.h               |  13 +-
 drivers/gpu/drm/xe/xe_vm_types.h         |  17 ++
 drivers/gpu/drm/xe/xe_wait_user_fence.c  |   5 +
 10 files changed, 354 insertions(+), 45 deletions(-)

-- 
2.43.0

