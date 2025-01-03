Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5500E77188
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jan 2025 00:11:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D73610E7C7;
	Fri,  3 Jan 2025 00:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JXsgD0Ln";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C836010E431
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jan 2025 00:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735863092; x=1767399092;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iJcHIlTJKzztqidgND3rRNUT6O1rmfn/BR0LlpEYuf0=;
 b=JXsgD0LnNBPnS+u+YS7l6s0vqWx1OFXCHLKsPqpDsf6Bz2oTiHmMo2Vs
 EkreS66eW1778iTJOxLBzi/YxnwYuuxd6AAHdcUTpK0UVCdA8slKEw1pw
 aJz77S2YhVNAPDGh/AtKnau0pBvOoaYY8AnS5/M9CpbcN85/HYN6dCE2P
 kW5XOdfZxZgHimhqI8aNY8lxlN8vmK+2uOYHDY2GhRiXWCYYQoAduo+uS
 Sl7L4aCRT1aZWqMfy/DqbRz4hNZoSQHtnP5wxml8EpClS6XSgCCFbrvdt
 +NWMkWTyvss8FLcqLUnAGUBRSkGICEzSD0/HIFNf5ErEIic9E/GiIWpv4 A==;
X-CSE-ConnectionGUID: u3kyoFKAQdOhvyjrWiDkmw==
X-CSE-MsgGUID: QCJ/oO3cR4u5nIUG4QfkrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="53519369"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="53519369"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 16:11:31 -0800
X-CSE-ConnectionGUID: ZuhzuxvCQw+4P1HAw1ACZQ==
X-CSE-MsgGUID: oLwH1U5xRNGt1oAxvIqpbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="101498538"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 16:11:30 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/2] TLB invalidation on wedge fix
Date: Thu,  2 Jan 2025 16:11:09 -0800
Message-ID: <20250103001111.331684-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

First patch fixes TLB invalidation when wedging before the place where
it was initialized. Second focuses on dropping "graphics tile", but the
wording chosen may not be the best. If we agree on something else I'm
happy to respin it.

Lucas De Marchi (2):
  drm/xe: Fix tlb invalidation when wedging
  drm/xe: Remove "graphics tile" from kernel doc

 drivers/gpu/drm/xe/xe_exec_queue_types.h    |  2 +-
 drivers/gpu/drm/xe/xe_gt.c                  |  8 ++++----
 drivers/gpu/drm/xe/xe_gt_stats.c            |  4 ++--
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 16 ++++++++--------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  3 ++-
 drivers/gpu/drm/xe/xe_hw_engine_types.h     |  2 +-
 drivers/gpu/drm/xe/xe_hw_fence_types.h      |  2 +-
 7 files changed, 19 insertions(+), 18 deletions(-)

-- 
2.47.0

