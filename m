Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E53CCFA0D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 18:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68AF10E06D;
	Wed,  5 Nov 2025 18:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrXlOa3C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD52610E06D
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 18:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762367586; x=1793903586;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7RRRFrfe5bWl2n5WJz7R/GNm842OV1uewd1qDrmsnQw=;
 b=mrXlOa3CUMcAWOENNk8Xy6wX2rXw7feYfntHh5e5ZarjTMb1XMEgFlRD
 E4RNDPw7GZLJjbJs9twwrOIm6Y/0qyqWxKkL73iEcbmedxKQaRITeYBGZ
 vl/1zES/xidZnf4aj6ExlSKrtm7OkdDPRguP6kz2nR597RStojCPE/Znn
 aPaAJLBMpIeW8KIwpSBNwrIiF0g9xnoO5LY1vwmO3MMYTnO6XvD8+0+2V
 v9D8c9Hw2nz0LgomGv2mQIxG3MyzRvcF63kV+k/JnSm2e/htvjP5T6t58
 PyE9Uhi4dN1jy4X8siHZNo92GWWTSTSS4MbIwQDly/gEsF4KJ/uVtAinC Q==;
X-CSE-ConnectionGUID: GYW1HfoCS9SxGpbUzOFA6w==
X-CSE-MsgGUID: S/0Gz9T1Rf6ND7VjoQUBlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64591457"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="64591457"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 10:33:05 -0800
X-CSE-ConnectionGUID: 3xCyTEv5TlW9R+kOEe0qgQ==
X-CSE-MsgGUID: 3o/sC6+ORwStWch6tdfLTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="187477908"
Received: from mtripa2-mobl.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.252.236])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 10:33:04 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/3] PF: migration-friendly auto-provisioning
Date: Wed,  5 Nov 2025 19:32:49 +0100
Message-ID: <20251105183253.863-1-michal.wajdeczko@intel.com>
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

Instead of trying very hard to find the largest fair number of GuC
IDs that could be allocated for VFs on the current GT, pick some
smaller rounded down to power-of-two value that is more likely
to be provisioned in the same manner by the other PF instance.

 num VFs | num contexts | num doorbells
 --------+--------------+--------------
  63..32 | 1024         | 4
  31..16 | 2048         | 8
  15..8  | 4096         | 16
   7..4  | 8192         | 32
   3..2  | 16384        | 64
      1  | 32768        | 128  (regular PF)
      1  | 64512        | 240  (admin only PF)

Only if the above values can't be satisfied, fallback to estimated
largest available value.

Michal Wajdeczko (3):
  drm/xe/pf: Use migration-friendly context IDs auto-provisioning
  drm/xe/pf: Use migration-friendly doorbells auto-provisioning
  drm/xe/tests: Add KUnit tests for PF fair provisioning

 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    | 162 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  37 ++++
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h      |  11 ++
 3 files changed, 210 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c

-- 
2.47.1

