Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA4CC87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 17:49:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804CE10E222;
	Wed, 30 Jul 2025 17:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iphk5J+X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2C610E222
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 17:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753897764; x=1785433764;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kf0tlt6cuLfORkUirv6mNrtSGyTmbfmppSqBi44t6IY=;
 b=Iphk5J+XQa9BrA2AD13cdMw9HFZX6LogdduMBdzXF0P1RWZp7tZxw8tb
 KX7cYUFL4zmuJ7UrAdfsj63Rwr7oJzYB9jtdoxJkEuC2DKVVcXuNM6r/D
 xMAWKZ0Gkpu7hNz/5UrskVvvq5CrV4qZwaoPtgr/+CfWbymJeSnFTy8Ag
 lx9jx1pwDOReHteCVcQnf3VyVeU0sv7n/JmJmMg9wsWHdVDIVAFgrDsSI
 TQueqrLA7EBoN/HXlhVhw9LVMgpEUn1pfclI1YLBvppeDOSLMdAcQjb+Q
 Cl8d6xLzZShFOLQGfRcTZDe5QSLR8alExUxLHLpRuEqjAtGOLGqnDoz5V Q==;
X-CSE-ConnectionGUID: TnmgJcZ3Q5y0BJt8/PvH2g==
X-CSE-MsgGUID: 4Jz9cIjXRFiIDERMym/50w==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56297912"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56297912"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 10:49:24 -0700
X-CSE-ConnectionGUID: lVuTXn6VQjmdQ2XNMn4dvw==
X-CSE-MsgGUID: In8VR/XJS/SN8cFMhytVow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="186744668"
Received: from jroznova-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.96.116])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 10:49:23 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/3] Misc PF improvements
Date: Wed, 30 Jul 2025 19:49:10 +0200
Message-ID: <20250730174913.178434-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (3):
  drm/xe/pf: Disable PF restart worker on device removal
  drm/xe/pf: Make sure PF is ready to configure VFs
  drm/xe/pf: Don't resume device from restart worker

 drivers/gpu/drm/xe/xe_gt_sriov_pf.c         | 79 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h         |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |  4 +-
 drivers/gpu/drm/xe/xe_pci_sriov.c           |  7 +-
 drivers/gpu/drm/xe/xe_sriov_pf.c            | 27 +++++++
 drivers/gpu/drm/xe/xe_sriov_pf.h            |  1 +
 6 files changed, 113 insertions(+), 6 deletions(-)

-- 
2.47.1

