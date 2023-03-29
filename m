Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C112C76196
	for <intel-xe@archiver.kernel.org>; Wed, 29 Mar 2023 00:09:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E7F10E266;
	Wed, 29 Mar 2023 00:09:55 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4E010E488
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Mar 2023 00:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680048594; x=1711584594;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L6/1/4QFpjOJm1kzyWkT5LKR4p0OsZqt9PlfKKh3nHQ=;
 b=e9L4d3c895EdAJ6QCX1g6vPDT2SD0eE6zQzGbbl157TSsChN9nbXQpq1
 MCwFMXW8F428Z7xmuQGa3nhDy4BLX56DHU9EKHcm72KmmJkys0/CiGl7v
 w1feBHx1lCUsXhFnWNYBGDuz8ZReygvJAw4xQapkxdo02TB5LD3i6oDsq
 3AfHg1un4nAc9VdORfuA83UItdejLkp3wQY9b1/4dmUXXumDEgf5VTWIK
 RySeBk4oCjS90i47XThiYDATgX51jqxHG76ddR+FsSOL7axTUFp8BYNu3
 DN+SdB28BWTaF/n3QmwQq7ts/mFA5VtabMJWxYgjvrtLKli4NAoQCFwx6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="403350268"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; d="scan'208";a="403350268"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 17:09:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="773346492"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; d="scan'208";a="773346492"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 17:09:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 28 Mar 2023 17:09:57 -0700
Message-Id: <20230329000958.2188321-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 0/1] Long running jobs ideas
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

We discussed 2 options in a meeting today for long running jobs:

1. Return NULL in run_job, find another way to flow control ring and
clean up after engine errors.

2. Don't export dma-fences from the DRM scheduler or xe_sched_job, use
lockdep to enforce these rules (we don't export currently but do not
have lockdep asserts).

This series is an attenpt to code option #1, specifically the flow
controling of the ring. This series is not tested at all.

I've reached the conclusion that option #1 doesn't work as all it does
is move a dma-fence from run_job to prepare_job and in either case the
dma-fences from the DRM scheduler can be endless. Based on the
discussion in [1], the only proper way to throttle submission is through
dma-fences too.

Based on this IMO the only sensible solution for long running jobs in
option #2. We likely should update the DRM scheduler with a flag so when
it creates fences it uses lockdep to enforce that these fences cannot be
exported. Likewise we should also apply these rules to job->fence in Xe.

Matt

[1] https://patchwork.freedesktop.org/patch/525461/?series=114772&rev=2

Matthew Brost (1):
  drm/xe: Return NULL in run_job for long running jobs

 drivers/gpu/drm/xe/xe_engine.c          | 54 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_engine.h          |  6 +++
 drivers/gpu/drm/xe/xe_engine_types.h    |  3 ++
 drivers/gpu/drm/xe/xe_guc_submit.c      | 31 ++++++++++++--
 drivers/gpu/drm/xe/xe_sched_job.c       |  5 +++
 drivers/gpu/drm/xe/xe_sched_job_types.h |  2 +
 6 files changed, 96 insertions(+), 5 deletions(-)

-- 
2.34.1

