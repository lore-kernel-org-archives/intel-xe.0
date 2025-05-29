Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1C5C5AD49
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 19:31:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A2510E0BC;
	Thu, 29 May 2025 19:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ekQJV/5Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2959810E755
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 19:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748547096; x=1780083096;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FKktWJV8X2tVramzVFFT4sy3Lo1c6y2ottbjcoTCK+U=;
 b=ekQJV/5QifXAqRk3P5awy7AGrATAEXVgp3+jCzItafaWnErVmMEXzzuS
 cQ6XA3yLm9SuapQHgBUrJiCt2XNboeFGH2YCz3aIbVcn5lkFLjiW4hWqC
 Zfbc1ae7QM4hkjq+9Zd7QWBYGNMeLawycjEkX0q1QC75KzqeXkU/zTkVf
 dtuRu10uprA28+jC5MDvmn9FfSUBujDJqY9CUuloViiGcC5AL16w1z6Hn
 dtbtuzVQZn9+8cAQ6rdLSYaOKkUSaQVsSV0kizBWTVuYnsU4RItKWL50b
 lu1FkqPN488xUZKveD1tZqieFeguAsXZBjuxgZf8sWPNWsjDMaY1vlna9 A==;
X-CSE-ConnectionGUID: TgmRXwNiSPK2OUoFapDc7Q==
X-CSE-MsgGUID: 2A0GEOmCQhuiLY6MyeG5ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="68049944"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="68049944"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 12:31:36 -0700
X-CSE-ConnectionGUID: eroim1wGQvKg6SmJE4rYAA==
X-CSE-MsgGUID: Xs/aqJHAQPi4qUGR+M4UFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="144642012"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 12:31:33 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com, riana.tauro@intel.com,
 jani.nikula@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH 0/3] Add debugfs node to expose pcie link state residency
Date: Fri, 30 May 2025 00:56:17 +0530
Message-Id: <20250529192620.1227468-1-soham.purkait@intel.com>
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

    The changes in the first patch is taken from
https://patchwork.freedesktop.org/series/149026/
Thay are  added only for compilation and does not
require review.

    This patch exposes pcie link state residency counter values through
debugfs for L0, L1, L1.2.

Soham Purkait (3):
  Utility function and macro for telemetry reading
  drm/xe/regs/xe_pmt: Macros for pcie link state residency offset
  drm/xe/xe_debugfs: Exposure of pcie link state residency counters
    through debugfs

 drivers/gpu/drm/xe/regs/xe_pmt.h |  9 ++++++
 drivers/gpu/drm/xe/xe_debugfs.c  | 49 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.c     |  2 +-
 drivers/gpu/drm/xe/xe_vsec.h     |  5 ++++
 4 files changed, 64 insertions(+), 1 deletion(-)

-- 
2.34.1

