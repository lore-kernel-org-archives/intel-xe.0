Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51B3606A31A
	for <intel-xe@archiver.kernel.org>; Sun, 15 Nov 2026 08:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hQ7MZeHx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688C410E02F;
	Sun, 15 Nov 2026 08:55:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1B510E02F
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Nov 2026 08:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794732948; x=1826268948;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xvT5Qky/tl6rZ7K6Z8ITNdkrKfxUKMDR0T1OEC4zPQ0=;
 b=hQ7MZeHxMUL1oK3NwDOlncQiz4uj3FCB0/pU6rWzssGjJXTYG4wUU5QP
 grwTm3yCKsNcPb0JCVflkQqNVam/WRGxQPAnQX0SSK2WRheWmoZs/Qvvb
 O8Q0+M0z1jmXXPmzlGGpxHDmGMFHo6y9dFhhmgQmVN0Xuo8ya6CyMjfdb
 KJNDQ6vM62ExLDbsgDCA5NYSP5HRfKCHW4VcdgQKZuxJUZuz/E/sLr8Pm
 cTc5h3y8VKpIdz062DekAbO1KCjGCp6aE6XVOaenEe2V0xQIx/WHT1jQE
 CrgW26gvcWffiWeSQWt2CXBqAnmipkSHozPs2zv10gvKTAbUqsJE0RVB/ A==;
X-CSE-ConnectionGUID: GS6r8XA6TL2XdxvpL25pSw==
X-CSE-MsgGUID: R5fq+OwhS4+dGOuPew4G2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3496476"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3496476"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 00:55:48 -0800
X-CSE-ConnectionGUID: kvB0X604T4i9ZI6lulv2xw==
X-CSE-MsgGUID: 6x3w92PFSCSbcF32fXAuXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9306636"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 00:55:47 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/3] CI-ONLY Fix VM teardown and migration queue recovery
Date: Sun, 15 Nov 2026 14:25:15 +0530
Message-ID: <20261115085518.1135138-1-arvind.yadav@intel.com>
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
  CI-ONLY Hold a device reference across deferred VM destruction
  CI-ONLY Mark VMs as closing before queue cleanup
  CI-ONLY:Defer VM teardown until exec queue cleanup

 drivers/gpu/drm/xe/xe_device.c           |  24 ++-
 drivers/gpu/drm/xe/xe_exec.c             |   9 ++
 drivers/gpu/drm/xe/xe_exec_queue.c       |  32 +++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   6 +
 drivers/gpu/drm/xe/xe_pagefault.c        |  87 +++++++++--
 drivers/gpu/drm/xe/xe_svm.c              |   3 +-
 drivers/gpu/drm/xe/xe_vm.c               | 191 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.h               |  13 +-
 drivers/gpu/drm/xe/xe_vm_types.h         |  17 ++
 9 files changed, 338 insertions(+), 44 deletions(-)

-- 
2.43.0

