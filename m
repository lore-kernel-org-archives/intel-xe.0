Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42EE606A32E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 13:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k4ihcqPg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DC811256A;
	Fri, 13 Nov 2026 13:44:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E683911256F;
 Fri, 13 Nov 2026 13:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794577440; x=1826113440;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vTHB2rp+/xMLM+2yowuF26hqjzFwdewBP7Qqu/Io7HI=;
 b=k4ihcqPg3HcFsUcv2jsOBNNYX9O/Ltq1bp8tJQn3y/JY/aLEjLXrXv2P
 blsmhB+QJ635ZzJYtYkeqrj86iQpgGBl4INV1t/VfJKAyWF8xwT3hZf/R
 VjVG/gG+rxEWq1MgPCOaBN/rKZS7QZxC7o/+jJFdHgxwOLP43V+SCC+Wj
 rzre0SPmHNDJovCoIMuIqwpta+T4I0JEakLefKh7V+e5qx/2qSplc/TdB
 aOni7DK3PhOPuSlIhSJcLUFXH7J8lCs7O/WrcNYh0NlXdIaBM7U8vmUNF
 Ojt5txU2m711bDzOFziYdu4YzLQQiP2550YNe+abV1qoluzFM7RdBF1fJ A==;
X-CSE-ConnectionGUID: WUYsDXquR2G83Lk1Re5lng==
X-CSE-MsgGUID: MbywzoUKTBy64CYG/CWGAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3391314"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3391314"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:43:59 -0800
X-CSE-ConnectionGUID: 2TyuHk+LTTyUp8IGEwLxYg==
X-CSE-MsgGUID: +soDTA94R3aiZQ6e1/2M8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9245444"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:43:59 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/8] drm/{i915,
 xe}: Make unclaimed mmio detection lockless and enable it for xe
Date: Fri, 13 Nov 2026 15:43:47 +0200
Message-ID: <20261113134355.14579-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Make the unclaimed mmio detection lockless (albeit somewhat
more racy), and enable it for xe. Also make TGL+ lockless on
i915 (already was so on xe).

And I tossed in the deinlining of intel_de_{read,write}_fw()
as well because the bloat has been bothering me for a while.

Ville Syrjälä (8):
  drm/i915/de: Uninline intel_de_{read,write}_fw()
  drm/i915/de: Pimp the intel_de_{read,write}_fw() docs
  drm/i915/de: Flatten the unclaimed mmio code
  drm/i915/de: Make mmio_debug lockless
  drm/i915/de: Optimize the mmio_debug checks in intel_de_{read,write}()
  drm/i915/de: Make display registers unlocked for TGL+ on i915
  drm/xe: Enable unclaimed register detection on xe
  drm/i915/de: Nuke driver_is_i915()

 drivers/gpu/drm/i915/Kconfig.debug            |   2 +-
 drivers/gpu/drm/i915/display/intel_de.c       | 220 +++++++++++-------
 drivers/gpu/drm/i915/display/intel_de.h       |  40 ++--
 .../gpu/drm/i915/display/intel_display_core.h |   7 +-
 .../drm/i915/display/intel_display_params.c   |   4 +-
 .../drm/i915/display/intel_display_params.h   |   2 +-
 6 files changed, 152 insertions(+), 123 deletions(-)

-- 
2.56.0

