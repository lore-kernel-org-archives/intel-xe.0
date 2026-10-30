Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4662F606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 22:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=edUYeGUy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0949010E8F8;
	Fri, 30 Oct 2026 22:31:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873CF10E8D4
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 22:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793399465; x=1824935465;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ya+O8NsWm9XXm/R/mMpj01lp5MBdRjdMFNFFx321ZJg=;
 b=edUYeGUyy8gnEXzRKHKboGaaWkoKtJjvxmKlThUg1LiFt30GPrIcOQVf
 ukcmq3YLTXzyZUkxPkdNbU5UxItkdFp1qF0G+h0b0Xs8JSfNrzjs07/XR
 ORWVLQsE+Mzt3Ovj6Nsnbp7ZQb7tS8haF//LEN2tIwTJ3z2kMcL9X70oM
 E67qOh81VLY6NAAg7YluNCJ3OkZECuqNO8en6p1vv2pPzbAkIS7kUIfsU
 bz0pPh3fzy4CfsGXF0EQ+6gdY8m79RQMG+Se0Z/XTOxjAUBErHZW/BnG/
 C5Nbt3uF5OEMWM67N1vypY0Xd7Jeh2NsoFHVYMfhOYTr+xBiGW2mIMART Q==;
X-CSE-ConnectionGUID: 3uKW9eRASYyAjMIO7CcGOQ==
X-CSE-MsgGUID: uwiPJtIwTLG1UT/+BWLYBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2049985"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2049985"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:31:05 -0700
X-CSE-ConnectionGUID: 0UdjnzkMTnybs0T7S86kMg==
X-CSE-MsgGUID: Eu+jhTqjQH2LCqNsbvJ4qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5550431"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:31:05 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>
Cc: riana.tauro@intel.com, shekhar.chauhan@intel.com, harish.chegondi@intel.com
Subject: [PATCH v2 0/3] Cleanup OA stream on PCI unbind/remove
Date: Fri, 30 Oct 2026 15:30:57 -0700
Message-ID: <20261030223056.2266638-5-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (3):
  drm/xe/oa: Use the drm device address_space for the OA stream fd
  drm/xe/oa: Gate OA buffer mmap faults
  drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset

 drivers/gpu/drm/xe/xe_bo.c       |  30 +++-
 drivers/gpu/drm/xe/xe_bo.h       |   4 +
 drivers/gpu/drm/xe/xe_oa.c       | 285 ++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_oa_types.h |  12 ++
 4 files changed, 300 insertions(+), 31 deletions(-)

-- 
2.55.0

