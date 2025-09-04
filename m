Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D31ACA1002
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 09:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0268910E9C6;
	Thu,  4 Sep 2025 09:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kRqjPlP4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0985410E9C6
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 09:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756977327; x=1788513327;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hmwpHOQHQFnv/0DaGWzxzRG5taYWope9Mf8/uIOkqu0=;
 b=kRqjPlP4wMrU0w2PA6N4J32OlNEyexWsfKOjuG5Flmw3S4Mgg3WZisPm
 3kLdZ0oJkMufSPwQAqbhy9jxNkHu9XBq7fTrcL1t24UqTCJbm4gR75qKB
 /KcPIxZhP4W9Z1bYhg3e7YWGPC3kdj9fKA9Y6plthFrxh5CME3nAJwI/I
 IcetLgPjHZzExkTnv+kZJWaRXH/Sncm6HBPghpKukd857De+Om8VKqJ9p
 jwAiLmO2CLpmaW4ZfbepShFmiLH3mN5KHYLMUjL3oga2xV/25qINOQa1Z
 4oXK5DmHXh+408ZFTm16OWxlQPEQJTxOp432aAzCJPZUfwtFcSaFvpHxF A==;
X-CSE-ConnectionGUID: 8mgzfmiXTryqCJ1D8NxXIg==
X-CSE-MsgGUID: Q3UPMp2SQYCkqVcaewOLNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="84739376"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="84739376"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 02:15:26 -0700
X-CSE-ConnectionGUID: UdVzM0O8S3+CmAoJdjOmuQ==
X-CSE-MsgGUID: W4HZbUkxQOOJ2LiS99CKmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="177101570"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 04 Sep 2025 02:15:23 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 0/2] Introduce GT runtime suspend/resume
Date: Thu,  4 Sep 2025 14:44:37 +0530
Message-Id: <20250904091439.2279352-1-raag.jadav@intel.com>
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

v2: Drop redundant xe_gt_sanitize() and xe_guc_ct_stop() (Daniele)
    Use runtime naming for guc helpers (Daniele)
    Split xe_guc_ct_enable() (Daniele)

v3: Drop redundant logging, add kernel doc (Michal)
    Use runtime naming for ct helpers (Michal)

v4: Split xe_guc_ct_enable() patch (Rodrigo)
    Fix tags (Rodrigo)

Raag Jadav (2):
  drm/xe/guc: Split xe_guc_ct_enable()
  drm/xe/gt: Introduce runtime suspend/resume

 drivers/gpu/drm/xe/xe_gt.c     | 58 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h     |  2 ++
 drivers/gpu/drm/xe/xe_guc.c    | 31 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc.h    |  2 ++
 drivers/gpu/drm/xe/xe_guc_ct.c | 61 +++++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_guc_ct.h |  5 ++-
 drivers/gpu/drm/xe/xe_pm.c     | 10 +++---
 drivers/gpu/drm/xe/xe_uc.c     | 29 ++++++++++++++++
 drivers/gpu/drm/xe/xe_uc.h     |  2 ++
 9 files changed, 185 insertions(+), 15 deletions(-)

-- 
2.34.1

