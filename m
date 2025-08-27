Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E5DCA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 19:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A34910E7B0;
	Wed, 27 Aug 2025 19:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKHv3Ti/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D1A10E7B0
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 19:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756322811; x=1787858811;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bMkepRPCbZh2tl47X97nx4dnEqUXN6rqoiZlJ4RJTpo=;
 b=oKHv3Ti/6n91W8duA9L/OcZmSxsXXlVMyLrDnox01jWsMVy8W7faCR3E
 etp5Mb7czqbn7Pt6KmP5400AoMNvUc6I7EwAZFXxVWZyOyRdbGfR0cK6b
 mhz4zPpwbvs2h+KCHQfcf6IHYFWQ0aXt1J/blFx6ehMKYkncw0mq4YCgM
 Ux7heTHG/jyVPF5oYYUQdF7UqpoakuGE3JYHvfsGvaS/G+bo3tE5uesD0
 Xsjj5NJJvwGVlk4BnooBChLCvIfLBCwttrr7zCUdY5ZBbd8JK3mrmVBm/
 Cz5KN2flnne34PPmeaggiz5+jSqgWKxQ+4qvcOiufpKNP34B4KxcadNYF Q==;
X-CSE-ConnectionGUID: 8KJBeTz7SXe/MC7crbdAdw==
X-CSE-MsgGUID: PPvPYkjJR+W2n7PlrHYctQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="68855673"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="68855673"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:26:49 -0700
X-CSE-ConnectionGUID: OfPODjS+Q22gPIpLVU37Kg==
X-CSE-MsgGUID: 1yFunsT9SVW4HlfM1E4CaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="169519493"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:26:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 0/2] Enhance SVM stats
Date: Wed, 27 Aug 2025 12:26:42 -0700
Message-Id: <20250827192644.254002-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add ability to clear GT stats and add more SVM stats for profiling.
Scripts should be able to be built on top of stats to breakdown time
spent in parts of the SVM page fault handler, bandwidth of copy engine,
etc... Will help showing concrete performance improvements when
implementing SVM optimizations.

Open suggestions of more stats. Prefetch not considered - can be done in
a follow up.

Scritpt to parse stats for reference: https://pastebin.com/rZZN5sgh

v2:
 - Include local changes missed in first rev
v3:
 - More stats after putting together script to parse
v4:
 - Rebase
v5:
 - Rebase
 - Drop clear_stats entry
v6:
 - Rebase
 - Address Michal's comments

Matthew Brost (2):
  drm/xe: Add clearing stats to GT debugfs
  drm/xe: Add more SVM GT stats

 drivers/gpu/drm/xe/xe_gt_debugfs.c     |  20 ++-
 drivers/gpu/drm/xe/xe_gt_stats.c       |  47 ++++++
 drivers/gpu/drm/xe/xe_gt_stats.h       |   1 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h |  33 +++++
 drivers/gpu/drm/xe/xe_svm.c            | 196 +++++++++++++++++++++++--
 5 files changed, 287 insertions(+), 10 deletions(-)

-- 
2.34.1

