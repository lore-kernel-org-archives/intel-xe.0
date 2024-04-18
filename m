Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271E1C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 15:28:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A423410EFA1;
	Thu, 18 Apr 2024 15:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="buXMCeYJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9198810EFA1
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 15:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713454089; x=1744990089;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bVzR+rRFs2+yMa6GD/fDSAIKGBaAbJoVvodQ7nnJSsM=;
 b=buXMCeYJRuM1Mw3gZG5ANec0I8EKN7i635jDf5e3cTl1s+84p8P8b6Id
 LYlub2AKewE5oV0oO57M0Ftw767wTJ9aDoU4dXD3WTWj2XJ7VRhA1DJQb
 sznLZ2AVq5PKBfXzKje+si8N7Xy17nxWS86/GXIipfGf+Mz74HEO4qC6K
 vIcxDniTeXATC/7CinwTU0HXSsRjbLKNJUtGQIh4NpUOFqpeFcghNqIIe
 EM1cNQxWVEJp+OIgPtWTEO9t+s5aw1J5XzmNlwdTpFlUiZu+fVB6MasY2
 jKmyaZLPrQWiYPZXtkyx3ty+GIg8tm8ajhgi4x1SC/hsRExgGs8ahTii0 A==;
X-CSE-ConnectionGUID: pJqy9YgLSpmY/Ydie4+KiQ==
X-CSE-MsgGUID: xrfwAJFtTVqmtF9ui3LLIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8873715"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="8873715"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 08:28:09 -0700
X-CSE-ConnectionGUID: tg0jV4W1TRS//BmnGskRHA==
X-CSE-MsgGUID: ZyeP8xBEQuyvk1mTGyAegQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="54205896"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.62.251])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 08:28:09 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/5] Add SR-IOV GuC Relay PF services
Date: Thu, 18 Apr 2024 17:27:57 +0200
Message-Id: <20240418152802.182-1-michal.wajdeczko@intel.com>
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
  drm/xe/guc: Add GuC Relay ABI version 1.0 definitions
  drm/xe: Add helper to calculate adjusted register offset
  drm/xe: Add few more GT register definitions
  drm/xe/pf: Add SR-IOV GuC Relay PF services
  drm/xe/kunit: Add PF service tests

 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../gpu/drm/xe/abi/guc_relay_actions_abi.h    | 147 ++++-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   3 +
 .../xe/tests/xe_gt_sriov_pf_service_test.c    | 232 ++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c   | 553 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h   |  36 ++
 .../gpu/drm/xe/xe_gt_sriov_pf_service_types.h |  52 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   5 +
 drivers/gpu/drm/xe/xe_guc_relay.c             |   8 +-
 drivers/gpu/drm/xe/xe_mmio.h                  |   7 +
 10 files changed, 1041 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_service_types.h

-- 
2.43.0

