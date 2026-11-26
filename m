Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E451606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 21:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KiuF6J3b
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1180F10E9F4;
	Thu, 26 Nov 2026 21:27:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E4A10E9F4;
 Thu, 26 Nov 2026 21:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795728455; x=1827264455;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uGXDRoRgzxQ3H1yhwV3YBcIsgUNCFdU5ZamWz7Jz0K8=;
 b=KiuF6J3bmN3c+GfxTiKWRdDCAa6lCKXLpujPkC4YGj+BW8Hv3XblfVX6
 lkxWr/GT/oCRqsXfPHxEee8DIY9u2deRYAj5tU+xDb8RNNjAOFAfEtd71
 uiPJcZLcp+eWIWjGDEo+9jIqcReWqhxjIMrWtI1mGNgAH/BiXMaFU2l4t
 6CQ3b4erV0uyi2FiJy+/YCe+BrhOsmppuYu0m0PkNrn17rOiI4PzTKVoz
 qe/DYa4Iw5aFArrzfzgSa4Uz/fqh+S5EhdHz/c7SKIlswAx9EtpGfEUQH
 9FJcW+N0tix/64sX79C2rBeN54ogNHZay6Tw5V9lN8EJpPZF+tAyEWkKs w==;
X-CSE-ConnectionGUID: dAEcw+UASeKab6fTcwbQ5A==
X-CSE-MsgGUID: bYAY94EGRwS/+pbfUEpF2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4531790"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4531790"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 13:27:34 -0800
X-CSE-ConnectionGUID: +6CQWNKoSaGroYUGSfbhGQ==
X-CSE-MsgGUID: oUgN/DOIROi1x8ISvYF6GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12037771"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.221])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 13:27:32 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/7] drm/i915/de: Nuke uncore
Date: Thu, 26 Nov 2026 23:27:21 +0200
Message-ID: <20261126212728.9034-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Eliminate uncore from intel_de.c:
- add a display specific intel_reg_rw tracepoint
- implement mmio via raw readl()/writel()/etc
- add a new parent interface to get the pointer to the
  memory mapped registers

Ville Syrjälä (7):
  drm/i915/de: Move the register tracepoint to display
  drm/i915/de: Pimp the intel_reg_rw tracepoint printf format
  drm/i915/de: Convert intel_de_read_fw() into a vfunc
  drm/i915/de: Use raw readl()/writel()/etc for register access in
    display
  drm/i915/de: Add intel_parent_mmio_regs() interface
  drm/xe: Nuke the compat uncore stuff
  drm/i915/de: Document intel_de_write8()'s usage restrictions

 drivers/gpu/drm/i915/display/intel_de.c       | 119 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_de.h       |   6 +-
 .../gpu/drm/i915/display/intel_display_core.h |   3 +-
 .../drm/i915/display/intel_display_trace.h    |  25 ++++
 drivers/gpu/drm/i915/display/intel_parent.c   |   5 +
 drivers/gpu/drm/i915/display/intel_parent.h   |   1 +
 drivers/gpu/drm/i915/i915_driver.c            |   6 +
 .../drm/xe/compat-i915-headers/intel_uncore.h |  66 ----------
 drivers/gpu/drm/xe/display/xe_display.c       |  11 +-
 drivers/gpu/drm/xe/xe_device_types.h          |  13 --
 include/drm/intel/display_parent_interface.h  |   3 +
 11 files changed, 151 insertions(+), 107 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h

-- 
2.56.1

