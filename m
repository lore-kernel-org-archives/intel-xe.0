Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74344C27C7B
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 22:41:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECD910E2C0;
	Fri, 14 Jun 2024 22:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SPBgLkSF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06A010E2C0
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 22:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718404892; x=1749940892;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3pTy93mk6+q0iCnuIX4PBO5CBHzNX93qLxk+GREL5pg=;
 b=SPBgLkSFm9A/7tzdW2fjWkewGc90eNmH1b5nvXEBkx8+kEtA3UWzblsc
 D2EphQV2dW0eaQjo6AuAkOit6DIDo82QUNQnk3MsjtCDkqO30O1fLFbHE
 XM8ID980WWm7Z7YF7sxL1fRtZfw0XDxY9YNXTGBHA5tHYs57LZOa2yUBy
 hi3Gjw6qhwA2Radvl+OLm+uS/lLC7MCEAdSOaNOyNvJ5Z4TTvjtKrRws3
 DjHqofumzWlfE9basz3317N9HQROA8pWEgoc36+La5tH5SAbV1uY/QoA+
 NXDz2FEnfaZaD+40EBq7zBfHhiFRS8Tt18OeQbkE4ANPBSQFDYjGH6QOw g==;
X-CSE-ConnectionGUID: 8RNzb3GrTv+oYCiUx2Wp2w==
X-CSE-MsgGUID: l32RX2oFSo6jO9BVdIlyjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19168475"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; d="scan'208";a="19168475"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 15:41:31 -0700
X-CSE-ConnectionGUID: TA9O8AdwQXmyt2VsT8jJUA==
X-CSE-MsgGUID: gLL7c6cyRD2y9j8w5yZU9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; d="scan'208";a="63842101"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa002.fm.intel.com with ESMTP; 14 Jun 2024 15:41:31 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 0/2] Apply Wa_22019338487
Date: Fri, 14 Jun 2024 15:40:30 -0700
Message-Id: <20240614224032.2965600-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Apply Wa for LNL and also ensure frequency request is raised in the
resume path as well.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (2):
  drm/xe/lnl: Apply Wa_22019338487
  drm/xe/guc: Request max GT freq during resume

 drivers/gpu/drm/xe/Makefile          |  2 +
 drivers/gpu/drm/xe/xe_device.c       |  3 +
 drivers/gpu/drm/xe/xe_ggtt.c         | 22 ++++++++
 drivers/gpu/drm/xe/xe_ggtt_types.h   |  2 +
 drivers/gpu/drm/xe/xe_gsc.c          |  5 ++
 drivers/gpu/drm/xe/xe_gt.c           | 24 ++++++++
 drivers/gpu/drm/xe/xe_gt.h           |  1 +
 drivers/gpu/drm/xe/xe_guc.c          |  4 +-
 drivers/gpu/drm/xe/xe_guc_pc.c       | 84 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_pc.h       |  3 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h |  4 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
 12 files changed, 152 insertions(+), 3 deletions(-)

-- 
2.38.1

