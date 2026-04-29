Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD63FF8877
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 10:25:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7538710EB08;
	Wed, 29 Apr 2026 10:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5P+un7I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA8F10E1E8;
 Wed, 29 Apr 2026 10:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777458302; x=1808994302;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=32bY7kBcx66FBEcK29K5IZk0gIXxIXvf1Gpx2a0MIjE=;
 b=J5P+un7IBvKTTnRfwDdlhXwWvVzmj/EOPyhMYn7soDTO6Z77D24jmlR2
 TxXkhxo4INeQFx9FAmShPh/C9ZvYwEtaEvZ/qM8vGVBJdALy9QFsIDXjF
 H2hSBo18NEnqo1oODAhMs0YfAvDKAXflmIlkY2hsFiamIDk0+v5D3HvO+
 UecpKuypcEImIzCpkppxpdydf2Hpw40U96ZIvkWhOa0/C/fn0KvwNqhE1
 Ea3vrOYN/Uuc2j3Rq6hIfo8DciRpZly4uzwr7y0JBdrsqqAufHVe8hDVt
 j2NOQjcDAk383VbI52QhUkXLK63l26qGRIvUUZAtIC7rdBFnVSr1hbG7K A==;
X-CSE-ConnectionGUID: TCGEmh3RTEyZrpiOXu+Hug==
X-CSE-MsgGUID: pV8E6WJOSLG1UJVIzHtQoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="89078439"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="89078439"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 03:25:01 -0700
X-CSE-ConnectionGUID: ZwGA6zxvSp2aUehdrYWX5Q==
X-CSE-MsgGUID: CTgAC2BkTBmQIQDdPeaPWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="238554307"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.175])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 03:25:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 00/15] drm/i915: refactor display funcs, add display irq hooks
Date: Wed, 29 Apr 2026 13:24:40 +0300
Message-ID: <cover.1777458161.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

I was going to add display irq hooks first, but decided the organization
of the existing hooks under display->funcs is a bit weird. Spread them
out by function first. And then add hooks for display irq calls.

The end goal is to reduce the number of functions exposed from display
to i915 and xe core.

Jani Nikula (15):
  drm/i915/display: move audio funcs under audio sub-struct
  drm/i915/display: move color funcs under color sub-struct
  drm/i915/display: move fdi funcs under fdi sub-struct
  drm/i915/display: move watermark funcs under wm sub-struct
  drm/i915/display: move hotplug irq funcs under hotplug sub-struct
  drm/i915/display: move dpll funcs under dpll sub-struct
  drm/i915/display: move cdclk funcs under cdclk sub-struct
  drm/i915/display: move display funcs under modeset sub-struct
  drm/i915/irq: deduplicate dg1_de_irq_postinstall() and
    gen11_de_irq_postinstall()
  drm/i915/irq: move VLV/CHV LPE irq handler call after irq acks
  drm/i915/irq: constify pipe stats parameters
  drm/i915/irq: add display irq funcs, start with
    intel_display_irq_reset()
  drm/i915/irq: add intel_display_irq_postinstall() to irq funcs
  drm/i915/irq: add intel_display_irq_ack() to irq funcs
  drm/i915/irq: add intel_display_irq_handler() to irq funcs

 drivers/gpu/drm/i915/display/i9xx_wm.c        |  22 +-
 drivers/gpu/drm/i915/display/intel_audio.c    |  22 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  84 +++----
 drivers/gpu/drm/i915/display/intel_color.c    |  58 ++---
 drivers/gpu/drm/i915/display/intel_display.c  |  30 +--
 .../gpu/drm/i915/display/intel_display_core.h |  60 ++---
 .../gpu/drm/i915/display/intel_display_irq.c  | 218 +++++++++++++++---
 .../gpu/drm/i915/display/intel_display_irq.h  |  37 ++-
 drivers/gpu/drm/i915/display/intel_dpll.c     |  28 +--
 drivers/gpu/drm/i915/display/intel_fdi.c      |   8 +-
 .../gpu/drm/i915/display/intel_hotplug_irq.c  |  30 +--
 .../drm/i915/display/intel_initial_plane.c    |   4 +-
 .../drm/i915/display/intel_modeset_setup.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_wm.c       |  32 +--
 drivers/gpu/drm/i915/display/skl_watermark.c  |   2 +-
 drivers/gpu/drm/i915/i915_irq.c               | 182 +++++----------
 drivers/gpu/drm/xe/display/xe_display.c       |   6 +-
 17 files changed, 454 insertions(+), 371 deletions(-)

-- 
2.47.3

