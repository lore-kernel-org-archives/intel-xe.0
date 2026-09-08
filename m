Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E579C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 22:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2B510EDD8;
	Tue,  8 Sep 2026 22:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P5ZsF8hU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD8510EDD8
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 22:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788906247; x=1820442247;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ROODc69RrOKA3ctpLN3VQJgksv+snHA61b3IsXWspDY=;
 b=P5ZsF8hU1AiyRj9f4zf58zJHPJ+i1R7MQWkmCViXsp86hvOmSH3FMtP8
 n+XS/7/77RMlcbuoM+llSe84bYTTYbFdxWOYjwAPkWP03g3b6zV1yqmw5
 2sKr3osoNVJFD65uTYOdhFQz7Qw+n9ioDcVtWQgu7sBBhM73rNGW/0za/
 4cweRW7KXij4y3qv1iq/NpPT762MykjJnNRECkkAPKzCgZDG8EMNl1+53
 /XV+8KksZvaEbN+cPk+LZO0L7OjOJGbFl9u8a1yRdP+lYpI5O3Duqhzeg
 rUMVQY38RXZBGsEcWS9kG8GXxSPLTtDT83YpJCx3aWhDc9UCrVRu3onRY A==;
X-CSE-ConnectionGUID: uAZ4biZDRaeD4nWA0SaBxg==
X-CSE-MsgGUID: dchY0vyZQBieNrd+x5XLyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100677198"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="100677198"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 15:24:06 -0700
X-CSE-ConnectionGUID: E0UIsdR5QWKIw6SdDhYoSQ==
X-CSE-MsgGUID: OEwr7WSoSbCcX3Y1V9rcwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="270638218"
Received: from unerlige-desk1.jf.intel.com ([10.24.80.43])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 15:24:07 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 1/3] drm/xe/xe_oa: Clear status only if relevant bits are set
Date: Tue,  8 Sep 2026 15:23:58 -0700
Message-ID: <20260908222356.1210175-6-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908222356.1210175-5-umesh.nerlige.ramappa@intel.com>
References: <20260908222356.1210175-5-umesh.nerlige.ramappa@intel.com>
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
 drivers/gpu/drm/xe/xe_oa.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a3484e943c55..2353a8c0e6c1 100644
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
2.53.0

