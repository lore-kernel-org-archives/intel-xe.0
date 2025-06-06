Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367C7C677C4
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 16:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE03610EAF0;
	Fri,  6 Jun 2025 16:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EnOqgDMu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0F810EAEC
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749225783; x=1780761783;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KcD13/DyInWPVbWoxtbjzhOLiV8e6EjyywRv59bEMsM=;
 b=EnOqgDMu8KYdIF0WyxOfp0hJ9rvX/lp7H2SPmjkJsyr745V11qHLaYYJ
 GEE3lT56JC8W0PiJkyqB+x/JLLyRc7ygeFjdGf7LXaABZdpx2pOhMfoNL
 Ru584r+hPqq8GxdN3zANiKPHGov2qMnYuFtpdp5blhyBYULfmtTw+CXbm
 FsWtrdUQh9Z7aMt4vT/mVEgtFsgZ1mq4SJ4kbH7037yUt4DDYW57m8aFe
 pRYlP9NH8UawlWhz2vETq7rtSJp9U9B8SJeKsp3kjRMl5rYHORA57kRqk
 mIB0IifDL/LIQsb+NFMAYNHzygbHN4sIp4Vj6AJ5yQvPUVFIDD/ML0Bvr w==;
X-CSE-ConnectionGUID: emg5Mt8QQoKl2o7N0Cr7KQ==
X-CSE-MsgGUID: Vx2SsfdyQcC785lwu7Gdbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51526353"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51526353"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 09:03:02 -0700
X-CSE-ConnectionGUID: MzyHgt5yT0SVrYhc2l4maw==
X-CSE-MsgGUID: gmHKCeOBRUO3wkTHkuEhyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="145748885"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 09:03:02 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v4 0/5] Enable media OA
Date: Fri,  6 Jun 2025 09:02:48 -0700
Message-ID: <20250606160253.4054668-1-ashutosh.dixit@intel.com>
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

We had previously enabled render and compute OA units. Enable media OA
units with this series.

v4: Address code review
v3: Introduce DRM_XE_OA_UNIT_TYPE_OAM_SAG
v2: Added Patch 5

Ashutosh Dixit (5):
  drm/xe/oa/uapi: Expose media OA units
  drm/xe/oa: Print hwe to OA unit mapping
  drm/xe/oa: Introduce stream->oa_unit
  drm/xe/oa: Assign hwe for OAM_SAG
  drm/xe/oa: Enable OAM latency measurement

 drivers/gpu/drm/xe/regs/xe_oa_regs.h |   3 +
 drivers/gpu/drm/xe/xe_oa.c           | 213 ++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_oa_types.h     |   6 +
 include/uapi/drm/xe_drm.h            |   3 +
 4 files changed, 171 insertions(+), 54 deletions(-)

-- 
2.48.1

