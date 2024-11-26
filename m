Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B501D65550
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 19:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB45910E9AE;
	Tue, 26 Nov 2024 19:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jUSEm6Mr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCAC10E083
 for <Intel-Xe@lists.freedesktop.org>; Tue, 26 Nov 2024 19:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732648739; x=1764184739;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rPDVPaY4DS0ta0HKE6r0hd5+F4XdjtrXK+ISWs0j90Y=;
 b=jUSEm6Mr8JJ/3b35uSih6egyAIVSigqD2fXwRe+2Q34+4koFZwF9ottf
 40/1YHr2dPyB7n5yGX+mKe6Fn2Lb7550oYOai3NgAzCR4Be7/qggGoF7f
 kASzw4YtJcpf0Nhh4DV2sCDvZ6fsO6HgSOM/uWZmDozs6A9xJSfz6G/zt
 2vE+0Lg88dUImdg7xWYwI/O7b85IAMxktfPqP76//1zIZQb8o6tJHBTCP
 v9Tq4AoxgcCByF5NTuQn3jLFzEzBTAfphhnaSP4PvCnxb1w2BcgJyq+Z9
 KIMaol88GrHEGoQ5fA3GpejAHcoVhY4SqtTcnI6PhMp1Wfz+lR/HGJeKL Q==;
X-CSE-ConnectionGUID: Zv3cNHndSWShxN4MhbFVAQ==
X-CSE-MsgGUID: yfxm2JnPQqKevi21a0dodA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44217841"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44217841"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 11:18:58 -0800
X-CSE-ConnectionGUID: sWD2H4t0T/WqsUz9C4GhBQ==
X-CSE-MsgGUID: kqCiIVhMSFWcSuZzTiSdDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="91811726"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa006.jf.intel.com with ESMTP; 26 Nov 2024 11:18:58 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v5 0/3] drm/xe: Add devcoredump locking and reason string
Date: Tue, 26 Nov 2024 11:18:54 -0800
Message-ID: <20241126191857.2583429-1-John.C.Harrison@Intel.com>
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
v3: Move mutex locks and add reclaim annotation (review feedback from
Matthew Brost).
v4: Fix typo - when adding lockdep specific code it helps to actually
have CONFIG_LOCKDEP enabled!
v5: New patch to move the call to dev_coredumpm_timeout to prevent an
existing issue highlighted by the new lockdep checking.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (3):
  drm/xe: Add a reason string to the devcoredump
  drm/xe: Move the coredump registration to the worker thread
  drm/xe: Add mutex locking to devcoredump

 drivers/gpu/drm/xe/xe_devcoredump.c       | 115 +++++++++++++++-------
 drivers/gpu/drm/xe/xe_devcoredump.h       |   5 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   8 +-
 drivers/gpu/drm/xe/xe_guc_submit.c        |  14 ++-
 4 files changed, 102 insertions(+), 40 deletions(-)

-- 
2.47.0

