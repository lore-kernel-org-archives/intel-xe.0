Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1340C44539
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 13:42:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E84A10EDC0;
	Wed, 22 Jul 2026 13:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AWu8hY9K";
	dkim-atps=neutral
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B4A10E3D4
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 00:47:33 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-966e7380109so3706781241.3
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 17:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784681252; x=1785286052; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=xbYEwl1APLA9v8Bgt7rzMXgmY//bSBtGC8TuI9t+PTM=;
 b=AWu8hY9KaetKVTmp4IasWawehCkeb+QYpqUZtkX9eG38HM/WcnMWzzGRN9tf3tuViq
 G0GwQ6gDUwpjOOkYCKE4fgyxPfI+AGKMU0JbOcWSdr/GkvnU60HDeZVlurfR5KL1m291
 kEPasCRUmbcBPLP6DQIKjTZe8AElPaw3697ZSbxB9eUx5j0Eyt8J1kpo72mj38MKodD8
 Ma0S72F1L5SSsOxr5hVVQ6IG7139xGwpbguX+OvagRPB3wF/TuyFvxLiMJGxfYAZugB8
 t44CXGYQipXhyCjPIwAxDK513Ylm7t9kF8UVqZk3FPmbhxhlwUAN7bSIm9QWNu+6vzA7
 vqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784681252; x=1785286052;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xbYEwl1APLA9v8Bgt7rzMXgmY//bSBtGC8TuI9t+PTM=;
 b=lHVALzm9U4u+fa3GLAWLt+7spHBeasCugVLHFwPABea2mBlXa/55GMdPubEmyXvkTj
 G+yZu5+sm9pFuOyH3F6hhUPykow1EvuBK6FY46E//vYLhZf1zQM0UNRmD6XhZ2+EQOPR
 cQY8osoH13uSZNysldf1rC3R67M6HBIsauA0RDN3W7KiSYjccP1OGl26Q9olcdjZ7dsd
 QCuMJVrvAY2xDT7Ontq5GGz7P4FfQzmxln/uVBnbeohtW4FDIwZ6Zr54X1JJoWYakWRn
 pCvcw5LvsG2wM8YkKRgUa7wZGIC6yrRRH+UvXXTSeaLCWGNCCLEpOsfMYpbDMV7XGau4
 lxeA==
X-Gm-Message-State: AOJu0YzoKcfTGVwooHDKacPO7Z4+1MmvBT7wrT+vaZQTQ/IikXFAClU0
 FsvA1a8V3ZeQTG8IIZxj89K3AZFdmbVi+Ngerpt4HU2vTkTsSYq3wt2v5g6R0w==
X-Gm-Gg: AR+sD12qm+SwpDUyt3ewLgbGXr8ZH/GxqPC/VWbzxAqisL+PK0maWgshhoSalCfq3qt
 hrv5lW2kCJzIiAIWDpXDqW90+OUeyk1xVnxJbMlsz5eakBYjYfqZzJz1uoZASlc4Llb1TJdYxXk
 +sQ33w2aVAXFYTafzTil8WPuaawOO9oLclhhAXXb9GtmAtfJeSsltPN9W1LkohyKKI/9KxJwkqZ
 9MD7HN8/2QP+DUlHTU/a9swxec9B50PwP93d6jzV2mcWHcYJweH2xdIT0Rzyx3LeaUPtvL+nFH4
 NJqPMLhbaijpAvdlrmpwKmS6znPNnbpY5ONrY1dn4aXkzvHqFG+4G3mgxBuP4MNjSgEqIyUtqKJ
 qBWzdmWHkwdm4yCYOrKJbtUGUhJuwN9NYoFz7RyQnEP71sIfBHTrHlYOwD8trv++gU9e8AFMxRw
 CETWBSF0+GppbxUaeG3OegxgjuulPvIsk0VG6z7KsTIbPXzZZUNPVyNI2xA9uTQ/JVyo4pzA==
