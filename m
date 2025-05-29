Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1224CC5B543
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 12:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E7710E013;
	Thu, 29 May 2025 12:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYCI0HSN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B2010E013
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 12:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748520337; x=1780056337;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Iiw+fsbhUYss0j1CvAnX15WS8gFWydqzn834a+JY/U4=;
 b=TYCI0HSNKfxhVdbtJPpFvt4KTO2w51PNqVupZvmD6WCtFS4v+AvRZXoP
 Gtoq7Kbx8FyaFAP6mvNG8q7+z1oOkG/LwJu4j7m28hp0ZMW1LbNWqiZPl
 ET/C0ixv3v6aG2LSdIqWR8dLOnOIraBZDd4Xb6cdpol6C2u3x+/gWdtsw
 w33zAj6Gu0Izo2jl8HuHfty0w7CfTom4IMTI8MDii++EdycnRwHrgtlEL
 bM/A4AvJ4rpM/ZwgEDorPfLQfAO1Xr6YepWd2YL38SHBIdF0MWF25QZ9o
 PCUywjc9oGEErdsvZt6Q6JiIj55AVaVDD+A2OBxLsWWyFcRinH1Kot4L/ w==;
X-CSE-ConnectionGUID: bLTUDKkSRDe2/aDIKX8Pig==
X-CSE-MsgGUID: +UsdpXGkSSuQup/gAdBJ0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50461477"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="50461477"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 05:05:37 -0700
X-CSE-ConnectionGUID: loPR6ZLMQuqgHSOdAQmbCw==
X-CSE-MsgGUID: +I9iKRcBRjivajxNkJALvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="148585587"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa004.jf.intel.com with ESMTP; 29 May 2025 05:05:36 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 0/3] drm/xe/bmg: Update PCI Id's and Workarounds
Date: Thu, 29 May 2025 17:35:31 +0530
Message-Id: <20250529120534.531237-1-dnyaneshwar.bhadane@intel.com>
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

Added new PCI's and workaround for xe2hpd/xe2hpg.

Shekhar Chauhan (3):
  drm/xe/xe2_hpg: Add set of workarounds
  drm/xe/xe2_hpg: Add PCI IDs for xe2_hpg
  drm/xe/xe2_hpg: Define additional Xe2_HPG GMD_ID

 drivers/gpu/drm/xe/xe_pci.c        |  1 +
 drivers/gpu/drm/xe/xe_wa.c         | 56 +++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_wa_oob.rules |  5 +--
 include/drm/intel/pciids.h         |  7 ++--
 4 files changed, 48 insertions(+), 21 deletions(-)

-- 
2.34.1

