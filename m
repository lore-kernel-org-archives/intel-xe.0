Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771CBC678D4
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 01:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C43910E368;
	Thu,  2 Mar 2023 01:35:01 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114EE10E35A
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 01:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677720899; x=1709256899;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kV4epnhGjcmsqShvTi9t337+dGnq6etjQ+FqzqAXJog=;
 b=dDjri+7004PCgP6BKgeyeHCAkBmtHelsD5atre6NLniPjvrxWVN/LWut
 iCohHHcEKudayT51d7kLspafSTv2IthTFBM3Ol4LyD9+Q0yAw85qV+quU
 3v59mRlzmwWQAh3qnOgv2MQ7Kq6v6dDGUPtnj5AW78wVxZo0mRRH7X6uM
 Amy92eFQR8sWvtlA0sxvRmXnx7sf056ME5A1PFxQIs/SA56XesuiTtzC8
 wkbvM4oyPs9I72Ax88D+m7lWgvdrdbSd79eakb387A6Kf+8dDTJDquTXt
 GNUUWNQou55vyJdzfXJwcIJ1wp2SlfyGpU5H7TizvON4wwdNhXNbjWuWx g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="397148697"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; d="scan'208";a="397148697"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 17:34:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="798635044"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; d="scan'208";a="798635044"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 17:34:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Mar 2023 17:34:04 -0800
Message-Id: <20230302013411.3262608-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/7] Encapsulate display
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, maarten.lankhorst@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Since the addition of display, the entire driver is built with
additional CFLAGS to allow the i915 types/headers to be used.  This has
already been problematic as the i915_reg_t and i915_mcr_reg_t were
conflated.

Completely removing this dependency is still not achieved as it would
mean making the structs opaque. However since now there is support for
compiling without display, with a few more ifdefs it's possible to make
sure the driver continues to work without those types/headers. So, move
the display-related initialization inside xe_display.c and remove the
CFLAGS when display is disabled.

Lucas De Marchi (7):
  drm/xe: Fix typo persitent->persistent
  drm/xe/display: Fix return code for deferred probing
  drm/xe/display: Rename and clarify xe_display_enable()
  drm/xe/display: Move display sw init to xe_display.c
  drm/xe/display: Move device info initialization to display
  drm/xe/display: Rename GEN13_DISPLAY
  drm/xe: Remove i915 header dependency when building without display

 drivers/gpu/drm/xe/Makefile          |   6 -
 drivers/gpu/drm/xe/xe_device.c       |  75 ++++-------
 drivers/gpu/drm/xe/xe_device.h       |   6 +-
 drivers/gpu/drm/xe/xe_device_types.h |  17 ++-
 drivers/gpu/drm/xe/xe_display.c      | 183 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_display.h      |  25 ++--
 drivers/gpu/drm/xe/xe_engine.c       |   6 +-
 drivers/gpu/drm/xe/xe_engine_types.h |   6 +-
 drivers/gpu/drm/xe/xe_execlist.c     |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c   |   2 +-
 drivers/gpu/drm/xe/xe_pci.c          |  90 +------------
 11 files changed, 252 insertions(+), 166 deletions(-)

-- 
2.39.0

