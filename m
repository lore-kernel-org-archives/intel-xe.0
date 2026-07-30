Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C87C55165
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 23:35:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DFF10F0F3;
	Thu, 30 Jul 2026 23:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DMVv1feB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F2210F0F3
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 23:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785454553; x=1816990553;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cd6GyCRGVGflu8mh7r7S/m/qRuamhF3c2yh1vpvziHw=;
 b=DMVv1feBFmpK0j1H6WI92wBDby6CEhuxJe9LNCB3f24w8Vq+YtQsPvXD
 a+b4u76MAfgwCFu6JijIlpb9eIa+nz3bHgJ5SRfm0o4oQX7r8NScqEFiC
 A9JDPSxwLzhlWr4EUo8qiHaJLwdn2lAXX6sC21PeUImOwIWt7wS6GthTT
 0Ws0i66CzwtdhQwn9GWC0/EYdyXL69tQqsPIKnBORMqkGpGQvB8IUlfbt
 zsVNCiQ2krF1qmvvCKnylS1JCxRE43+tlMcHdbFflpN/DVUFrFKl89Suv
 I2n9BGVVhpajYiB28lgz0i79+g3Q402JyM4MzSN22W3Z1kRm7jZBB/w2U g==;
X-CSE-ConnectionGUID: W07hvC5IQTCjALeTyM2pZw==
X-CSE-MsgGUID: 4Dq65zNKRGiCS36MM6Urgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="103619703"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="103619703"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 16:35:53 -0700
X-CSE-ConnectionGUID: bR+Rn2qyRRSVpeSd5qGK6w==
X-CSE-MsgGUID: fauZSCRLTCS9tTHR8Wy1Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="257759656"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 16:35:52 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 1/3] drm/xe/xe_oa: Clear status only if relevant bits are set
Date: Thu, 30 Jul 2026 16:35:41 -0700
Message-ID: <20260730233539.3140839-6-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260730233539.3140839-5-umesh.nerlige.ramappa@intel.com>
References: <20260730233539.3140839-5-umesh.nerlige.ramappa@intel.com>
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
index b3acbcd678b7..5eb8f6739fae 100644
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

