Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55E5D374A3
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 21:26:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C4010EA83;
	Fri,  5 Dec 2025 21:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gd3lcTjQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C4810EA83
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 21:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764969981; x=1796505981;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HP8E6YQ87nZI4DmOzjgesFy9Ou6QOQQmOC+33AiwgHQ=;
 b=gd3lcTjQeomXP2OwcQPmpksvAtNRkI2RFqWW3TPgqjGOyxxiPuKuxflV
 eT5ckkmnWaLwtTaKGt6OUhGjWPatAZmmGcK06a7krEzRQ8wP0eaL6oxCr
 ji6CApUdwk3JlBdf5YiTEQC1UU1m3vj2hRFU297Na6FVLqGTakQqC1rpG
 6NkvzThMbpIxrjdDHqPxrd3jxUwUioIshDUMEHCEY4toEm/xHDQcelw+A
 /v2+yCZSPiPDSJyip4/+QR+bZeVrfqGGUgWP23vgb/yWVESKgfics3CJF
 eay5s7EiuyF7+0wph1p4ohZrst25cXaoHhEkTrfKw+N8ehsDCVXIRXyUn g==;
X-CSE-ConnectionGUID: y2Jiw50FTI6T7X2Z2bXncQ==
X-CSE-MsgGUID: CZ6g8HlmQcW2VtzvTYfskg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66893792"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="66893792"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 13:26:20 -0800
X-CSE-ConnectionGUID: HfBiHiMqQs2bV6GoHVoM0A==
X-CSE-MsgGUID: ajuGIgidT+O8DwMmfGtLpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195202134"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 13:26:20 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 0/3] drm/xe/oa: Expose MERT OA unit
Date: Fri,  5 Dec 2025 13:26:10 -0800
Message-ID: <20251205212613.826224-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

Ashutosh Dixit (3):
  drm/xe/oa/uapi: Expose MERT OA unit
  drm/xe/rtp: Whitelist OAMERT MMIO trigger registers
  drm/xe/oa: Always set OAG_OAGLBCTXCTRL_COUNTER_RESUME

 drivers/gpu/drm/xe/regs/xe_oa_regs.h  |  9 ++++++
 drivers/gpu/drm/xe/xe_oa.c            | 44 +++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 19 ++++++++++++
 include/uapi/drm/xe_drm.h             |  3 ++
 4 files changed, 69 insertions(+), 6 deletions(-)

-- 
2.48.1

