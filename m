Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D21C47DA9
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 18:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF7D10EE48;
	Tue, 30 Jan 2024 18:57:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EBE10EE72
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 18:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706641069; x=1738177069;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kgk3NtfzPix13yNVRltfCrnrfiOS6OFhCL5mbE3Aqqw=;
 b=h7gJn8W0ZR4JWrE24bg2tpEWFBE/1hBX/QhVmb8iGxH0Qm98D5mGMeNZ
 Wg18kgzlBijSZIlNCVpV/2NUqP9FHsQEpu0q3H4WFwNcp/5m4Mkdvfcel
 Mr5ILkMEdA3YWySxHyb4RkneK2G0s8OPWfha66WEqr+wcl8adDVXcFKLX
 z1+eSHOTrT92MEe8ah9pB8MWLFhxP+icZe4vKQARV9uvf1zDaxhDCQKnp
 /yKlhVILa5+vayhcqP/VbGzhmv/gkAV7WFV9tZhRnTm78UHv6rgcaPJbF
 jicm1BVOWQ3wl98K2IAR40SB2G9XM0Xnd0A5QecrQla7unWPp8lVeIdCu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3219791"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3219791"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 10:57:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3892518"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa004.jf.intel.com with ESMTP; 30 Jan 2024 10:57:49 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 0/1] drm/xe: Expose number of dss per group and helpers
Date: Tue, 30 Jan 2024 10:57:43 -0800
Message-Id: <20240130185744.209647-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Matt Roper <matthew.d.roper@intel.com>, Souza@freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Expose helper for dss per group. This is a precursor patch to allow
for easier iteration through MCR registers and other per-DSS uses.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Souza, Jose <jose.souza@intel.com>

Changes from prior revs:
v4: Revert function name with mcr back
v3: Rename functions with mcr removed
v2: Resend with cover letter

Zhanjun Dong (1):
  drm/xe: Expose number of dss per group and helpers

 drivers/gpu/drm/xe/xe_gt_mcr.c      | 40 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_mcr.h      | 17 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_topology.c |  1 -
 drivers/gpu/drm/xe/xe_gt_types.h    |  1 +
 4 files changed, 57 insertions(+), 2 deletions(-)

-- 
2.34.1

