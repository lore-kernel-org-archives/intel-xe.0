Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EB6E7717D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 01:01:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBDB10E0F4;
	Thu, 12 Dec 2024 01:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXuwvq/6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921C610E0F4
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 01:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733965316; x=1765501316;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wODZaXFmA1njwkIJcb8Z6fIvjeQfs9B/DYhYzGkErTo=;
 b=IXuwvq/66INKYSZdNSaICOYVzgbRLjbrWfMcx3FpXA4oO4RdktzlqyWL
 lTgD7T3tYsv6sscyL/YQjVm/0hXTLnpfcBSbom9CZSkMEWfe/kntIJaX6
 wUnUoBJtbo8juzMASt4vdsj8AfSjwR0JImlDSMHv1oTG3fUR1WxPE3eq1
 1fv23wqodlR0MqoDgzAEPANFm5EWBRrjEKYXS6uLylWx0HSuW+H9eGnRb
 12lyVd8iVtdMIUgqNXi1UauFB/AW8SHy5PzWR3bfKcvWQCPxEQIl0Ltlt
 WlP2HjdfmCLqVuycrVogdGAnVImpTBksv58qh37xdqK1y9UsRN+ruOLeG A==;
X-CSE-ConnectionGUID: t64PQ6U8R+OuMWLci3TfcA==
X-CSE-MsgGUID: yc+pi9J5Tj6g48FywCxh0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45379775"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45379775"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:01:56 -0800
X-CSE-ConnectionGUID: gbd6RL+vQaqcA4hPRi6A6w==
X-CSE-MsgGUID: C8owx6fRQjuIO97/rhklIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="126856472"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.89])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:01:55 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 00/13] The xe_sa_manager based GuC Buffer Cache
Date: Thu, 12 Dec 2024 02:01:28 +0100
Message-Id: <20241212010141.389-1-michal.wajdeczko@intel.com>
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

This is another attempt to introduce GuC Buffer Cache [1].
Includes set of improvements to the xe_sa_manager.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

[1] https://patchwork.freedesktop.org/series/139801/

Michal Wajdeczko (13):
  drm/xe/sa: Always call drm_suballoc_manager_fini()
  drm/xe/sa: Drop redundant NULL assignments
  drm/xe/sa: Cleanup internal BO data at device removal
  drm/xe/sa: Drop useless is_iomem member
  drm/xe/sa: Improve error message on init failure
  drm/xe/sa: Tidy up coding style in init()
  drm/xe/sa: Allow making suballocations using custom gfp flags
  drm/xe/sa: Allow creating suballocator with custom guard size
  drm/xe/sa: Minor header cleanups
  drm/xe/guc: Introduce the GuC Buffer Cache
  drm/xe/pf: Use GuC Buffer Cache during VFs provisioning
  drm/xe/kunit: Allow to replace xe_managed_bo_create_pin_map()
  drm/xe/kunit: Add KUnit tests for GuC Buffer Cache

 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c | 335 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.c                  |   4 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  |  69 ++--
 drivers/gpu/drm/xe/xe_guc.c                 |   5 +
 drivers/gpu/drm/xe/xe_guc_buf.c             | 176 ++++++++++
 drivers/gpu/drm/xe/xe_guc_buf.h             |  47 +++
 drivers/gpu/drm/xe/xe_guc_buf_types.h       |  28 ++
 drivers/gpu/drm/xe/xe_guc_types.h           |   3 +
 drivers/gpu/drm/xe/xe_sa.c                  |  71 +++--
 drivers/gpu/drm/xe/xe_sa.h                  |  21 +-
 drivers/gpu/drm/xe/xe_sa_types.h            |   1 -
 12 files changed, 696 insertions(+), 65 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_buf_types.h

-- 
2.47.1

