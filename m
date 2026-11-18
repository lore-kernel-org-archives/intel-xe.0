Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99258606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 02:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VWV53WIb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C33D10E4B6;
	Wed, 18 Nov 2026 02:51:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AC910E086
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 02:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794970312; x=1826506312;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cHgBPOYBjQ94X12048tz1+d/5amYnUA6TW4ITyOudeY=;
 b=VWV53WIb7YFCWsOhYHV5mCet8s50GNyGPCvex70kEwV2y+VtDFNkUZot
 MQOtdFsTx79kWChfo9poLilWSMt4FGaGqvA+tzE9y68UpnXdHGVvLJnkn
 mQqFmgMhumOcOuHOfhpZCG7QSrXNe9ko25WjPd/ll1nplym6KF7ZSGFw/
 ii4SZsGplMhgTR2WcfsQOkZ5i90edCRasj9QWL9W6F+CbFAQV2Wx2HyE5
 +ApyRAxuSDA+D9/mtc7OFy8KAL8eoJTuRzA23mYig4WlKvhnGpzJ3W2Wd
 EUDM2VXJ4WJYRJzOMR7nJ4Idqf87MhFTEJfysOvrHmCHVbCWaUDLpcBiW g==;
X-CSE-ConnectionGUID: fPNdUcXPTBaOWI1K+dVD2w==
X-CSE-MsgGUID: yzMvD04uTna3sO9rWpTPDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3614548"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3614548"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 18:51:51 -0800
X-CSE-ConnectionGUID: o2doeRCXREubUm3NICCHiA==
X-CSE-MsgGUID: FLzPOca0Qe+SRc7fqcp0Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9888990"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 18:51:51 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: shekhar.chauhan@intel.com, harish.chegondi@intel.com,
 intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v7 0/7] Cleanup OA stream on PCI unbind/remove
Date: Tue, 17 Nov 2026 18:51:41 -0800
Message-ID: <20261118025140.3782678-9-umesh.nerlige.ramappa@intel.com>
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

v2 - v7: Sashiko Comments

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
 drivers/gpu/drm/xe/xe_oa.c          | 368 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_oa_types.h    |   3 +
 drivers/gpu/drm/xe/xe_observation.c |  20 +-
 4 files changed, 357 insertions(+), 49 deletions(-)

-- 
2.55.0

