Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33945CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 20:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE18E10E45D;
	Mon,  6 Oct 2025 20:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OquoVSmD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B841410E45D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 20:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759781788; x=1791317788;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oapniFQiwVupAUzw3UwSvnBeDYd+qbrER4FGZrbymsk=;
 b=OquoVSmDkWghG8IExq6sKbr7FXLwjqP8l4njSLFePFihSKsST7B+BKDz
 uH5+6nIabAvx+ASM+OXKjbsVfHdBdwRQrQGVgLHW/6LxuxUytouh3fyST
 gfaW9RtOez1W6IEUoJ+VVLXRm4lW1aJBsKC9ZaiLVdUaO1SQFZYfzr2sJ
 swt7NwjHt1U/sxeHJVcixHKVEfHozaJ6oZgVkR8QEqrLZGutudqqkcqPD
 8V/gBT5fjkZpQY3F4unvrou8l28DOoGU2ednaiDBTZ6ZmTYL9WtTzPbgQ
 yaldvdXiHK0sK6ENwyVd8VY983OZkJVhrzIM0wJmERQqy/1ZhmP9Yx6yB g==;
X-CSE-ConnectionGUID: UOzmgcmvQjqzHi996zKEKg==
X-CSE-MsgGUID: 01j8wRpwSReiCh4iCC6zfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61998399"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="61998399"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 13:16:28 -0700
X-CSE-ConnectionGUID: EDJBfoU9QLCdwyepNCXjZw==
X-CSE-MsgGUID: LAZOCBpURD2B5W2t8yg+xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="185245475"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa004.fm.intel.com with ESMTP; 06 Oct 2025 13:16:28 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/3] drm/xe: Fix copyright in xe_ttm_stolen_mgr
Date: Mon,  6 Oct 2025 20:13:26 +0000
Message-ID: <20251006201339.2603160-7-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251006201339.2603160-5-shuicheng.lin@intel.com>
References: <20251006201339.2603160-5-shuicheng.lin@intel.com>
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

- Correct Red Hat copyright year from "2002" to "2022".
- Sort the include lines alphabetically.

No functional changes intended.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index dc588255674d..9b00bdc8ef1a 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: MIT
 /*
  * Copyright © 2021-2023 Intel Corporation
- * Copyright (C) 2021-2002 Red Hat
+ * Copyright (C) 2021-2022 Red Hat
  */
 
 #include <drm/drm_managed.h>
@@ -24,8 +24,8 @@
 #include "xe_sriov.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_vram_mgr.h"
-#include "xe_wa.h"
 #include "xe_vram.h"
+#include "xe_wa.h"
 
 struct xe_ttm_stolen_mgr {
 	struct xe_ttm_vram_mgr base;
-- 
2.49.0

