Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DDACCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 09:12:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD0210E107;
	Wed, 15 Oct 2025 09:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b323OoFw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F256B10E107
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 09:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760519576; x=1792055576;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0ovbJQFiiHyQJQNk8XdPxVYnBT89JiFy/Zmy1feLM2M=;
 b=b323OoFwZBzfsyiXMlphbiSfuHzsCnRgq5ChWTVIgM7qhqqgbcCjK+KW
 IWVXaOD1Eoej6fweuKc9BwKnLomY/IAQo2wqHlySJE/12ynICOUevJt98
 tQ+i4RyhnMYYLb6q2gZd8ucnsmyZ2ea5epdstc5K0R6mts4EABaZBjthx
 knghVp39VZ5aUhcCIa8XEf1uEHRlhY163nf9Ahbd5Egyg53O3Hp+Rt/zw
 RufBJFXYKdx9AUfdSs3IflQ7ppwQSS/kOA0W0gPRn57JZLGgnOAvmpWL5
 TAhRn5srCu32XpgW1/58mMmrRw0EctZcr1ZrDMdtm8n19SvDy/5E+8SvU A==;
X-CSE-ConnectionGUID: 5XoJaQcZQGihsb8pHu6QZA==
X-CSE-MsgGUID: yC5tKYE5RWWEswfs9jnxgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66515807"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66515807"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 02:12:55 -0700
X-CSE-ConnectionGUID: GL8+Wu83QNaWPk37CWccIw==
X-CSE-MsgGUID: 0AydyEFeT7igHcZAd4zMOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="213065714"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 02:12:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/4] PF: Update auto-provisioning
Date: Wed, 15 Oct 2025 11:12:05 +0200
Message-ID: <20251015091211.592-1-michal.wajdeczko@intel.com>
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

This is a small preparation step before we introduce sysfs based
provisioning.

Michal Wajdeczko (4):
  drm/xe/pf: Promote VFs provisioning helpers
  drm/xe/pf: Automatically provision VFs only in auto-mode
  drm/xe/pf: Disable auto-provisioning if changed using debugfs
  drm/xe/pf: Allow to restore auto-provisioning mode

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |   7 +
 drivers/gpu/drm/xe/xe_pci_sriov.c             |  45 +----
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  63 +++++++
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h      |  11 ++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c    | 154 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h    |  31 ++++
 .../gpu/drm/xe/xe_sriov_pf_provision_types.h  |  36 ++++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |   4 +
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c |   3 +
 10 files changed, 314 insertions(+), 41 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_provision.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_provision.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h

-- 
2.47.1

