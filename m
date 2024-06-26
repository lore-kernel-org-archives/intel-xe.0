Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1CAC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 18:18:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFF710E056;
	Wed, 26 Jun 2024 18:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fCUN6R13";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6324610E056
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 18:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719425902; x=1750961902;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CD+pA+zRoKXrKhBTdX0kG7617j+5v2RjS37uaMoRp8A=;
 b=fCUN6R13gMe1OGuH1WH4DcMXV9jXNep3QLVTIepc4tZJ7UQYkv0thSv8
 U9uVdjWkFei6ROVbzaRUv8C4TrWL1irAwnm5FVeQz1I4fRzunYLg9fuAk
 ih0iIzBdvzmtgkr/rgbDqrC3cLpAWKq48XQeHrqWhkrPg8+gNaBZ2Q5Af
 P9aeM3jRMWHvd51q+BTF9Uutb5pUmkUcxPdCTmWYRBC/JTibqHkvWvi2q
 +h80totFepsO1CBv+wBVG8j3njMzZWFhIkTWr+ulmRj3MrJ0vBSMDm/CA
 iyqnIjKx/c6iPnXHr4xq3Qrcefvkdp4GmIdBlzc7NcVKaHVgxSOIU95pQ g==;
X-CSE-ConnectionGUID: hyNwWb7fREWrNojq0ngUEg==
X-CSE-MsgGUID: FopkOxc/RRWa9md85zCMvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19406447"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="19406447"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 11:18:21 -0700
X-CSE-ConnectionGUID: C2q9SbQqRU2sz2fKTLMzjQ==
X-CSE-MsgGUID: XcM55eblSNShkC+r7kYYwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="48539655"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 11:18:21 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] drm/xe/oa: Add NO_PREEMPT property
Date: Wed, 26 Jun 2024 11:18:15 -0700
Message-ID: <20240626181817.1516229-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Add DRM_XE_OA_PROPERTY_NO_PREEMPT property. This is intended to be Xe GuC
equivalent of i915 property DRM_I915_PERF_PROP_HOLD_PREEMPTION.

v2: Introduce no_preempt exec queue op
v3: Introduce set_no_preempt and clear_no_preempt exec queue op's
v4: Revert to v1, which doesn't add new exec queue op's
v5: Same as v4, except added 'uapi' to Patch 2/2 title
v6: Minor change to debug print in Patch 2/2 and add Jose's ack

Ashutosh Dixit (2):
  drm/xe/oa: Allow stream enable/disable functions to return error
  drm/xe/oa/uapi: Allow preemption to be disabled on the stream exec
    queue

 drivers/gpu/drm/xe/xe_oa.c       | 104 ++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_oa_types.h |   3 +
 include/uapi/drm/xe_drm.h        |   6 ++
 3 files changed, 98 insertions(+), 15 deletions(-)

-- 
2.41.0

