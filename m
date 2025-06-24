Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC96C7EE33
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 20:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430DF10E035;
	Tue, 24 Jun 2025 20:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHeiKLT/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240E310E035
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 20:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750795775; x=1782331775;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2OUJ+wV8CCibs7ECs1DQZQ2wkjYbkrvv43+65Tus51Y=;
 b=IHeiKLT/V0FKd8vhzXUPTba7hQSueyXQOm6f3ccq14tM0qdjIYtWmQ5M
 IlsF0OJ4mkaH9Im0gURAO0iIWgJG/CBE3agLYRuTP70XuzeuNQb82LEfJ
 WpEVyytD8Wjha8cKWaGM7e5ZydamPr2oEmNHwtsoiuqosdCt1VZtCMR5+
 DgG42SxwS6OS2zN+wxibtUqjUqrI1yQ1LCD/ksSqR/NoKSv2zO3o3DtjV
 l4uOR3SZIUoFw5hWaexWCpUULF2pQvBP/ZX53F3HU/ExRjoKfF5+RD+Dn
 qVwqDs+J2IUPJm6qI1mND+so3bQJPLEaDoEs3WZUlCffIKSOuiPDRKlw1 g==;
X-CSE-ConnectionGUID: 9XX369RZRE2aZVR/7Ulhsg==
X-CSE-MsgGUID: KvZqaE5ZQOufl5rkxgRkfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52920631"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="52920631"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 13:09:35 -0700
X-CSE-ConnectionGUID: bsT0o/TCTXiFgMrROA10Bg==
X-CSE-MsgGUID: uLoLOjVTTmWxnewTB0tLow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="189195533"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 13:09:34 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/5] Relax VF/PF version negotiation
Date: Tue, 24 Jun 2025 22:09:18 +0200
Message-Id: <20250624200923.1348-1-michal.wajdeczko@intel.com>
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

It was clarified by the arch team that initial version negotiation
can be done by the VF just once, by using any available GuC/GT.

Michal Wajdeczko (5):
  drm/xe: Combine PF and VF device data into union
  drm/xe: Move PF and VF device types to separate headers
  drm/xe/pf: Expose basic info about VFs in debugfs
  drm/xe/pf: Stop requiring VF/PF version negotiation on every GT
  drm/xe/vf: Store negotiated VF/PF ABI version at device level

 drivers/gpu/drm/xe/Makefile                   |   3 +-
 .../xe/tests/xe_gt_sriov_pf_service_test.c    | 232 ------------------
 .../drm/xe/tests/xe_sriov_pf_service_kunit.c  | 227 +++++++++++++++++
 drivers/gpu/drm/xe/xe_debugfs.c               |   4 +
 drivers/gpu/drm/xe/xe_device_types.h          |  12 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |   6 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |   5 -
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c   | 164 +------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h   |   2 -
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  30 ++-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  12 -
 drivers/gpu/drm/xe/xe_sriov_pf.c              |  64 ++++-
 drivers/gpu/drm/xe/xe_sriov_pf.h              |   6 +
 drivers/gpu/drm/xe/xe_sriov_pf_service.c      | 213 ++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_service.h      |  23 ++
 .../gpu/drm/xe/xe_sriov_pf_service_types.h    |  36 +++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |  45 ++++
 drivers/gpu/drm/xe/xe_sriov_types.h           |  36 ---
 drivers/gpu/drm/xe/xe_sriov_vf_types.h        |  41 ++++
 19 files changed, 696 insertions(+), 465 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_sriov_pf_service_kunit.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_service.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_service.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_service_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_types.h

-- 
2.47.1

