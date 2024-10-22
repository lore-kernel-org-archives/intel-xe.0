Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C81CDD0E6
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 20:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEBC10E20E;
	Tue, 22 Oct 2024 20:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D66YWTcf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B844810E1B0
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 20:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729627440; x=1761163440;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tJTv6AkTZgbveIF2e+MxxBFY4lSSy53GRP+CYciYo6E=;
 b=D66YWTcf4GjugH2nfIuOvtsedY2NuK2zy7KvNHtVK1GdBEButYHXkCEr
 ZHbrCyTXJA+3yigmHSzKYl1bMUZTj1aOIK1OFjIcgK+HMRZQhVpiM7+YP
 bCZLjxJcO8RY6uKAoZwCDAZoAJm46sn/jZxkigHbROGwh2VxzWZyj1H6I
 JqVCiqQR8YhObnUIoQtU/CWMBnRRAGoWaOOWQFQ5mSqSz9m1pxRbKWX/j
 +Ekx/Lx4REAgDKarvZB0Upal5ISzrP3yuOTQKmUgLPcVI8zpt1yJX3m60
 p4n5cdyZlEvvKyx3x3FLNSxiq3MptuiRwWgZl8KInHojUqCBzl8YVXmez g==;
X-CSE-ConnectionGUID: JAD1n+1AQqebJPO1itOqsg==
X-CSE-MsgGUID: rbCAyQJITgiiVVbpcrXpvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28966832"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28966832"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 13:03:59 -0700
X-CSE-ConnectionGUID: I+zpoxy6SEO8WejFwucAwA==
X-CSE-MsgGUID: YDPmrIYhTsW8JsLoP768eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="84570350"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 13:03:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 0/7] drm/xe/oa: xe_syncs for OA
Date: Tue, 22 Oct 2024 13:03:45 -0700
Message-ID: <20241022200352.1192560-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Reviewed Mesa MR which consumes new uapi introduced here:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31283

v2: Address review comments from Matt Brost, Jonathan Cavitt and Jose Souza
v3: Changes to Patch 4 and Patch 7 to address review comments from Matt
    Brost and Jonathan Cavitt
v4: Change to Patch 6 in response to Jose Souza
v5: Change to Patch 4 to fix potenatial uaf
v6: Changes to Patch 1 (v3) and Patch 4 (v5)
v7: Rebase and add reference to Mesa MR above

Test-with: 20241022171658.1181667-1-ashutosh.dixit@intel.com

Ashutosh Dixit (7):
  drm/xe/oa: Separate batch submission from waiting for completion
  drm/xe/oa/uapi: Define and parse OA sync properties
  drm/xe/oa: Add input fence dependencies
  drm/xe/oa: Signal output fences
  drm/xe/oa: Move functions up so they can be reused for config ioctl
  drm/xe/oa: Add syncs support to OA config ioctl
  drm/xe/oa: Allow only certain property changes from config

 drivers/gpu/drm/xe/xe_oa.c       | 667 +++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_oa_types.h |  12 +
 drivers/gpu/drm/xe/xe_query.c    |   2 +-
 include/uapi/drm/xe_drm.h        |  17 +
 4 files changed, 489 insertions(+), 209 deletions(-)

-- 
2.41.0

