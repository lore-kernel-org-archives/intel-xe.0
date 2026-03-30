Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B3F10D14AC
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 13:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C97B10E766;
	Mon, 30 Mar 2026 13:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HvLHbDyq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5213E10E765;
 Mon, 30 Mar 2026 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774875765; x=1806411765;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GizUeGuhOI6xqg7Gi5GFQac9an3uswH4AB9nvvujSkM=;
 b=HvLHbDyqZUPGcp9G2RmXfBTO7EkUhHNQzmFWqUWQOuUzQSVILco0Ua0W
 Az5nF9W9lQNKl4pTW6mjh93gESr6a1x60wLfOFPF0fb7Gx2myGzeMbxNH
 KfGk3ykMJagC+gHzBwGOxWHrWxLKj3EPN+2Ti1JMarf+sDQKrxVTu/Zm8
 amO5bQKTV79jkNrcse+E87/g6+Ofd/X7lcaBbRKnp6fFFulFVht/hrWXw
 rxdsnQCihI60V8RHAJFRIs6NyY8CV/b3ZlGxZsIWjCqLZsY+GCO3hpD3j
 Oo7Ng0ueVV0sQdFxzRoV0DTdn0xASQZv/vpXm/QxaAJKoo1EKRFOo/jzI w==;
X-CSE-ConnectionGUID: UQaJvIKNSlCKmPszM+HQuA==
X-CSE-MsgGUID: KmGY9/foSnmmiuWV6UZvWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="78462862"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="78462862"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 06:02:44 -0700
X-CSE-ConnectionGUID: O7VNdxBgSyCNn3lUdpfmEw==
X-CSE-MsgGUID: z0+omlpkRQCGcB8hFius/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="263988591"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 06:02:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/3] drm/{i915,xe}: finish switching to common step.h header
Date: Mon, 30 Mar 2026 16:02:33 +0300
Message-ID: <cover.1774875688.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

The remaining ones from the step.h conversion which were pending some
merges and backmerges.

Jani Nikula (3):
  drm/xe/step: switch to the shared step definitions with i915
  drm/xe/step: switch from enum xe_step to intel_step naming
  drm/i915/display: switch to including common step file directly

 drivers/gpu/drm/i915/display/intel_cdclk.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +-
 .../drm/i915/display/intel_display_device.c   |  2 +-
 .../drm/i915/display/intel_display_power.c    |  2 +-
 .../gpu/drm/i915/display/intel_display_wa.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  2 +-
 drivers/gpu/drm/i915/display/intel_fbc.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_flipq.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c |  2 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |  2 +-
 .../drm/i915/display/skl_universal_plane.c    |  2 +-
 .../drm/xe/compat-i915-headers/intel_step.h   | 13 ----
 drivers/gpu/drm/xe/tests/xe_pci.c             |  4 +-
 drivers/gpu/drm/xe/xe_step.c                  |  2 +-
 drivers/gpu/drm/xe/xe_step.h                  |  4 +-
 drivers/gpu/drm/xe/xe_step_types.h            | 61 +------------------
 18 files changed, 20 insertions(+), 90 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_step.h

-- 
2.47.3

