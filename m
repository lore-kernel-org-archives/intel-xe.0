Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DD3C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 03:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874CC10EA78;
	Fri,  1 Mar 2024 03:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qqn1X5/k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D127610EA7A
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 03:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709265312; x=1740801312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bVnzSSL+ptFR9bScjPRTeSZMt2zxy6inczOzPb5j+ac=;
 b=Qqn1X5/kNQbMF3gOhKCUAdrjMb23q74DgLjowTcZzaJIdN8I9Hl/6fHG
 i2Xns/f2UDB18ZEyT7+khlHmg0nJaWNBe/zfzZYztqkYTvuoJ+0FWaRm+
 3GF4l3emjTqtVPu3AG3gcleWgp1mwOkn19Oouo2D612VE39Ni0KqEKHDi
 NaoST34KZWV8wqKjXu24im8Pq292JtVjAKV8EU6Cv+1QgZ2+3T8yu9LB0
 nmDoh3VQukW2qsIDvq7RkohGM/+KeGuLYMWeGH/awxeeIF4IgEy32M5sS
 D0lGb3VXq5Y19vALO+aoECg0qKKebcrXgoEeLOUhBB5JrkWUxRiUWuQtH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14425067"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; d="scan'208";a="14425067"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 19:55:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; d="scan'208";a="45607203"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 19:55:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 2/3] drm/xe: Validate user fence during creation
Date: Thu, 29 Feb 2024 19:55:21 -0800
Message-Id: <20240301035522.238307-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301035522.238307-1-matthew.brost@intel.com>
References: <20240301035522.238307-1-matthew.brost@intel.com>
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

Fail invalidate addresses during user fence creation.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index c836a5f3a1ea..c20e1f9ad267 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -53,14 +53,18 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 					       u64 value)
 {
 	struct xe_user_fence *ufence;
+	u64 __user *ptr = u64_to_user_ptr(addr);
+
+	if (!access_ok(ptr, sizeof(ptr)))
+		return ERR_PTR(-EFAULT);
 
 	ufence = kmalloc(sizeof(*ufence), GFP_KERNEL);
 	if (!ufence)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	ufence->xe = xe;
 	kref_init(&ufence->refcount);
-	ufence->addr = u64_to_user_ptr(addr);
+	ufence->addr = ptr;
 	ufence->value = value;
 	ufence->mm = current->mm;
 	mmgrab(ufence->mm);
@@ -183,8 +187,8 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		} else {
 			sync->ufence = user_fence_create(xe, sync_in.addr,
 							 sync_in.timeline_value);
-			if (XE_IOCTL_DBG(xe, !sync->ufence))
-				return -ENOMEM;
+			if (XE_IOCTL_DBG(xe, IS_ERR(sync->ufence)))
+				return PTR_ERR(sync->ufence);
 		}
 
 		break;
-- 
2.34.1

