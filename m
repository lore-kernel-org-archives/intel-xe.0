Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80129606A32F
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 00:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bwO0xL4m
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EC610FFCB;
	Thu,  5 Nov 2026 00:16:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC43D10E8E2
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 00:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793837772; x=1825373772;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hifPAMP2OgRsr95AF9OO+6j7SnQvV9+fbG6rF2oUJF4=;
 b=bwO0xL4mEwNz/p5fuNzvbRz5qtB48GPDr4cEWY9icndk0B6OupOPr1Fk
 XRCund/CuvX28HKigAGmNcUKuAsnThWbaeCphTmSONGyo3RXsaDllW7W2
 NTCul9XVTWsgWzuAprEEQPk/+OONjxqKgwhqjbOOd4zNaVQBZ1K57WCGW
 NYcpP5mRVEA6BbjSCr43bP/tkIO2lENrFJR9dq9+XcwGwQ7X5wPFxZdeN
 MK1X+vuJfdMTm/lUclSBn7dYKsAmr4nn03jfx1ASdilgAB3z3jhniAzyF
 j1/tZtN/6BNEhjZqBUy1UXOM1kLvBq1tJdDYz+W9DGyQSkWuHytwGzJGH Q==;
X-CSE-ConnectionGUID: dQx2fPzKThS9czr9eGISvg==
X-CSE-MsgGUID: OJku4LYYTOC5v4JiRKAcZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2605961"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2605961"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 16:16:11 -0800
X-CSE-ConnectionGUID: ukXd1jMKQ66oA8DSFAml4w==
X-CSE-MsgGUID: 1cJcSL3lRLG6TzFbALJzJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6761929"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 16:16:11 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 Matthew Brost <matthew.brost@intel.com>
Cc: harish.chegondi@intel.com
Subject: [PATCH v4 0/7] Cleanup OA stream on PCI unbind/remove
Date: Wed,  4 Nov 2026 16:16:00 -0800
Message-ID: <20261105001559.3288915-9-umesh.nerlige.ramappa@intel.com>
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
v3: More Sashiko fixes and refactor
v4: More Sashiko fixes and refactor

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (7):
  drm/xe/oa: Use the drm device address_space for the OA stream fd
  drm/xe/oa: Split OA stream destroy into HW teardown and resource
    release
  drm/xe/oa: Take the runtime PM reference in xe_oa_destroy_locked()
  drm/xe/oa: Skip OA HW teardown on a wedged device
  drm/xe/oa: Wait for in-flight OA batches before stream HW teardown
  drm/xe: Reject vm_ops->access on BO mappings of an unplugged device
  drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset

 drivers/gpu/drm/xe/xe_bo.c          |  15 +-
 drivers/gpu/drm/xe/xe_oa.c          | 320 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_oa_types.h    |   3 +
 drivers/gpu/drm/xe/xe_observation.c |  23 +-
 4 files changed, 322 insertions(+), 39 deletions(-)

-- 
2.55.0

