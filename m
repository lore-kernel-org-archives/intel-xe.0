Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE2BEE4980
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 09:08:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D267C10E8C1;
	Wed, 11 Sep 2024 09:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VGKFree0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F1C10E818;
 Wed, 11 Sep 2024 09:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726045727; x=1757581727;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8o6JncxlIqWQ9ojWDoh3IYf0amL63o0g8XjcUZaGDLo=;
 b=VGKFree0bD9OIIGI7Rqmut8y4GYglpZVB4WjKnxon90tbgkdwo4p9fBt
 GbcB4bMHPuumImchn5wUrym0a5yOBZ0h4iqciFlqMncXMkIeY+MO1oVnZ
 9xTv/2k0qQBpUv2qOTcJhm6FT1WtII5KE7/6Wb15ejqEq8cTf3dqmL6rM
 ZOllh8dYbmGOQOVIqWXZhWHqrO3427VNIEhs1/i1gwy+btvL/ltm+mqPi
 7ZlIjvEv1UM+agVXHiI/6RQfPYeV4TGCYMFGGuOv8x/adVVS14e6Hvj3I
 jPVsLJUHGT5G0tDZ4bMWXAiQGey2mEtnHfZlN5JJO3zQp4KLpZGx4LhgZ g==;
X-CSE-ConnectionGUID: elRpwyM3SUGH/1CcqGz/uw==
X-CSE-MsgGUID: sek7IZaXQCGppVQR3XTjeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="50245710"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="50245710"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 02:08:46 -0700
X-CSE-ConnectionGUID: iZ8YmxXEQQ2UlzuveOYqAw==
X-CSE-MsgGUID: VBWB/NoCQdSVJ8pd+5oV4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="67253306"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orviesa009.jf.intel.com with ESMTP; 11 Sep 2024 02:08:45 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, ankit.k.nautiyal@intel.com, jani.nikula@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 0/2] HDCP intel_display refactors
Date: Wed, 11 Sep 2024 14:35:38 +0530
Message-ID: <20240911090540.643155-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
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

Refactors related to intel_hdcp/xe_hdcp in which we replace
drm_i915_private usage with intel_display wherever possible for
the ongoing efforts to try use intel_display structure more.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (2):
  drm/i915/hdcp: Move to using intel_display in intel_hdcp
  drm/i915/hdcp: Use intel_display in hdcp_gsc

 drivers/gpu/drm/i915/display/intel_hdcp.c     | 689 +++++++++---------
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c |  40 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h |   9 +-
 .../drm/i915/display/intel_hdcp_gsc_message.c |  44 +-
 .../drm/i915/display/intel_hdcp_gsc_message.h |   3 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      |  44 +-
 6 files changed, 422 insertions(+), 407 deletions(-)

-- 
2.43.2

