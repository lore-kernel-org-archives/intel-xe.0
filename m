Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CFDC47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 09:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6F510E806;
	Thu, 11 Jan 2024 09:16:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8895610E806
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 09:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704964598; x=1736500598;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z66uXg/XZiL8EQLdEv0TH9FwrDeNF9arA+6UFEh8hBM=;
 b=DSVOxg6dA9URY5Jrq4g74ZE/APtwUL5kByejFGXwQ94I+q8Pu+DxItnc
 BnshzP1550jNYi5uRCFetS8LvaIGBc/Qyo0J1nBb6TtXlK2UtmhyCTh+6
 QBOTuncNOuZBtKP6i7XLgDbLpF7mu6SeFaFO4S0zNdwFgOPlQ74mVR5/d
 iiTZFdgNTsYUKzevJuaekuxYDNj04Qnx7cMGHnEb3svd/jRLfo+/9uJds
 fxUQ3/ryLX6EEGnUjK8TeF15brJ35tZHnMShXcCvOhIK5D7kmlx2VDsG8
 BxSpBQyPCO8UekzT0Ds6TjvDzRo8PifbfdeMVHWHYTvKWzK48NdmK9HrG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="397663315"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="397663315"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 01:16:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="24568507"
Received: from kgdowskx-mobl1.ger.corp.intel.com (HELO
 hazy.ger.corp.intel.com) ([10.249.37.118])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 01:16:37 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [RFC v2 0/5] drm/i915/display: DMC wakelock implementation
Date: Thu, 11 Jan 2024 11:16:18 +0200
Message-Id: <20240111091622.1110799-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,

This is the second version of my RFC with this implementation.  What
changed from v1 is that I added a few more patches adding the
implementation in other helper functions.

This is still a bit rough.  Ignore all the traces I added (I'll remove
them).  I'm also planning to add debugfs entries to expose the
wakelock status and control it when testing.  And I'll also add an
option to enable/disable the feature at some point.

Please review.

Cheers,
Luca.


Luca Coelho (4):
  drm/i915/display: add support for DMC wakelocks
  drm/i915/display: use wakelock in the remaining read operations
  drm/i915/display: use wakelock in register waiting functions
  drm/i915/display: use wakelock in the last write function

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_de.h       | 110 +++++++++-
 drivers/gpu/drm/i915/display/intel_display.c  |   4 +
 .../gpu/drm/i915/display/intel_display_core.h |   4 +
 .../drm/i915/display/intel_display_driver.c   |   1 +
 drivers/gpu/drm/i915/display/intel_dmc_regs.h |  18 ++
 drivers/gpu/drm/i915/display/intel_wakelock.c | 191 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_wakelock.h |  34 ++++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 9 files changed, 354 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_wakelock.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_wakelock.h

-- 
2.39.2

