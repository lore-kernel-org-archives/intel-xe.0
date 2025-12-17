Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12C1D6406A
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 01:39:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E3F10E9C9;
	Wed, 17 Dec 2025 01:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jHfhGWDm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E23010E9C9
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 01:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765935590; x=1797471590;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fct8wMmW93r+R8ZG+TpoXwXG/UM2kOJWLDzzDVq+zP8=;
 b=jHfhGWDmKRthycj2dX9/ELSyS3fG5Z5qjBGn1Pm9SyizwzSdPTkvQ9EN
 DesrChq/tudvUUUfkvGcx8X0qyYZtAq1BXBw1JrBE+QajEFF+Orfv6uy/
 +OY9FejS3e+iiumAwwIET0ATVH7bcZbxn9pR8FcLLgjjTo/VrWXkWBGtO
 dTWPu0KaZ54hXR+S+hz4vA7vrVf00t2I9qvvOMdD77+dSRmBVE4AbOjGQ
 j83eFFq/P0U5YkX4XM9wmRTO3MHHXBmbA9xfsvsqw+ZBvOSP2oOY11I5y
 CU5ePLN/vVVRpFRtwrkeCUYe4Asl7u4YcdQgFI0lt5M1ixzHmGiw57hFS Q==;
X-CSE-ConnectionGUID: HmqD3G54RP6BxecmSuDKgQ==
X-CSE-MsgGUID: 3pgCBsqUSGKcP6FukUQZiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67803943"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67803943"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 17:39:49 -0800
X-CSE-ConnectionGUID: O7GFFUxeRwukTdsRFZ21CA==
X-CSE-MsgGUID: cI1ik6WSSg++HqhwAx4Fmw==
X-ExtLoop1: 1
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by fmviesa003.fm.intel.com with ESMTP; 16 Dec 2025 17:39:48 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v2 0/2] drm/xe: drm/xe: Separate out GuC RC code
Date: Tue, 16 Dec 2025 17:37:00 -0800
Message-Id: <20251217013702.3597539-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

This allows us to independently toggle GuC RC feature.

v2: Address review comments (Michal W)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (2):
  drm/xe: Decouple GuC RC code from xe_guc_pc
  drm/xe: Add a wrapper for set/unset params

 drivers/gpu/drm/xe/Makefile    |   1 +
 drivers/gpu/drm/xe/xe_guc.c    |   5 ++
 drivers/gpu/drm/xe/xe_guc_pc.c |  95 ++++----------------
 drivers/gpu/drm/xe/xe_guc_pc.h |   3 +-
 drivers/gpu/drm/xe/xe_guc_rc.c | 159 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_rc.h |  23 +++++
 drivers/gpu/drm/xe/xe_oa.c     |   9 +-
 drivers/gpu/drm/xe/xe_uc.c     |   8 +-
 8 files changed, 219 insertions(+), 84 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h

-- 
2.38.1

