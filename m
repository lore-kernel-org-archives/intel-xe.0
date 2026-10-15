Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E49ECCA462
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 23:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF7110E08E;
	Thu, 15 Oct 2026 23:33:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3631B10E08E
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 23:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792107216; x=1823643216;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vLkddcILGvIdkrhiCZW/EqFM3j+qjz1BfAXRzXN2554=;
 b=Hy9iRXWPsbLOxwOt8jDn4KFG3WFlSI7ZFwgczBC9BdpJAIXYPGmKwSDJ
 VWqpdoeJEI/9lEik+FyTLRPufU809HshG68426mPxbCqp05z1hZ4hcnMs
 CtufPCZCDkjF69kimCRWMv+dWCv06scoCiP3rFLb3Tb8F6eRsf6ehIb7d
 IF5RO6Zkzpp2xwbYZg6W3rF9pXU+QDzAKCdVnMgU2Y5Q9FvVF8Ixac4p3
 F3K3an7S/mUWmOONgqeATcBc7uXHFHmd/QxewCq9HOfMEiW+aqAukFCU7
 N2PJkvXzxPuQrp1kF/vaU5L06gmKmLmozHEb9ISOWzLV+fRfqMdB2uRTE Q==;
X-CSE-ConnectionGUID: k8brM/0sT2yNTUh2y1BYXQ==
X-CSE-MsgGUID: sNGl8fdoS1aJ0Vi0RfAbzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="891333"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="891333"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 16:33:35 -0700
X-CSE-ConnectionGUID: dHT273USTaqj88ikKK7Glw==
X-CSE-MsgGUID: xL6kxUHWRoO2EqSzI25gXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1814556"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by fmviesa004.fm.intel.com with ESMTP; 15 Oct 2026 16:33:34 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 0/3] drm/xe: Some d3cold related fixes
Date: Thu, 15 Oct 2026 09:54:52 -0700
Message-ID: <20261015165451.154495-5-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.53.0
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

Toggle d3cold allow flag and wait for pcode init before accessing
MMIO.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (3):
  drm/xe: Toggle the D3Cold enable flag at runtime resume
  drm/xe: Access MMIO after pcode init
  drm/xe: Memset g2g buffer on resume

 drivers/gpu/drm/xe/xe_gt.c  | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h  |  1 +
 drivers/gpu/drm/xe/xe_pci.c |  3 +++
 drivers/gpu/drm/xe/xe_pm.c  | 12 ++++++------
 4 files changed, 28 insertions(+), 6 deletions(-)

-- 
2.53.0

