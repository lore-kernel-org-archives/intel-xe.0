Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D44CA101A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 22:16:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B63110EAF3;
	Fri, 30 Aug 2024 22:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gRZMmppY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE2010E074
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 22:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725056195; x=1756592195;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=00BgEyKKuocsMeeVSTFE4wP8DJu/lfmkBakT8xA7dCg=;
 b=gRZMmppYgkxFtvhaDGU3Mua5tXUtCsGYuTziLPqpV/kYyLrJfckO8LYi
 6Vury2CLR36ZWlGAIhldiQ1RPpQU3q8hZQtKytu142v5SaBgJS44LgAcL
 7yXDOJ1pg1zeOpcJD2+GpyWCWxP9L37E4geMeD6dZgWhBP7GNtDnAGEw0
 NSyVXPvnQcmpgbxZtaYb3Zq7aIEcilzWpsW2lj460/h9b2ygViRb2MsN7
 trApV8N0sCu3zSTxXzhpFM8RDR1k9Ddm+Rf/A2OVB0RVTLYUwTGE13Ps0
 R57tAkvWX8AxwF5ub9kvQr+MBCNf5hDKEaS7fcgqCj2Gmsy/4XQXB2ukJ Q==;
X-CSE-ConnectionGUID: FLYa3AcGR3CsoHua6PZljQ==
X-CSE-MsgGUID: VlPVBVjFS2SCJ1YGhVjORA==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23898738"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="23898738"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 15:16:34 -0700
X-CSE-ConnectionGUID: uLaCewUhQeWb+yCLlhtDRQ==
X-CSE-MsgGUID: F2wYRwRgS1Sl050luuk//Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="64040408"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 15:16:34 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 0/7] drm/xe/oa: xe_syncs for OA
Date: Fri, 30 Aug 2024 15:16:11 -0700
Message-ID: <20240830221618.2103948-1-ashutosh.dixit@intel.com>
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
v5: Change to Patch 4 to fix potenatial uaf

Test-with: 20240820003104.1407398-1-ashutosh.dixit@intel.com

Ashutosh Dixit (7):
  drm/xe/oa: Separate batch submission from waiting for completion
  drm/xe/oa/uapi: Define and parse OA sync properties
  drm/xe/oa: Add input fence dependencies
  drm/xe/oa: Signal output fences
  drm/xe/oa: Move functions up so they can be reused for config ioctl
  drm/xe/oa: Add syncs support to OA config ioctl
  drm/xe/oa: Allow only certain property changes from config

 drivers/gpu/drm/xe/xe_oa.c       | 667 +++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_oa_types.h |  15 +
 drivers/gpu/drm/xe/xe_query.c    |   2 +-
 include/uapi/drm/xe_drm.h        |  17 +
 4 files changed, 491 insertions(+), 210 deletions(-)

-- 
2.41.0

