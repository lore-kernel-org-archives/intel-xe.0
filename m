Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28533C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 17:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D212110E47F;
	Mon, 24 Feb 2025 17:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iw49oIxP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8148610E47F
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 17:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740416408; x=1771952408;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kJqzFbz5qvwnsuJ3pFfLy8ri2/7wCNoy/6ols9ylQrU=;
 b=iw49oIxPDK0qDMNbnfMzT8Pb8p47S+c8+pZa5U27aByywhNWuMllzTSg
 4dVALIBe6BNPl1DUscA1twwevvUaoRauTu3DL7flMDN4uqV4C3T+jJMCQ
 dABfhs01E6TtG8Q/49fML+vvbdI5y9BfIkyJNviumaSWyWlbU+hwLBrxo
 byIMqv+d6jBBSWGqeBhrKNO3KAGTCOHqbNvh3gzKm0G1M87+Z6mCZLpod
 Ha6BOFza8R0HKEZ5qUWb0m1nblyGLIUQwivECHDM8gCJVW7d6YIXLGtgy
 jAHXCEeGIDK0VgW29Jnhpf8i+KF+mpQ1J8t6RBNW5UJAWB2VQGRoWEPrJ A==;
X-CSE-ConnectionGUID: Bs1BF7hfQmqvZZb+SMmZ2g==
X-CSE-MsgGUID: Ki6dPoZ/SdOVRnSRNulEzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="44961295"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="44961295"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:00:08 -0800
X-CSE-ConnectionGUID: K4k0geTESEiHcluXuT6Huw==
X-CSE-MsgGUID: 8xeIAgcWTB2HIl483PUAyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="116741779"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:00:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	matthew.auld@intel.com
Subject: [PATCH v4 0/2] Userptr fixes
Date: Mon, 24 Feb 2025 09:01:07 -0800
Message-Id: <20250224170109.3078314-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Tested with below tests on BMG + CONFIG_DRM_XE_USERPTR_INVAL_INJECT
xe_exec_basic; xe_exec_compute_mode; xe_exec_fault_mode; xe_vm; xe_exec_threads

Matt

Matthew Brost (2):
  drm/xe: Userptr invalidation race with binds fixes
  drm/xe: Add staging tree for VM binds

 drivers/gpu/drm/xe/xe_pt.c      | 79 ++++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_pt_walk.c |  3 +-
 drivers/gpu/drm/xe/xe_pt_walk.h |  4 ++
 drivers/gpu/drm/xe/xe_vm.c      |  4 +-
 4 files changed, 60 insertions(+), 30 deletions(-)

-- 
2.34.1

