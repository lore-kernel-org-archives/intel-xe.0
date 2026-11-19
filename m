Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E331606A339
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 00:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kpo7hu3I
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5592010ECAC;
	Thu, 19 Nov 2026 00:29:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472B010E173
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 00:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795048141; x=1826584141;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V7BX6IKu+KQFdSRCB0PCnYzxwcuuV+OhI7rlR+Vm/r0=;
 b=kpo7hu3ISdeqOSjfHkA8CDB5Y9UqNrkT1nEMpxDAEdIMBXRwuhGJR1ZH
 Ay4Yqea642nuqXlrwguo8wX4S72K9s0FqsZDCJ6z0At1z+M4BUuIzNtUL
 reI7X/arwXAu6Rdd+6Qd9+HtZ7MRzTv/JlH6PlldJ66AcXSShEABAsvZY
 JtLYweY06yMP3wUiOQIUcapqpOKFQk9GrGwz9zfKxpeLuFUXUQgrym5g2
 CBjZYbDpL8akwXyUFI0ahkNz3tK3odrU9tpQbbBijdoAwIy9gjSI4e8JQ
 Wi0zyCtZAyqDRorJG/poY36aFm5pgCrgwu07czKrs7VIboVB8D7eZSC3h Q==;
X-CSE-ConnectionGUID: 8VDH0ZLkTWa3rMHq3lpDHQ==
X-CSE-MsgGUID: UJe0NtdIQq2hF4tDV2z/Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3876661"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3876661"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:29:01 -0800
X-CSE-ConnectionGUID: wJS+p9NLTPGGtCj4o+ZVoA==
X-CSE-MsgGUID: BnEURYmkTGOEdCpkpjbk3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10081543"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:29:01 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 harish.chegondi@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH v8 0/8] Cleanup OA stream on PCI unbind/remove
Date: Wed, 18 Nov 2026 16:27:38 -0800
Message-ID: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
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

v2 - v8: Sashiko Comments and other refactor

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (8):
  drm/xe/oa: Ignore a HW tail pointer outside the OA buffer
  drm/xe/oa: Use the drm device address_space for the OA stream fd
  drm/xe/oa: Wait for in-flight OA batches before stream HW teardown
  drm/xe: Reject vm_ops->access on BO mappings of an unplugged device
  drm/xe/oa: Fence OA ioctls and mmap against device unplug and wedging
  drm/xe/oa: Take the runtime PM reference in xe_oa_destroy_locked()
  drm/xe/oa: Free the OA buffer and the stream after the stream destroy
  drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset

 drivers/gpu/drm/xe/xe_bo.c          |  15 +-
 drivers/gpu/drm/xe/xe_oa.c          | 289 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_oa_types.h    |   3 +
 drivers/gpu/drm/xe/xe_observation.c |  20 +-
 4 files changed, 289 insertions(+), 38 deletions(-)

-- 
2.55.0

