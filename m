Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44A0C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 08:43:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8202910E7C9;
	Wed, 26 Jun 2024 08:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R0CkvjQb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400D510E7C7
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 08:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719391402; x=1750927402;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rUfL6XfXV3DL4ug10Ih9D4vBtf47Ihq9HyxXs5ElTq4=;
 b=R0CkvjQb2sfH25nhDcqPPIgZnVONmkJ5A9NQE9W9Uqnhrq/zNXHGe30a
 EKgwLP8+lhV6Hh5WX9itX1oyH16qG9OIfQaJHiGCl7/8vi0wvJoHRGAAV
 LklQzFFTcGZdxTzHVKUdFiEZu3EF6kQhQ9gzzTQ8maWzQRLVINy/crY15
 0CC60Znu8ElIgMMk6LFIS9JmHpQSpgDZUqlUuVkhTHff9RcJGowuDYuFc
 AFAFijxMDgcFDFBDWVu9UMp3JaQXyvx7crnpibEFzziLmJqx4xgVq2PsO
 pMKBhsv5pw4T/iX0wHvdWGri3xt5EbLUpD6jistg/FTNlm7eNNrmc2J4d w==;
X-CSE-ConnectionGUID: ww8fZxXFTEKEnYjd/owEfw==
X-CSE-MsgGUID: tXDiZNxjTnqzDm4hg9aZdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="33982784"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="33982784"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 01:43:21 -0700
X-CSE-ConnectionGUID: mMKpRodPRpmkHE/voRgv9g==
X-CSE-MsgGUID: X+KmZlOLRcy6TkUKUQnCjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="48532636"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.34.68])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 01:43:20 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] drm/xe/vf: Track writes to inaccessible registers from VF
Date: Wed, 26 Jun 2024 10:43:02 +0200
Message-Id: <20240626084304.1345-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

With the HAX to actually test it on the CI.

Michal Wajdeczko (2):
  drm/xe/vf: Track writes to inaccessible registers from VF
  HAX: Try SR-IOV on ADLP/ATSM

 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
 drivers/gpu/drm/xe/xe_mmio.c        |  6 +++++-
 drivers/gpu/drm/xe/xe_module.c      |  3 +++
 drivers/gpu/drm/xe/xe_pci.c         |  2 ++
 5 files changed, 33 insertions(+), 1 deletion(-)

-- 
2.43.0

