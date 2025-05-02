Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D34C3ABAC
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 08:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F14E10E8C0;
	Fri,  2 May 2025 08:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W5Uidige";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43DA10E8BF;
 Fri,  2 May 2025 08:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746175804; x=1777711804;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DxZECuyvN2B3WPIR//sqgHYAvkFvwdNOdAGxDYzq71M=;
 b=W5UidigeElcPRl3tjPiz893eMlIS+XbHxUdZcipTvSXCfE6n2iFjDhRB
 nSRv92uuiGWMIAwdd7vCYq6EpJnpwGYjCGuUmuHBZBQm9CAiA3Hq0Xd9k
 gSy3HeuAvFTejcti50BzFZQDzdoh4fE2dSa3/2ph4l5ZrPVz/UyWeoN3w
 k7I/9AYEklt5cfwt9S9hOoBJ08iNvxKg/mlJNKOBqb5VU9IgX1G3gBn3z
 cwIpeax2E142E03QJPdauoXh+u/wAHvIr9LYJESglpO7dSTa4AGhurt2P
 +7tlUTkLmk/LHo4XwLqIoiIMG5Gql884iUX7n8Eoss8IerhYke6wHkP8t A==;
X-CSE-ConnectionGUID: EvamLn8kSR6nzcJarCfgDQ==
X-CSE-MsgGUID: icOtjcqBSU2QCNoRoIMtMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47115159"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="47115159"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 01:50:02 -0700
X-CSE-ConnectionGUID: dsBoyHMvQ7q1/rnR7dieRQ==
X-CSE-MsgGUID: +4ciV93vSlar1oDSKqmbcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="138612635"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.144])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 01:50:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH v2 0/3] drm/i915/display: remove intel_de_*() compat wrappers
Date: Fri,  2 May 2025 11:49:53 +0300
Message-Id: <cover.1746175756.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
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

Rebase of [1].


[1] https://lore.kernel.org/r/cover.1745399318.git.jani.nikula@intel.com


Jani Nikula (3):
  drm/i915/dpt: convert intel_dpt_common.c to struct intel_display
  drm/i915/hdmi: convert rest of intel_hdmi.c to struct intel_display
  drm/i915/de: drop drm_i915_private compat wrappers from intel_de_*()

 drivers/gpu/drm/i915/display/intel_de.h         | 14 ++++----------
 drivers/gpu/drm/i915/display/intel_dpt_common.c | 15 +++++++--------
 drivers/gpu/drm/i915/display/intel_hdmi.c       | 12 ++++++------
 3 files changed, 17 insertions(+), 24 deletions(-)

-- 
2.39.5

