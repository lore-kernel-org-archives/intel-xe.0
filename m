Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CE8C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 09:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41FB10E966;
	Tue, 21 May 2024 09:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0XiDPx1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA2710E966
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 09:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716283539; x=1747819539;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MI0rDE3jI+K6kCdVHXfm2gblVYvdfTedXt3StgMYDJY=;
 b=O0XiDPx1K5PfeprDWEbTUtp4ESKlCE3kKemn2n2AypBFt+C3ylSpvfl9
 R+ETbbdzVE03jLOz1ffEmB9wV7eCm/SteCAM2OLp/LOHnEhIa9lkipJgx
 /uyg2ukxxvP7FTnxXalwWZZ+saXNjnkYHjzrrhpWo6mwaThO32n8rjbLT
 AFrOvt1aikT/+yG/oct5KpdEN7aHLRXtXpM6ISWxD95ccaQBAP4vLVHXe
 LV/FzA0GhVZTAMb+WCldRP9m0aqLKdfsN1RxbYFuzwTcc8I/ulLnX2T6Q
 hDIRcnCJQJPHDletBlN47VWtQTrQSMj/gqaIajtqSO2YiQV6VfPB4e5XO g==;
X-CSE-ConnectionGUID: /w9HuFq7TRyDUDCxPoqRGQ==
X-CSE-MsgGUID: Ghwm0e7BR3m60HgeUoMysQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12310791"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="12310791"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:25:39 -0700
X-CSE-ConnectionGUID: 0Qs82sAWS7eod3yancLGNQ==
X-CSE-MsgGUID: LI+6X51LQ6O2fPuyoH4g8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="32758148"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.128])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:25:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 0/2] Custom GuC initialization if VF
Date: Tue, 21 May 2024 11:25:16 +0200
Message-Id: <20240521092518.624-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

v1: https://patchwork.freedesktop.org/series/133832/#rev1
v2: add kernel-doc for xe_guc_submit_init (Himal)
    only assert guc.major version (John)

Michal Wajdeczko (2):
  drm/xe/guc: Allow to initialize submission with limited set of IDs
  drm/xe/vf: Custom GuC initialization if VF

 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 17 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  2 ++
 drivers/gpu/drm/xe/xe_guc.c         | 42 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_submit.c  | 17 ++++++++++--
 drivers/gpu/drm/xe/xe_guc_submit.h  |  2 +-
 5 files changed, 76 insertions(+), 4 deletions(-)

-- 
2.43.0

