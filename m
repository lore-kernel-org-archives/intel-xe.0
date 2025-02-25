Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20399C021BE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 04:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C346910E56D;
	Tue, 25 Feb 2025 04:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hseb9Yee";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3161B10E545;
 Tue, 25 Feb 2025 04:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740458534; x=1771994534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BPwQfrVh4y6GwizLFCXGJau4Hr+mxHSPE1n5oQna2oc=;
 b=Hseb9Yee92hEziDH+NaGdPc9N7NL58yJVNZwSthwYk/fWNRVII5PSlwg
 eYh3dqlUw+oIbV3nmFFWddphJbIlbk/tG3dyUlpSmizRKp7m6dhH2KjM8
 TUiXaJdoI3rRgkO++BnLztm/QcrlE0xq7unj4600v1glrU8lRqwsXnj1C
 31WK0hLrvSyyMEL8UVtpyAIVObPGCCCfyX0eIrNr2yhfa9rOmc7CT/1wm
 WfXW2/Tz37h7Slf1FhSY+BnA1fw/fsJIXxw+tGFkOP/i46tPS5GHSyLnu
 5Z50NHKl6hciykybyhSnMKE0sYOBWRWv/x+Tcng8RZYe19XKPtOVEWjD8 A==;
X-CSE-ConnectionGUID: XwYH1MMiTxSCah7WgiLBbg==
X-CSE-MsgGUID: yEbr0g8oRUqytPCvWlRwlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51885013"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="51885013"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:13 -0800
X-CSE-ConnectionGUID: LJpSiuIuQdqITTPWVZOSuQ==
X-CSE-MsgGUID: Lffkxa/VRo6CVvGz8MQieA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116290299"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v6 18/32] drm/xe: Enable CPU address mirror uAPI
Date: Mon, 24 Feb 2025 20:42:57 -0800
Message-Id: <20250225044311.3178695-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225044311.3178695-1-matthew.brost@intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Support for CPU address mirror bindings in SRAM fully in place, enable the
implementation.

v3:
 - s/system allocator/CPU address mirror (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a3ef76504ce8..3c1a824af42f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3065,12 +3065,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		u16 pat_index = (*bind_ops)[i].pat_index;
 		u16 coh_mode;
 
-		/* FIXME: Disabling CPU address mirror for now */
-		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror)) {
-			err = -EOPNOTSUPP;
-			goto free_bind_ops;
-		}
-
 		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
 				 !xe_vm_in_fault_mode(vm))) {
 			err = -EINVAL;
-- 
2.34.1

