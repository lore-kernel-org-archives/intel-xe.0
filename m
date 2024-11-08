Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBAAD64085
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 20:22:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C1F10E291;
	Fri,  8 Nov 2024 20:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hi0g88Jl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DBE10E0B9
 for <Intel-Xe@lists.freedesktop.org>; Fri,  8 Nov 2024 20:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731097338; x=1762633338;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gKJM+pPVgembf2k49bH9HwSfd+Pb8ih12CNjdFCsopY=;
 b=Hi0g88JlMprHer6dAltyIcBGfIJAp0ugbrV79uYDYfTZsKUvu/THhzmE
 MfZSz/o1QJYogjiZ49MAH0cw6tq+K0/lMtyzwsXOyjE38+6PSiF+bKbcq
 Qv7S5V3trHjNkAnra0Ag0EC/3oC+Owe0mM4nV4q8IjK9hoTQYujuDTOrN
 +ko6BbQk5ZMyy98hwZcseHzBL/gY3XSd5xadkg4coaEATTyZSCIjNKzmr
 PHkOnnH+CzE+xpTvDvvcPgu6bGdm7PQsI9frlI5F5xrzU1vLzo77fXmkp
 yc8Oq2n6RoWgfqWx6P8Aj/3MDyL3ThcKGgfHRErlcrwU5zuyfopdbk7NA Q==;
X-CSE-ConnectionGUID: ewVPtZbUQ8aG2sJCpD8QTg==
X-CSE-MsgGUID: zBEY1spgQW6ooIX1klvoWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41558548"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41558548"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 12:22:17 -0800
X-CSE-ConnectionGUID: zY/clUAhRguQiaV4OpK8+A==
X-CSE-MsgGUID: GM2F79gJRlWWV43HzB8fLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="86509481"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 08 Nov 2024 12:22:16 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/2] drm/xe: Add support for G2G communication
Date: Fri,  8 Nov 2024 12:22:14 -0800
Message-ID: <20241108202216.2020164-1-John.C.Harrison@Intel.com>
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
 drivers/gpu/drm/xe/xe_guc.c              | 276 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_types.h        |  10 +
 9 files changed, 406 insertions(+), 47 deletions(-)

-- 
2.47.0

