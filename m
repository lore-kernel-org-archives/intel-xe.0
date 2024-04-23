Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55965C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 18:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0760C11355F;
	Tue, 23 Apr 2024 18:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kUZaZC1C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEAF11355F
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 18:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713895491; x=1745431491;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hgGwvQNC9eHxTMaO0LbM6O5WDu6n3j2v4meFRUp99pE=;
 b=kUZaZC1CDrHz4w04rhLJyWx47ThOOe7doMGmSnDykGiOn+4r5oN/DQdW
 /t2jGDntisWjlf091fQ46b/n4Fgoo3cYc7cS5wZ/w0U8ixUCsv3VRbfQd
 8+n9TqO+Y+6R0ddDCGrhFsTy9Me6fL4j6LP23zS8adSJZLuYMeWLZ2jlR
 1CFHjEMrHhmstAVGE/y5N1CsU9u4x6CKO6Zw9fJnzYg6vZI/PYWIOfXaB
 v/xnHB0BvGH1sG9Ke5gfL5Dy6oY77fGsd6yZebgHTJcNce9EtBsslVsRf
 BaJprQbKgmaaFFicWgin0V2VKKWBqpeUHcQ+uLDahEhUatdbH+YwkOZjM Q==;
X-CSE-ConnectionGUID: INBty1MwQwCMIcdudp0d/g==
X-CSE-MsgGUID: YxINJItaQkm61r6ZQdp+Yw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9363491"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9363491"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 11:04:50 -0700
X-CSE-ConnectionGUID: nBG2/ji6SdSlP7p/EXvdJg==
X-CSE-MsgGUID: Ze/WThpMQCqurFzHxEN9Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29105513"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.48.128])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 11:04:48 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 0/5] Add SR-IOV GuC Relay PF services
Date: Tue, 23 Apr 2024 20:04:31 +0200
Message-Id: <20240423180436.2089-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v2: describe purpose of the MAJOR|MINOR_ANY (Piotr)
    update description on QUERY_RUNTIME action (Piotr)
    start using helper (Piotr)
    make gt param const to allow use in xe_mmio_in_range()
    assert that we adjust both or none addr in xe_mmio_read64_2x32()
    fix params indent and improve struct description (Piotr)
    fix kernel-doc annotation (CI.hooks)
    use VF2PF_QUERY_RUNTIME_NO_LIMIT

Michal Wajdeczko (5):
  drm/xe/guc: Add GuC Relay ABI version 1.0 definitions
  drm/xe: Add helper to calculate adjusted register offset
  drm/xe: Add few more GT register definitions
  drm/xe/pf: Add SR-IOV GuC Relay PF services
  drm/xe/kunit: Add PF service tests

 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../gpu/drm/xe/abi/guc_relay_actions_abi.h    | 170 +++++-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   3 +
 .../xe/tests/xe_gt_sriov_pf_service_test.c    | 232 ++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c   | 550 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h   |  36 ++
 .../gpu/drm/xe/xe_gt_sriov_pf_service_types.h |  52 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   5 +
 drivers/gpu/drm/xe/xe_guc_relay.c             |   8 +-
 drivers/gpu/drm/xe/xe_mmio.c                  |  38 +-
 drivers/gpu/drm/xe/xe_mmio.h                  |   7 +
 11 files changed, 1076 insertions(+), 26 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_service_types.h

-- 
2.43.0

