Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2121DC5DF8C
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 20:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A6C10E34F;
	Fri, 21 Aug 2026 20:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQbdoAV6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB6510F3BA
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 20:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787342858; x=1818878858;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=qGf01sVL7H38UY65rVgW8OKfyOSW9a3399ykIlgBrzo=;
 b=AQbdoAV6X9u8/i6eeSIPFJex4kVDNM5XJFOkLImxRrfM26xSOsjkBOm0
 w6rbYfdfkUCq/ggjrdC2guNwFGDc17Wc+z2Q2eIOnRiTiu9Tfpr1oJjKK
 gY2Lc536Um5i92oiL6Nnc7rBX08GBe8DQoJMgMCyj9g9RkMCo6Oy8qppm
 Qoe9I7cNm5mP0zvtgCqojc6XauL5kI+TDKUDwXCOq7mCVteXDt5oLVMry
 XMHfZmTkrO/YWc0FM7WDQn3KzAdW0kWnRNPkQyJtG6HSfNO6g5S1N0GT0
 AXBeW65nGNqtZQj3RnjRd7KXgRrJAXU7QFJnpE3kKqMSJcYPBjUB7NJQd g==;
X-CSE-ConnectionGUID: jdbt5jD0SeCgvTkdQQ3Tag==
X-CSE-MsgGUID: CZ54eqp5T02v6o7J0KsOeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87957214"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="87957214"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 13:07:37 -0700
X-CSE-ConnectionGUID: 2VZiyJqISyWIchB0H/18fQ==
X-CSE-MsgGUID: rZJ8m6e3SAmS6tCpiiYa1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="266491044"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 13:07:38 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 1/3] drm/xe/xe_oa: Clear status only if relevant bits are set
Date: Fri, 21 Aug 2026 13:07:30 -0700
Message-ID: <20260821200728.1048699-6-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260821200728.1048699-5-umesh.nerlige.ramappa@intel.com>
References: <20260821200728.1048699-5-umesh.nerlige.ramappa@intel.com>
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

OA monitors only a few bits in the status field. The current
read-modify-write will write to the MMIO even if none of the relevant
bits are set. Clear the status only if relevant bits are set.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
v2: Move comment (Ashutosh)
---
 drivers/gpu/drm/xe/xe_oa.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index b460fcdfca15..024940478c06 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -542,15 +542,17 @@ static int xe_oa_wait_unlocked(struct xe_oa_stream *stream)
 static int __xe_oa_read(struct xe_oa_stream *stream, char __user *buf,
 			size_t count, size_t *offset)
 {
-	/* Only clear our bits to avoid side-effects */
-	stream->oa_status = xe_mmio_rmw32(&stream->gt->mmio, __oa_regs(stream)->oa_status,
-					  OASTATUS_RELEVANT_BITS, 0);
+	stream->oa_status = xe_mmio_read32(&stream->gt->mmio, __oa_regs(stream)->oa_status);
 	/*
 	 * Signal to userspace that there is non-zero OA status to read via
 	 * @DRM_XE_OBSERVATION_IOCTL_STATUS observation stream fd ioctl
 	 */
-	if (stream->oa_status & OASTATUS_RELEVANT_BITS)
+	if (stream->oa_status & OASTATUS_RELEVANT_BITS) {
+		/* Only clear our bits to avoid side-effects */
+		xe_mmio_write32(&stream->gt->mmio, __oa_regs(stream)->oa_status,
+				stream->oa_status & ~OASTATUS_RELEVANT_BITS);
 		return -EIO;
+	}
 
 	return xe_oa_append_reports(stream, buf, count, offset);
 }
-- 
2.51.0

