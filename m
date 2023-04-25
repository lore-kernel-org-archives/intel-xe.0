Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8187CC77B61
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 19:26:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE7D10E50A;
	Tue, 25 Apr 2023 19:26:33 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FACB10E50A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 19:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682450791; x=1713986791;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8F19e9iFkmyJBSiTb4vYnLNI31Zna5hf4dbIy5NzFc0=;
 b=i8d449ZU9e31uhatJY3DKlrP6C793EzwPTphgDTFf6wxxEUJj3g7MeVb
 NU7dxfnYiCfjCS+dVoYTQDeKFydJ2q8tgPrikZdYQ67RdPFmQIO2bg30r
 V0PYEWcSoVAvWlI4mMVxD4jqQaAawf3/kbwRLA/WYh7V3X9WFoeihsF7p
 joF6E5CkoU90Zv3gIOTp1gruEmNmn348pghKwEW5HA3CjevWjyr4LDUhG
 XC032LLU5psUeVU6fUGFLMe6YQh/uqw1zy4IHQJxmGNp4JGqL6H1/ZhyT
 SGx3anMCQ9Cfru2SEqIoGcDj5aeyF6VQ5wLEBpb5YGfdEaTf/Bj4cGbqg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="331100741"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="331100741"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:26:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="782990441"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="782990441"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:26:27 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Apr 2023 12:26:09 -0700
Message-Id: <20230425192624.168640-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 00/15] Display fixes
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This patch series does 4 main things:
- fix the dkl phy mutex initialization by:
	- backporting: https://patchwork.freedesktop.org/series/116431/
	- backporting: https://patchwork.freedesktop.org/patch/msgid/20230420170558.35398-1-jose.souza@intel.com
	- fixing display function calls

- enable modular fia in TGL
	- this patch will be gone in next Xe rebase as has_modular_fia
	was removed in drm-tip. Not backporting patches removing it
	because it is a huge series.

- Makes has_psr_hw_tracking default as 0, as only TGL and DG1 supports
PSR HW tracking in Xe kmd

- Enable Raptorlake-P

v2:
- function call fixes in 'squash! drm/xe/display: Implement display support'

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/249

Jani Nikula (10):
  drm/i915/display: remove intel_display_commit_duplicated_state()
  drm/i915/display: start high level display driver file
  drm/i915/display: move intel_modeset_probe_defer() to
    intel_display_driver.[ch]
  drm/i915/display: rename intel_modeset_probe_defer() ->
    intel_display_driver_probe_defer()
  drm/i915/display: move modeset probe/remove functions to
    intel_display_driver.c
  drm/i915/display: rename intel_display_driver_* functions
  drm/i915/display: add intel_display_reset.[ch]
  drm/i915/display: move display suspend/resume to
    intel_display_driver.[ch]
  drm/i915/display: rename intel_display_driver_suspend/resume functions
  drm/i915/display: add intel_display_driver_early_probe()

José Roberto de Souza (5):
  drm/i915: Initialize dkl_phy spin lock from display code path
  squash! drm/xe/display: Implement display support
  TEMPORARY: drm/xe/display: Enable modular fia in TGL
  drm/xe/display: Disable PSR HW tracking by default in all display
    versions
  drm/xe: Enable Raptorlake-P

 drivers/gpu/drm/i915/Makefile                 |   2 +
 drivers/gpu/drm/i915/display/intel_display.c  | 693 +-----------------
 drivers/gpu/drm/i915/display/intel_display.h  |  29 +-
 .../drm/i915/display/intel_display_driver.c   | 585 +++++++++++++++
 .../drm/i915/display/intel_display_driver.h   |  36 +
 .../drm/i915/display/intel_display_reset.c    | 135 ++++
 .../drm/i915/display/intel_display_reset.h    |  14 +
 drivers/gpu/drm/i915/display/intel_dkl_phy.c  |   9 +
 drivers/gpu/drm/i915/display/intel_dkl_phy.h  |   1 +
 drivers/gpu/drm/i915/gt/intel_reset.c         |   6 +-
 drivers/gpu/drm/i915/i915_driver.c            |  35 +-
 drivers/gpu/drm/i915/i915_irq.c               |   2 +-
 drivers/gpu/drm/i915/i915_pci.c               |   3 +-
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_display.c               |  38 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   1 +
 16 files changed, 854 insertions(+), 736 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_driver.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_driver.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_reset.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_reset.h

-- 
2.40.0

