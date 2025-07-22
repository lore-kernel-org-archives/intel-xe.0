Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27822C83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 18:26:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E210110E6FA;
	Tue, 22 Jul 2025 18:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqHtNCJk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE4910E6EE
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 18:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753208790; x=1784744790;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f8R3NnhTkrzIfzPjshJyOaCHDRVejZ8Rf4e2CoudO1g=;
 b=dqHtNCJkwywPH8GOFj6kftoK3QjuicaFnSacP69GDTbWre7ZmYWuA2Cq
 d57Ln8CeWaYaZHByps9cjV5vcpa17YTv1c/bY1xEKzYIisMOBlvZkr4Qg
 DW9WhdSYxOzbE5+j+4O5U70HYcYVCdlmt8TfiDViFkM11e09XRxC56Ymy
 lziMBxgKRnTdqas7Y/BqR1iiLtoEJh6VmDUwwRmxtjqDCnDYRloDfqP3P
 kWbKXFYLBM6FUIPGfD9gjVFpm60RsLfZj2sXjhv5qQ4rVO/Evm1VjnalL
 3my6oXS8FX4ueAANN7E4MqB1VQkeGCOkqKHcEP0412SnYzYLrxl9LcvSB g==;
X-CSE-ConnectionGUID: tNlCNuqsSVCUFgpmf6zv8A==
X-CSE-MsgGUID: QU1P9dYWTheFRjwp9GW9qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66045748"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="66045748"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 11:26:30 -0700
X-CSE-ConnectionGUID: 1frXoLVURXum+xkNIIRTXQ==
X-CSE-MsgGUID: Ony0582uThGEJlcxhNNefg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="159308213"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 11:26:29 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/4] SR-IOV promotions
Date: Tue, 22 Jul 2025 20:26:14 +0200
Message-ID: <20250722182618.30811-1-michal.wajdeczko@intel.com>
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

Promote CI topic patch and unconditionally enable SR-IOV support for
ADL, ATSM and TGL (all require force probe anyway) plus the PF mode.

Michal Wajdeczko (4):
  drm/xe/for-CI: Revert "drm/xe: Enable SR-IOV for ADL/ATSM"
  drm/xe/pf: Enable SR-IOV PF mode by default
  drm/xe: Enable SR-IOV for ADL/ATSM
  drm/xe: Enable SR-IOV for TGL

 drivers/gpu/drm/xe/xe_module.c | 6 ++----
 drivers/gpu/drm/xe/xe_pci.c    | 9 +++++----
 2 files changed, 7 insertions(+), 8 deletions(-)

-- 
2.47.1

