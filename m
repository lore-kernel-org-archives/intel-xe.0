Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F3BD116EA
	for <intel-xe@archiver.kernel.org>; Sat, 29 Nov 2025 22:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0793110E218;
	Sat, 29 Nov 2025 22:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EvOt6DPl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF2210E218
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Nov 2025 22:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764455194; x=1795991194;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j9UL0bwynt54klz2a3ySY6rIMhVNChdqpYQrrMxqJy0=;
 b=EvOt6DPlHtswY5UYFofMOdQI+3GyJ79Yzm1Uzvlwp6z7elSLrMSzspgl
 FEPGSKYp97o1gByJd/rSZzQHSoDgMOx9Lm0jfbk3VJBIcfpYlF//wXXs2
 KEwl4F8qSUNZxXWYEXZg19GXt0hVs/+NPZ3/LpZHRq5PYQfG0w2VcfQb9
 JCCHNqDzno78q9QfSVWBRWE+J+mDKBDMiDj/5K3lhGGYjkZ5IDfCUh+36
 3B8O/Tc8BmeiuksNsBdNAGCAXuwYsyOWVuMuzq6mCpBsUgWKksF0qbJcz
 r3aQJBjh02JW++zy6vQ/ld6F2Ya8tE+fqka+ytjDQxVSLpNzUi69dyRGd w==;
X-CSE-ConnectionGUID: S1uxhrROQ86389z+TF722w==
X-CSE-MsgGUID: r9VZufWuREOdsSqx2H/zTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="77120244"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="77120244"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 14:26:33 -0800
X-CSE-ConnectionGUID: kbqOCDCiQ1yNaGnGidv8qw==
X-CSE-MsgGUID: DNHJ+St1QDCfam6ps5pM6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="194515610"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 29 Nov 2025 14:26:32 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <demarchi@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH] drm/xe/configfs: free aux. array after storing the wa_bb
Date: Sat, 29 Nov 2025 23:25:41 +0100
Message-ID: <20251129222541.3306090-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

When commands issued via configfs are executed mid- or post GPU context
restoration, a temporary buffer is reallocated in order to store all of
commands of varying count. However, after content of the buffer has been
copied to the desired location it is never freed, which causes following
memory leak to appear when running igt@xe_configfs@ctx-restore-mid-bb:

    kmemleak_alloc+0x4a/0x90
    __kmalloc_node_track_caller_noprof+0x645/0x9d0
    krealloc_node_align_noprof+0x206/0x3c0
    wa_bb_store+0xf4/0x2c0 [xe]
    ctx_restore_mid_bb_store+0x21/0x30 [xe]
    configfs_write_iter+0xe6/0x150
    vfs_write+0x231/0x540
    ksys_write+0x6d/0xf0
    __x64_sys_write+0x19/0x30
    x64_sys_call+0x79/0x2350
    do_syscall_64+0x93/0x10f0
    entry_SYSCALL_64_after_hwframe+0x76/0x7e

Deallocate temporary array upon finishing the store of batch buffer
into wa_bb.

Fixes: 39ac06f7006f ("drm/xe/configfs: Add post context restore bb")
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 9f6251b1008b..f9a64352138b 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -789,6 +789,8 @@ static ssize_t wa_bb_store(struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
 
 	memcpy(wa_bb, tmp_wa_bb, sizeof(tmp_wa_bb));
 
+	kfree(tmp);
+
 	return len;
 }
 
-- 
2.45.2

