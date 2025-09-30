Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07407CCA470
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 23:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B558310E2E0;
	Tue, 30 Sep 2025 23:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ec72amYb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF9310E2E0
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 23:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759275335; x=1790811335;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vSgGHmU2y42GcdB2qo0BE24q1ZEbVsSiLA3/6cYfS30=;
 b=ec72amYbgZG1EL3ISsYwbWbUAwXclWVjOpSLpQ/U/aN6sR7Hx1PzNES7
 MWFdpK89UbSddUZKw1kU6Ec6pOH5KCJ6ei0zcoyUrHMwXTnpbkGq7qNvw
 ZgfW28PzYlihqJh51jzxi3diWzpRSvjpmoyNnnBHaJJQyWv81qVa3Eavt
 bfqsK4NamDBPaaqHWR4n3AwWNjmKqyewQLi8CYO6CUw9mDAFk6mgd47vm
 ictT3MJyy01MgKJ3aKlF5YgNOCpArSgdq0DqALI4i2vot15uKNms1fzPR
 kUUSYov5SaecCBGX0KmBp7y3cuBmiOrDbKL1XSNYD3Cdl2uG2fITdFESU w==;
X-CSE-ConnectionGUID: 8e+opfU3Qautm3Sy0C0/Ng==
X-CSE-MsgGUID: USV96S0yShyzDlaAPQZgcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72646722"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="72646722"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 16:35:35 -0700
X-CSE-ConnectionGUID: VU99p9uIR5aIdON5PvbfZg==
X-CSE-MsgGUID: D5+LQqM3QcOO8c0ru6knKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="177775496"
Received: from krychlik-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.173])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 16:35:34 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/6] More PF improvements
Date: Wed,  1 Oct 2025 01:35:18 +0200
Message-ID: <20250930233525.201263-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Michal Wajdeczko (6):
  drm/xe/pf: Add top level functions to control VFs
  drm/xe/pf: Log only top level VF state changes
  drm/xe/pf: Expose VF control operations over debugfs
  drm/xe/pf: Unify VF state tracking log
  drm/xe/pf: Split VF FLR processing function
  drm/xe/pf: Synchronize VF FLR between all GTs

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 102 ++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   2 +
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |   2 +
 drivers/gpu/drm/xe/xe_pci_sriov.c             |   8 +-
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      | 151 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h      |  17 ++
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  93 +++++++++++
 8 files changed, 360 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_control.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_control.h

-- 
2.47.1

