Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02212C47077
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 23:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B0E10E503;
	Tue,  9 Jan 2024 23:50:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E7A10E503
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 23:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704844228; x=1736380228;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JDvifT/yIOi5PWy2QJ7WrbM83qwLa98Pd23twkR52rA=;
 b=hYKxzEKCeans7R8FeeNv4LeY7iwinc58tTXP12qtDwPwB525tbmE2UsJ
 6EItSwAutaRSITuZXC2B27+3y/ITs1s8vi25B7JTbvDVDQ1PX9u5lOzDu
 YAORehJ2FTWwKhwEaqJkCDblkUyvc5mKg1Pdrsf8U8VHVX4hpmy6W3iLS
 WeGI/7/oG2OXppvOW58/Wpkpd9NwRXShv8S4zLe9E8jLZ2iKxuOYUymTJ
 FI/3xKEttLv15/0EW90ACAQg+gvnpVhUPJ9sKA/7hiJSS6Pd8n74BUVTL
 cVVQB7bEDwH94TwZ8ROTIlLLg4Mo9gqJ+n9knXUa3uAHgM7cUnwdh1Kk/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11845368"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="11845368"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 15:50:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="23742098"
Received: from pallavim-desk.iind.intel.com ([10.145.162.180])
 by orviesa002.jf.intel.com with ESMTP; 09 Jan 2024 15:50:26 -0800
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/xe: CLOS Based Cache Reservation support
Date: Wed, 10 Jan 2024 05:27:55 +0530
Message-Id: <20240109235758.1432987-1-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Xe API supports an optional extension for allowing Apps to reserve
portions of the GPU Caches for exclusive use. This allows the App
to separate latency/bandwidth sensitive workloads from all other
workloads.

PVC and XE2 expose control over each Cache through the Class of Service (CLOS)
feature. CLOS allows to define which portions of a cache may be
used for a given allocation through a set of Waymask controls grouped
into multiple sets.

For each CLOS set, and supported cache, there is a Waymask to configure
the Ways in that cache that may be used to cache memory requests for that
CLOS.

Clients must specify a PAT index in the same region mapped to previously
reserved CLOS level

TODO:
  - Need to add sysfs for setting limits
  - Need to handle BO host cache type

v2 (Brian)
 -  split into smaller patches
 -  Address review comments in xe_clos.c
 -  Change implementation of xe_pat_index_clos_check()

Pallavi Mishra (3):
  drm/xe/uapi: CLOS uapi support
  drm/xe: Introduce xe_clos.c
  drm/xe: Add CLOS specific initializations

 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_clos.c         | 264 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_clos.h         |  31 ++++
 drivers/gpu/drm/xe/xe_device.c       |  15 ++
 drivers/gpu/drm/xe/xe_device_types.h |  22 +++
 drivers/gpu/drm/xe/xe_pat.c          |  36 ++++
 drivers/gpu/drm/xe/xe_pat.h          |   9 +
 drivers/gpu/drm/xe/xe_pci.c          |   4 +
 drivers/gpu/drm/xe/xe_vm.c           |  12 ++
 include/uapi/drm/xe_drm.h            |  71 +++++++
 10 files changed, 465 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_clos.c
 create mode 100644 drivers/gpu/drm/xe/xe_clos.h

-- 
2.25.1

