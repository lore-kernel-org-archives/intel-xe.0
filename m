Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1CCC30653
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 20:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3769110E2ED;
	Tue, 25 Jun 2024 20:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YAaGOr3B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7520610E008
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 20:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719346525; x=1750882525;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y5cSb5w/1BPihWQqfI8XKD9nxl31iv1ejY235UDaVOE=;
 b=YAaGOr3Buit2iFys4JzIhBITDnNr+OvbBIL+5gacniEwmc9jio6Ztnj5
 lIl4kjGGUIyscdYD8FXGX3+srXFbTqBeWTtBTDeP3MzwJH0+cDZJGmwBx
 zVe3s8ATl82+DBRa05RZm3AYFuiZe4ZvvJUZURyvvu1N2WBYOJ48vpJCT
 k+RwL8MmoNPxje8ARnD6CXH4qX64xo2GVnkI62Fk+IVLk+aUjCqNx6pMO
 WhmESCMwll+l9RIKc9rhk+hZy4zdphck4PS/Pnlw5+QrOPx8rMrj7PonI
 q4iWv69jY7GJwr4AR7z5HuweXJ8HhjGd/tqufX9VWFz62tEqC31jeOaDE Q==;
X-CSE-ConnectionGUID: BOFkGgXtS8GrfUE9WoPmHg==
X-CSE-MsgGUID: 8GXvLUSuSASwX7JHfGwkrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16535014"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="16535014"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 13:15:25 -0700
X-CSE-ConnectionGUID: EgnA6FKPQh6SnNWWbfkULw==
X-CSE-MsgGUID: ghQ94/pcRXO1TcALm90HgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43855729"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 13:15:24 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jose Souza <jose.souza@intel.com>
Subject: [PATCH 0/3] drm/xe/oa: Add NO_PREEMPT property
Date: Tue, 25 Jun 2024 13:15:15 -0700
Message-ID: <20240625201518.766925-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Add DRM_XE_OA_PROPERTY_NO_PREEMPT property. This is intended to be Xe GuC
equivalent of i915 property DRM_I915_PERF_PROP_HOLD_PREEMPTION.

v2: Introduce no_preempt exec queue op
v3: Introduce set_no_preempt and clear_no_preempt exec queue op's

Ashutosh Dixit (3):
  drm/xe/oa: Allow stream enable/disable functions to return error
  drm/xe: Exec queue op's to enable/disable preemption and timeslicing
  drm/xe/oa: Allow preemption to be disabled on the stream exec queue

 drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 ++
 drivers/gpu/drm/xe/xe_execlist.c         | 14 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 45 ++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.c               | 67 ++++++++++++++++++------
 drivers/gpu/drm/xe/xe_oa_types.h         |  3 ++
 include/uapi/drm/xe_drm.h                |  6 +++
 6 files changed, 124 insertions(+), 15 deletions(-)

-- 
2.41.0

