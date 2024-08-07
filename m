Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521DBC3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 13:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBA310E0C7;
	Wed,  7 Aug 2024 13:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SrrATZT0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D2E10E0C7
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 13:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723037246; x=1754573246;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TPTc2e++2keJjjQifidVAyzA1RoiDxps0A82vowX9iM=;
 b=SrrATZT0BkLotINOHUUcKRDsEq71wi2wYEZHNeM2qbpmG6PZUdx5wVsr
 1C+H4qL3EPkyxtuwjUEXvOX1S1AinG8Od0YClmB6pwbPo4lM6X6vWdyBu
 9Gw5GTyWyneR5zE8/9+ffWEN7cVq/VJH+xsP/leM+XXUR8Vgvz3bYn5EH
 JZge2zOIOGMwujVhfi0f4u8l89Eh7XtJ3FAymuMvI+eoZauAHjY21BJ6y
 eK8/NlCnLFCUBPCtBkjI0DkqgNVCUwcPD24ZqnC3DsvGB0bQ+G2ZADmqX
 4NCLkILjNv7Z7hj3jXoIapz5cG5uxpSjHLFw7x4MXGANuxe6Lirww+seQ Q==;
X-CSE-ConnectionGUID: Jb0diCoZTxetduJ4a93ZgQ==
X-CSE-MsgGUID: hqoMdWHORaSvUGFNLO+BEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21247389"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="21247389"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 06:27:26 -0700
X-CSE-ConnectionGUID: +mV5NX/PRuW6fFnxRReTcQ==
X-CSE-MsgGUID: OZNze7K8TACPzEplJaz7RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="94426114"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 06:27:23 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 karthik.poosa@intel.com
Subject: [PATCH v6 0/2] drm/xe: remove GuC reload in D3Hot path
Date: Wed,  7 Aug 2024 19:10:48 +0530
Message-Id: <20240807134050.2048114-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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

Power is not lost when only D3hot is allowed so remove GuC reload in
runtime suspend D3Hot path.

Rev2: Rebase
Rev3: fix review comments
Rev4: fix commit message and kernel-doc
      split patches
Rev5: add runtime suspend and resume pair in CT layer
      fix review comments
Rev6: use xe_gt_WARN_ON instead of xe_gt_assert
      assert and queue g2h handler if g2h head and tail are unequal

Riana Tauro (2):
  drm/xe: modify GuC CTB enable communication
  drm/xe: remove GuC reload in D3Hot path

 drivers/gpu/drm/xe/xe_gt.c     | 33 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt.h     |  4 +--
 drivers/gpu/drm/xe/xe_guc.c    | 53 ++++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc.h    |  4 ++-
 drivers/gpu/drm/xe/xe_guc_ct.c | 36 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h |  3 ++
 drivers/gpu/drm/xe/xe_pm.c     |  8 ++---
 drivers/gpu/drm/xe/xe_uc.c     | 32 ++++++++++++++++++--
 drivers/gpu/drm/xe/xe_uc.h     |  2 ++
 9 files changed, 156 insertions(+), 19 deletions(-)

-- 
2.40.0

