Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EDBC3DA64
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 11:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF7110E15B;
	Wed, 31 Jul 2024 11:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZMkIiEmJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6902210E15B
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 11:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722424296; x=1753960296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8qijpVTaFD1AHYWlcOcJ9Y8y2TalFHKO3qiqwAg/g4s=;
 b=ZMkIiEmJzPwk/NMUcwKPeK9joLB+Pv+n4NCDobRTYubmXWNjlexlLJ9F
 /3Wjcr6ISPey7e4JX/qGjyLyPGSN5R5lqHQC61/D2EF1eixK7HqUO1GSF
 8FYMXCvNpuWQ9eOwW0op8LdPnxRr5H4iN8V0JCQ+MjntpDDlgi7ZN7Hr0
 47WdQNj3R2U8OiR/NpzgvRl0PkHd5FhxvnW+HpjUCfkxGuAuln0zWLKVY
 RZXb8wu2zxukGyEhZ1CIvrZ0qQGTgwlZOwsSPBKy7yTNqIpomzC5SCVnw
 0N87oyYh/7Wt669spszNOc5oqcZ7Gp4blyX7MYqiK1IKtRAia8bWCOMdD Q==;
X-CSE-ConnectionGUID: KNHC7kVSRnOMulDjcq6NOw==
X-CSE-MsgGUID: ksBl3aEgRYWtxOyqXcACow==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="42825555"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="42825555"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 04:11:35 -0700
X-CSE-ConnectionGUID: IzBU+q79TZ+o6/+6r1Mtvw==
X-CSE-MsgGUID: lCmL9Ip1Q2mWA5PwbsgWUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59290204"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 04:11:33 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH] fixup! drm/xe/eudebug: implement userptr_vma access
Date: Wed, 31 Jul 2024 13:11:12 +0200
Message-Id: <20240731111112.2702343-1-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZqRRQmDz9zF/IMUW@DUT025-TGLU.fm.intel.com>
References: <ZqRRQmDz9zF/IMUW@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
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

This fixup pulls call to xe_vma_userptr_pin_pages out of
vm->userptr.notifier_lock.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Hi Matthew,

I hope this fixup should answer your concerns.
It was tested on LNL with lockdep turned on and with your
two patches mentioned earlier.

Posted in form of fixup to underline the difference,
let me know if you insist on full patch.

Regards
Andrzej
---
 drivers/gpu/drm/xe/xe_eudebug.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 472d9314505a..80d6f886969a 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -3343,6 +3343,7 @@ static int xe_eudebug_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
 	struct xe_res_cursor cur = {};
 	int cur_len, ret = 0;
 
+lock_notifier:
 	/* lock notifier in non-invalidation state */
 	for (unsigned long nseq = uvma->userptr.notifier_seq; true;
 	     nseq = mmu_interval_read_begin(&uvma->userptr.notifier)) {
@@ -3358,9 +3359,11 @@ static int xe_eudebug_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
 		list_del_init(&uvma->userptr.invalidate_link);
 		spin_unlock(&vm->userptr.invalidated_lock);
 
+		up_read(&vm->userptr.notifier_lock);
 		ret = xe_vma_userptr_pin_pages(uvma);
 		if (ret)
-			goto out_unlock_notifier;
+			return ret;
+		goto lock_notifier;
 	}
 
 	if (!up->sg) {
-- 
2.34.1

