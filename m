Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D444BC5DF9C
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 05:43:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8776310E011;
	Tue, 25 Aug 2026 05:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2TTO+01";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395D010E011
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 05:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787636625; x=1819172625;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y6GYOA0LrYUyP/W7Y/pMK8wJwKtz3hrhBChYcDsJdtU=;
 b=j2TTO+01pXihwtsd61Vo+0mdcvbUFfWB6xF2YN3bsJwOchuR601lP16+
 G2wi2xou9zHcZl/Jn8AQPngQMEgu9h5kqhwydnsZ0rBivfwYWGborDIsG
 0ir3BqvktAGK7lB52jRn937nq12G0ofqn1BaEZk19s5aynxC5QYU902Ns
 uQpa01mbPVsqXJGtaPcnyFnppdwNODyuw3/Z2ehApsEYqtH6YVVyS9qk4
 dSgVC/MHEoluLehh6NwC1pmD0+qV+YB9SkSwpQnoCwtCZU7Zjf+npFF4p
 wYxsWkV1IKOFsGXbm4rfLb1un8ErfuQ5MJ34BgZd7qIx1rlQu+YWycQXL A==;
X-CSE-ConnectionGUID: a2YMMod5S7KSAxsA1+Zrag==
X-CSE-MsgGUID: R/M/r/CnTfuYLNu5mxZ4/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88112042"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88112042"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 22:43:45 -0700
X-CSE-ConnectionGUID: zRJeCF0qRdS8DdsPFGJwgA==
X-CSE-MsgGUID: qRMawO2pSxmWTSM7usLUQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="272418200"
Received: from unknown (HELO jraag-Z790M-ITX-WiFi.iind.intel.com)
 ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 24 Aug 2026 22:43:40 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: dave@stgolabs.net, jic23@kernel.org, dave.jiang@intel.com,
 alison.schofield@intel.com, vishal.l.verma@intel.com, djbw@kernel.org,
 iweiny@kernel.org, ming.li@zohomail.com, bhelgaas@google.com,
 rodrigo.vivi@intel.com
Cc: linux-cxl@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 lukas@wunner.de, riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 0/2] Export pcie_aer_is_native() to AER namespace
Date: Tue, 25 Aug 2026 11:12:49 +0530
Message-ID: <20260825054312.1319951-1-raag.jadav@intel.com>
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

This series adds xe driver as a new user of pcie_aer_is_native() and
changes pcie_aer_is_native() export namespace to AER instead of CXL.
Detailed description in commit message.

v2: Change pcie_aer_is_native() export namespace to AER (Lukas)

Raag Jadav (2):
  PCI/AER: Export pcie_aer_is_native() to AER namespace
  drm/xe/ras: Enable SGUnit PCIe error reporting

 drivers/cxl/port.c          |  1 +
 drivers/gpu/drm/xe/xe_ras.c | 14 ++++++++++++++
 drivers/pci/pcie/aer.c      |  2 +-
 3 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.43.0

