Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F42C982DE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 05:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D862C10E03E;
	Mon, 21 Sep 2026 05:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SWrHCSv6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D61B10E01F;
 Mon, 21 Sep 2026 05:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789969035; x=1821505035;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mdBNc24x7PduKXH2whnzxtPajwedLTmexLe3sQQDBec=;
 b=SWrHCSv65bb+JqycNJq/RS9EmLV0SodyphhnyfKkl18CnrKiuBwwFCmQ
 R4bgMWBOXD8rkETw2Pn3MNZm6FanrlKdLWT9Uxqqw2cUo2InN6DhJsyYw
 FoZx+kRpx35BZwwPUVEH7pdeKfgA/NCKkv5YnMRqBgw0Qjxheb8K5FCoj
 j4qxvvpo5GEoaQ0ZJdc8EvFH272qDdM9WfyKMfc9f+WoeRSSkZXmah9s3
 o74PdNEiCKRNCnpu4Ze9j5X5dpIpmOzOzjeZIbs3jf0hDBQQlQY9VVB9h
 gWA3UALbbxH4hxbvf0tNIdgpvssvceBUTj47xx/hWNHz9eWiCtwEZ4sSg w==;
X-CSE-ConnectionGUID: XEl15FvhSQSYbWYvNnm4ZA==
X-CSE-MsgGUID: VCjoPYWzRjuJ9DoSKNP05Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="966577"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="966577"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2026 22:37:15 -0700
X-CSE-ConnectionGUID: vaIPkGUiTLyYZAbFsFGjvA==
X-CSE-MsgGUID: tY26m867THOYoWEI4hrivA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="300444443"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa001.fm.intel.com with ESMTP; 20 Sep 2026 22:37:13 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 0/8] log DPCD access errors
Date: Mon, 21 Sep 2026 11:07:02 +0530
Message-Id: <20260921053710.1586776-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

Now that all DPCD accessors have been updated to use latest
drm_dp_dpcd_{read,write}_{byte,data} which return 0 on success
and error on failure.
Use that to log errors in debug logs using ERR_PTR().
Note this series sits on top of :
https://patchwork.freedesktop.org/series/174242

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>


Suraj Kandpal (8):
  drm/i915/lspcon: log DPCD access errors
  drm/i915/alpm: log DPCD access errors
  drm/i915/ddi: log DPCD access errors
  drm/i915/backlight: log DPCD access errors
  drm/i915/dp: log DPCD access errors
  drm/i915/linktraining: log link training DPCD access errors
  drm/i915/dptest: log DPCD access errors
  drm/i915/psr: log DPCD access errors

 drivers/gpu/drm/i915/display/intel_alpm.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      | 20 ++++++-----
 drivers/gpu/drm/i915/display/intel_dp.c       | 31 +++++++++--------
 .../drm/i915/display/intel_dp_aux_backlight.c | 29 +++++++++-------
 .../drm/i915/display/intel_dp_link_training.c |  6 ++--
 drivers/gpu/drm/i915/display/intel_dp_test.c  | 24 +++++++------
 drivers/gpu/drm/i915/display/intel_lspcon.c   | 34 ++++++++++++-------
 drivers/gpu/drm/i915/display/intel_psr.c      | 11 +++---
 8 files changed, 91 insertions(+), 66 deletions(-)

-- 
2.34.1

