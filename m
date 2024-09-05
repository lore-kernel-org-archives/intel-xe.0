Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84183CD4F50
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 05:14:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EAA10E023;
	Thu,  5 Sep 2024 05:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0ybqhv4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877FC10E023
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 05:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725513259; x=1757049259;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mlys/B6EOxADkfHMN+Uoo3p/1WE3ap/+Hv6GMvkWmUo=;
 b=j0ybqhv4vNpBuFVnqJ7/KOeIU1/2RwTnLUe2uHj9znLcN2ZEmQSiDThx
 uHETRJJbgGAaJHJuRXajGCDSZMDOV2fzaN7fW8G5i+QITjdWXNTg9TgFY
 NAvvFR4Fh+prVL6pzZ7bFd2LrzNUKtd8CMcCMSfzd906pTTrhe90yTGIR
 lGS9eLvc+6Y2x4R91zPkOcUj6f3HJ6QqfilFerMVeje15FIndK+lyIvc4
 sYCnElAhvY7LBX2vUz5569+bLeM7BLISD+NJcN6FRfRYf4nXX+nd13fpc
 A3A7b8Xn3gP64dFywUPvU+9OfZSNYjD1oJf5nAEkGoHdLIcn/N2jtrRWi g==;
X-CSE-ConnectionGUID: pnhoWVhNSGasJH73ShsufA==
X-CSE-MsgGUID: 3y883eNnTsSGmEYWSMnbxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="23717408"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; d="scan'208";a="23717408"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 22:14:18 -0700
X-CSE-ConnectionGUID: Ut5TTsceT3qGs6aNlSnDSA==
X-CSE-MsgGUID: SfsCrF08QzKrHVYKN82pZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; d="scan'208";a="65519311"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 22:14:16 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, badal.nilawar@intel.com
Subject: [PATCH v4 0/2] drm/xe/xe_gt_idle: add debugfs entry for powergating
 info
Date: Thu,  5 Sep 2024 10:58:11 +0530
Message-Id: <20240905052813.4169007-1-riana.tauro@intel.com>
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

Add debugfs entry for powergating info

Rev3: do not wake GT if in C6 to read powergating info
Rev4: modify condition to enable powergating

Riana Tauro (2):
  drm/xe/xe_gt_idle: modify powergate enable condition
  drm/xe/xe_gt_idle: add debugfs entry for powergating info

 drivers/gpu/drm/xe/regs/xe_gt_regs.h  |   8 ++
 drivers/gpu/drm/xe/xe_gt_debugfs.c    |  13 +++
 drivers/gpu/drm/xe/xe_gt_idle.c       | 115 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_idle.h       |   2 +
 drivers/gpu/drm/xe/xe_gt_idle_types.h |   2 +
 5 files changed, 133 insertions(+), 7 deletions(-)

-- 
2.40.0

