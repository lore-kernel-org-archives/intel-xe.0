Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A32D70DEB
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 21:08:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD4110E4A0;
	Thu, 28 Nov 2024 21:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FoX39byj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9CC10ED48
 for <Intel-Xe@lists.freedesktop.org>; Thu, 28 Nov 2024 21:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732828106; x=1764364106;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w2ULk2zwjhYwK63JjRK9kGIqVHKcPVPqxcMdrXfVKu4=;
 b=FoX39byjyIZZoTl9EgrFtBuq++pk89o6B2jhm6E2URVWxF5UIHKwZCSI
 t5aStacQYOn/MRkDONKkSUvgqBvGiPShAJ7gQWGarUZ/gNZALET4AKgV5
 kjykrfsxvEPgaog6ziLF/57nhq6Iyn4tT/FtxAdI0ZcjOcUCOlOie6Dmm
 C7dpiddvWEeI/Mc2zH1djEWjB0bsHvXgwGZW58l/IZ3uq2LYJVy6HMVpC
 hP/mBV4g3ikDaVAfET0Y2nRmIUfqXPlEvZ0PM2JZtU/diih6LP/YFABPd
 B2V83uobhrh/zvtkchrsUOzSLSztD1xBpkhn79r5pnu/CKM/XVHKU43WF A==;
X-CSE-ConnectionGUID: 4gVdvY0YRoGWAnD3Ms0f3A==
X-CSE-MsgGUID: TqyriYerRb+wLRei+Cj67Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33311940"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; d="scan'208";a="33311940"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 13:08:25 -0800
X-CSE-ConnectionGUID: H2YvpDa9TW2drME/5UPT9A==
X-CSE-MsgGUID: 3vXf6dNuSd6EmdUfRExdwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; d="scan'208";a="93165057"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 28 Nov 2024 13:08:25 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v6 0/3] drm/xe: Add devcoredump locking and reason string
Date: Thu, 28 Nov 2024 13:08:21 -0800
Message-ID: <20241128210824.3302147-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
v6: Rebase due to conflict with recent change to worker function.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (3):
  drm/xe: Add a reason string to the devcoredump
  drm/xe: Move the coredump registration to the worker thread
  drm/xe: Add mutex locking to devcoredump

 drivers/gpu/drm/xe/xe_devcoredump.c       | 125 +++++++++++++++-------
 drivers/gpu/drm/xe/xe_devcoredump.h       |   5 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   8 +-
 drivers/gpu/drm/xe/xe_guc_submit.c        |  14 ++-
 4 files changed, 107 insertions(+), 45 deletions(-)

-- 
2.47.0

