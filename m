Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14D7C531D0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jul 2026 22:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833F910E4D0;
	Mon, 27 Jul 2026 22:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fO9+w85S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9584310E4D0;
 Mon, 27 Jul 2026 22:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785190928; x=1816726928;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CoHYI1btCuL8ZkerBAv4q9bLZo0yQBp4REDvfTt4mHE=;
 b=fO9+w85Sjki1oh0DMt9HTU0s+vqwXcXhuHa8f3O+e4lrYAGnChx7Sc+Z
 17biHAdTsawCWEOdlcSx2jJ7XgI45MlJKX0W4ir7+dRDUkvmunor3lIl6
 LpzHdZqPyC4b5mQ9og3/zqYCHTt/QVlDBFUmHcskboGvwLFKXUasaJOBw
 QpbBUkVxF05SFsWXKyiVO7bCPHOV4c9g9azRrGVERawhg+OO8Q+zmKZcq
 Z61tj3QPh2B0UdpZ9LBIgmkENt5OBQMA/sz2b0DO5wJDRdCFLHGl2+VuS
 zJd81p9XB+Q8yGyqbCYlLkc0mEmQ59NgcL+vAz8Lu9W9EQy1++bNrFyCh w==;
X-CSE-ConnectionGUID: NXbDCYiBSLShv4DO/ay5tw==
X-CSE-MsgGUID: LrpQxGAQRpOaHB0hBVA+QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85781804"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="85781804"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 15:22:07 -0700
X-CSE-ConnectionGUID: 3ME72VZzRWKFKdg2MOoGmA==
X-CSE-MsgGUID: iXQ7c3UUQm2DfXuE7HSB4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="256167303"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa007.fm.intel.com with ESMTP; 27 Jul 2026 15:22:06 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v1 0/2] drm/i915/display: SKL_DSSM / DE_CAP fixes
Date: Tue, 28 Jul 2026 00:21:23 +0200
Message-ID: <20260727222125.2459634-1-michal.grzelak@intel.com>
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

Michał Grzelak (2):
  drm/i915/display: fix SKL_DSSM register masks
  drm/i915/xe2lpd+: disable 3D LUT if unsupported

 drivers/gpu/drm/i915/display/intel_color.c          | 3 +++
 drivers/gpu/drm/i915/display/intel_display_device.c | 8 ++++++++
 drivers/gpu/drm/i915/display/intel_display_device.h | 4 ++++
 drivers/gpu/drm/i915/display/intel_display_regs.h   | 9 +++++----
 4 files changed, 20 insertions(+), 4 deletions(-)

-- 
2.45.2

