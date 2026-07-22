Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639E7C44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 12:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9F510E468;
	Wed, 22 Jul 2026 12:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XpRzs/r3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF4510E0E6
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 12:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784724801; x=1816260801;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=SHCOi6TJ0s/xjnMdmUmbEXVCs8+53vumZZxACHTOAcU=;
 b=XpRzs/r3F/Dl9GOLM+2UGh0Vyk/NG8OxvsuxZJXGQgfemgKmOVCE8LFI
 JuAev47HWwelnDIzSqVGFBqlsj7Eu//s7S1dmC/KeTHD8nmxlWxIm1ENa
 LHBN0wc31bVOfe9zvThkq1rnOCc+IFPaxd70GrIwxNAfcM9JllBUxNslt
 9qTOOKqOGiqlc1WGdHn2LF6e3M5UqnR/o9I6GyALMOthVfjm8qzg2+Rz1
 yupuxSS+bk0rdlj9hl4HydqPJ8QjYImI28hQxZRbnmiF5pqtTvRUUvQ85
 jkno0ynoc9unXKijCs9FZQ3QmtbgsSIFZ6uM/F75h2eS+DClRSPdY52tG w==;
X-CSE-ConnectionGUID: a2JUZu6pS0OHn1DP9qx2UQ==
X-CSE-MsgGUID: wsUuqp7eS7ix7m/SV7XWMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96874100"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="96874100"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 05:53:20 -0700
X-CSE-ConnectionGUID: /7E3AfQ5ROWhqSHkRsEUcg==
X-CSE-MsgGUID: boqNJoWWR9aM4zSYsPxJbA==
X-ExtLoop1: 1
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.42])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 05:53:19 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 22 Jul 2026 09:52:57 -0300
Subject: [PATCH] drm/xe/nvls: Drop force_probe requirement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260722-nvl_s-drop-force_probe-v1-1-db944d940cff@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSQqAMAxA0atI1gY0ONWriIhDqgFpSwoiiHe3u
 HyL/x+IrMIR+uwB5UuieJdQ5hmsx+x2RtmSgQpqipYI3XVOETf1Aa3XlaegfmGsrWmMKSuqqw5
 SHJSt3P94GN/3A1oDX7xoAAAA
X-Change-ID: 20260722-nvl_s-drop-force_probe-5f9699142548
To: intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

NVL-S is stable enough for us to drop force_probe requirement. Let's
do that.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 123ffd4c1ee9..36d62927b969 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -461,7 +461,6 @@ static const struct xe_device_desc nvls_desc = {
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	MULTI_LRC_MASK,
-	.require_force_probe = true,
 	.va_bits = 48,
 	.vm_max_level = 4,
 };

---
base-commit: cfee1b098ebceda0381298e945031733a5aec8dd
change-id: 20260722-nvl_s-drop-force_probe-5f9699142548

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

