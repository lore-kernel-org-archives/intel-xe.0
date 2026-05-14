Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEB4CD4851
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 15:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F1A10E166;
	Thu, 14 May 2026 15:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="luAgEWLA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C250510E166
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 15:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778770821; x=1810306821;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hFjDbBrGiHyeDuS1n9gD/lwoB6XykbXCB+tYxSc2n10=;
 b=luAgEWLAD4KLri8gTZKYBNLbgE1f6SxjyXfG6BlIj2c1J23/GYtISWC6
 IUxcItc0+BN2LqELvQ8IhHTBNiDNhITxa0qYIhWftLKj0uux18QAO7ZHl
 tpgxrBGwQRO/dCF0N5ajadRb5tx0SyFieChu6gRLBLHFJ/IJdpq48uhjb
 q610sVhBmwmv1SI2H3pDXks6hT5S8QWkvpDMbJhpdxp2bzi9B1tpTfMMn
 fcJ2U2Jjs7nhnvhUppqpVVENavMbzTRwZLF8Wn/OZozCOsNEK5vtoPrvR
 7VQdbpaF6w9nO6/B6gVvxxMUODCtI2vym+RAEhf/g1Ds0NKOQrYG/5cl7 A==;
X-CSE-ConnectionGUID: YkcZNr4ySiitRnK7Qno+bA==
X-CSE-MsgGUID: 9O2IU6E5TdGXGxLjdpcbsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91178814"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="91178814"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:00:21 -0700
X-CSE-ConnectionGUID: E1/XgxsJRXepA92Wz9uN7A==
X-CSE-MsgGUID: PxnPnqnuQDqYB+Xc5RH2nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="262152847"
Received: from johnmoon-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.112.169])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:00:19 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Ilia Levi <ilia.levi@intel.com>
Subject: [PATCH 0/9] drm/xe: Refresh MEMIRQ code
Date: Thu, 14 May 2026 17:00:01 +0200
Message-ID: <20260514150010.7123-1-michal.wajdeczko@intel.com>
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

Cc: Ilia Levi <ilia.levi@intel.com>

Michal Wajdeczko (9):
  drm/xe: Add IRQ page to HW engine definition
  drm/xe/memirq: Make page layout macros private
  drm/xe/memirq: Update GuC initialization and IRQ handler
  drm/xe/memirq: Use IRQ page from HW engine definition
  drm/xe/memirq: Reduce buffer size
  drm/xe/memirq: Update diagnostic message
  drm/xe/memirq: Dump all source pages if MSI-X
  drm/xe/memirq: Drop cached iosys_map for MEMIRQ mask
  drm/xe/memirq: Drop cached iosys_map for MEMIRQ status

 drivers/gpu/drm/xe/xe_hw_engine.c       |  11 ++-
 drivers/gpu/drm/xe/xe_hw_engine_types.h |   2 +
 drivers/gpu/drm/xe/xe_memirq.c          | 118 ++++++++++++++----------
 drivers/gpu/drm/xe/xe_memirq_types.h    |  13 +--
 4 files changed, 83 insertions(+), 61 deletions(-)

-- 
2.47.1

