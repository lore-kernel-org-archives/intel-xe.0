Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6B8CA5FB1
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 09:40:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D50410E6C8;
	Wed, 30 Sep 2026 09:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cV2EH5LB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290EF10E6C8
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 09:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790761244; x=1822297244;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8ALocwVVP2zx2PSv4KYcoRKuUqor3NBKIDtWjvLIi00=;
 b=cV2EH5LBfwxhNur6reFrk37Ju6PvW+2azAEOD3jRBPIKJWK8f0p00W5d
 uGjFhaI/wOt8fPESSVCYe4oPrSx0mQ4Kv3gC44bklTl7sdiwZ2OgzaUob
 Yqh21+lf2n5NMqDjj+bGyYV5Z85K5V7S3gXNavTjMPCnVbCxrtWrtx9TX
 HxysM7o96DI6Kzo6m4QdRa3a1UKbqxK0SnGQFMmTqK71RQBn9VoGMGCpy
 Sl117667EpKo99RvWrBGI2Wud5k4MzZRe0cp1c6gNTHTh5eVmc8SsHRIw
 pLdGkMnrO9OfVezOmaJFR9ZzRd07pleNHRdXx5eyADi77+g8tRHsrRFUy w==;
X-CSE-ConnectionGUID: vn9SOPu4S3eIHJk9kR0a8Q==
X-CSE-MsgGUID: CkOZuZN4SA6ft53od7Qdcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="95303794"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="95303794"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 02:40:44 -0700
X-CSE-ConnectionGUID: RzchSMNrQYSlSaKKGR2Q2g==
X-CSE-MsgGUID: FyGuK5q+TlG8si7euIPrYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="274768685"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 02:40:42 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 0/3] drm/xe: Fix ULLS chained job loss and GT reset replay
Date: Wed, 30 Sep 2026 15:10:32 +0530
Message-ID: <20260930094031.3365707-5-varun.gupta@intel.com>
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

A chained ULLS migration job can be lost: its predecessor's postamble
publishes the ring tail over the job's slot before parking on the
semaphore, so the CS is free to fetch that slot while it still holds
padding. When the job is later written and the semaphore signalled,
the CS runs what it already fetched, drains to the tail and idles. A
lost ULLS_EXIT goes unnoticed, a lost ULLS_ACTIVE hangs the kernel
migration queue, and because the GT reset replay of a chained ULLS job
does not work either, the second timeout wedges the device.

Patch 1 is the fix: park first, publish the tail after the wait, so the
next slot stays beyond RING_TAIL until the job is in place. This puts
the non-posted tail write on the wake-up path, which the original
ordering was chosen to avoid. I could not find a way to keep the tail
ahead of the wait without the CS being able to fetch the slot early.

Patches 2 and 3 make the GT reset replay of a chained ULLS job work,
so a future ULLS hang degrades to a single recoverable reset rather
than a wedge. Patch 3 covers a state patch 1 eliminates and is defence
in depth.

A couple of related items I have left alone and would appreciate a
view on:

 - The SR-IOV VF pause/unpause replay only routes the last_replay job
   through the tail write, so a chained last job publishes nothing
   there either. Adding "|| job->last_replay" to the patch 2 condition
   looks right but I have no VF setup to test it for now.

 - At replay, pending chained jobs still have their semaphore slot
   signalled from before the reset, so the first re-emitted postamble
   passes its wait immediately. The resubmit loop writes every job
   before GuC processes the enable, so this has not been observed;
   clearing the slots in guc_exec_queue_start() would close it.

Varun Gupta (3):
  drm/xe: Park on the ULLS semaphore before publishing the next job's
    tail
  drm/xe/guc: Publish the ring tail when replaying a chained ULLS job
  drm/xe/guc: Rewind the LRC ring head when replaying a ULLS job

 drivers/gpu/drm/xe/xe_guc_submit.c | 19 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_migrate.c    | 24 +++++++++++++-----------
 drivers/gpu/drm/xe/xe_ring_ops.c   | 15 +++++++++++----
 3 files changed, 41 insertions(+), 17 deletions(-)

-- 
2.43.0

