Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E9CC83F17
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 09:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB1710E745;
	Thu, 31 Jul 2025 09:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lNl/nBwe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA1E10E745
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 09:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753954704; x=1785490704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6JQTzHOBGwKGayHMANiosEE8yLJ/Upf+qxYLkinV0uM=;
 b=lNl/nBweIIWBNeKiKcDfmWfsV8QsxbIwsmEVAI5wVzElyx973Wzez3pT
 5CLXlIM/vsRtuUoIRc4WIX+l8WPKVzxipZijGb2xq86mSuFbuJ6PIdKxf
 vRQb+copK5JGt6I9iX8n3eGLBaM7ucopPS4UWscryQbJHI18lvmE7eGL1
 jBPDmAtNtO2WoGPLgBlMF2Jhr7lxN2z1zeC7EcEsGvy3s++DuLkd+gVuG
 eQHfxctuAp5kc9EJ+2jUkZt4TcJZgT27oIXGavTXr4kS0wYl/uXTT+LqM
 646uCWCk1APzEBdWGFHugTv3sYhWZd7KwIiDZAvcTY26tfE0QfnZZ6pcp Q==;
X-CSE-ConnectionGUID: OPiHi7+gS7m4spEzbbACpg==
X-CSE-MsgGUID: 2qF7Ldm5SfCS67o5gCgE/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="43877059"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="43877059"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 02:38:20 -0700
X-CSE-ConnectionGUID: v6aw1OVVRgqU6D1I/58gcw==
X-CSE-MsgGUID: czpwr+zhRfW5IslE/MdBiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="194056856"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.250])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 02:38:19 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v2 2/3] drm/xe/migrate: don't overflow max copy size
Date: Thu, 31 Jul 2025 10:38:10 +0100
Message-ID: <20250731093807.207572-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250731093807.207572-5-matthew.auld@intel.com>
References: <20250731093807.207572-5-matthew.auld@intel.com>
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

With non-page aligned copy, we need to use 4 byte aligned pitch, however
the size itself might still be close to our maximum of ~8M, and so the
dimensions of the copy can easily exceed the S16_MAX limit of the copy
command leading to the following assert:

xe 0000:03:00.0: [drm] Assertion `size / pitch <= ((s16)(((u16)~0U) >> 1))` failed!
platform: BATTLEMAGE subplatform: 1
graphics: Xe2_HPG 20.01 step A0
media: Xe2_HPM 13.01 step A1
tile: 0 VRAM 10.0 GiB
GT: 0 type 1

WARNING: CPU: 23 PID: 10605 at drivers/gpu/drm/xe/xe_migrate.c:673 emit_copy+0x4b5/0x4e0 [xe]

To fix this account for the pitch when calculating the number of current
bytes to copy.

Fixes: 270172f64b11 ("drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index b8d1ec4c1861..30f40e1201c4 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2057,6 +2057,12 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 		else
 			current_bytes = min_t(int, bytes_left, cursor.size);
 
+		if (current_bytes & ~PAGE_MASK) {
+			int pitch = 4;
+
+			current_bytes = min_t(int, current_bytes, S16_MAX * pitch);
+		}
+
 		if (fence)
 			dma_fence_put(fence);
 
-- 
2.50.1

