Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1AEC71136
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 17:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E5B10E072;
	Tue, 17 Jun 2025 17:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XFQ4FvkN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5191810E072
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 17:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750180911; x=1781716911;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GVoEAocgG7sa3M/U6pe/qxvd3vPNC4vFCWa0t3/ptts=;
 b=XFQ4FvkN9JFhRpjlVUV6c2VIokeVQbpzW5dzcsFD3T5UzMdRZ4G4NIdP
 szktkypVuI8kQ2sLv+e4X7eSvZ6gvpY6tyVhtbu9YCDOh7voSiR17eArU
 Kg0B58Mlp0aVq5PFgejH24xJuJzCHTkkiiAJnYQz0n/qo+YIORXy4TdnT
 T47RHg3XUAPbQ7kKhIMgDj2ovyxAju2aXnyceE8OMnjAni1yXYnvYfMIV
 qwC17LQc2/FT9VeFszKzLYYyaF7pzqcdx/n4KFUcGmCb1moixj1O/cSsP
 L2f5mgNnVhUFoc2ft5CpeZLwgfevchZNaQd04Cn6uZ3jb9ZklqTLvAtOY w==;
X-CSE-ConnectionGUID: irDtbkn6T/+2cVZsQLcDJg==
X-CSE-MsgGUID: oczhN3rESGWB2NfH6z2GYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="77774351"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="77774351"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 10:21:51 -0700
X-CSE-ConnectionGUID: 08FoWHjlQpCPYNbXt6FVeA==
X-CSE-MsgGUID: hkNR0+rkTn68KQK/Xi71kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="153796178"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 10:21:48 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com,
 ashutosh.dixit@intel.com, riana.tauro@intel.com, jani.nikula@intel.com
Subject: [PATCH v4 0/2] Add debugfs node to expose G-state and pcie link state
 residency
Date: Tue, 17 Jun 2025 22:45:58 +0530
Message-Id: <20250617171600.2905682-1-soham.purkait@intel.com>
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

 drivers/gpu/drm/xe/regs/xe_pmt.h | 10 +++++
 drivers/gpu/drm/xe/xe_debugfs.c  | 71 ++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

-- 
2.34.1

