Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4775C5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 17:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDFB10E331;
	Fri,  7 Aug 2026 17:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kmO1CSDt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515EF10E331
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 17:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786123050; x=1817659050;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=utPtG9QR5HF6vRWJ22fYPBYfKIDFp7t1P0czkkxfnho=;
 b=kmO1CSDt7FRafOKJ0ZLKOx8iyCOMWhUsR2cIZv9r7abkChKqI4LJ+ogK
 5SJ5FXNLPqYb9ApjhpVn8KZjPULkWOznslh64AMUnfw+6n+MrP9yTNdIX
 1XOD/Dv1dV0kkSuLGq0WIP22Zuj/MR2LCSbcR5195Bf7NRNEyuDNYSWCC
 tGlaNcVf4qWZg1W224vNAUCZA4SkxA9c7a21f4z/rslu4RCM2CW9HAfUP
 7S778CXftAZBIXUtYR3zITRxxEiNrJbLLLILhsgjnRtjx8yX5PKLhgV3l
 SH2AbQFGAWL79mwci/nEbJfkeYlfDN3Cw+97srF6QHbGBFrJ2pQzh4wmY g==;
X-CSE-ConnectionGUID: 2mGTdei7TSScWUIjSnd6Kg==
X-CSE-MsgGUID: yWZ+FVJ9TLygwhMmsZq6/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="97088138"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="97088138"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 10:17:29 -0700
X-CSE-ConnectionGUID: 3KdmniPKTsG1LkD3ZRim3w==
X-CSE-MsgGUID: cm1SZcrNQcOcEZjKUkUJUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="258150245"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 10:17:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org
Subject: [PATCH] drm/xe: Order ring writes before ring tail updates
Date: Fri,  7 Aug 2026 10:17:16 -0700
Message-Id: <20260807171716.140475-1-matthew.brost@intel.com>
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

The ring buffer and the LRC context image are both mapped WC, so the ring
tail update can become visible to the device before the ring contents it
is meant to publish.

The GuC CT send does contain an xe_device_wmb(), so sending the H2G would
flush the ring contents. The problem is that it comes too late:
xe_lrc_set_ring_tail() publishes the tail before the H2G is sent, and the
device samples the tail from the context image independently of it, either
at context switch-in or while the context is already resident. A submitter
which is interrupted between updating the tail and sending its H2G
therefore leaves the device free to observe the new tail while the ring
contents behind it are not yet visible:

  1. Thread A emits a job into the ring, sets the tail to T_A and sends
     the H2G, which flushes A's ring contents. The GuC starts scheduling
     the context in, but it is not executing yet.
  2. Thread B emits a job into ring[T_A..T_B]. Those writes are not yet
     visible to the device.
  3. Thread B updates the ring tail to T_B. That write targets a
     different page and becomes visible first.
  4. Thread B is interrupted before it sends its H2G, so the flush which
     would have published ring[T_A..T_B] has not happened yet.
  5. The context is switched in and samples the ring tail from the
     context image, picking up T_B rather than T_A.
  6. The GPU executes A's job, advances HEAD to T_A, and continues on to
     ring[T_A..T_B], which still holds the previous wrap's contents, so
     the CS parses stale commands.

The result is command stream corruption, which typically manifests as a
hang or a spurious pagefault rather than anything that points back at the
submission path.

Kernel jobs are by far the most likely to hit this. Kernel queues such as
the migration queue are shared and can be driven by many threads
concurrently, producing back-to-back submissions on an LRC which is
already executing. User queues are typically tied to a single submitting
thread, so the same interleaving is much harder to produce.

Add an xe_device_wmb() at the end of xe_lrc_write_ring() so that it covers
every ring tail publication site, and so the invariant is local: once
xe_lrc_write_ring() returns, the ring contents are visible to the device.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8651
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7810
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Assisted-by: GitHub_Copilot:claude-opus-5
---
 drivers/gpu/drm/xe/xe_lrc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 01d087e82205..a332c11420fd 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1851,6 +1851,13 @@ void xe_lrc_write_ring(struct xe_lrc *lrc, const void *data, size_t size)
 
 		__xe_lrc_write_ring(lrc, ring, &noop, sizeof(noop));
 	}
+
+	/*
+	 * The ring and the LRC context image are both WC, so the ring tail
+	 * update which publishes these writes can become visible to the device
+	 * first. Ensure the ring contents are visible before returning.
+	 */
+	xe_device_wmb(xe);
 }
 
 u64 xe_lrc_descriptor(struct xe_lrc *lrc)
-- 
2.34.1

