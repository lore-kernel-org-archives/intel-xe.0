Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77721C5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 21:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F3F10E6D1;
	Wed, 28 May 2025 21:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gsVyr6Ud";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D586510E0C6
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 21:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748469258; x=1780005258;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BBSS5WTdh3J4Ypb3lYMxWjfuicf7oPehnexiF6pszo0=;
 b=gsVyr6UdbpcRgsMS5K93dNC88WYeT/BRKnofKK0TphNxbQJGcPE+XR4V
 kl/auNccfKhvXp8Ldt7qKmg2jBx6tzIguWINCMOSUC124PqzNo2MN3+r5
 kOLihi0a5STBxdW74RGyS1rfhtB5GKgghbDzIIHByTS8af9zjyKEtWwyf
 vOyM6UIq8ccBvYoUNO6GLrb7jXBUgSDkZ5XGpH7WuvUg8vZ2FWG0w+QDo
 4Uz3f1alfgzs5trQ+aqjC6J1uSdnrGa25VBtCkjBfOFI1dXPSyFN2Zwq0
 tOaygIoJqcG+lSP/qEivR2pOrXA1VAvhd1jCkwEenS+kUw1PqxW7pYG+T A==;
X-CSE-ConnectionGUID: 6jAKhBOjS3Kvj2tdLfXnSw==
X-CSE-MsgGUID: PouB+MXmSHGVVfH/NDULQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="73044755"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="73044755"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:54:17 -0700
X-CSE-ConnectionGUID: ya8FUUdYTjiEGcVbadDtIw==
X-CSE-MsgGUID: cuuuOFBQS0GD9jUsux9tVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143201059"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:54:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v4 0/5] drm/xe: Add configfs to load with fewer engines
Date: Wed, 28 May 2025 14:54:03 -0700
Message-ID: <20250528-engine-mask-v4-0-f4636d2a890a@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250520-engine-mask-f6f5962afa42
X-Mailer: b4 0.15-dev-d9694
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changes in v4:
- Add patch to convert fused off log messages to gt-based and convert
  the new "sw disabled" as well (Matt Roper)
- Add patch to make the internal API visible in the documentation
- Fix upper bound checks: since it's using fls64(), it's invalid when
  it's greater or equal (Matt Roper)
- Greatly simplify the engine pattern parsing by just dup'ing the
  entire pattern rather than the instance part (Jani)
- Improve documentation about the meaning of engine instances and its
  relation with multi-tile platforms (Matt Roper)
- Link to v3: https://lore.kernel.org/r/20250523-engine-mask-v3-0-11817dc6eb63@intel.com

Changes in v3:
- Add patch with coding style changes to header
- Split patches: the use of the mask hw_engine initialization is one and the
  configfs handling is another
- Move the lookup table outside of the function looking up the mask:
  this will also be used in other patches in future
- Change the _show() method to pretty-print engine names: it's not the
  same format as passed in, but covers the "what was exactly parsed"
  while at the same time not require one to lookup the indexes in the
  source code (Stuart)
- Avoid the term "fuse off" (Matt Roper)
- Handle gcscs (Matt Roper)
- Improve and fold conditions for checking if the engine instance is out
  of bounds (Matt Roper)
- Link to v2: https://lore.kernel.org/r/20250520-engine-mask-v2-1-46e76f935b35@intel.com

Changes in v2:
- Fix build with CONFIG_CONFIGFS_FS=n
- Link to v1: https://lore.kernel.org/r/20250520-engine-mask-v1-1-ce6daf16d23b@intel.com
---
Lucas De Marchi (5):
      drm/xe/configfs: Drop trailing semicolons
      drm/xe: Convert "fused off" messages to be gt-based
      drm/xe: Allow to disable engines
      drm/xe/configfs: Add attribute to disable engines
      drm/xe/configfs: Add internal API to documentation

 Documentation/gpu/xe/xe_configfs.rst |  10 ++-
 drivers/gpu/drm/xe/xe_configfs.c     | 160 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h     |  10 ++-
 drivers/gpu/drm/xe/xe_hw_engine.c    |  37 +++++---
 4 files changed, 200 insertions(+), 17 deletions(-)

base-commit: f9b3e6ff6ee2fc39545dde4b195c5c4452939f9f
change-id: 20250520-engine-mask-f6f5962afa42

Lucas De Marchi

