Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D591DC369D1
	for <intel-xe@archiver.kernel.org>; Sat, 26 Apr 2025 00:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DB610E0C0;
	Sat, 26 Apr 2025 00:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OpskOYys";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A7110E0C0
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Apr 2025 00:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745627395; x=1777163395;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+kVncf42AP/CFPnmd8+Eu0h2KtXnEWMG+lkllhniMy0=;
 b=OpskOYysWgxTrqQNbaMiC0l8kLXe4bOcp1vqrrkMqC87I1oxTyUvuxcq
 vhI6ZjYjwXS14daqcB7FN5mB3t76kUdSo4b6v0YHz0LvaKmGEJGLUF9NB
 zSrdpyvq72a6c7WPppgkRrRYpph1zd+Pmvta+ViMSZBBmc6aq8Vuj1Np2
 3vWJvaKhL7WklCxN2/4dE2RLdyiGogr4x34fgm9UKmyjl/PCiDbpC6/Ub
 K4ea9RQ8EZ9+gGRwct1F24MneTWXxEIGlW5Xf8KpQ9dCM9xXGAbemjjx2
 /U+upTlLqxjnlFNdFkMhADv1CWrVE8iWvY+W4bbgfS3VdNFXjvudLztee A==;
X-CSE-ConnectionGUID: EL4pHtokSACPJSmDoCE/uA==
X-CSE-MsgGUID: XhoCLhtqSTqCyDfytb+n/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="46532992"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="46532992"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 17:29:54 -0700
X-CSE-ConnectionGUID: fJXbuimnQjeT3K7HEZ2knA==
X-CSE-MsgGUID: DtEJ2i63RCaR/np5W2aeLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="138134877"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 17:29:54 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 matthew.brost@intel.com
Cc: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 0/3] Support active context utilization
Date: Fri, 25 Apr 2025 17:29:48 -0700
Message-ID: <20250426002951.1795492-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add support for active context utilization using WA BB.

v2: (Matt)
- Fix breakage in TDR due to this feature.
- Other review comments

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (3):
  drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC value
  drm/xe: Save the gt pointer in lrc and drop the tile
  drm/xe: Add WA BB to capture active context utilization

 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   4 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   4 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   1 +
 drivers/gpu/drm/xe/xe_lrc.c                   | 171 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_lrc_types.h             |   7 +-
 drivers/gpu/drm/xe/xe_ring_ops.c              |   7 +-
 6 files changed, 183 insertions(+), 11 deletions(-)

-- 
2.43.0

