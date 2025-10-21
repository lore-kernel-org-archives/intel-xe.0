Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D34CCD1A5
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 22:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E826A10E65F;
	Tue, 21 Oct 2025 22:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3tenDqI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7F710E65F
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 22:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086765; x=1792622765;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rchlOtrbfJNpt1NifBq6jKv32QX45pH+j2bg5QDM2bw=;
 b=g3tenDqIqzkFQ+AQMvJTDNQQnqNQDMrcpiltTSchFHsSyacCLJiJJjAT
 paWf3c2c9wf+ruViWlWQL7kUZ33zAGFLVx+0rB56lXg5xzoump3sF8buN
 qKPiOYBCvCJPQPMX8YpQzY9nyigivocC4QZOwiI0gKRahS5OCdJGWfUdS
 fh+75R9ew2zfBgSes3T7W1dA6XlP+c3MDesfv4FllD36n86DKBROgMMBs
 Y5FxwmML58ZGwN53dXpVOILym6QsTEgmbBO15EINrqMs2xyTBCyIx+YKJ
 ONsby65EWy+k1hTQEaBAdSBpO3RW/q0oG0BWK+iL0/e+t1EdGjby0E25n g==;
X-CSE-ConnectionGUID: XO60gaaGRD+EcWXBIEVzeg==
X-CSE-MsgGUID: L6Jt9gmdQkeDSKjAB8npCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63128904"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63128904"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:46:04 -0700
X-CSE-ConnectionGUID: qUw2BEY9Tmy9d6qIzVJDaA==
X-CSE-MsgGUID: HDxbTUy1RPqla8S+8lpQwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="187982611"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:46:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/2] Xe3p_XPC Steering Updates
Date: Tue, 21 Oct 2025 15:45:54 -0700
Message-ID: <20251021224556.437970-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
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

A late-breaking spec update has changed some details related to MCR
register steering for PSMI register ranges, and has supplied missing
information related to L3BANK and NODE MCR register ranges.  Based on
the new spec details (and some offline discussion with the hardware
team), make the necessary adjustments to the driver's MCR code.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Matt Roper (2):
  drm/xe/xe3p_xpc: Treat all PSMI MCR ranges as "INSTANCE0"
  drm/xe/xe3p_xpc: Add MCR steering for NODE and L3BANK ranges

 drivers/gpu/drm/xe/xe_gt_mcr.c      | 36 ++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_gt_topology.c |  7 ++++++
 drivers/gpu/drm/xe/xe_gt_topology.h |  2 ++
 drivers/gpu/drm/xe/xe_gt_types.h    |  9 +-------
 4 files changed, 33 insertions(+), 21 deletions(-)

-- 
2.51.0

