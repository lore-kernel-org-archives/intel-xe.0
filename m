Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D67CC4725D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 05:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012AE10E50C;
	Mon, 22 Jan 2024 05:49:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7515910E50C
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 05:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705902553; x=1737438553;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ImDmDrDe7QoU+Huj9KvOeYB11ZpvkDDM6Rsj+maV6nk=;
 b=UVDYxwYsTw+gBlmlxRDc0HuRr+Wo9UNQBMcWHO/SZaRdvWr27aMVA2lR
 6tBTxA1+WvFy3TR1DO+yvSVSBhynDWIdQGMP0ae30xKoCnFAtLyRaWZT6
 w1bEQNEVcPfgXc8ySdbO48sy0PWNOC1OrkWMftJEDDSaAsbQ95D0dTJee
 +IafrsXXmBiGdYplYUWqBX0lAmbOGbwdr+fHwyH1XJGE1CzRAYJy0o0yB
 +9xfShZa/VOegjpH2mgF+pYR8CMt8k8RJvLato1qNBsR4/2xnTocW4VAG
 HrT+8GWrgNH3gTvV39UOXrBiHAQ22x7bs1UIAyJI0bCLHaoXycbR/FFn9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="1006869"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1006869"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2024 21:49:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="908835992"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="908835992"
Received: from shekharc-desk.iind.intel.com ([10.190.239.16])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2024 21:49:11 -0800
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/1] drm/xe/xe2_lpg: Introduce performance guide changes
Date: Mon, 22 Jan 2024 11:19:03 +0530
Message-Id: <20240122054904.2111721-1-shekhar.chauhan@intel.com>
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

v1: Add performance guide changes to Xe2_LPG.
v2: Change GRAPHICS_VERSION_RANGE to END_VERSION_UNDEFINED for incorporating future platforms, if any.
v3: Remove irrelevant register changes.

Shekhar Chauhan (1):
  drm/xe/xe2_lpg: Introduce performance guide changes

 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 6 ++++++
 drivers/gpu/drm/xe/xe_tuning.c       | 9 ++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.34.1

