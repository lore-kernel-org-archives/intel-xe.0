Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344BBE8784C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 17:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87C210E172;
	Tue,  3 Feb 2026 17:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0+KaMC3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDBE10E172
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 17:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770139251; x=1801675251;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SiKvY0TewHJWB1Ut1s6kl2z+ow1UTPBMUu7qkAQ2+t4=;
 b=f0+KaMC3dhwsBr4ZYMBe19kx04GV1MLKyUDoSoL709ERPisjfiwLqD2O
 ngM6I82EqCBUZURJi5hTMYKB9MZm3qeQ21u/X3lypSDeC5hTLRJhezK3B
 qBlvB2Dg79eGxyfvgLDttjjsWJIMI1rIA/POsUHE3KOScV3KdzoDhpm2e
 pSae2Jq+ZFPd+UnyUKjhwsXjW3AUsgIgubhQTmb/kl29t5Tnv1bwGrTJD
 3QUUUh2wLL3vD4VnEUi4DIKlqrUbmU15DO6BiCjvUuMAa+mFWC2S+Q+S/
 PL/XFi7jzUH2uv2V+JDCPsfE6BOdxrZXOXcgkSQB5XN+1CopX7OQ3yIl9 g==;
X-CSE-ConnectionGUID: 1gKCKNxRTkKNHNV5gezv6A==
X-CSE-MsgGUID: 7lQOo1izQpGv7gvN4Scf7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82056063"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="82056063"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 09:20:50 -0800
X-CSE-ConnectionGUID: a+k31w+TSMqPrWsshsUtuw==
X-CSE-MsgGUID: De4O7ZHVSsGY3C72HBQlEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="209598163"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.45])
 by fmviesa006.fm.intel.com with ESMTP; 03 Feb 2026 09:20:50 -0800
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Add bounds check on pat_index to prevent OOB kernel
 read in madvise
Date: Tue,  3 Feb 2026 17:20:45 +0000
Message-ID: <20260203172045.1154546-1-jia.yao@intel.com>
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

When user provides a bogus pat_index value through the madvise IOCTL, the
xe_pat_index_get_coh_mode() function performs an array access without
validating bounds. This allows a malicious user to trigger an out-of-bounds
kernel read from the xe->pat.table array.

The vulnerability exists because the validation in madvise_args_are_sane()
directly calls xe_pat_index_get_coh_mode(xe, args->pat_index.val) without
first checking if pat_index is within [0, xe->pat.n_entries).

Although xe_pat_index_get_coh_mode() has a WARN_ON to catch this in debug
builds, it still performs the unsafe array access in production kernels.

Fix this by adding an explicit bounds check before calling the function,
similar to other IOCTL parameter validations. This prevents malicious
userspace from reading arbitrary kernel memory.

Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index add9a6ca2390..c109f9adf6fb 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -291,6 +291,9 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 		break;
 	case DRM_XE_MEM_RANGE_ATTR_PAT:
 	{
+		if (XE_IOCTL_DBG(xe, args->pat_index.val >= xe->pat.n_entries))
+			return false;
+
 		u16 coh_mode = xe_pat_index_get_coh_mode(xe, args->pat_index.val);
 
 		if (XE_IOCTL_DBG(xe, !coh_mode))
-- 
2.43.0

