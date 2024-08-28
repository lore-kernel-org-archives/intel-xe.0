Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB9BC54746
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 01:51:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FA010E158;
	Wed, 28 Aug 2024 01:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b23SS5JI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47AEC10E14C
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 01:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724809854; x=1756345854;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xK3CAPlik5bWOLn/BajpQ6D7ONq+TMqsMoFJC/f6cmw=;
 b=b23SS5JIV+h3OyrHNc1ibQvEETbbsawmSeAxr6RFG3WePkHccup0kdSL
 pymszgKbnpOrjuInkNv1frb3+fi0eLfqY5p0SN2zb2T9jPKwTZHERk+Jq
 UI/PShBT6Io1Md95UyT5QcXZ+QteDGRhKBT908W7YK+q2wLly1skuiKtU
 4jXU6l0zK4SfVcupJIQpFsfRZ7b79LuX0WYZHZA15bX3YIlbNImvb1YdD
 F3qRIzIsj8tEt2bBgRrpxNePJG8d4T/ZV1E08Glix/aYtUjX7DYf4oRrT
 5LkB7d4x7db5joOBYrSIDoWh6bV7s7vY3wfDEuWrpwxWngir6X/rWPz5L w==;
X-CSE-ConnectionGUID: FHNdw2F0TCm7gR97LIlTig==
X-CSE-MsgGUID: C3jlPsHNTt2Z2fjbVnemZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="40790210"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="40790210"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 18:50:53 -0700
X-CSE-ConnectionGUID: DW2NM58QQsGDgnjQ33rdNQ==
X-CSE-MsgGUID: 7xx47o+ISHqNS8Ia19xvgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="93852600"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 18:50:52 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jose Souza <jose.souza@intel.com>
Subject: [PATCH v4 0/7] drm/xe/oa: xe_syncs for OA
Date: Tue, 27 Aug 2024 18:50:38 -0700
Message-ID: <20240828015045.1889706-1-ashutosh.dixit@intel.com>
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

v2: Address review comments from Matt Brost, Jonathan Cavitt and Jose Souza
v3: Changes to Patch 4 and Patch 7 to address review comments from Matt
    Brost and Jonathan Cavitt
v4: Change to Patch 6 in response to Jose Souza

Test-with: 20240820003104.1407398-1-ashutosh.dixit@intel.com

Ashutosh Dixit (7):
  drm/xe/oa: Separate batch submission from waiting for completion
  drm/xe/oa/uapi: Define and parse OA sync properties
  drm/xe/oa: Add input fence dependencies
  drm/xe/oa: Signal output fences
  drm/xe/oa: Move functions up so they can be reused for config ioctl
  drm/xe/oa: Add syncs support to OA config ioctl
  drm/xe/oa: Allow only certain property changes from config

 drivers/gpu/drm/xe/xe_oa.c       | 651 +++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_oa_types.h |  12 +
 drivers/gpu/drm/xe/xe_query.c    |   2 +-
 include/uapi/drm/xe_drm.h        |  17 +
 4 files changed, 475 insertions(+), 207 deletions(-)

-- 
2.41.0

