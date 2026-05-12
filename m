Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66E8CD4F24
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 18:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979AA10E59D;
	Tue, 12 May 2026 18:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CWkbi9Te";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED59B10E59D
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 18:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778610834; x=1810146834;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6f/IaGIk2qYbhEETFfdczZyVT0FSP2Cr0wJ8+TyUpZI=;
 b=CWkbi9TeS+Y2UZF4c5Xlux996cvnctgeZVDv3yyLVaNRiNob0Pb6X9Zu
 KemPsE9sujdblepi9YaOL52clfwV+qpsonEzXcOEeJWq7IvqxxusYmBs8
 93RmPzCM1CZqjv6cGr1AsdtAzFlFGIobNGL5lB1xwYzcL/3rWWzoB1OHu
 YN9CogS95g+3ZvVfFxEf9TY0M728CirSFIRILehJ8dB95N62gpZ2l0qZH
 NTZM5pG2pjtgDedJiCOoxi+2cgymT+Ze0KSPK8NJL3WnGrHygRPdowKKq
 Md5O8JVafSOra96ZB7CdtFU8T5QK+rKHohT2WW+hWBhQiN6lLJwF4Tg/x g==;
X-CSE-ConnectionGUID: SblMU5QmRgChQLDJ4OSi6g==
X-CSE-MsgGUID: LzobwNeCShCUYgbfB+gmlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79425706"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="79425706"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 11:33:53 -0700
X-CSE-ConnectionGUID: 2qQTD2ySSqm1bIFO9aHQJg==
X-CSE-MsgGUID: /wjKIxGxTFyP9Fp6ent2Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="234791072"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 11:33:51 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 0/7] drm/xe: Make drm_driver const
Date: Tue, 12 May 2026 20:33:35 +0200
Message-ID: <20260512183342.3374-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Today, to enable display support, we rely on making runtime modifications
to drm_driver definitions, but that is risky as drm_driver pointer is
shared by all xe device instances and we might introduce unwanted bits.

Fix that by relying on the updates to the drm_device.driver_features bits
instead, following the design of the 'driver_features' feature.

While around, make also some minor cleanups.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>

Michal Wajdeczko (7):
  drm/xe: Drop unused drm/drm_atomic_helper.h include
  drm/xe/display: Drop xe_display_driver_remove() stub
  drm/xe/display: Prefer forward declarations
  drm/xe/display: Add macro with display driver ops
  drm/xe/display: Add macro with display driver features
  drm/xe/display: Drop xe_display_driver_set_hooks()
  drm/xe: Make drm_driver const

 drivers/gpu/drm/xe/display/xe_display.c | 33 ++++++++-----------------
 drivers/gpu/drm/xe/display/xe_display.h | 21 +++++++++++++---
 drivers/gpu/drm/xe/xe_device.c          | 13 +++++-----
 3 files changed, 34 insertions(+), 33 deletions(-)

-- 
2.47.1

