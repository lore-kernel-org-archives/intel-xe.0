Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48D1C44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 21:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0D310E4F8;
	Wed, 22 Jul 2026 21:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gyfDqsUE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7A510E4F8
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 21:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784757250; x=1816293250;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cd6GyCRGVGflu8mh7r7S/m/qRuamhF3c2yh1vpvziHw=;
 b=gyfDqsUE/fa2aWJH2aucAp28W0vv6r9H1rY8V3ZHpWtHk4yBwiHBAmdF
 d3tDosXE6o7nw9AjtWWgSbQjgLuCSXL3aVRVlPPBX84qwnbbXyJsbTNgL
 l8VeRYpQsH++VsA9Qxfe9Df+mh6c4T8O97zd1dva6KAQf18TxqN3bRQd/
 VJ6pJ0QYTUh+woPIcF2psR8TUvkx3E1oWnM6DbgZfgue3FCQPnypw+d87
 O/LLPj31ykCXVPtFhZ2XzZSUlJTSCBcF/mhd8W2UKh3/m4drQBIGhj5Nd
 1FqzNeOmg05ovkGviCeA+LDVW7brLn7oOPr9R3PZucPv8I7hRg+y9IB41 w==;
X-CSE-ConnectionGUID: oqSpOU0KQ8ulsMrdpKdI/g==
X-CSE-MsgGUID: LI1xT/dDS/OS4KE4K/MK6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="102950632"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="102950632"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 14:54:09 -0700
X-CSE-ConnectionGUID: kQeJk2MsTnSPh0tjXCyz/A==
X-CSE-MsgGUID: reZq0iVeQIa4hxA8FJPOrA==
X-ExtLoop1: 1
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 14:54:09 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 1/3] drm/xe/xe_oa: Clear status only if relevant bits are set
Date: Wed, 22 Jul 2026 14:54:05 -0700
Message-ID: <20260722215403.2668958-6-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260722215403.2668958-5-umesh.nerlige.ramappa@intel.com>
References: <20260722215403.2668958-5-umesh.nerlige.ramappa@intel.com>
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

