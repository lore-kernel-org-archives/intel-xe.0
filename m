Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F201C61DCB
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 11:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED86910F333;
	Fri, 28 Aug 2026 11:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ndhRz38p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E3A10F333
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 11:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787916686; x=1819452686;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LvS+VEsMl858wO4DsfEeF7dD8CwUfq4STTLex31CthU=;
 b=ndhRz38pAsrFxCdHR1ak7XpBh5sLukSSlDR2yqGRn8179g2Yy01Ucyna
 wuwQ/3rEPfb4bxMd4cQ+dQ+cCtgqZvf8IRE6pA7Fp3GyzotcmyzTkOOFv
 fUjLmTBvRHWV+IJ+DKMLueI/Hlxnca6pPfXrr2d6JJ3jONGHeKsYAPlLM
 3nut9qnbNHmNB+FnEpzubqIH4+ZfO0VKJT+7jOE8aKj0qe4Whn452FZB0
 kYDnmi+1UfUCGUfR7B7bzh1X5HxEaguqGpcM5wEsgggszMWHsrqqAdw3R
 uCICjNoUAGlnhTsal+dSILp0MqoQWpnZr+fMEt/2GjlGOGLfmxt/1yByI A==;
X-CSE-ConnectionGUID: DoBOpWMgTeuKxd5JNmsDOw==
X-CSE-MsgGUID: prtIqFV1TLKKRxkoi94vrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="113957089"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="113957089"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 04:31:26 -0700
X-CSE-ConnectionGUID: GkDYvnZ2Rt+nJ4AEaXmgmA==
X-CSE-MsgGUID: naJiMa8FQRewWLxCBxD2lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="306338263"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 04:31:24 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, matthew.d.roper@intel.com
Subject: [PATCH 0/2] Xe Pci error handling fixes
Date: Fri, 28 Aug 2026 17:01:05 +0530
Message-ID: <20260828113104.319843-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Wait for device to be ready by checking if pcode initialization is
complete before accessing device. Also do not access device in teardown
path in an unknown state.

Riana Tauro (2):
  drm/xe/xe_pci_error: Wait for device to be ready post reset
  drm/xe/xe_ras: Skip GuC reset post SBR

 drivers/gpu/drm/xe/xe_device.h    | 5 -----
 drivers/gpu/drm/xe/xe_guc.c       | 5 +++++
 drivers/gpu/drm/xe/xe_pci_error.c | 6 +++++-
 3 files changed, 10 insertions(+), 6 deletions(-)

-- 
2.47.1

