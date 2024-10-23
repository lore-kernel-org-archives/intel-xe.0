Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37B2D0BB46
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 23:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624EB10E873;
	Wed, 23 Oct 2024 23:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g0WSU/Yo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7A610E872
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 23:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729725127; x=1761261127;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qL5rk4jntd9VVai60zHOpTeJH+B5y+xy5CCQoJdvPUA=;
 b=g0WSU/YoX2wlAP2ERnqwGvTuBFLLQAKiXQRt3lCnBOKrc4l+vSAbW1BS
 GcSZqg/QxG3iLkRsGvxjMe6GJxxrDPpvWqgRUrMGy+TVwcZXMV/EOMCNE
 pFLrBwLX9kaTX7khsq5amWHcYDyjAC7Hk+Vgk/wiH1gLbmGykRg5IkLgX
 KmTGJO78NRVKD/5dQ/57IAVXlkNNNfS90fyE8CtbDIvuTPpHuqq0UtEt0
 jly1l3D8wVdqH92i47z+WL629jzWNCMyMNi0/OPrI8Xs2Rv9IriaXDk8b
 ii++qAfDHttIhYtft1nkseoIFiJ0LXOFr5iccjIOWC2bvHoWdoWnc/bDS Q==;
X-CSE-ConnectionGUID: nbcl58cBQdmwatlVYCAbUQ==
X-CSE-MsgGUID: SSjOqAxrQc+w06yYcIIEwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="28775150"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="28775150"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 16:12:06 -0700
X-CSE-ConnectionGUID: hXvkg2qISFySCGbAdb3qPQ==
X-CSE-MsgGUID: BDKu58lhTQqFR8IMPKGpDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="111217961"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.97.255])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 16:12:04 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/5] PF: Add support for VF scheduling priority
Date: Thu, 24 Oct 2024 01:11:47 +0200
Message-Id: <20241023231152.1815-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (5):
  drm/xe/guc: Add VF_CFG_SCHED_PRIORITY_KEY KLV definition
  drm/xe/guc: Add VF_CFG_SCHED_PRIORITY to KLV helper
  drm/xe/pf: Add functions to configure VF scheduling priority
  drm/xe/pf: Allow to control scheduling priority using debugfs
  drm/xe/pf: Adjust scheduling priority based on policy change

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         | 13 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 76 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |  3 +
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |  2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  5 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 25 +++++-
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c       |  2 +
 7 files changed, 123 insertions(+), 3 deletions(-)

-- 
2.43.0

