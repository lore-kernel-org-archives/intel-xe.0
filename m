Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EFCCCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 16:52:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B3E10ECA4;
	Fri, 17 Oct 2025 16:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="maRNDXex";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F19A10ECA8
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 16:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760719945; x=1792255945;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EA8LZQKjG6wBQ9Mit7//YIuuLRV4PlcaYkSTt6dXt8E=;
 b=maRNDXexYDrzLy6wj5J+ABIIVqE4A8t5G0RxiBVVO1Mo2DfFJRvP0e5S
 E7P2B9qmF29K8tdptbSK26bKojkpqNRhxmvciZB07vfIXi5ZVgKox7aDi
 ufI+6IeUk7vpIuILKwLNuQGu2I3yPIqgaHqlnCiebLAJW32ogmLcl5+fS
 IMUWrWL8i2B8UrbbrmTesTmkqwBEVHPWV2/REXDSgpVABNl7jcHr7+W6X
 z6dLiVerKiCuDfT7fxfdVRkwAbwCgrGCOSwp3E/++Xpwygw71qQk3lzB8
 4NJfHbJJIQVZj0UHF3C6jysOw8yGfoHZJs5kYDP9XFB3re+AnqsX4jEKD A==;
X-CSE-ConnectionGUID: P/aXigrXQMmibfJK2yu6mw==
X-CSE-MsgGUID: 4dNsLqKQRFKhFZDniZ0Tiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="73537950"
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; d="scan'208";a="73537950"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 09:52:25 -0700
X-CSE-ConnectionGUID: Jb6QYQowScSTNytjHfAlkw==
X-CSE-MsgGUID: vv7ERtfXS1yI8kLU76UwRg==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 09:52:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: carlos.santa@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH 0/1] Fix serialization on burst of unbinds 
Date: Fri, 17 Oct 2025 09:52:16 -0700
Message-Id: <20251017165217.493595-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Attempting to resolve part of [1]; the patch should explain the details
of this solution.

Other options have been discussed, including not exporting TLB
invalidation fences to user space, or using TLB invalidation fences to
enforce ordering on the bind queue, rather than simply attaching TLB
invalidations to dma-resv, which blocks reclaim. I’ve implemented this
approach, and it appears to have the same effect as this patch. However,
I can't confidently reason that it won't violate queue fence ordering
rules. If desired, this alternative solution can also be posted for
discussion.

Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6047

Matthew Brost (1):
  drm/xe: Avoid serializing unbind jobs on prior TLB invalidations

 drivers/gpu/drm/xe/xe_exec.c          |  3 +-
 drivers/gpu/drm/xe/xe_exec_queue.c    | 18 +++++++++--
 drivers/gpu/drm/xe/xe_exec_queue.h    |  3 +-
 drivers/gpu/drm/xe/xe_pt.c            | 15 +++++++--
 drivers/gpu/drm/xe/xe_sched_job.c     | 44 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_sched_job.h     |  7 ++++-
 drivers/gpu/drm/xe/xe_tlb_inval_job.c | 14 +++++++++
 drivers/gpu/drm/xe/xe_tlb_inval_job.h |  2 ++
 8 files changed, 98 insertions(+), 8 deletions(-)

-- 
2.34.1

