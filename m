Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C054FCD8CA8
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 02:57:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D11B10E15F;
	Mon, 15 Jun 2026 02:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LlIF2r4G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFEF10E15F
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 02:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781492262; x=1813028262;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VYtp5wjrX323lda0JKqOD1Twi99Do56hmnuyQWPcWEU=;
 b=LlIF2r4GgwjwKXhYor3LwUnPBUDH9+X5ZaGdUbfqcz8IzfFlkRYnHi8u
 kMDvjS5v/YJB1Hl75PG9xWTx1g56BSM/e2TfrWRIolx08m8DKDwIIoV0L
 4M7GwFSVXzJJCZ95RlYBYQxxO4a+LI0I+j/dcj1ktoKIMh9mD16nF8um1
 6Jll/dA3HR4ImIe3Dzm4Wn3UAaV90qeL0c7uQkXQdLlsVICfDPhY6PmER
 xPLpFEcQJkaEKEbFVxK11cklaUa3sDtlXTjWYqS7LXcTJ1SyJOaisV27b
 6Q2pporUjNwQ/HhLv9GXOyh06zCMUUppbXcG21eJANDRl66u/a7g8ZVz2 Q==;
X-CSE-ConnectionGUID: +9AoN7sZSZmSnOpbTFHlHQ==
X-CSE-MsgGUID: hG9rTRqaR4eiCa/Of8plRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="92547922"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="92547922"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 19:57:42 -0700
X-CSE-ConnectionGUID: cMSPYnX7RbKJ8N7fB44/Kg==
X-CSE-MsgGUID: zahBQYBwRyyRYw4Y4SUinA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="247226108"
Received: from soc-5cg5233szh.clients.intel.com ([10.66.72.118])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 19:57:39 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: umesh.nerlige.ramappa@intel.com, matthew.brost@intel.com,
 intel-xe@lists.freedesktop.org
Cc: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v2 0/1] drm/xe: make CTX_TIMESTAMP TOCTOU-safe and handle
 sentinels
Date: Mon, 15 Jun 2026 02:57:30 +0000
Message-ID: <20260615025729.346143-3-gajendra.uttamchand@intel.com>
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
Added Fixes tag for the original commit (Umesh Nerlige)

Uttamchand, Gajendra (1):
  drm/xe/lrc: document sentinel and make CTX_TIMESTAMP read TOCTOU-safe

 drivers/gpu/drm/xe/xe_lrc.c | 29 +++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_lrc.h |  7 +++++++
 2 files changed, 28 insertions(+), 8 deletions(-)

--
2.43.0

