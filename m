Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6383C54798
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 07:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5486510E0F0;
	Thu, 29 Feb 2024 07:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aJvoRBT5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600A310E0F0
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 07:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709190482; x=1740726482;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z0OKDmLKoNgfEj35cupzPS5tgXNeHhCJQohRjorG3UA=;
 b=aJvoRBT5P0Xwdi76kglQBNofFtwO1k/3MQ5RnLinl0ZLVoTSrjaOxXsB
 bvXW44X6T8/dpKgyjHel5NWwsyksq7YWH0AvOUj8BszKb5yFH6A0zibGP
 VIuO/Jgl+Fhw8TuFzslv8ZCMNct9IJl7lOp+K3n1qoIdMX0q+HPsbEci/
 NpviJIkYvxEdVwpqvU9v5z/znKwA5Y4P0dxBCOWgvFuFVbCQIhxmaLsR7
 DiQSUxp4TpiLgKv39VMdtu8pAfafkOuI6DiziONysdnkImApROdpDP8kF
 Vh4JvYSKepKaR6RpWY2hCwh9IbvOVqwyNW6+Jj6Ma/xJA4Df4tEYOaU+Q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="29073964"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; d="scan'208";a="29073964"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 23:08:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="8149824"
Received: from pltuser2-ms-7d25.iind.intel.com ([10.190.239.58])
 by orviesa006.jf.intel.com with ESMTP; 28 Feb 2024 23:08:00 -0800
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH V1 0/3] drm/xe/arl: Add Arrow Lake H support
Date: Thu, 29 Feb 2024 12:38:03 +0530
Message-Id: <20240229070806.3402641-1-dnyaneshwar.bhadane@intel.com>
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

These patches includes the new PCI ids and support of workarounds
for ARL-H platform.

Graphics version 12.74 (which is technically called "Xe_LPG+") should
be handled the same as versions Xe_LPG 12.70/12.71 by the KMD.

Dnyaneshwar Bhadane (1):
  drm/xe/arl: Add Arrow Lake H support

Matt Roper (2):
  drm/xe/xelpg: Recognize graphics version 12.74 as Xe_LPG
  drm/xe/xelpg: Extend some workarounds to graphics version 12.74

 drivers/gpu/drm/xe/tests/xe_wa_test.c | 1 +
 drivers/gpu/drm/xe/xe_pci.c           | 1 +
 drivers/gpu/drm/xe/xe_tuning.c        | 4 ++--
 drivers/gpu/drm/xe/xe_wa.c            | 8 ++++----
 include/drm/xe_pciids.h               | 3 +++
 5 files changed, 11 insertions(+), 6 deletions(-)

-- 
2.34.1

