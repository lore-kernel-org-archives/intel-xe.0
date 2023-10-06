Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BF4E92FFE
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 10:38:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D36210E06B;
	Fri,  6 Oct 2023 10:38:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DA110E06B
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 10:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696588692; x=1728124692;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hFGcFfQ4Knr6x3RBYK2hX4m6DcG1numl1uIvT2uXP5o=;
 b=OwD9FvaPNr8fljKvKZ0Yac6+nTA2e7GdFHMt9uUnZncjAmICIRdFLVDs
 SB0VJAFsON6z5xeHcoyKMDeQ9oFJs82hjykAqrHeR3MsBaLoNnr6XSg9/
 DtBkkwUe8JGJ8r+Fc5uhSn0NPdIBnYByxdTTNnmErCZRV+ijPVwbf32/o
 A+Nygm+HnKS1igDHzjxeor1JYRbnFXoKYkotTg8fS2RMskuXdhnKkOeJg
 ItLvl1QpGpvRt0dsZQ47hFpqQX8E2oz7lJFm22kfNAT13x4A3XY9vX+ce
 E+NBRBkEhNluB2e7uZ1XJ83djzeIht3j3wJli4ugWhpv+JXY6EvaIRZHO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="374070189"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="374070189"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:38:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="787348335"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="787348335"
Received: from lvroom-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.239])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:38:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 13:37:56 +0300
Message-Id: <cover.1696588392.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/6] xe/display: clarify display configuration
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

v2 of [1] with all the controversial patches dropped.

I'm not going to pursue the dropped patches any further. I'll leave it up to
others to clean them up or leave them broken as they see fit.

BR,
Jani.


[1] https://patchwork.freedesktop.org/series/124561/


Jani Nikula (6):
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe: Introduce Xe assert macros
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support

 .../gpu/drm/xe/compat-i915-headers/i915_drv.h | 11 ++++----
 drivers/gpu/drm/xe/xe_assert.h                |  3 ---
 drivers/gpu/drm/xe/xe_device_types.h          |  2 --
 drivers/gpu/drm/xe/xe_display.c               | 25 ++++++++-----------
 4 files changed, 17 insertions(+), 24 deletions(-)

-- 
2.39.2

