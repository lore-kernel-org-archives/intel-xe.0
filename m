Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FB0E7849A
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 09:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2E410E26D;
	Mon,  2 Oct 2023 09:16:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AA410E26C
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 09:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696238157; x=1727774157;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hKgrDbk+n+C7+Gqi+pcYb7DvvHuDGONYEYJGOx1lxeA=;
 b=Owf/mwirR/+q20y7QGHIBEF6PXxXzlgrxVUdEAuv3nvtyRU0O75nI13A
 uhSeI2zpc3NWtMGtFw77t8s7NoaGqjMor8L94Ob0wJCfVKkGXDDLZ3QKM
 cFsru005mHe5DM/IoUil/IPLw42Ew9oCN3bAi+rJxigBP56o5Sk8zdQDR
 L66E0D+pFngpNkPGcmDmbpEnMeR6F2p3dqM5YQkp3LaRZzbGbhqVyGlHZ
 1+TjBF+z1YzOVGETPK5L9qRPk1fEkersx1F3XqfWgiSvyq/Os+O8EwLSs
 mT5Hobqa4O9pXxfFt0Yy67D1CLVtbGzlijkSwn2LeMa0oKBKpg61wpOou A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="361985404"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="361985404"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 02:15:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="997570359"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="997570359"
Received: from apascali-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.221.122])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 02:15:53 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  2 Oct 2023 12:15:38 +0300
Message-Id: <20231002091542.3696656-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/4] Frontbuffer tracking and dirtyfb
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Generic dirtyfb implementation which Xe is currently using is doing
atomic commit which is inefficient. We have now dma fence handling in
our dirtyfb implementation. This works with Xe and CPU/GPU frontbuffer
rendering as long as sync objects are imported by userspace
(dma_buf_import_sync_file).

v2: rebased

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>

Jouni Högander (4):
  fixup! drm/xe: Add empty def for i915_gem_object_flush_if_display
  Revert "FIXME: drm/i915: More display ugly wa needed after rebase"
  drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base
  fixup! FIXME: drm/i915/display: Remaining changes to make xe compile

 drivers/gpu/drm/i915/display/intel_fb.c                | 10 ++--------
 drivers/gpu/drm/i915/display/intel_frontbuffer.c       |  2 --
 .../gem/i915_gem_object_frontbuffer.h                  |  1 -
 drivers/gpu/drm/xe/xe_bo.h                             |  2 ++
 4 files changed, 4 insertions(+), 11 deletions(-)

-- 
2.34.1

