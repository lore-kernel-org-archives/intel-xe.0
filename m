Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49E2606A898
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 22:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BT4GS0Rq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6539710E498;
	Mon, 16 Nov 2026 22:30:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E5210F48A
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 22:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794868203; x=1826404203;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wWfwcksCc2o078m6rA4kXjcxxb+FYl4X8ArJ2Qd+UWo=;
 b=BT4GS0RqqvP6sQ3erS+px/f6FYJ+LjRx0w8Zw/Yxzdov4fESXALrZvy7
 9gy3DIfRq5FSMa2/uo/KRWvg8oy0SP+BZGcZIYXW7IyVyi4Ogv5Dknqx0
 MBsvky9IHzrDaik10V40bGovvccJdbGE+G2VlKuZ5X9HgfhU2vBGrzWr2
 0cxaG5c966cW5CA9ngy4wEfzdmDBpLx191k8x8Hc9EevwXEhtzo+DP4ef
 Cd7MdDRfh6nDl8wSDMCOiKuu5PVhTFdhj0mjbA4WN5/95CtGeH/dveiuz
 52u1kYXZC+1br4Qa0NLMgPHC3eTqVDtwxcgsILQ9zn0/oVgJ54fEBMmw0 Q==;
X-CSE-ConnectionGUID: Jcok8nVVQE6Vdwu0w8TkqQ==
X-CSE-MsgGUID: aAA//ScLRpGrjic1ZfRW5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3699665"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3699665"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 14:28:04 -0800
X-CSE-ConnectionGUID: 4+0ElJufQOyfa9CiIFMfwg==
X-CSE-MsgGUID: x5SAwYCvRzScKjE39qkdTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9705031"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 14:28:04 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: shekhar.chauhan@intel.com, harish.chegondi@intel.com,
 intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v6 0/7] Cleanup OA stream on PCI unbind/remove
Date: Mon, 16 Nov 2026 14:27:53 -0800
Message-ID: <20261116222752.3677159-9-umesh.nerlige.ramappa@intel.com>
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
v5: Drop unpinning of BO in quiesce (Sashiko)
v6: Some more Sashiko fixes

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
 drivers/gpu/drm/xe/xe_oa.c          | 348 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_oa_types.h    |   3 +
 drivers/gpu/drm/xe/xe_observation.c |  20 +-
 4 files changed, 343 insertions(+), 43 deletions(-)

-- 
2.55.0

