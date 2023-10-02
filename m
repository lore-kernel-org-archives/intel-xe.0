Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D63E784AF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 10:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B3310E278;
	Mon,  2 Oct 2023 10:24:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDA110E278
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 10:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696242256; x=1727778256;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lgf4h5gE/t61flW5nyIAB1kBFQ45yZIfHT3lYEOHMQM=;
 b=daCpTXuxK9DwNu2sOzQ/BHNjmLdtV1+xXHgMOzUXtpF3sd01hdb1qEXg
 R8ZvZyBpRQgNjQbXoNuUmc+4XrJbMP42I3y8AGeqliBMFMu7zPDta8rDK
 tLrrLjFw15/EqGqvMoZNrwSfR3VmknPMFgX62bcsKcvTgVjFUoEqpokAQ
 Csz8ZqbXanw2cv/r39TaEc0SvZqEuMiARWMSC+1AJXMg1FPtqqNHWmuG4
 qYhlAYPalnSPtJUJXMQuf7CFudwseE750Q75KlZu5gUM7NatRO4QXo1ke
 FpvE5rpoNx6ri7x8cY1AeU5QpeJsuwskLhOk1dUlLQrbASbQDSN1kqDbl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="468894329"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="468894329"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 03:24:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="744075751"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="744075751"
Received: from apascali-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.221.122])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 03:24:12 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  2 Oct 2023 13:23:55 +0300
Message-Id: <20231002102359.3740026-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/4] Frontbuffer tracking and dirtyfb
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

v4: add missing patch
v3: squash fixup patch
v2: rebased

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>

Jouni Högander (4):
  drm/xe: Add empty def for i915_gem_object_flush_if_display
  Revert "FIXME: drm/i915: More display ugly wa needed after rebase"
  drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base
  fixup! FIXME: drm/i915/display: Remaining changes to make xe compile

 drivers/gpu/drm/i915/display/intel_fb.c          | 10 ++--------
 drivers/gpu/drm/i915/display/intel_frontbuffer.c |  2 --
 drivers/gpu/drm/xe/xe_bo.h                       |  2 ++
 3 files changed, 4 insertions(+), 10 deletions(-)

-- 
2.34.1

