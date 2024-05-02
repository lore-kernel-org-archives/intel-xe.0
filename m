Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B44C25B10
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 19:56:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD37410F5AE;
	Thu,  2 May 2024 19:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9K7B0VC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA3310F408
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 19:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714679806; x=1746215806;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NxyQ0f65+49quo1YhCfVIIFPhOTDFcOMYkdxrL0eG5k=;
 b=J9K7B0VCEPK4bp8k0sIYXUjTCC0i2EFOKV6qE00rFR5Scgfrp1Jg7Sqr
 ca2B37DC53qZwQYDwTCG3wDPc64a3SYRYlct9EnTeKkyyuXEs4S68XhDI
 muIkwpY894PTD4Fa1YMYZcx2dQlrqzDfOeqoCvA6mjTO7bBbKsaR9OaK4
 Anky1X92GW6q/dv1Thwq9dB30GBi244brzCYDCHayMFpEskhGz8jExAxv
 W+xXdMXPfsFozoHiLg8AuJHSv0AWCZpdtiyoYw2/3y1ztLvUZMJfwtOOR
 QvtQEEohYNYyuCkEEgwhlecQD86PODhl4tH/qlRCoY8kS3l/mrUIJXeqb g==;
X-CSE-ConnectionGUID: /p0EDrLCROKtB11q2CKpQw==
X-CSE-MsgGUID: ZmnZ8onFRbSFpJHAoHdDwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10296664"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10296664"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 12:56:36 -0700
X-CSE-ConnectionGUID: T+6EgxslSE2jGFw6dEuang==
X-CSE-MsgGUID: f2Wn1K9wRJG1f+yvvb+IZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="64670647"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.17.255])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 12:56:35 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 0/2] Define generic helpers for manipulating macro arguments
Date: Thu,  2 May 2024 21:56:17 +0200
Message-Id: <20240502195619.2483-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

v1: https://patchwork.freedesktop.org/series/133123/#rev1
v2: don't pollute linux/args.h yet (Andy, Lucas)

Michal Wajdeczko (2):
  drm/xe: Add helpers for manipulating macro arguments
  drm/xe/rtp: Prefer helper macros from xe_args.h

 drivers/gpu/drm/xe/xe_args.h        | 114 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_rtp.h         |   4 +-
 drivers/gpu/drm/xe/xe_rtp_helpers.h |  26 +++----
 3 files changed, 126 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_args.h

-- 
2.43.0

