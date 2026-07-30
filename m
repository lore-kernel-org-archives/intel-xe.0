Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B083C531D0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 05:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7D010E101;
	Thu, 30 Jul 2026 05:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D5qzRTSy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9530010E101
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 05:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785389034; x=1816925034;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MR9kbcm7I7hT25S50vjDXnGQ8I5J7mzW76CgI7x+TRw=;
 b=D5qzRTSy/hnLyZzSXDkMF/ZZx5T1M93uw8tIvJ+UVzdaurW6FNvSf6dq
 Fw3eK1YwyKeLVeqfP3AyQNuTpqUZ9smco6jfGJOixgYSEXuWOf2Ib7qXo
 JxTuT3RpTLIN/4f8IzUJ03xURcRnSQwZDVn/lE9vRz1FDTxgabr1L/PIA
 Eba/Za6xsMQRsNZwMKz0IGGKZ+FwW+3KbjWYyFa+OVKF3syLfDpNoySZe
 UkhRjDEzeMxxUuELpXrYN9gzG0u7H9AwLnSnOCpA+1XTQLzgBD4eKkRLj
 km0iUk79YprgT8X9xxGvu6goMdDgpOtJfshkNlVgs2+Cg5yhDdurynM8r Q==;
X-CSE-ConnectionGUID: +RLb5FulTum5IsEfwES2lQ==
X-CSE-MsgGUID: 40quSbymRu+et1WhKhJwAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86078523"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="86078523"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 22:23:54 -0700
X-CSE-ConnectionGUID: yJCzw0K6SB602QotyZZVrQ==
X-CSE-MsgGUID: Xpg9edvbR5O9PHghKUYxrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="260256314"
Received: from soc-5cg5233szh.clients.intel.com ([10.66.65.194])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 22:23:51 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: umesh.nerlige.ramappa@intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org
Cc: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v8 0/3] drm/xe: make CTX_TIMESTAMP TOCTOU-safe and handle
 sentinels
Date: Thu, 30 Jul 2026 05:23:44 +0000
Message-ID: <20260730052343.1205472-5-gajendra.uttamchand@intel.com>
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

v8:
Fix git am merge issue with v7 patch series

Gajendra Uttamchand (3):
  drm/xe/lrc: document sentinel and make CTX_TIMESTAMP read TOCTOU-safe
  drm/xe/lrc: Fix torn read of CTX_TIMESTAMP from LRC
  drm/xe/lrc: Fix ABA race on engine migration in context timestamp read

 drivers/gpu/drm/xe/xe_lrc.c | 63 ++++++++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_lrc.h |  7 +++++
 2 files changed, 55 insertions(+), 15 deletions(-)

--
2.43.0

