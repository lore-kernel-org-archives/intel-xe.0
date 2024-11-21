Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0C3E65D00
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 22:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334F910E419;
	Thu, 21 Nov 2024 22:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CdiPpnS/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CA010E419
 for <Intel-Xe@lists.freedesktop.org>; Thu, 21 Nov 2024 22:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732229743; x=1763765743;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=69YK95flDVLpqbE75ueszAwGybgGZe92YwPFmrY0760=;
 b=CdiPpnS/JLA5TzATdyB49tRkqfY1rAsFIM2zk2symxzZ656AMp6TeL36
 c0NbWI1hyBo1WS+lKm77a/wpfXL3xxnqZYp8+oFFrNnaNWMk4+lLyHaKm
 9DLXm2OaPaIfb8nw/MQNZMp/0YjBJc8cPS1UgkCBn4cvl+IfEKYi9sggI
 vCRcEvUtBY4nv2wwEX7A9aYajH4WIYggh4QgeAtlzR21oDnuEzOFzjCvT
 RRM272TEN3oiQlxhch8A6gGfzhPEV88CT2d2GE+HkkogDcNRtfcjHDBPk
 u0iSS2KYk4PFrgg8vZCrX99pEcRn1MU18yMgKMyao9j2N0OyIINNt2u6C w==;
X-CSE-ConnectionGUID: UrQlCHTLT7KPaFvq0IgbvA==
X-CSE-MsgGUID: 0TWNTE5FRruTZIZSRiwPjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="42885955"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="42885955"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 14:55:43 -0800
X-CSE-ConnectionGUID: yzUYkDwiSGqXCmrLRwWJVg==
X-CSE-MsgGUID: 8vtvDk3vSjy8WaBAN1/rlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="90194314"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa007.fm.intel.com with ESMTP; 21 Nov 2024 14:55:42 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 0/2] drm/xe: Add devcoredump locking and reason string
Date: Thu, 21 Nov 2024 14:55:40 -0800
Message-ID: <20241121225542.1336796-1-John.C.Harrison@Intel.com>
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

There are now many ways to trigger a devcoredump capture. So include a
reason message to say why it happened.

Also, add locking to avoid a races with double captures and free vs read.

v2: Change to spin_lock to mutex and a few other tweaks (review
feedback from Matthew Brost).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/xe: Add a reason string to the devcoredump
  drm/xe: Add mutex locking to devcoredump

 drivers/gpu/drm/xe/xe_devcoredump.c       | 47 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_devcoredump.h       |  5 ++-
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  8 +++-
 drivers/gpu/drm/xe/xe_guc_submit.c        | 14 +++++--
 4 files changed, 62 insertions(+), 12 deletions(-)

-- 
2.47.0

