Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEFCC2BD09
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 20:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C12110E22B;
	Mon, 24 Jun 2024 20:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d8I9iTLV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7171E10E160
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jun 2024 20:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719262669; x=1750798669;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yF+rKq3MZH6WSctf+AMWnkzi1PxXyoABA1sBacb8Djg=;
 b=d8I9iTLVkQdmb2yGjCybkBGmhoBz+k1+8eLSXSJmplHP/MlRRCC7Dt2o
 vObH9VI1X2LgVkwvvZXndDQFIgbtI81KiE4kYIkRvn/IxJUfZQovM2HB9
 QnUX6CtXrOxaFWZnyS/gwJNExB2XpmQ8ZXVT/NVqzxHPcb49vY51NaTIg
 4X7B1tODPNbz2z7CHpsjpPNeuCP6QV/3oMn4MjYhM0w+Grpuu2iVxFuJn
 ymlcKQ9QWNe9yZKZRgFFk0P40vWbTXfady9psxvL+7VsqaURiLI2LIivO
 +brUHYGgOTWi8iC8WwPmq0zS1hZhe5hL77tVeWsDh2rp/kNn4edK27ETp w==;
X-CSE-ConnectionGUID: 1pDeprRZST+wivP0kYbG2A==
X-CSE-MsgGUID: URYUTf+ERh2fKm2L1E4l4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="12225345"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="12225345"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 13:57:48 -0700
X-CSE-ConnectionGUID: RfpWObY+T1uohpNr3F428A==
X-CSE-MsgGUID: Oy+GsW5dQz2/DGL44yPsAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="43513557"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 13:57:47 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] PF: Trigger explicit FLR while disabling VFs
Date: Mon, 24 Jun 2024 22:57:35 +0200
Message-Id: <20240624205737.1213-1-michal.wajdeczko@intel.com>
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
  drm/xe/pf: Trigger explicit FLR while disabling VFs
  HAX: Try SR-IOV on ADLP/ATSM

 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h |  1 +
 drivers/gpu/drm/xe/xe_module.c              |  1 +
 drivers/gpu/drm/xe/xe_pci.c                 |  2 ++
 drivers/gpu/drm/xe/xe_pci_sriov.c           | 14 ++++++++++++++
 5 files changed, 39 insertions(+)

-- 
2.43.0

