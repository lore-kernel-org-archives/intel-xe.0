Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4342ECAC58E
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 21:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D537810E0A0;
	Thu, 11 Sep 2025 21:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jooyrpis";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80A710EB86
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 21:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757624719; x=1789160719;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2ciKZ3KpNRgJb3K0uQfbXXTOsyA5DI167Yao3+sJctA=;
 b=Jooyrpisoujfr6QKh68DCkZrrOWDi/q2Vko8Ib+CQ9HQijr3ZjV3neSr
 cXSYTVO+vvlKAWX8Hng6ytjcJvs7vTt+qr8TEl3LSqoNfNc5ZBksHo5an
 pQVPDEyTvb7lkyR3tDL5wtNgGOUXDZoNGQ4oPEJ+l0y+C8Y3ZKMzV9TNd
 GbIjKFi2JxZtT054FgRD4v9HnPop0RN2Pf6Oj7oPFtoIP5m2HZUBkIbpm
 3hXteCmVPYhzD06G1cOR+7IUne9Ws+2HU8yFnjwciDFybT/KVDdATIM29
 hMQLJMxD2Vdwg1PMAeKOzEqocvc5Kw5by08uOC3FOD75RmCBooijy8Deq g==;
X-CSE-ConnectionGUID: QKDFgMZoRhK5U+/AnNXaWA==
X-CSE-MsgGUID: ae1kQi5sRYqBjnPLB9ZT6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="71070349"
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; d="scan'208";a="71070349"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 14:05:18 -0700
X-CSE-ConnectionGUID: cpKvS3CnRMmc2Ee07FAFEA==
X-CSE-MsgGUID: XsQ5EbISTieutjbEiwG/hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; d="scan'208";a="173361315"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa007.fm.intel.com with ESMTP; 11 Sep 2025 14:05:17 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 0/3] Add WCL as subplatform from PTL
Date: Fri, 12 Sep 2025 02:35:11 +0530
Message-ID: <20250911210514.389014-1-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.51.0
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

- Add WCL as subplatform and update the definition struct. 
- Update condition required to distinguish WCL C10 PHY selection
on port B.

Dnyaneshwar Bhadane (3):
  drm/pcids: Split PTL pciids group to make wcl subplatform
  drm/i915/display: Add definition for wcl as subplatform
  drm/i915/xe3: Restrict PTL intel_encoder_is_c10phy() to only PHY A

 drivers/gpu/drm/i915/display/intel_cx0_phy.c        | 11 ++++-------
 drivers/gpu/drm/i915/display/intel_display_device.c | 13 +++++++++++++
 drivers/gpu/drm/i915/display/intel_display_device.h |  4 +++-
 drivers/gpu/drm/xe/xe_pci.c                         |  1 +
 include/drm/intel/pciids.h                          |  4 +++-
 5 files changed, 24 insertions(+), 9 deletions(-)

-- 
2.51.0

