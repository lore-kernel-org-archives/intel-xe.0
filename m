Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89033606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 20:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RsEDr7zg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C6510E255;
	Tue, 24 Nov 2026 20:12:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449BB10E0EC
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 20:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795551118; x=1827087118;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9rVnYJhXveawIxc+dk/UEZ5K27TdLH1jWqrf1ZCe/rk=;
 b=RsEDr7zgQwubhydOXTaICtBFcBfHwZptJClqnpLzjGNau29LUsFkpa/L
 dHbywU6qZl7OP8oDwOSfg3g+3biL0OIZygr+uicow74t+H/zeuudnT+lx
 lr5/8w+c7AvFEXC+uRhKMOP9kzXt0pPJEhS4SkPuwMvU1Jj4Qz/lzKj5j
 IT0AbSqFTczE93kKghXMUwu70QBp8yGwyiet7s1mzqj+6rWxgdqMkoGEu
 rILXGNW7cYs9GxBR9VLL4M8oDxHFkxd27+L0QSK5BL5XDDMlmLSdmifgi
 lTv8JOX/5+ICRbHOH52G5WbfX6heYexoP028pQd35DKNcZF89jHRkuoTt w==;
X-CSE-ConnectionGUID: ubzHmrlNQ3iCSPWbv0KQ+Q==
X-CSE-MsgGUID: dnvZSD7vRjyvHS6FTqc+eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4305565"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4305565"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 12:11:58 -0800
X-CSE-ConnectionGUID: dypN/MAfTfCSONQd3KS1tg==
X-CSE-MsgGUID: rOL769RuTVK3j3Mk/PQpUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="12240619"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 12:11:58 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 harish.chegondi@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH v10 0/7] Cleanup OA stream on PCI unbind/remove
Date: Tue, 24 Nov 2026 12:11:51 -0800
Message-ID: <20261124201150.405479-9-umesh.nerlige.ramappa@intel.com>
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
v9, v10: Incorporate comments from Sashiko and Shekhar

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (7):
  drm/xe/oa: Ignore a HW tail pointer outside the OA buffer
  drm/xe/oa: Use the drm device address_space for the OA stream fd
  drm/xe: Reject vm_ops->access on BO mappings of an unplugged device
  drm/xe/oa: Wait for in-flight OA batches before stream HW teardown
  drm/xe/oa: Fence OA ioctls and mmap against device unplug and wedging
  drm/xe/oa: Free the OA buffer and the stream after the stream destroy
  drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset

 drivers/gpu/drm/xe/xe_bo.c          |  15 +-
 drivers/gpu/drm/xe/xe_oa.c          | 309 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_oa_types.h    |   3 +
 drivers/gpu/drm/xe/xe_observation.c |  20 +-
 4 files changed, 308 insertions(+), 39 deletions(-)

-- 
2.55.0

