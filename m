Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867D6C61DA4
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 08:15:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DCD10E942;
	Wed, 15 Mar 2023 08:15:15 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A332110E942
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 08:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678868113; x=1710404113;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lMcKXTIrMFGA10eoDJ8ln1obk/DzKm7bTWAP+2AM+fE=;
 b=kuywtM07uNEMoKmKEvU2LrncbamLYF2YdaaWNmHOj/Ix4/M9XtXPzV+K
 /8XEOOJuQskYjuG5pDFHL5CB4sykdZ5G0eRVAKu41LPY7oJYwqo60rglr
 FKxqZXOkBzze+ohKbDmQnpgcaYXgEcjoC92qmzTQC31KLDfhBC1OOul4A
 fVnY9KZGxKP4NlnFQkOb9ek8xudbyg0WYKeaTV0IoRfLqFs5nnKsTuFfl
 vMO5jdtjs+U5XW+8jFGQ+TbvK1xowHU99kW3q2w9h+sOkwnB6kN576kmm
 lIIBqnOdvXMixOeLOmfRmqTommn5QpEhQMEKWJVaDESjf1u+8StbTp4n4 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="317295720"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="317295720"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 01:15:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="681739194"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="681739194"
Received: from atheja-mobl2.gar.corp.intel.com (HELO bvivekan-mobl.fritz.box)
 ([10.213.127.182])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 01:15:10 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Mar 2023 13:44:58 +0530
Message-Id: <20230315081500.608346-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/2] drm/xe: Skip XY_FAST_COLOR instruction on
 link copy engines
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use MEM_SET instructions as alternative on platforms with link copy
engines which does not support the XY_FAST_COLOR instruction.

v4:
  - Modified the patch such that when using MEM_SET instruction, only
    allow clearing the memory region, setting of value is not supported.
  - Adapt migrate sanity kunit tests for platforms with link copy
    engines (Niranjana).

v3:
  - bitmask definitions reorder with most significant bit first (Lucas)
  - s/GRAPHICS_VERx100(gt->xe)/GRAPHICS_VERx100(xe) (Niranjana)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Balasubramani Vivekanandan (2):
  drm/xe: Skip XY_FAST_COLOR instruction on link copy engines
  drm/xe/tests: Adapt migrate_sanity_test for link copy engines

 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  9 +++
 drivers/gpu/drm/xe/tests/xe_migrate.c     | 19 ++++--
 drivers/gpu/drm/xe/xe_device_types.h      |  2 +
 drivers/gpu/drm/xe/xe_migrate.c           | 70 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pci.c               |  4 ++
 5 files changed, 94 insertions(+), 10 deletions(-)

-- 
2.25.1

