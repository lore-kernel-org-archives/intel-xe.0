Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB1D606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 12:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ig6y8qdn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97601127C3;
	Fri, 30 Oct 2026 12:16:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B2E10E8AB
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 12:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793362603; x=1824898603;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ogRN5eOlUM2zXFnLAnaim6TgZ5YthKOiZ6dnJ4Qw6U8=;
 b=ig6y8qdnc/ujptVnEltHZqc3lJp6OFAE0IxvH6ebKVg0cYiW7QceTmPK
 sBZ7Aq7gEq8ukVEFpYITRyZCW0hyXmzRcCJD4k5xiWACwiyRbh+CtQZqB
 15p/jn1pH6BAGG01T2TZHHhZxQqVHBwF4GQ/V6qK+nmLcCQs/6yv+VW1B
 yIejX8P+C1YonfDcMib5FajaAKyjGrS8oWDTv+DLz874mm3qgE5YxpUgr
 nqAXUbfEgBLDr2fqrQTtQvQCb0bi/AT1RGr8oCCS3qy2KCy3p1PWWm56q
 bBzC7GTmicKUEJU/yahFRlVayt+gAxVscGvxblm3GF/pOo4ifSV3LpRTM w==;
X-CSE-ConnectionGUID: mL2IL8nTSJezc0ywBUTdLg==
X-CSE-MsgGUID: 6p8JTR42QtSe+p/IPZsTMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2140085"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2140085"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 05:16:41 -0700
X-CSE-ConnectionGUID: rXdSo+fXSdiOdYegachFnQ==
X-CSE-MsgGUID: fMjUgxHdRo6CWsuzUSvI1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5314213"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 05:16:40 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH CI 0/2] drm/xe: CPER info queue for CI
Date: Fri, 30 Oct 2026 17:46:37 +0530
Message-ID: <20261030121636.2488868-4-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
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

Add support to retrieve info queue data and prepare Intel CPER info
records from the retrieved information

Badal Nilawar (2):
  drm/xe/xe_ras: Add support to retrieve info queue data
  drm/xe/cper: Prepare Intel CPER info records

 drivers/gpu/drm/xe/xe_cper.c                  | 247 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_cper_types.h            |  54 +++-
 drivers/gpu/drm/xe/xe_ras.c                   | 130 +++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |   4 +-
 drivers/gpu/drm/xe/xe_ras_types.h             | 116 +++++++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 6 files changed, 542 insertions(+), 11 deletions(-)

-- 
2.56.0

