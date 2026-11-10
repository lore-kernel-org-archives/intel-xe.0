Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B0E606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 23:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KG563GuP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9C810E9A6;
	Tue, 10 Nov 2026 23:23:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C8610E9A6
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 23:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794353023; x=1825889023;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KMVefr9E7xzlqqrUan2zbTjL2l2WJb7FXpmAtVzU1A8=;
 b=KG563GuPnteKkOTJ8Zkhv4vlD5LxvKOXvjTEQkVZbUMkn4qfZrcP4mXT
 DMIe0sOynGRKjqUsbonxXYvDAZharCRl6yZJcjV9t1qsTqQbHAZdWw/mo
 wcuadprO/9Gn0A+v/dIpfo/V2GxNHVZmRfv0XDFVhLqIECfhs/7YIkBlP
 aFHafJDLzx6rMMxLRFT1YSiynNd7jt/u8M8pJ8ML9BfH7GtgV4j9uttrA
 4orRE5j2u//ov2i5xn+rLmIzxN/WMcVIyyslT83wPB8ujpyJe4yZc60Dy
 +O62Lh9E3dAKKP9A+0leUf0aELDucGAwSPqDOg3cLQL0pKtgdpTb6vtnY w==;
X-CSE-ConnectionGUID: WeRAOSoRSsK4cyjaIFYUfw==
X-CSE-MsgGUID: GyW3g4MFSGmHW5T7PL0A3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3118733"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3118733"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:23:42 -0800
X-CSE-ConnectionGUID: oZRuXgL3QQii3rJApac8JQ==
X-CSE-MsgGUID: iSEKH7C3SEOb/Tzx+zny7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8271665"
Received: from cyp07.fm.intel.com (HELO pallavi-cyp07.fm.intel.com)
 ([10.36.54.237])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:23:42 -0800
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: gustavo.sousa@intel.com
Subject: [PATCH v4 0/2] drm/xe: Store GMD_ID subunit during GT init
Date: Tue, 10 Nov 2026 15:23:26 -0800
Message-ID: <20261110232328.842758-1-pallavi.mishra@intel.com>
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

Replace the separate GMD_ID and subunit fields with struct xe_gmdid,
then initialize that struct from the value already read during probe.

This is v4 of:

https://patchwork.freedesktop.org/series/176997/

v2:
- Store GMD_ID in struct xe_gmdid instead of a u32 plus a separate subip field.(Gustavo)
- Initialize the struct from xe_probed_info in xe_info_init() instead of reading GMD_ID again during GT init.(Gustavo)

v3:
- Rebase.

v4:
- Rebase.

Pallavi Mishra (2):
  drm/xe: Store GMD_ID as a struct
  drm/xe: Initialize GT GMD_ID from probed info

 drivers/gpu/drm/xe/xe_device.c   |  6 ++--
 drivers/gpu/drm/xe/xe_gt.c       |  6 ----
 drivers/gpu/drm/xe/xe_gt_types.h | 17 +++++++++--
 drivers/gpu/drm/xe/xe_guc.c      | 12 ++++----
 drivers/gpu/drm/xe/xe_pci.c      | 50 +++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_query.c    | 11 ++++---
 6 files changed, 68 insertions(+), 34 deletions(-)


base-commit: a6a3cf6cc0759788b1b0ce63f9cfd855d5785449
-- 
2.43.0

