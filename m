Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E7310F9958
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 15:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AAE10E68D;
	Wed,  8 Apr 2026 15:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eYtiPwrs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEC210E6A6;
 Wed,  8 Apr 2026 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775663869; x=1807199869;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UKPW1nqrHKoKDAYxTe71ut8FvZipFUMp91xCnFEJ3VQ=;
 b=eYtiPwrsuLjzbYj7RjQNov2ED1ltUigDnUk2iy8AT30mfS5gnCeyEoQ+
 UJSkXmM4K33BXqIAZlU58AX4UufICGC2cx12IQjJvYBtr8Laflve+XrD9
 bfBPHSidHHhyNPOYzbHPEk5hfxqnkx7dvZ0Ow4wfu5oCaxrKmbirS7TfO
 0tYfulNsSRBFdKWI5AgshZ/Mno9vTL6U4H/kTKg5d+gP34qgexkF3yNg2
 NwaHtdOmMmCXlJiy9HE5HEmV95aE9TFpxQUwdN/gvwNn2QN5gqUOlRuoz
 SC8CiLrOXpVSztC6+lTLsYq7RaQL+KgnviPWko7mfaulcuiZlgUtnHI4b Q==;
X-CSE-ConnectionGUID: TSqgOBPhTHiD1zp4r+Hq/w==
X-CSE-MsgGUID: si5slWw8QCCxUZ5mOibe6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76542061"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="76542061"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 08:57:49 -0700
X-CSE-ConnectionGUID: Icxw3quVR361Ro7ERR2a8A==
X-CSE-MsgGUID: bSvaZuXNQgKu91bMXMt5Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="228400652"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.73])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:57:47 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 0/2] drm/i915: Make sure CRTC vs. pipe reordering is safe
Date: Wed,  8 Apr 2026 18:57:42 +0300
Message-ID: <20260408155744.13326-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Couple of things to make sure we can safely reorder
CRTCs vs. pipes.

I have another idea to make the joiner modeset and nomodeset
state copy paths a bit more alike still, but that's a bigger
change and clearly not backport material. The simple version
here we might be able to backport if necessary.

Cc: Jani Nikula <jani.nikula@intel.com>

Ville Syrjälä (2):
  drm/i915/joiner: Make joiner "nomodeset" state copy independent of
    pipe order
  drm/i915: Walk crtcs in pipe order

 drivers/gpu/drm/i915/display/intel_crtc.c     | 20 +++++
 drivers/gpu/drm/i915/display/intel_display.c  | 20 ++---
 drivers/gpu/drm/i915/display/intel_display.h  | 90 ++++++++-----------
 .../gpu/drm/i915/display/intel_display_core.h |  3 +
 .../drm/i915/display/intel_display_driver.c   |  1 +
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/xe/display/xe_display.c       |  1 +
 7 files changed, 69 insertions(+), 67 deletions(-)

-- 
2.52.0

