Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9C6CA5FCE
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 12:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADA510EC9A;
	Mon,  5 Oct 2026 12:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQ510j4j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D8E10EC99;
 Mon,  5 Oct 2026 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791202998; x=1822738998;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NavfqlaXmztCSJrz670XgvB0HaQmjfcuAf0eFEB7UeY=;
 b=fQ510j4jQeC1gh2zGnAWYjPlN4P6aBCscBn5GBpX+iKuSNoHpC7hVhz8
 sQC8vnAgD7OF01bJ3YDNzTdkDvqHjnCkY9UOfilGzxXXfrI3EAzx/mrXp
 iloLVHpDjOnLtb8MBA0IrOXeb4asMTw6y5MSc1g5HzXnfEBvb9UDDdRk5
 UkJryg7wAvGnpCyJd3jaCVRtd1pZGPQdeOY7yA1HnmZKMjROdHh1hE7vh
 dQQPifpMH0zPTufZpRCZD3YQRfrX8FBGM0Yj3tv8dXwoG2lh605Pck2x1
 mn0w/cQ3djXoVkWbotxSHuvrvjQr4aGzDh2+cD+BwJvP/5CqFw6k/gf/G A==;
X-CSE-ConnectionGUID: 0D7kVL3FRsODKCOYjKE3Wg==
X-CSE-MsgGUID: gkt7a12mQ6SL2/h+aMK4Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="109361040"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="109361040"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 05:23:18 -0700
X-CSE-ConnectionGUID: HX3cGf+xQRelBw2nqvEOjQ==
X-CSE-MsgGUID: CjF0uOzXQDyUVEjfUj9xSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="304763345"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.184])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 05:23:17 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] drm/i915/dp: don't touch the AUX engine while it's still
 busy
Date: Mon,  5 Oct 2026 15:22:07 +0300
Message-ID: <20261005122302.110968-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
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

Hi,

On NVL_S with an LTTPR dock, the AUX engine can stay busy for 10-20ms
after the TC PLL is disabled.  When that happens, intel_dp_aux_xfer()
re-writes PORT_AUX_CTL and re-triggers the transaction while Send Busy
is still set, which the bspecs forbid.  This causes a series of 10ms
errors and can end in a "not started" WARN, as reported in:

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9090
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9092

The first patch gives the engine up to 100ms to finish and, if it's
still busy, returns -EBUSY without touching the register, leaving the
retry to the DRM helpers.

The second patch avoids reporting the expected busy state on the retry
as an error, while still reporting an unexpected busy channel.

Please review.

Cheers,
Luca.


Luca Coelho (2):
  drm/i915/dp: don't touch the AUX engine while it's still busy
  drm/i915/dp: only complain about a busy AUX engine when it's
    unexpected

 .../drm/i915/display/intel_display_types.h    |  2 +
 drivers/gpu/drm/i915/display/intel_dp_aux.c   | 92 ++++++++++++++-----
 2 files changed, 71 insertions(+), 23 deletions(-)

-- 
2.53.0