X-Received: by 2002:a05:6102:41ac:b0:739:77a7:90bc with SMTP id
 ada2fe7eead31-74753727549mr8172513137.23.1784681252241; 
 Tue, 21 Jul 2026 17:47:32 -0700 (PDT)
Received: from lord.bigscale.net ([170.246.211.222])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-74ad31c215bsm1346505137.2.2026.07.21.17.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 17:47:31 -0700 (PDT)
From: =?UTF-8?q?Tales=20A=2E=20Mendon=C3=A7a?= <talesam@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 =?UTF-8?q?Tales=20A=2E=20Mendon=C3=A7a?= <talesam@gmail.com>
Subject: [PATCH v1 2/4] drm/xe/mcr: Sanitize steering semaphore on GT resume
Date: Tue, 21 Jul 2026 21:46:52 -0300
Message-ID: <20260722004654.744249-3-talesam@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722004654.744249-1-talesam@gmail.com>
References: <20260722004654.744249-1-talesam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Jul 2026 13:42:23 +0000
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

The MCR steering semaphore can be left in a held state after a suspend
cycle. The first MCR access after resume then stalls until the
semaphore wait times out and logs:

  Tile0: GT1: hardware MCR steering semaphore timed out

as observed on an Arrow Lake-P system resuming from s2idle. Recovery
currently only happens because mcr_unlock() releases the semaphore
unconditionally.

i915 addresses the same issue in intel_gt_resume_early() via
intel_gt_mcr_lock_sanitize(), noting that the hardware team confirmed
that forcibly releasing the semaphore is safe during driver
load/resume because no other agents acquire it at that time.

Port that to xe: release the steering semaphore at the start of
xe_gt_resume(), before the first MCR access performed by
do_gt_restart().

Signed-off-by: Tales A. Mendonça <talesam@gmail.com>
---
 drivers/gpu/drm/xe/xe_gt.c     |  7 +++++++
 drivers/gpu/drm/xe/xe_gt_mcr.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_mcr.h |  1 +
 3 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index dfdacc0f6de..c61f3d9fc9a 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -1068,6 +1068,13 @@ int xe_gt_resume(struct xe_gt *gt)
 		return -ETIMEDOUT;
 	}
 
+	/*
+	 * The MCR steering semaphore may be left held across a suspend
+	 * cycle; release it before the first MCR access below so that
+	 * mcr_lock() does not stall until the semaphore wait times out.
+	 */
+	xe_gt_mcr_lock_sanitize(gt);
+
 	err = do_gt_restart(gt);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index e1e3c0688dc..3934d0de717 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -750,6 +750,28 @@ static void mcr_unlock(struct xe_gt *gt, unsigned int fw_ref) __releases(&gt->mc
 	}
 }
 
+/**
+ * xe_gt_mcr_lock_sanitize - Release the hardware MCR steering semaphore
+ * @gt: GT structure
+ *
+ * The MCR steering semaphore can be left in a held state after a suspend
+ * cycle, in which case the first MCR access after resume stalls until the
+ * semaphore wait times out.  Forcibly release the semaphore during driver
+ * load/resume; this is safe because no other agents acquire the semaphore
+ * during the load/resume process, mirroring i915's
+ * intel_gt_mcr_lock_sanitize().
+ */
+void xe_gt_mcr_lock_sanitize(struct xe_gt *gt)
+{
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
+		return;
+
+	lockdep_assert_not_held(&gt->mcr_lock);
+
+	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270)
+		xe_mmio_write32(&gt->mmio, STEER_SEMAPHORE, 0x1);
+}
+
 /*
  * Access a register with specific MCR steering
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index 75374662f10..162f54075cf 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -16,6 +16,7 @@ void xe_gt_mcr_init_early(struct xe_gt *gt);
 void xe_gt_mcr_init(struct xe_gt *gt);
 
 void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt);
+void xe_gt_mcr_lock_sanitize(struct xe_gt *gt);
 
 u32 xe_gt_mcr_unicast_read(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
 			   int group, int instance);
-- 
2.55.0

