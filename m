Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727E9D30CF4
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 00:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A24A10E570;
	Wed, 14 Jan 2026 00:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CeTDL0W+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD3210E37F
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 00:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768349075; x=1799885075;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SyYV+uMNX2vPGZfvND4H3WhfQFdohHT2+Z0xW/YN6c0=;
 b=CeTDL0W++02UKyh2h2u8JC1/lKtYFxLwSetAXfy6+6R1afPLrHRtTJbY
 URM7R1sGWxAsuGmrduzOq+QVv4T2FrwrMfMf2jRyNLnqyuUVF/7e7evYE
 YrESBVATHkq8O0iOe6klMCjP/4CrHHh9TaICqGL6a/xeTHO9i8fE/1uzq
 DqgpOd2CMGFHp5tA4aA49niTety0eCE/746Nb4WkNZQdEX6o7SDuTUPkz
 zW0ybMhBvLaaqJoR4oNKLS98hiZXg22kUjDePsf38J9FGET/5CxsNA8Ro
 MlFhqhQL8Mk3AH/SSBBP/a1q/fEU0LJ4Xq3p2sf/90T1d7XA0zv9wrfTm g==;
X-CSE-ConnectionGUID: bG8dQWBMRK2MRK/0ve2t7A==
X-CSE-MsgGUID: 7xMHEY0kSaeWrFYrXmEz6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="81010594"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="81010594"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 16:04:34 -0800
X-CSE-ConnectionGUID: MWlDtGyPSmCQLZpmwtbRMQ==
X-CSE-MsgGUID: W5FwKeftQ7uBlTut8bJE8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="203740092"
Received: from dut4344arlh.fm.intel.com ([10.105.10.86])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 16:04:34 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, intel-xe@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 0/2] Add feature to force ring-based TLB invalidations
Date: Wed, 14 Jan 2026 00:04:19 +0000
Message-Id: <20260114000421.331082-1-stuart.summers@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add the feature flag for testing. Enable it for Xe2 for now
to get CI results.

Stuart Summers (2):
  drm/xe: Add feature to force ring-based TLB invalidations
  drm/xe: Enable ring based TLB invalidation for CI

 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 2 ++
 drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
 drivers/gpu/drm/xe/xe_sched_job.c    | 7 +++++--
 drivers/gpu/drm/xe/xe_vm.c           | 3 +++
 5 files changed, 13 insertions(+), 2 deletions(-)

-- 
2.34.1

