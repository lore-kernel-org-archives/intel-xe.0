Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC2EC5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 18:17:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1A810E032;
	Tue,  3 Jun 2025 18:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRRP46Tc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94BD10E032
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 18:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748974650; x=1780510650;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kXMjnr+qsIBNnw6Ln2gtW0U2Ai+GMNPIthNVXRGbZO4=;
 b=iRRP46TcZoUYPHvPi6rzAAYlqu407rahp4Lo6ZL8uVMm8fxrL6qRB6+5
 MNWfmbm/ck2rwhHgKQSm23uu6KDQ02c6KqU41TR8vVAdT22nFvqC5OKlO
 GriBskyRbmfrKVjbxsssANgQaaqRbLbs677LPKTfkEelgGuvvfQZu5pfI
 wFL5QGKcqWEmtfvzMyuhfVKgt/TykKNtl6688M6GsP0R6YAQUewicaNmo
 tq5NWV0JDBF1zD0+7NdB8h8ZF4529CmO6vuTzi3M0L5Dyd3xnLJZHW3cQ
 vUA2AhEEBP4U2trEUn9W79gL0rGzPS1EYaN0/UEqYR4vJ5HTZ/XzPk9M3 A==;
X-CSE-ConnectionGUID: ZXoRAfX7SY+ycVKRTjuQgQ==
X-CSE-MsgGUID: N/n+HkucQFSF5sJxQmlYaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="73563214"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="73563214"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:17:29 -0700
X-CSE-ConnectionGUID: FAGx1/nKRB6+4gigzpp6ZQ==
X-CSE-MsgGUID: Mq6tacLbTcWf3wqNCUefjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="145560701"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:17:27 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com,
 ashutosh.dixit@intel.com, riana.tauro@intel.com, jani.nikula@intel.com
Subject: [PATCH v3 0/2] Add debugfs node to expose G-state and pcie link state
 residency
Date: Tue,  3 Jun 2025 23:42:03 +0530
Message-Id: <20250603181205.1680363-1-soham.purkait@intel.com>
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

    This patch exposes G-state and pcie link state residency
counter values through debugfs for G2, G6, G8, G10, ModS and
L0, L1, L1.2 respectively.

Soham Purkait (2):
  drm/xe/xe_debugfs: Exposure of G-State and pcie link state residency
    counters through debugfs
  drm/xe/regs/xe_pmt: Macros for G-State and pcie link state residency
    offset

 drivers/gpu/drm/xe/regs/xe_pmt.h | 10 ++++
 drivers/gpu/drm/xe/xe_debugfs.c  | 99 ++++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+)

-- 
2.34.1

