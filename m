Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D9F606A917
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 20:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ud5nKR4n
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3792E10E7DC;
	Thu, 19 Nov 2026 20:50:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4821410E1BF;
 Thu, 19 Nov 2026 20:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795121446; x=1826657446;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Yww1AufYCiupfPJOWhU3apdVPDoCDCxPlSDVWLyWrlk=;
 b=Ud5nKR4n2YZGDFKrGiAgym/6IBkK7ONPD04cGGNeejNkUDed5vgMU83X
 uU7PM4iU24okqhmopITzjLZJSny66xxUNebgCzQX/CO13ZK0NoBOfdQ5+
 Kw7Wg9PPMgU26U/02vP8hw6cFimU+R4nCBeIqHNHHWM7gKx6Xl6fUt1OA
 dSkOxX6zaOaD5sgQ+wCnC/dr1SoIDR1R/sMvC4YzmnRYZX7LZgRQIXj6M
 589mWGNVsScc/Fs7fFEy9ITrNA9dnZcPwCQW2+hQydP3pnhpWrktpVNpC
 o59pFhzYBTj/+Vl1+4fH665AeuCpbNUaiZE0qhQoMKKLtl9CD/GSc1wPn Q==;
X-CSE-ConnectionGUID: 7eqGEdPhSuyLmF3S19hIRA==
X-CSE-MsgGUID: nQM8V9GNQqi98LRSkswlRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3884334"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3884334"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 12:50:45 -0800
X-CSE-ConnectionGUID: MZZNbngOQ6C13sISYkWNwg==
X-CSE-MsgGUID: xVAZ1EMVQTG6EcFhGCWStg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10524804"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 12:50:43 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/6] drm/i915: Make register accesses and unclaimed mmio
 detection lockless for TGL+
Date: Thu, 19 Nov 2026 22:50:34 +0200
Message-ID: <20261119205040.31935-1-ville.syrjala@linux.intel.com>
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Make the unclaimed mmio detection lockless (albeit somewhat
more racy), and utilize that to to make all register accesses
lockless on TGL+. By using the lockless xe driver on TGL+ we've
pretty well established that serializing all register accesses
(ala IVB/HSW) is not required on TGL+.

And I tossed in the deinlining of intel_de_{read,write}_fw()
as well because the bloat has been bothering me for a while.

I left out the earlier xe parts. Once we land these i915 bits,
we can try again to enable unclaimed mmio detect for the pre-LNL
platforms on xe as well. Theoretically those should be fine since
i915 is fine, but the messed up differences in the init/suspend
ordering between the drivers can cause xe exclusive issues still.
And based on the last attempt we already know that some LNL+ systems
are have broken pure display code paths (eg. ALPM), which will need
to be fixed before we can enable the unclaimed mmio detection for those
platforms.

v2: Drop the xe stuff
    Keep the modparam as int for compatibility purposes (Jani)

Ville Syrjälä (6):
  drm/i915/de: Uninline intel_de_{read,write}_fw()
  drm/i915/de: Pimp the intel_de_{read,write}_fw() docs
  drm/i915/de: Flatten the unclaimed mmio code
  drm/i915/de: Make mmio_debug lockless
  drm/i915/de: Optimize the mmio_debug checks in intel_de_{read,write}()
  drm/i915/de: Make display registers unlocked for TGL+ on i915

 drivers/gpu/drm/i915/display/intel_de.c       | 180 ++++++++++++------
 drivers/gpu/drm/i915/display/intel_de.h       |  40 ++--
 .../gpu/drm/i915/display/intel_display_core.h |  16 +-
 .../drm/i915/display/intel_display_params.c   |   2 +-
 4 files changed, 147 insertions(+), 91 deletions(-)

-- 
2.56.0

