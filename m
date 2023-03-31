Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13B6C77B62
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 10:24:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD47C10F1C6;
	Fri, 31 Mar 2023 10:24:26 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8198110F1CA
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 10:24:24 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 12:24:13 +0200
Message-Id: <20230331102419.521392-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/6] drm/xe: Meteorlake fixes.
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

I've been trying to make MTL-P work on Xe, and noticed a few things that needed fixing.
First of all, intel_dram needed updating for MTL. But instead of trying to keep track of
intel_pch.c and intel_dram.c, we compile the copy from i915. Ideally we would also use the
headers from i915, but I haven't found a clean way to make it work.

Maybe change the compat headers to #include "../../i915/soc/FILENAME?", or allow a symlink?

Maarten Lankhorst (6):
  drm/xe: Fix meteorlake stolen memory
  drm/xe: Use full_gt batchbuffer allocation for media tiles.
  drm/i915: Fix comparison in intel_dram.
  drm/xe: Fix XE_LPDP and meteorlake display info.
  drm/xe: Build soc files directly
  drm/xe: Fixup __intel_de_wait_for_register macro.

 drivers/gpu/drm/i915/soc/intel_dram.c         |  32 +-
 drivers/gpu/drm/xe/Makefile                   |   8 +-
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   2 +-
 .../soc}/intel_dram.h                         |   1 -
 .../soc}/intel_pch.h                          |   0
 drivers/gpu/drm/xe/display/ext/intel_dram.c   | 495 ------------------
 drivers/gpu/drm/xe/display/ext/intel_pch.c    | 157 ------
 drivers/gpu/drm/xe/display/xe_de.h            |   4 +
 drivers/gpu/drm/xe/xe_bo.c                    |   3 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +-
 drivers/gpu/drm/xe/xe_display.c               |  11 +-
 drivers/gpu/drm/xe/xe_gt.c                    |  10 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   3 +-
 13 files changed, 50 insertions(+), 678 deletions(-)
 rename drivers/gpu/drm/xe/{display/ext => compat-i915-headers/soc}/intel_dram.h (80%)
 rename drivers/gpu/drm/xe/{display/ext => compat-i915-headers/soc}/intel_pch.h (100%)
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_dram.c
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_pch.c

-- 
2.34.1

