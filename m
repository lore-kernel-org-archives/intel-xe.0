Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8945CD6E79
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB6F10F6EC;
	Mon,  8 Jun 2026 16:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nqgf+dny";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE2710F6EC
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780936087; x=1812472087;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jMm5UOIMXk3XZDRVV8QZD5i2s8mIlAf3ve+nfRHz24Q=;
 b=nqgf+dnylfyl9Xz/9NAJa9NAJOYNUz0PjCvqHveUDUSqyymz3Cx+RPB3
 Xw+FxHg1yFJ6djbX7TvqUdOvRATeAjyyB+8plUEweoKpvkvOonDo+rGrk
 S6o9tP1D8L9PfUnAzzGx2A8Aa8ohwNENxDJ3WEZTDGFR8Z7Q150oP0Oi2
 FxBDj3vUwGv0jcBb41X54O7Nw7CBxScuT1CmvxhcGPki4dO4ZekesI03T
 O86X8By1BQpK7OppaT+gaekGmC5nvCFY9825g+2ockjuvhbhztKCeBQdB
 sQ48rVHa8c6L+Zj218zWhKuKik8bOf2KKVPmjax01eTbJXYK8eEyGfIPn g==;
X-CSE-ConnectionGUID: cMeIly2RR/Od6lUfa8gfng==
X-CSE-MsgGUID: 5uX38SmfQhyyhRoAMY6upw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="80704056"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="80704056"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:28:07 -0700
X-CSE-ConnectionGUID: jR5O864GTPqX0dkAMyhWvw==
X-CSE-MsgGUID: 7/ZB58loR2y/njnXAmrN6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="242632662"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa007.fm.intel.com with ESMTP; 08 Jun 2026 09:28:05 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, thomas.hellstrom@intel.com,
 daniele.ceraolospurio@intel.com, matthew.auld@intel.com,
 stuart.summers@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] drm/xe: include all registered queues in TLB invalidation
Date: Mon,  8 Jun 2026 21:57:43 +0530
Message-ID: <20260608162745.338725-1-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Context-based TLB invalidation in send_tlb_inval_ctx_ppgtt() filtered
exec queues with q->ops->active(), which reads q->guc->state bits
lock-free. Those bits are flipped without serialization from many
paths, and nothing in send_tlb_inval_ctx_ppgtt() serializes against
them, so any state-based predicate can race, causing missed TLB
invalidations on LR rebinds.

Patch 1 closes the TOCTOU by invalidating every queue currently
registered on vm->exec_queues.list for the GT. List membership is
stable under vm->exec_queues.lock held by the caller. The performance
impact is expected to be minimal and harmless; a race-safe filter can
be added later if it proves significant.

Patch 2 drops the now-unused .active op along with its GuC and
execlist backend implementations.

This series is a continuation of a dropped patch from an earlier
series sent with a different subject:
https://patchwork.freedesktop.org/series/167262/#rev1

Tangudu Tilak Tirumalesh (2):
  drm/xe: include all registered queues in TLB invalidation
  drm/xe: drop unused xe_exec_queue_ops::active callback

 drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 --
 drivers/gpu/drm/xe/xe_execlist.c         | 7 -------
 drivers/gpu/drm/xe/xe_guc_submit.c       | 9 ---------
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c    | 7 +++----
 4 files changed, 3 insertions(+), 22 deletions(-)

-- 
2.46.0

