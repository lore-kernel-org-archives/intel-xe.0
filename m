Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC59C531D0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 04:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AB010E0F0;
	Thu, 30 Jul 2026 04:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b79UWftA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE4B10E0F0
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 04:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785385393; x=1816921393;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WCbLhe5q+wAIBAhkithjrkCJT0Ke+NLU6VNxfbXQYWw=;
 b=b79UWftA0qE6JDx00paqLvEVmSDCbwPdw28j0j8dbGTmxDnT7S3Fhbzw
 WJHnVekhNwb4T2QXczEbsEeCZMZ7c/sVHrSBjmTFc7LPhKBppvgkkT4P5
 mPFLlu3zy0za1NC+QjMASktbNE56PRZfnEv6p6VUnGB+EheoposOpDdqD
 ghkdvsU3oxfBUyluLkFG8gz+p5PjZ5ogB9n5kVAPU3kvK+xiUmpAwlwPq
 8+ev45FoaS5DMPBf/jr2DeeHowZ33Rk6r/ftkHcaeiDtxVQ//6Hh6fsi5
 YcnaGoW8GV3E8ltKN4YabgzWf4qICv3VM4J1vAE08PsHWUw2Xb5HrIHnn g==;
X-CSE-ConnectionGUID: tt9I2YeASB+n2vojmmf8Tw==
X-CSE-MsgGUID: EIrPzlD4TtSXsXNxjyBtPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97512649"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="97512649"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 21:23:13 -0700
X-CSE-ConnectionGUID: m40evYZqQiqn/oTmSEC3XA==
X-CSE-MsgGUID: JfOu22j7RZyWrrtJKtsgMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="264455579"
Received: from soc-5cg5233szh.clients.intel.com ([10.66.65.194])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 21:23:10 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: umesh.nerlige.ramappa@intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org
Cc: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v7 0/3] drm/xe: make CTX_TIMESTAMP TOCTOU-safe and handle
 sentinels
Date: Thu, 30 Jul 2026 04:23:01 +0000
Message-ID: <20260730042300.1178495-5-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
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

Fix timestamp handling for Xe LRC contexts to avoid races and false
timeout detection. This patch documents and centralises the
CONTEXT_ACTIVE sentinel and makes MMIO reads of CTX_TIMESTAMP TOCTOU-
safe by verifying the LRC-stored timestamp before and after the MMIO
read.

Fixes: d243ef6a39c6 ("drm/xe/lrc: Refactor xe_lrc_timestamp to simplify logic")

v2:
Dropped the redundant second patch (Matt Brost)

v3:
Added the Fixes tag for the original commit (Umesh Nerlige)

v4:
Added Reviewed-by for the original commit (Umesh Nerlige)
Added Acked-by for the original commit (Matt Brost)

v5:
Fix incorrect 'From:' username in commit header (Kamil)"

v6:
Fix AI review comments from sashiko.dev
 - Fix torn read of CTX_TIMESTAMP from LRC
 - Fix ABA race on engine migration in context timestamp read

v7:
Fix review comments (Vivi Rodrigo)
 - Added Assisted-by coding assistant used
 - Removed extra comments
Added ldw check additionally to avoid torn read (sashiko.dev)

Gajendra Uttamchand (3):
  drm/xe/lrc: document sentinel and make CTX_TIMESTAMP read TOCTOU-safe
  drm/xe/lrc: Fix torn read of CTX_TIMESTAMP from LRC
  drm/xe/lrc: Fix ABA race on engine migration in context timestamp read

 drivers/gpu/drm/xe/xe_lrc.c | 64 ++++++++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_lrc.h |  7 ++++
 2 files changed, 56 insertions(+), 15 deletions(-)

--
2.43.0

