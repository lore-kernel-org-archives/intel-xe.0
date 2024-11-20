Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C564D6C2B9
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 00:02:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A3B10E37D;
	Wed, 20 Nov 2024 00:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1niIqFd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5145310E37B
 for <Intel-Xe@lists.freedesktop.org>; Wed, 20 Nov 2024 00:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732060945; x=1763596945;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kGzMQNRH4F/t6JfO+OMbprhn6PTFrFemFIrTBsEw0A4=;
 b=b1niIqFdgNFPfpMF8+B/Nt5qLUw1Mj/R/TFKuHFgx4ff+RUw4Gl/9K/J
 ZjCpyb2jiJhOVXraPMqHNXElcRwoOx0jMIOJGFqTr0Ae2WJi4MbbnoPyc
 HomB+tE4IGEXV7yzEorBb7fEpmjWNUBEx4sPMWOdvJGVs4hR5Y4s/vE1P
 K6svVx6e/e/44Bb97KoD77IbCYaztBn8Ajo9lfOlkPXcAbKwnPomPXLxJ
 XHcLUCW1fj4YEsSHneBlv2F8V3HXQ3dz8hrSpFnggvHD2uwXsOcAh+eW8
 LRyRmF8Ia4V8JgrDTztWRS4CSprP5I5S/VX3dokpfxYowbICWMYZ07JUW w==;
X-CSE-ConnectionGUID: jf05MtjwQTSNU9uel4X1EA==
X-CSE-MsgGUID: //Hwx9VVRGqf6hAyesnqcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="43162422"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="43162422"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 16:02:23 -0800
X-CSE-ConnectionGUID: k9BFLTZ2SpyqXXGYyo94Fg==
X-CSE-MsgGUID: wQgZJyPGTr2M3xIQSAAGWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="89534985"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa007.fm.intel.com with ESMTP; 19 Nov 2024 16:02:23 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 0/2] drm/xe: Add support for G2G communication
Date: Tue, 19 Nov 2024 16:02:20 -0800
Message-ID: <20241120000222.204095-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Platforms with multiple GTs have the ability for the multiple GuCs to
talk to each other directly. This will be useful for in the future. So
start adding support for it.

v2: Couple of tweaks from review feedback - fix bo_get/put calls and
improve readability.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (1):
  drm/xe/guc: Add support for G2G communications

Niranjana Vishwanathapura (1):
  drm/xe: Allow bo mapping on multiple ggtts

 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  20 ++
 drivers/gpu/drm/xe/display/xe_fb_pin.c   |  12 +-
 drivers/gpu/drm/xe/xe_bo.c               |  49 ++--
 drivers/gpu/drm/xe/xe_bo.h               |  32 ++-
 drivers/gpu/drm/xe/xe_bo_evict.c         |  14 +-
 drivers/gpu/drm/xe/xe_bo_types.h         |   5 +-
 drivers/gpu/drm/xe/xe_ggtt.c             |  35 +--
 drivers/gpu/drm/xe/xe_guc.c              | 307 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_types.h        |  10 +
 9 files changed, 437 insertions(+), 47 deletions(-)

-- 
2.47.0

