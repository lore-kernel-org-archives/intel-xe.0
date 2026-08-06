Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F86C5AC82
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 22:47:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0755010E39B;
	Thu,  6 Aug 2026 22:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N2jp+A3k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007C110E39B
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 22:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786056436; x=1817592436;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=H1Ga/LV1bz7pNIJJZgwMrYz1CPtLtLUcC2C45pFXDuE=;
 b=N2jp+A3kB9r778XD8BelzAjT2t5lMCIUzy4F7T8RJx/7Gk9mUBidrPya
 3iz6MK3OhOHkCAmXg6OcVEbqEtlzxb1XcuV/J8eX1SXYu3lAvePicPAa+
 iZRpZedZPnTWI3l1h+iuCOvaJqFzFcb/ABggjwmqKZGicNjwKuwsSgZtY
 vBi3ThtLmBIJFGpGtEcc02492q7pEsWmn70/tJRJ8SIYOyJvbtz5ePjrz
 p9N+Q6u7d6+U2xgOwVHlPg5BKvO8UqdYysYe2YpT/bOccFws20wkTfWfD
 3JPVhPLJi4SkTNhigtJGiNe329V3weL4G3vHlJslI8hiRjXs30V2qXovy A==;
X-CSE-ConnectionGUID: KypKOOx8TO6jLi1ZRzFbiw==
X-CSE-MsgGUID: HizglDG4TCKLsEkm7jFobg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86675964"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="86675964"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 15:47:15 -0700
X-CSE-ConnectionGUID: IjUmKd/JSlaPJUuJ6ZjKMw==
X-CSE-MsgGUID: sNqqmsZfS1u3JA8cCPYrbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="258373139"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 15:47:15 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 1/3] drm/xe/xe_oa: Clear status only if relevant bits are set
Date: Thu,  6 Aug 2026 15:47:04 -0700
Message-ID: <20260806224702.3563031-6-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260806224702.3563031-5-umesh.nerlige.ramappa@intel.com>
References: <20260806224702.3563031-5-umesh.nerlige.ramappa@intel.com>
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
---
 drivers/gpu/drm/xe/xe_oa.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index cb526de0ef87..183956170757 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -543,14 +543,16 @@ static int __xe_oa_read(struct xe_oa_stream *stream, char __user *buf,
 			size_t count, size_t *offset)
 {
 	/* Only clear our bits to avoid side-effects */
-	stream->oa_status = xe_mmio_rmw32(&stream->gt->mmio, __oa_regs(stream)->oa_status,
-					  OASTATUS_RELEVANT_BITS, 0);
+	stream->oa_status = xe_mmio_read32(&stream->gt->mmio, __oa_regs(stream)->oa_status);
 	/*
 	 * Signal to userspace that there is non-zero OA status to read via
 	 * @DRM_XE_OBSERVATION_IOCTL_STATUS observation stream fd ioctl
 	 */
-	if (stream->oa_status & OASTATUS_RELEVANT_BITS)
+	if (stream->oa_status & OASTATUS_RELEVANT_BITS) {
+		xe_mmio_write32(&stream->gt->mmio, __oa_regs(stream)->oa_status,
+				stream->oa_status & ~OASTATUS_RELEVANT_BITS);
 		return -EIO;
+	}
 
 	return xe_oa_append_reports(stream, buf, count, offset);
 }
-- 
2.51.0

