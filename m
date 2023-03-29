Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3351C6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 29 Mar 2023 17:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49E610EBCE;
	Wed, 29 Mar 2023 17:33:55 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B1E10EBCE
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Mar 2023 17:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680111233; x=1711647233;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6+pZFQQoUev6zQy1WfMoe/BAPgXdx+VUBdulmE7TArw=;
 b=M6s1l5J487fwq0pcn7/nXkK2U4BuRwB//DGYnhn8U95HnpoIfgLcu3NI
 PCwr71SWlSXtDX74zgOGbWwBjSB0ol57nsaBc8dKBoRvQHdPiMGmQ02Xd
 OKKkqYR2yo3jwXbgT9E6E77lwWV2AUibWPTHUh5b6PwNjyL8JDOVKn9at
 MRDioO0kPQ6eM/E5ijCYDYf5zzmAHuYYo4Yr7WFaLL43hmtd5zYb6Ky8C
 XijvliCLS8Z8AcGrIIgm3vyHLOCJgQsyqkawsPxpqTJzTuMazyEaLVBX8
 VVZB2wkVZINjxqy7KyEZj0JSgPoG/4S4oDld3lOOEK5qwkuGLGTvs5+56 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="405896884"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="405896884"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 10:33:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="677854239"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="677854239"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 10:33:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 29 Mar 2023 10:33:31 -0700
Message-Id: <20230329173334.4015124-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] Minor batchbuffer handling fixes
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Xe's internal batchbuffer code is not properly considering the hardware
prefetch requirements.  It is also emitting duplicate
MI_BATCH_BUFFER_END instructions in the workaround batchbuffer.

Matt Roper (3):
  drm/xe: Include hardware prefetch buffer in batchbuffer allocations
  drm/xe: Adjust batchbuffer space warning when creating a job
  drm/xe: Don't emit extra MI_BATCH_BUFFER_END in WA batchbuffer

 drivers/gpu/drm/xe/xe_bb.c | 29 +++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_gt.c |  2 --
 2 files changed, 25 insertions(+), 6 deletions(-)

-- 
2.39.2

