Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350D1CCFA18
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 07:34:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE63010E32D;
	Tue, 11 Nov 2025 07:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2rAZcXS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E582F10E0E9;
 Tue, 11 Nov 2025 07:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762846450; x=1794382450;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vpESDQ7QJ1OSkXuNJwl5ZIpyFOFNn6TvOpKtWcQQdv4=;
 b=c2rAZcXSiLUE+BLACXsw6khNiLuhzHLkb40xCLKshkxFlBdCLBfCUH7y
 4zfgQyv2aQM2lnY5oOIE9wlrK/+SnYgB//7vAHY40i0myIQJYNv20/t1q
 NFrEnUA07KlO1YdZpDCet6B0aplSKtA6nVojbvbXiD2KVufsUlKk9shJR
 nB65DYZjpbPh6mXgZLv4f43AsLgxVpCPdkyTiGRsY3tfhDWRo+34OmVsz
 5ELnO32dSqWHQZvy2lIbycfHN8O4SDXuvYWDTWO3pkfRJi14ADaj2a2sO
 QtMbJhQuqPOspU8YVWt90/Pz6liJoe6ivi5W/A92WisaGeGOhQ+jfIi91 A==;
X-CSE-ConnectionGUID: fuZg5W9kRReendIFtmoN3g==
X-CSE-MsgGUID: /WmJy6bjQpqNZZlchT51lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="76359525"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="76359525"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 23:34:10 -0800
X-CSE-ConnectionGUID: uuK051RsQl6ERDm+kYRquw==
X-CSE-MsgGUID: JVXCsPMqRgiJ31ZsamP2JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="188657726"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 23:34:08 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH v2 0/3] drm/{i915,
 xe}/irq: clarify display and parent driver interfaces
Date: Tue, 11 Nov 2025 09:34:01 +0200
Message-ID: <cover.1762846363.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

v2 of [1], reordering the series to cleanly address Ville's review
comments.

[1] https://lore.kernel.org/r/cover.1762803004.git.jani.nikula@intel.com


Jani Nikula (3):
  drm/{i915,xe}/display: duplicate gen2 irq/error init/reset in display
    irq
  drm/i915/display: convert the display irq interfaces to struct
    intel_display
  drm/{i915,xe}/display: move irq calls to parent interface

 .../gpu/drm/i915/display/intel_display_irq.c  | 201 ++++++++++--------
 .../drm/i915/display/intel_display_power.c    |   5 +-
 .../i915/display/intel_display_power_well.c   |  15 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |   9 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c  |   6 +-
 .../gpu/drm/i915/display/intel_lpe_audio.c    |   1 -
 drivers/gpu/drm/i915/display/intel_pipe_crc.c |   6 +-
 drivers/gpu/drm/i915/i915_driver.c            |   1 +
 drivers/gpu/drm/i915/i915_irq.c               |  16 ++
 drivers/gpu/drm/i915/i915_irq.h               |   2 +
 drivers/gpu/drm/xe/Makefile                   |   2 -
 .../gpu/drm/xe/compat-i915-headers/i915_irq.h |   6 -
 drivers/gpu/drm/xe/display/ext/i915_irq.c     |  85 --------
 drivers/gpu/drm/xe/display/xe_display.c       |  18 ++
 include/drm/intel/display_parent_interface.h  |   8 +
 15 files changed, 166 insertions(+), 215 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h
 delete mode 100644 drivers/gpu/drm/xe/display/ext/i915_irq.c

-- 
2.47.3

