Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156ADCA0EDC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 08:39:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DFF10E353;
	Wed, 20 Aug 2025 08:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3k8XfJl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA6110E353
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 08:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755679151; x=1787215151;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Lg14O8eT16rRpVID74r7uxyDFIRp+KVOcExc0UUrKe0=;
 b=H3k8XfJlLNP6orpwsnEZuV35SQnLp9KtkU7/oPUt3+H+w9mD0X1KsCL5
 umfMFwn34QWcegE2j4CSWTrDZhA2oiXf4zjbkk3gjU4KTuwIRmyXkohFo
 d+tpLc/9IutambXOSWAwAt74PetScvsleHbMMRADEvDYyv/kyYI7PKA04
 0/JYhd2X3lAse+w5/XjHUPvWLvA6cmfT8izr64iuWpOvXghxHsCWwKd+T
 5yZfyn6sHY7U3tTldFUaxoW/dswHnigXCnXTDPbSLmm0ytjjR2Nqs6O6d
 JW0ydXHBp0ZA2MTrre67bKiyTWT6QweGZBILMfWhOdi6PXfddf5ho6T9y g==;
X-CSE-ConnectionGUID: ln+de7eOTEiDYcnr/HCPRw==
X-CSE-MsgGUID: Juewg0/yScGPuhdmHzgWHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="69319250"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="69319250"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 01:39:11 -0700
X-CSE-ConnectionGUID: mSslk5TrSM+CaE1TVFJ6ng==
X-CSE-MsgGUID: Ttu6dOFUShKr9e1kgeB8sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="167979737"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.248])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 01:39:10 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2] drm/xe/xe_sync: avoid race during ufence signaling
Date: Wed, 20 Aug 2025 10:39:04 +0200
Message-ID: <20250820083903.2109891-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
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

Marking ufence as signalled after copy_to_user() is too late.
Worker thread which signals ufence by memory write might be raced
with another userspace vm-bind call. In map/unmap scenario unmap
may still see ufence is not signalled causing -EBUSY. Change the
order of marking / write to user-fence fixes this issue.

Fixes: 977e5b82e090 ("drm/xe: Expose user fence from xe_sync_entry")
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5536
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index f87276df18f2..82872a51f098 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -77,6 +77,7 @@ static void user_fence_worker(struct work_struct *w)
 {
 	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
 
+	WRITE_ONCE(ufence->signalled, 1);
 	if (mmget_not_zero(ufence->mm)) {
 		kthread_use_mm(ufence->mm);
 		if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
@@ -91,7 +92,6 @@ static void user_fence_worker(struct work_struct *w)
 	 * Wake up waiters only after updating the ufence state, allowing the UMD
 	 * to safely reuse the same ufence without encountering -EBUSY errors.
 	 */
-	WRITE_ONCE(ufence->signalled, 1);
 	wake_up_all(&ufence->xe->ufence_wq);
 	user_fence_put(ufence);
 }
-- 
2.43.0

