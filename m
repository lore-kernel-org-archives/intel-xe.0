Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE74CD98CE
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 20:34:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C85010E66C;
	Mon, 15 Jun 2026 20:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aunuM3Wr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E0310E66C;
 Mon, 15 Jun 2026 20:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781555649; x=1813091649;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ajUm+NiL0ekiFLT1H5CJpRQUvuW2JdszuCXi7sh/WtU=;
 b=aunuM3WrGm20FBYAFLjZ8RHI7mo30N8e98gykLXG4cZE2sR290Sa3LG2
 HN7BWmYj6iiSt4imivKw7l81a23kP3RicfTqc/5/RqJBVkITVRJ+2jkTH
 oQiaVbTxTEFoFQiKe0xNwn+HxlOpurakPChNNPiYzj3PSwvAcnoTQdTfT
 W7mDZRDD8OfXey256ycSEQ/0kE14pm/D8wfcEqjGnVUaoguN5NNFqFpys
 57Kd8Py5IwnXneubyRMqAFVxwgh5atZedhe3OPzDzVj5mwRiEjC6fUQ2m
 x6xly688r3fVtpC2r2fcSH2to3WV+ljnSdPyOpg9lS+D8gbKPdCY1sBR6 g==;
X-CSE-ConnectionGUID: coYriyo5RKaVn+1bw0GK4w==
X-CSE-MsgGUID: MAm4VAZ0RFqOLiUf7f03fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93694558"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="93694558"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 13:34:08 -0700
X-CSE-ConnectionGUID: 2x/i28pMSnitAVG4IEmIYw==
X-CSE-MsgGUID: AY4AoYDITumj3zonCggw2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="252538403"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.246])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 13:34:06 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH v3 0/7] drm/i915/display: reduce the pm demand peak bw based
 on display data rate
Date: Mon, 15 Jun 2026 23:33:48 +0300
Message-ID: <20260615203355.218578-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

In xe3+, soc can lower the fabric frequency when the display
needs less bandwidth than the minimum GV point. Also some cleanups
in intel_bw.c

v1: pmdemand peak bw is updated to 20GB/s is the required data rate
    is low and less than 20GB/s even though there are no QGV point
    with 20GB/s. Only the peak_ww is changed based on the conditions 

v2: At the time of BW info calculations, a new row is inserted with
    peakbw as 20GB/s and deratebw also to 20GB/s and the required
    pmdemand peakbw is automatically calculated based on the old
    logic.

v3: change in the logic after Ville's refactoring of the intel_bw
    code. An extra QGV point for this low peakbw threshold is added
    Some cleanup patches from the v2 are dropped.

Vinod Govindapillai (7):
  drm/i915/wm: clear the plane ddb_y entries on plane disable
  drm/i915/pm_demand: introduce HAS_PMDEMAND macro
  drm/i915/display: sagv pre/post plane calls to check pmdemand support
  drm/i915/bw: Extract icl_init_qgv_info()
  drm/i915/bw: extract update_sagv_status()
  drm/i915/bw: avoid replicating the update_sagv_status() calls
  drm/i915/bw: introduce the peak bandwidth threshold

 drivers/gpu/drm/i915/display/intel_bw.c       | 94 +++++++++++++------
 .../drm/i915/display/intel_display_device.h   |  2 +
 .../gpu/drm/i915/display/intel_display_irq.c  |  2 +-
 .../drm/i915/display/intel_display_power.c    |  4 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c | 12 +--
 drivers/gpu/drm/i915/display/skl_watermark.c  |  8 +-
 6 files changed, 83 insertions(+), 39 deletions(-)

-- 
2.43.0

