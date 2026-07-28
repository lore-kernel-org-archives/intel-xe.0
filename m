Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDBBC54F4C
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 14:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8D310E157;
	Tue, 28 Jul 2026 14:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZXY246Bh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F7B10E157
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 14:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785250227; x=1816786227;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YHoS0cT2B14iH0HOd0Uj79cPrPIVd328iT2IMDT/3X0=;
 b=ZXY246BhPC7eces1vw1OfjQe0XMy6kPSenq1CfNHjPl/tVjlTFsErvZE
 188/tPdxT5nxA8auAKqu0pMAUwZQ5IZDoFvJSw2pWSDCiPBVFTIeBtcAm
 qJCI9qniEil00+Lfpqco5nwuohuLcZwrfM3rNYpxTIdTOcIN9Jl6uZ3eI
 ShLsz//oCIOWqCOLdbP6y/fObwr85Es4Atrm3XPkdfmX9Fc7dT63VktYC
 jJZt+a9sbPoS92EWxuq/dnuvXlfa3M851rgehkDAWc/9+te5JpZgZhAh8
 6V91yEGN4wGTl4GjTFyOd3GFBUADtNr+UO0jIjSN0UffnaOQXcahGhrew w==;
X-CSE-ConnectionGUID: kTicXl/bRPq5CaCE6grcBw==
X-CSE-MsgGUID: CN8t4ZKORrm7T6H0P6NIBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="84815352"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="84815352"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 07:50:27 -0700
X-CSE-ConnectionGUID: 1ievYlbfQHKtsV9aIhxtRw==
X-CSE-MsgGUID: Uk5WNSr9RfGsQ2K7RDUPUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="257927539"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.76])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 07:50:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/3] drm/xe/display: remove some redundant cleanup calls
Date: Tue, 28 Jul 2026 17:50:18 +0300
Message-ID: <cover.1785250188.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
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


Jani Nikula (3):
  drm/xe/display: drop redundant intel_hpd_poll_fini() call
  drm/xe/display: drop redundant intel_hdcp_component_fini() call
  drm/xe/display: drop redundant intel_audio_deinit() call

 drivers/gpu/drm/xe/display/xe_display.c | 5 -----
 1 file changed, 5 deletions(-)

-- 
2.47.3

