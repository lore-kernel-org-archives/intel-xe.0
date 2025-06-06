Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A3FC61DB8
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 19:26:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571C110EBF0;
	Fri,  6 Jun 2025 19:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZdZGQ5pU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C34C10EBE3
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 19:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749237981; x=1780773981;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AF7hLL4c6lms5OmuXKvNWobbNOSv7xmI6kMfND9fWMc=;
 b=ZdZGQ5pUnyLmDOf4HRTH49xlrq2zaBLBf8OGdkLUrDQAyZT8QQP/gHXu
 l0tWLbXxGkT4o9o2yCLXCzBFNXv3y5tWoTwz/Uv50uMKovsP2qR3GmQFx
 JqbOssjTgshfP4zXKMaPzVTKfxf8qKF6CjKAINf04FL68sTPh8oL9JkEU
 KjcFBTDWeywxHKlQKLSuXVZxNgFQK69EwEPyxVOc2Htk4vxCW8ocs8TKM
 oxKdYJbr3lE9hTMwhWbxSWUbYE18gWQFbl4VJeMYLsr01MxYJF0Yjnd4e
 UrdjrfzM50+Kjd8KhjoDyk6tULCby12nyoSZ7UFPwKCf8dm3h4K4rQJpe w==;
X-CSE-ConnectionGUID: TxAkPgg8StakfKNqNMl4Og==
X-CSE-MsgGUID: tmIo+ubpSsiKWPQQKrxxrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="61663142"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="61663142"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 12:26:21 -0700
X-CSE-ConnectionGUID: RKUir8kLTLi7Q8u1rKpfmg==
X-CSE-MsgGUID: dRG+5yn1RGGv/7k7Oa+yaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="150742748"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 12:26:21 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/5] Enable media OA
Date: Fri,  6 Jun 2025 12:26:12 -0700
Message-ID: <20250606192618.4133817-1-ashutosh.dixit@intel.com>
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

v5: Added DRM_XE_OA_CAPS_OAM
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
 drivers/gpu/drm/xe/xe_query.c        |   4 +-
 include/uapi/drm/xe_drm.h            |   4 +
 5 files changed, 174 insertions(+), 56 deletions(-)

-- 
2.48.1

