Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDF2CD98F1
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 01:54:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6F910EDB8;
	Wed, 17 Jun 2026 01:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EsDhDlc0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0646B10ED9D
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 01:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781661267; x=1813197267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PWUZB35a/1H9qdKKaXc55ZJX9Gi6i853eV98156IKas=;
 b=EsDhDlc029Cr2nXi5ja9Z3mFQwrScAalR6MsMHCFUritSYlbVy7TO2Za
 q3AHLXDEVqjq/ySNtiyiFNxpXIwj1DiRzUorBKbDywVZjO7Kb+ZA3jhRA
 rvOB022t3J7Hje/QUu4dNSB+Z56BcUNKKyNE3umkZmcviiX8C1U26wufZ
 W+oE9FuIRLxbgKfhJWohjrph0iUKP92ihdxY2D3yVoigWyWu0U3QBqCkB
 CISp0mJ6n0gNNDJ15u4+qJ/S0qhZnoquJI7KxhzXR0AP0I341b23JgpzE
 xQZT8U2UtYCTXQUWK1YKqm1VCOJYQ8fXat0roeC+bGlkpgM4FiACjU81W w==;
X-CSE-ConnectionGUID: Ft2vav/GRzysUIBiV55/Aw==
X-CSE-MsgGUID: j8vQhhldSpuuW5eLNI3KBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82456698"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82456698"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 18:54:26 -0700
X-CSE-ConnectionGUID: DcWafrsmSy6pM9iCUcng5g==
X-CSE-MsgGUID: 2oaOfnrjS4COGNx+3Nx2Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="246801635"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 18:54:26 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 3/4] drm/xe/oa: Provide OA status through status ioctl for
 mmap interface
Date: Tue, 16 Jun 2026 18:54:21 -0700
Message-ID: <20260617015422.226177-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617015422.226177-1-ashutosh.dixit@intel.com>
References: <20260617015422.226177-1-ashutosh.dixit@intel.com>
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

When only the OA mmap interface is in use, OA status can be provided
through the status ioctl. This enables us to stop whitelisting the OA
status register, thereby saving one nonpriv slot per OA unit.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 7 +++++++
 drivers/gpu/drm/xe/xe_oa_types.h | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 9fbd21b0ef974..985be10855c33 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -544,6 +544,7 @@ static int __xe_oa_read(struct xe_oa_stream *stream, char __user *buf,
 	/* Only clear our bits to avoid side-effects */
 	stream->oa_status = xe_mmio_rmw32(&stream->gt->mmio, __oa_regs(stream)->oa_status,
 					  OASTATUS_RELEVANT_BITS, 0);
+	stream->oa_status_read = true;
 	/*
 	 * Signal to userspace that there is non-zero OA status to read via
 	 * @DRM_XE_OBSERVATION_IOCTL_STATUS observation stream fd ioctl
@@ -1603,6 +1604,12 @@ static long xe_oa_status_locked(struct xe_oa_stream *stream, unsigned long arg)
 	struct drm_xe_oa_stream_status status = {};
 	void __user *uaddr = (void __user *)arg;
 
+	/* Provide oa_status through the status ioctl, when only mmap() interface is used */
+	if (!stream->oa_status_read)
+		stream->oa_status = xe_mmio_rmw32(&stream->gt->mmio, __oa_regs(stream)->oa_status,
+						  OASTATUS_RELEVANT_BITS, 0);
+	stream->oa_status_read = false;
+
 	/* Map from register to uapi bits */
 	if (stream->oa_status & OASTATUS_REPORT_LOST)
 		status.oa_status |= DRM_XE_OASTATUS_REPORT_LOST;
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 3d9ec8490899c..a84456540a13c 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -244,6 +244,9 @@ struct xe_oa_stream {
 	/** @oa_status: temporary storage for oa_status register value */
 	u32 oa_status;
 
+	/** @oa_status_read: true when read() interface is used to read oa_status */
+	bool oa_status_read;
+
 	/** @no_preempt: Whether preemption and timeslicing is disabled for stream exec_q */
 	u32 no_preempt;
 
-- 
2.54.0

