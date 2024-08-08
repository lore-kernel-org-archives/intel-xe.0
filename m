Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26105C52D71
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 17:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47AE10E7BD;
	Thu,  8 Aug 2024 17:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJTAFk+p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928B410E7C2
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 17:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723138909; x=1754674909;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S/5fhbrzeUC8Da/23hs+lASXU84vJL3uA/lYurFBZ84=;
 b=OJTAFk+p66v1gWbJCR8EQDt7C4bHBwC6VlljSKKtvpwwaAMV2a/o5NAw
 URums2E5Dyz7samDExJxTr85/PwtKCNX3Pb6v9kkm0rCh9QIcg4/9zcMy
 aIAnSFJLWDwmbbW7Mf0oyGA/yR8qMkoMTIq2f/bDJyLiaiyviLzsw9I+H
 +3UKrVfk/FxbEnOueQDkmyEDhI8qPTEsVf+0BRQrIA0v2HSaoetoBf5a/
 hoL1htYEKjAVZQqazKIncwybrOb8Y5R1gez+Iq+9keWoJ5DD/1n02feIN
 o7SOcyqIV6fFZYEWysiIn9+0TtHFPvLeV/Wmg0WLtaGU2wWigs1IQN675 w==;
X-CSE-ConnectionGUID: z7ApGeW/ToakxLlbs0QQrQ==
X-CSE-MsgGUID: QB6mZ2znQ++mcxEpJ8vyKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21256058"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="21256058"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 10:41:49 -0700
X-CSE-ConnectionGUID: w9LiGv0mQVuXpBCNy7X45w==
X-CSE-MsgGUID: u5vZ47+wSseffEnPLCu9LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="57850439"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 10:41:49 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jose Souza <jose.souza@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: [PATCH 0/8] drm/xe/oa: xe_syncs for OA
Date: Thu,  8 Aug 2024 10:41:31 -0700
Message-ID: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

OA stream configuration submits batches which can be queued behind other
(say workload) batches. Also, in some cases, additional delay is needed for
an OA configuration to take effect, even after programming batches have
completed executing on HW.

Mesa has use cases where a single workload is replayed repeatedly on the
GPU, each time with a different OA configuration (or metric set), in order
to capture different aspects of workload performance. This requires that OA
configuration takes effect at precisely the correct input batch and also
userspace is correctly informed when a new configuration has been activated
(at batch granularity).

In the previous implementation this is implemented by introducing a delay
in the stream open and reconfiguration ioctl's. This works, except that we
introdce a bubble in the userspace pipeline (the pipeline stalls during the
delays in calls into these ioctl's). Mesa prefers that such pipeline stalls
don't happen.

In this series this problem is solved using xe_sync arrays, similar to
xe_exec and vm_bind. Here OA re-configuration can be made to wait till
input fences signal and OA will signal output fences after a new
configuration has been activated. This can of course be done without
stalling the userspace pipeline.

Test-with: 20240808173632.4027344-1-ashutosh.dixit@intel.com

Ashutosh Dixit (8):
  drm/xe/oa: Separate batch submission from waiting for completion
  drm/xe/oa: Introduce 'struct xe_oa_fence'
  drm/xe/oa/uapi: Define and parse OA sync properties
  drm/xe/oa: Add input fence dependencies
  drm/xe/oa: Signal output fences
  drm/xe/oa: Move functions up so they can be reused for config ioctl
  drm/xe/oa: Add syncs support to OA config ioctl
  drm/xe/oa: Allow only certain property changes from config ioctl

 drivers/gpu/drm/xe/xe_oa.c       | 632 +++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_oa_types.h |   9 +
 include/uapi/drm/xe_drm.h        |  14 +
 3 files changed, 449 insertions(+), 206 deletions(-)

-- 
2.41.0

