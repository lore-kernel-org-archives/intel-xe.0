Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9D3E65D10
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 02:54:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F77310EABE;
	Fri, 22 Nov 2024 02:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQ5Mqhtu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B08010EADA
 for <Intel-Xe@lists.freedesktop.org>; Fri, 22 Nov 2024 02:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732244039; x=1763780039;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UL4DFMaub/LahyIZI4uryvGxLNHqUmQ0Ehmw/rM9ea8=;
 b=QQ5MqhtuloRKA7qUwDVQ1l2Qo12Anv3QCqpwRGDO6YO2k6fbRjDAOkLD
 0A8Ms/+nzkTjQmu3qeOaXD7xMpRHLMocQwsLuXns7raS4cg378LQe5mpZ
 j7cQrWptKLIqwtnAhjJUimAefqJZiS0g6Px/JCe6FLWQyEzu+3NbfVlKK
 4FvnCYrRqu/tkNDLSSo08QEkN1e5grO9t8deZ83rE4CzBMUGJWck1e39+
 jgUlx2v0NJUZQdHVJLHqw8fUKOTHalGGvL0u1XJANWnVcRPYrhsEiXZn4
 PpKfY3jBszzNbEzcJFl+XFfjguNLsfhqrBYUOOABeTnEUxpKXkoANLslJ Q==;
X-CSE-ConnectionGUID: xNOMzE6VTMyg/1CsDg+5pg==
X-CSE-MsgGUID: nNlYDZ56R2mxezs2vlehAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43001892"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="43001892"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 18:53:58 -0800
X-CSE-ConnectionGUID: cK0IFwb0T7aR+s1MVZrjAw==
X-CSE-MsgGUID: Lqe6wTXARJCDQmB9oBO4YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="95524964"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa004.jf.intel.com with ESMTP; 21 Nov 2024 18:53:58 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 0/2] drm/xe: Add devcoredump locking and reason string
Date: Thu, 21 Nov 2024 18:53:55 -0800
Message-ID: <20241122025357.1398385-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/xe: Add a reason string to the devcoredump
  drm/xe: Add mutex locking to devcoredump

 drivers/gpu/drm/xe/xe_devcoredump.c       | 53 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_devcoredump.h       |  5 ++-
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  8 +++-
 drivers/gpu/drm/xe/xe_guc_submit.c        | 14 ++++--
 4 files changed, 68 insertions(+), 12 deletions(-)

-- 
2.47.0

