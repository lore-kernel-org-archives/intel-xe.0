Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341CCCA6002
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 22:23:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE66310E6EB;
	Wed,  7 Oct 2026 22:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJCJyh7/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44F210E6D2;
 Wed,  7 Oct 2026 22:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791411799; x=1822947799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O28imWIn3mGs4xCeYzyuZ6ieOe9ddKdncD1qqHUEYnQ=;
 b=MJCJyh7/GJPegHRsLiMUPqVuaZ9VHRlvZffC1j9mSUwUlDb4UJt9XUc6
 jfsvrXfEIesTfxDLmG/BYfOB254x6mbRhLX6cApwg2iU18jXk8Z0Y0+kR
 MnHyeSr26UytqNHjOQrp9eHaHAWdIo89sKXnVmIod5tensFDVbtaDXZKm
 typxnpIS9eDWfY/YXg0u+45Cj0xNiHxeOHj69wmpQhbizpueyNAOd+miY
 pvoHXUwf43hsrp6wFRVaWdmiziQCTey1x48UqmPfTuV6vsWypDFhwq5jb
 EPVIHo6mAWpwu38mlnNwDhKIWF/SEzaggLrK7JIzbED2EA77NnMPRK6xw A==;
X-CSE-ConnectionGUID: 8IqmpWL3SFeVx3gzkSi6FQ==
X-CSE-MsgGUID: nPcsc+bpTzKVNbo1IezG3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="84691"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="84691"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 15:23:19 -0700
X-CSE-ConnectionGUID: DUcsxqRBRQWdAjPi4AQv+g==
X-CSE-MsgGUID: YKXK1ynzQLC2X0HQf8kJyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="1590855"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.62])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 15:23:17 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/5] drm/i915/gmbus: Fix PTL+ i2c bit banging
Date: Thu,  8 Oct 2026 01:23:09 +0300
Message-ID: <20261007222314.5714-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

Fix i2c bit banging on PTL+, and clean up some other warts
from the code.

Ville Syrjälä (5):
  drm/i915/gmbus: Stop frobbing with pin direction in
    .getsda()/.getscl()
  drm/i915/gmbus: Handle the internal pullup disable bits more sensibly
  drm/i915/gmbus: Reorder the PNV clock gating GPIO w/a
  drm/i915/gmbus: Fix i2c bit banging for PTL+
  drm/i915/gmbus: Remove the INTEL_DISPLAY_WA_16025573575 leftovers

 .../gpu/drm/i915/display/intel_display_wa.c   |  13 --
 .../gpu/drm/i915/display/intel_display_wa.h   |   1 -
 drivers/gpu/drm/i915/display/intel_gmbus.c    | 118 ++++++++++--------
 3 files changed, 68 insertions(+), 64 deletions(-)

-- 
2.55.0

