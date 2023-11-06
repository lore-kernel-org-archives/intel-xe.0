Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABF0C4167B
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB2F10E2E9;
	Mon,  6 Nov 2023 11:22:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B54910E2E6
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269763; x=1730805763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rrEYCPm4nnv0HywQWhmpFGcJykLUEuqdN/NmHJBEzmM=;
 b=bJUOYo7o/SQTmuxu398z+fIzu5SAVzPMtiReAuaIR/JCURayD5UYlf+O
 ZldtOjhGFiWSeQ9jorFetyJaP6f7sCkN1boAMMsfzbl2iH9uyDN8U8XI7
 c0M21UEi6zDOCskdVlqENCBli2J57HYYYzZM3pHCJBQ2kxvkbZ/bHrgBx
 JF3hXisr/ZwzRPFPV/AmWH4tyJ4LMkRlA3kcGSDtUJonpokZYoe82XD6P
 D8s6iyXGK5fondKqMXcVhe9129jOTgd5d2FvrX/bCr10xzbPOZb0zRj8F
 7YUoWLCfVHScOEnTWKILY4t8lCxomydqrBckeUjSxfagDPJ/uK/x+d4Mn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646882"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646882"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411756"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411756"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:41 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:43 +0200
Message-Id: <20231106111845.2333093-24-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 23/25] drm/xe: Capture metadata attached to vma
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 drivers/gpu/drm/xe/xe_usercoredump.c       | 7 ++++++-
 drivers/gpu/drm/xe/xe_usercoredump_types.h | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_usercoredump.c b/drivers/gpu/drm/xe/xe_usercoredump.c
index 1b90fecb1472..faa7b1ae980b 100644
--- a/drivers/gpu/drm/xe/xe_usercoredump.c
+++ b/drivers/gpu/drm/xe/xe_usercoredump.c
@@ -107,6 +107,8 @@ vma_snapshot_create(struct xe_vma *vma, u64 addr, bool is_vram)
 	s->is_vram = is_vram;
 	s->is_userptr = xe_vma_is_userptr(vma);
 	s->is_null = xe_vma_is_null(vma);
+	s->metadata = vma->debug.metadata;
+	s->cookie = vma->debug.cookie;
 
 	/* Ignore alloc failure by omitting contents */
 	if (xe_vma_is_capture_requested(vma)) {
@@ -378,13 +380,16 @@ static void vma_snapshot_print(struct drm_printer *p,
 	const bool is_userptr = s->is_userptr;
 	const bool is_captured = s->flags & XE_VMA_CAPTURE;
 
-	drm_printf(p, " [%016llx-%016llx] S:0x%016llx f:%08x A:%016llx %s %s\n",
+	drm_printf(p, " [%016llx-%016llx] S:0x%016llx f:%08x A:%016llx %s %s",
 		   s->start, s->start + s->size,
 		   s->size, s->flags,
 		   s->dma_addr, is_null ? "NULL" : is_userptr ? "USR" :
 		   s->is_vram ? "VRAM" : "SYS",
 		   is_captured ? "(captured)" : "");
 
+	drm_printf(p, s->metadata ? " m:%u c:0x%016llx\n" : "\n",
+		   s->metadata, s->cookie);
+
 	if (s->data)
 		hexdump(p, s->data, s->captured_bytes);
 }
diff --git a/drivers/gpu/drm/xe/xe_usercoredump_types.h b/drivers/gpu/drm/xe/xe_usercoredump_types.h
index b3aa29f23096..12ebb076887f 100644
--- a/drivers/gpu/drm/xe/xe_usercoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_usercoredump_types.h
@@ -26,6 +26,8 @@ struct xe_vma_snapshot {
 	u64 size;
 	u64 dma_addr;
 	u64 captured_bytes;
+	u32 metadata;
+	u64 cookie;
 	bool is_vram:1;
 	bool is_userptr:1;
 	bool is_null;
-- 
2.34.1

