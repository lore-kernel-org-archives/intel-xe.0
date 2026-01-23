Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54ABFD778B2
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 19:41:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A067410EBCB;
	Fri, 23 Jan 2026 19:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ayfscklh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC8E10EBC9;
 Fri, 23 Jan 2026 19:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769197296; x=1800733296;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MKX4eszRm+2liTO0KEZ3FDVH8gxWlzxetIbA9jGt9sc=;
 b=AyfscklhQPZ4H1ugwCB81OO8Py6GbnRWDMY6Ec00j4Z6Z5isXPewAfJt
 ZO6Pkxjzh1Uvj51+gJ2eYHTm2X/CaGZTaT9soCHryzOeCekNLj3SKt0QF
 I60CeHtFwhwyG+g16aWU7cAeIp1Go4Hbz1mIqk4lD3YCBskU0OMCa7feL
 29sdHaUbm8+bbcoVtAChYA/2RaaVZdDxXnKKaqKO5ylvxIWfInRyNJDIW
 rLVUXnFaRWJOX7geLjCxf0yLTDtOABD+bN43LzUVG9dHoSvLpwcEs70hg
 gPQgxLcx7khOTtqFVrUt6OoKYrBEjaPPAwOEr+MfFGCEI9q3t+rSpXD51 A==;
X-CSE-ConnectionGUID: M3/Bm7GEQSmaKj6a4GifIw==
X-CSE-MsgGUID: WiWO3mBeRdKuqYvRrpajgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="81172622"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="81172622"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 11:41:35 -0800
X-CSE-ConnectionGUID: 8sP6+gh4SFy/q1NHJ7D4Yw==
X-CSE-MsgGUID: c3066VxVT8GK221fUzLyeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="206909607"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa009.jf.intel.com with ESMTP; 23 Jan 2026 11:41:32 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v2 0/1] pcode: rename GEN6_PCODE_DATA to match spec
Date: Fri, 23 Jan 2026 20:41:08 +0100
Message-ID: <20260123194109.680186-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Next version of [1]. This patch conflicts with [2].

[1] https://lore.kernel.org/intel-gfx/20260123105525.572035-1-michal.grzelak@intel.com
[2] https://lore.kernel.org/intel-gfx/20260115113337.4079184-1-jani.nikula@intel.com

BR,
Michał

---
Changelog:
v1->v2
- rebase onto drm-tip (Jani)

Michał Grzelak (1):
  drm/{i915,xe}/pcode: rename GEN6_PCODE_DATA to match spec

 drivers/gpu/drm/i915/gvt/handlers.c         |  2 +-
 drivers/gpu/drm/i915/i915_reg.h             |  2 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c |  2 +-
 drivers/gpu/drm/i915/intel_pcode.c          | 14 +++++++-------
 drivers/gpu/drm/i915/intel_pcode.h          |  4 ++--
 drivers/gpu/drm/xe/xe_pcode.c               |  8 ++++----
 drivers/gpu/drm/xe/xe_pcode.h               |  4 ++--
 7 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.45.2

