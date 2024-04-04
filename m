Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39739CD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 15:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E219113280;
	Thu,  4 Apr 2024 15:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZedSfCU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92279113280
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 15:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712246205; x=1743782205;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2bFhGRNQaZK56ciFDsk4F3c+VvriERtjBLPkU0JKYmo=;
 b=EZedSfCUMLM/ShAdf+rSqBizIUXjXAcKdQ0y8RByeg24z0QPL+ZThUzF
 xfWSgFHqC1BrlUvnqk4cPVG0cKS4HmrqDVUof1un8sUg0pmUNCnWH3kaH
 pIUmbgMAxwXor8UyJkh9EYElwf5vp2HfKEfUZf4MKFbgsDElry+KYdNoM
 RkD/mPTlRSXI8xeWHI0y2mXcyHZbHA2i0Hf1sDdQ7QaJJ1jiDNPUEK+E/
 Eesf9Oxi9yxR5CTNORvU55CDp5okAIIw31lDbyBoCQN3ailFv/XqRo7kk
 FfH3YQYYh0+KRjYBsm2+kanRf8137uRI75zImeDNmBBa9Apw0k1wfCQaA Q==;
X-CSE-ConnectionGUID: k72HZkTIQ2q0T2wvHYFzig==
X-CSE-MsgGUID: fR27CniDQuiFZxJG1rEPrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="8119118"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="8119118"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 08:54:44 -0700
X-CSE-ConnectionGUID: hskxeS55T+qHC5MLe6RTDg==
X-CSE-MsgGUID: L6pIHeTGQNW1cugkIMYO9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="41992417"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.158.68])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 08:44:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/3] Add proper detection of the SR-IOV PF mode
Date: Thu,  4 Apr 2024 17:44:28 +0200
Message-Id: <20240404154431.583-1-michal.wajdeczko@intel.com>
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

SR-IOV PF mode detection is based on PCI capability as reported by
the PCI dev_is_pf() function and additionally on 'max_vfs' module
parameter which could be also used to disable PF capability even
if SR-IOV PF capability is reported by the hardware.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Michal Wajdeczko (3):
  drm/xe: Add max_vfs module parameter
  drm/xe: Add proper detection of the SR-IOV PF mode
  drm/xe: Add SR-IOV info attribute to debugfs

 drivers/gpu/drm/xe/Makefile          |  3 +-
 drivers/gpu/drm/xe/xe_debugfs.c      | 11 ++++
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++
 drivers/gpu/drm/xe/xe_module.c       |  7 +++
 drivers/gpu/drm/xe/xe_module.h       |  3 +
 drivers/gpu/drm/xe/xe_sriov.c        | 17 ++++++
 drivers/gpu/drm/xe/xe_sriov.h        |  3 +
 drivers/gpu/drm/xe/xe_sriov_pf.c     | 89 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf.h     | 24 ++++++++
 drivers/gpu/drm/xe/xe_sriov_types.h  | 15 +++++
 10 files changed, 175 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf.h

-- 
2.43.0

