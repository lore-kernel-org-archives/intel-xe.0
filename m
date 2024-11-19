Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E955D6C2B7
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 22:54:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF7010E37A;
	Tue, 19 Nov 2024 22:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kjsr5DgH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B168210E0D3
 for <Intel-Xe@lists.freedesktop.org>; Tue, 19 Nov 2024 22:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732056863; x=1763592863;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kGzMQNRH4F/t6JfO+OMbprhn6PTFrFemFIrTBsEw0A4=;
 b=Kjsr5DgH6YgrYg/taMqPGeBpFfoBtXZXMNhnhFgubmL5O4l/6o6wB3BV
 UoEa7uTXK7hMt71+864bg/nluiN7wo4stFgymfzZNfE3ns9My0eOFYvi8
 fnBls9HTN4YfuhHm+TOsMVKLFOxeawOCI26xazi34ZbvUgZOBsJYJ7Ne9
 K+Ey5Yjle8YWFoDrLQoTTsQC0V/MjR29Ptzq0K9fNIjgk2nXOkktwzoj5
 BUzc40w45+SiPonDXsfbtC4+5tv1QEsZp+7MfpBqKjZpmhB4c9PLpDeze
 ebxoXsJNHpurkxoGTeNjkWKwmekQ1qJN6Le39ToKd00yr8ug498p4J44Z Q==;
X-CSE-ConnectionGUID: 0D2Ck2uOSu2p2QThRwU4Ug==
X-CSE-MsgGUID: zBcwMJOFSSuajomhiWFoHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32026793"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="32026793"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 14:54:23 -0800
X-CSE-ConnectionGUID: 5p4PWYXnRvuE9x/VwTlFQQ==
X-CSE-MsgGUID: wSGrxetkTzOjKaY6NCCgCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="90540626"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 19 Nov 2024 14:54:22 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 0/2] drm/xe: Add support for G2G communication
Date: Tue, 19 Nov 2024 14:54:19 -0800
Message-ID: <20241119225421.198838-1-John.C.Harrison@Intel.com>
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

