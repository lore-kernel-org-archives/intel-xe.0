Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625A4C2BB85
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 18:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087B510E49B;
	Mon, 17 Jun 2024 18:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f41KoPqH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C101010E49B
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 18:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718648735; x=1750184735;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1v1/iXpCn4pO8VgPYnmSz/z0nX8WgzqBswQ2ru7j/FE=;
 b=f41KoPqHBPCggRFTiVWP2m8Nki+znxOJZiybIa5pxRqla4lWi8IxLAIX
 TT9/ywS7rvj2+XhU+AxeewRPhJKOS2Y9ZGsVBSlzYgcBsJgI284C4IQIX
 8UwOV4NMisAjvBHGpv3kJ2xn0vEaRMAkJu4n/sqSTxPcQ1nZyWVpoPlEs
 uNDcFYaEQW2Qd14D0N5M7EVNQthbi57wmJK8xtctZRvvgzT6r43UuD4Uc
 vP+59Fc1X78KjGCyr5lMB+yCZL4CUhhCyJo7NCxWenTJNpKu95N7J/hVs
 auS8oI4ro7X4FG5Ay3T6nNwBuD8b64PE1kb0Ejtfs6UGSiWfJ2Y6/EVA0 Q==;
X-CSE-ConnectionGUID: lM/cm8ezSZmUocvdLDnrxw==
X-CSE-MsgGUID: S7XGsyncSGOwJsv9msZdbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19276229"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="19276229"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:25:34 -0700
X-CSE-ConnectionGUID: 2FcPXwBnSV+/nICypE+Znw==
X-CSE-MsgGUID: sW59h5U8RsaTSp2hGxGp0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="45642430"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:25:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/5] drm/xe/rtp: Allow to OR rules
Date: Mon, 17 Jun 2024 11:25:13 -0700
Message-ID: <20240617182518.280975-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a new match that serves to OR the rules and a few more improvements
around that so we can future-proof Wa_14020756599 as implemented in the
last patch.

First 3 patches are covered by the unit tests, but the last 2 patches
still need to be checked on LNL that I don't have handy right now to
double check we don't have any regression.

Lucas De Marchi (5):
  drm/xe/rtp: Allow to match 0 sr entries
  drm/xe/rtp: Allow to OR rules
  drm/xe/rtp: Expand max rules/actions per entry
  drm/xe/rtp: Add match on any GT
  drm/xe/xe2: Add proper check for media in Wa_14020756599

 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 65 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_rtp.c            | 20 +++++++-
 drivers/gpu/drm/xe/xe_rtp.h            | 55 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_rtp_helpers.h    |  2 +
 drivers/gpu/drm/xe/xe_rtp_types.h      |  3 ++
 drivers/gpu/drm/xe/xe_wa.c             | 10 +---
 6 files changed, 139 insertions(+), 16 deletions(-)

-- 
2.43.0

