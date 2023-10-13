Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7F0CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 12:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8C210E0E7;
	Fri, 13 Oct 2023 12:08:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B839910E0E7
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 12:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697198892; x=1728734892;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6F0JcWQfr++WyzSNqNHGFbPIdVB+4imeles8hMNyz6g=;
 b=oFjW7JkRrF4AHPPyWmTBztcKzBO/N/gzkr7cSJrA4LfWVRtXG9lyd6+2
 VDeq9esegVfkUubSz3lWUkB7BP+dPZSrr/tgUe4CKZLSF9OYbowUQZLTk
 0KFVn0tBgzVv/bJzYfMxPjDbtyfBja2gJ3TkA0/Fc/8uUByTlE5vEbIZg
 fx2VTSw25oLoscZxlpOgviccOAIGsx3C1i1oWkoGYS3INr3A6ixMWjtsb
 4rb6WNbnFZECYnUQ+ijQy6tpvjUsyLWgAcygwPyxWmyiRE++xDRzs8xqV
 D4OEiKOomZ+aGXPAKwutMbo07HrXioepdKiYGhBzljYTxByDJ0YxAYnCW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="3769194"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="3769194"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 05:08:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="871058180"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="871058180"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2023 05:08:09 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 13 Oct 2023 17:46:31 +0530
Message-Id: <20231013121633.1038322-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V6 0/2] drm/xe: Count and report low level driver
 errors
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
Cc: Vishwanathapura@freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series adds low level driver error counter. Devided
into below patches:
1. Add APIs to count different category of errors under Tile and GT
2. Add counter increment at all existing error tap points

Focus is not to add new error checks but maintain counter for errors
on existing errors which can create performance impact.

TODO: Later on when netlink interface is ready, we will export these
counters through netlink interface.

Tejas Upadhyay (2):
  drm/xe: Introduce low level driver error counting APIs
  drm/xe: Update counter for low level driver errors

 drivers/gpu/drm/xe/xe_device_types.h        | 17 ++++++++
 drivers/gpu/drm/xe/xe_gt.c                  | 41 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h                  |  5 +++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 13 +++---
 drivers/gpu/drm/xe/xe_gt_types.h            | 19 +++++++++
 drivers/gpu/drm/xe/xe_guc.c                 | 15 ++++---
 drivers/gpu/drm/xe/xe_guc_ct.c              | 44 +++++++++++----------
 drivers/gpu/drm/xe/xe_guc_pc.c              | 12 +++---
 drivers/gpu/drm/xe/xe_guc_submit.c          | 39 ++++++++++--------
 drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
 drivers/gpu/drm/xe/xe_reg_sr.c              | 22 +++++------
 drivers/gpu/drm/xe/xe_tile.c                | 40 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile.h                |  4 ++
 13 files changed, 211 insertions(+), 66 deletions(-)

-- 
2.25.1

