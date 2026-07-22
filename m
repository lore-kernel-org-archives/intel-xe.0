Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C74C4452B
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 00:56:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644DA10E28E;
	Wed, 22 Jul 2026 00:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dyLH5kP4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E8410E28E
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 00:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784681785; x=1816217785;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i0zyEIQioTN05n819E4BzwaGWe4xNC9CbbbhPE9wrqQ=;
 b=dyLH5kP46J4giZXfjSeAtKxmWzwog5LvMSMv/pvRVU7/+tB2Dz0Ck+Bm
 imIf2lrNYzHBJCSVvqdZpYYALc2uGXLah41pJVAFc/EvoDDmwfDaJv1aQ
 8BdZURGiN+6emNIAKCCAFcIesF9/fsGbzNEThjDpprz2FPw0HSgZJcilP
 Ont2omJ1g5C/0JR3GdsBcpXXzNOBRklN+LWsW2U/d/Z68rVBvW5hna+L+
 YTeGtVmQQHhEldDaQGyjTMf4SgV2XY/mOZbMNcO85R+ODfGGKNlA5zM/A
 8yGkULZFWBqZwxr+nKbUBo9Pt88ZZvln7YoHCc0HxCB/anSj9/rHnXubZ g==;
X-CSE-ConnectionGUID: U/hQipveRQWabizYFzpQcg==
X-CSE-MsgGUID: vtbY1isLTui4E5ijvi1LSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="84429658"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="84429658"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 17:56:24 -0700
X-CSE-ConnectionGUID: xNC1KfGmTZuxEtzmPTx1iA==
X-CSE-MsgGUID: KG9zJuL1QfqRsBCQ9Dzo5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="258003176"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 17:56:24 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH 0/2] drm/xe/multi_queue: Handle lost message during VF
 migration
Date: Tue, 21 Jul 2026 17:56:15 -0700
Message-ID: <20260722005617.2912343-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

During VF migration, CGP_SYNC message to GuC or CGP_SYNC_DONE response
from GuC might get lost. Handle it by resending the message again.
Also handle cgp_sync wait woken up by vf migration.

This was previously posted as RFC here,
https://patchwork.freedesktop.org/series/165324/

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (2):
  drm/xe/multi_queue: Handle VF recovery in CGP_SYNC and queue
    registration paths
  drm/xe/multi_queue: Add needs_cgp_sync mechanism for VF post-migration
    recovery

 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  7 ++-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 46 ++++++++++++++++++--
 2 files changed, 48 insertions(+), 5 deletions(-)

-- 
2.43.0

