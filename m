Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E799C982C1
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 21:58:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CC810E28A;
	Wed, 16 Sep 2026 21:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eotFRgj0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6232A10E28A
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 21:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789595926; x=1821131926;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G1zmupVv/XqYaxmVIuU5MXllOzuwDIhQc8fGpwzQZQ8=;
 b=eotFRgj0Pb7Mrz1sIsxOKpHZzYnfUgZ/xJlEWU+Hcz+HhD7QZ15UtzSh
 cwvgkSvM3ErMD5ugTnHuDxllFCs9vExgbRXHDbNZ2t5/iOrO+Ouf1QQWh
 ejLcII/UyKrA5YQyzJv3ItFEIXvTEBaitJEZXQuWZhN2rCgLyMSU7c/wF
 XMj19zq1EZoPriq+PtCFjDAgZuG+0iIDM/4czZz2xEOX5FaNn9lzOekKB
 ye6bzxLYm8eYnm8KkeAkmQgy1HCK/4ydYJ2ftrrSravvAXukSPULp/lwL
 ShhauLk7nOKiAkjDiJAUj5vhewU9pn5PxLO918hL8oLkTbSKtnq3efe1Q w==;
X-CSE-ConnectionGUID: mGmpjohlSVufPonK07QEHw==
X-CSE-MsgGUID: u5a+WsSNSXiPolDKa43fZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101325120"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101325120"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 14:58:45 -0700
X-CSE-ConnectionGUID: cyb0iwKtQ1i9HK+YSNdH5A==
X-CSE-MsgGUID: T7rVEn/fS86ZK9KTaJxe9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="267247862"
Received: from awalabdu-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.64.211])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 14:58:44 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/3] drm/xe/guc: Add simple KLV decoder helpers
Date: Wed, 16 Sep 2026 23:58:24 +0200
Message-ID: <20260916215827.13488-1-michal.wajdeczko@intel.com>
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

We will need them in the upcoming series, but we can start using them
also now for parsing migration packet.

Michal Wajdeczko (3):
  drm/xe/guc: Add simple KLV decoder helpers
  drm/xe/tests: Add kunit tests for KLV decoders
  drm/xe/pf: Use KLV decode helpers to parse migration packet

 .../drm/xe/tests/xe_guc_klv_helpers_kunit.c   | 303 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c       |  79 +++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h       |   5 +
 drivers/gpu/drm/xe/xe_sriov_packet.c          |  31 +-
 4 files changed, 412 insertions(+), 6 deletions(-)

-- 
2.47.1

