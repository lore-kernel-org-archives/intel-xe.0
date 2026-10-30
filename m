Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBF4606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 23:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ePJhl12A
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B7810E3F2;
	Fri, 30 Oct 2026 23:38:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6101910E311
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 23:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793403526; x=1824939526;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7Jh7uwyk/yHjvvBIWkQ7oGWSRQAfDwpSv5L3R2Km2og=;
 b=ePJhl12AajbwP/J26+qTT1LyeGnI4i8NVHbtlTOALG01msKWYAe5nr6x
 yEtO+wxaSv9R0ReT95gjOBrU7O2eynbzoDrETLkVBELMdb0sA6HnMirA0
 Tec2M0yrSPFT+i2CmAFqhjUuSj4NciLs5lipaFtE/VQNolmqDghrmk7jb
 7mVtAC7jJUqUHXNZkM/WSt+NK74T8oLTSlnb+sjtUN4+epqxY9Tdx1bDd
 Td/BHmNj34BoOcfAak/3kvHiO4IE63TkXuRzSvWdgL691FNh7BXymLaim
 SULGny6oEdt0nyF57RgvVdryiUtxdzBswFkWZrEO3qNu7y/fhyL7lFFAd Q==;
X-CSE-ConnectionGUID: xRv94a8FRna611LyQCXmnw==
X-CSE-MsgGUID: o7NJrUWARoCxbm7H9Ne+qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2168346"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2168346"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 16:38:46 -0700
X-CSE-ConnectionGUID: p/1Srq/JRPq1eeGlI9Qp5g==
X-CSE-MsgGUID: L3v1C70mSYmlTcpJ7OCYEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5970921"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 16:38:45 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 Matthew Brost <matthew.brost@intel.com>
Cc: riana.tauro@intel.com,
	harish.chegondi@intel.com
Subject: [PATCH v3 0/3] Cleanup OA stream on PCI unbind/remove
Date: Fri, 30 Oct 2026 16:38:40 -0700
Message-ID: <20261030233839.2284694-5-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When an OA stream FD is open, removing the PCI device due to PCIe errors
or doing an unbind causes a NPD and system reboots. While OA registers a
fini handler with devm, the handler does not take into account active OA
connections.

Add code to quiesce OA connection on PCI remove/unbind.

v2: Sashiko Comments
v3: Circular lockdep fix

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (3):
  drm/xe/oa: Use the drm device address_space for the OA stream fd
  drm/xe/oa: Gate OA buffer mmap faults
  drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset

 drivers/gpu/drm/xe/xe_bo.c       |  30 +++-
 drivers/gpu/drm/xe/xe_bo.h       |   4 +
 drivers/gpu/drm/xe/xe_oa.c       | 293 ++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_oa_types.h |  12 ++
 4 files changed, 308 insertions(+), 31 deletions(-)

-- 
2.55.0

