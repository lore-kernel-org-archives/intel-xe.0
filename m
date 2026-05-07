Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8E8CD343F
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 12:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D768010E058;
	Thu,  7 May 2026 12:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y0ZbRvS8";
	dkim-atps=neutral
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0232C10E18B
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 05:54:11 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-82418b0178cso171985b3a.1
 for <intel-xe@lists.freedesktop.org>; Wed, 06 May 2026 22:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778133251; x=1778738051; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Uh9bbazrPITkf0mpglMFr/dzIoLu0nt2Rlj2ZEQ+nU0=;
 b=Y0ZbRvS8GsXzLkwRHOtc0ng9uHOQPmEJs0G/b2siSR6Ljen0R/yykbdv2AVls395Mo
 Sn0aJ7UpCweLZXdeDb+bFRDL1iNpNKz34UTd9Zf5IFK8Z4hRIQOkpyjVvnyujl+4Qai8
 n9aDuHrjuVzQHsYZEn+yUXYVJ19aV3UXeXpT4q5Z+s9uqE9yr+uFLLgb1zidQJ0zArEQ
 0gxnkfoJXgbslh3iEOEc+LPGAO8J34wNBrrVM7E1qlgxnrpQYGl5Syn5ig5didgIQrq2
 qUJrpLiP1kq4P6CC5ezqAU8CEgfr/1YbR4RYXim2Llyk4IIwkoXwJYBhJDEwXmPHQUmo
 b/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778133251; x=1778738051;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uh9bbazrPITkf0mpglMFr/dzIoLu0nt2Rlj2ZEQ+nU0=;
 b=YE3EpGfnKMz45okqj/SBwi5N560KC3N2Lcw6tXNvpi5nDeNFT7I6u2ydEcWLdlHuTc
 cDQ09EGinD/fZmu+S2T+C/bsYwjTk2jVhIRtX5kHd6EhJmaxM3KYE+ov5Ux/AORTQaOn
 VUyC/DfZgj4hMhYJvfym7das74ME+6RY9ukQdEeDRLQfkZMQIrrNclR0tyY3PREsnOgL
 H0W7hgcgxEAwZyVPulqNynGzXBtLqn8DVgOEqS/yAYCtvOO4C6kyuYIxrwuM+GndC04q
 /vNhZ8W9Bn1pvtg5dT9hS3EKFr7S4egIkakvyzbrFf/4m+4DKgimhNqO4GA3k2gOvr5k
 lBew==
X-Gm-Message-State: AOJu0YzIt6uOBuHWpgajf9lMPAYKoHMcjq/6Bdoji7HcphnsfNOAw+RC
 K9UmxqwzPwo+sNpXigluqLq06xdLmE2f3fTp0A3rJJHokrxd7c8mG5+plZkxf0A=
X-Gm-Gg: AeBDies2NI1+1zxWVQKfEtxkiULWpbhYKAozWPA+Abhiah/nb9A0dJTYDSnAWIuhLzG
 L7hD6HIBtmykUq7B7xLF4TWgEXAWehgFmFbpzTzoZMnvTCiSm/zvy7ahSdlsZAR8ok54OMwgW1e
 TywDVDO4Zty/eT0BOCWvs1jN6Iq7WmBovjp12ea1SXyzXOWxG9H2psFq5B43DZa2OQD53qEhnbJ
 PZ/q+dn8h/Lqg399JkBP9LlAiVO1RTJY5htOfMgnmh+kZEsFul5wc+6NaBtpBwzcv9QO0XY+IyI
 pLjG/kHgO1IiSXGzJRhqcx14WnyR8oruTtLlK/gnS4/KFKU3leLgby9XKg3AIQmIifIwG2qBBjd
 ON+qIrUKO6IzKsQGZRA6BRXRI9+5bjpy76NCViZeBbACp7BM/l06bNqDHExz9/R5epSxZnS3ItI
 KWNjxO+xN0rhRK4awGPbtIxDKKJnvcQ/S78mXlcfhXrw5XFi4ts/Ca+vGDOxyF0BAtTKDto2A4L
 wiIYtRj0NX3X7c=
X-Received: by 2002:a05:6a00:b483:b0:837:6bb9:acd5 with SMTP id
 d2e1a72fcca58-83a5825898bmr6322050b3a.0.1778133251101; 
 Wed, 06 May 2026 22:54:11 -0700 (PDT)
Received: from coe.tail83f5bd.ts.net ([202.177.225.148])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83967dbf67fsm7577641b3a.47.2026.05.06.22.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 22:54:10 -0700 (PDT)
From: Ramesh Adhikari <adhikari.resume@gmail.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com
Cc: stable@vger.kernel.org,
	Ramesh Adhikari <adhikari.resume@gmail.com>
Subject: [PATCH v2] drm/xe: Add bounds check for num_binds to prevent memory
 exhaustion
Date: Thu,  7 May 2026 11:23:51 +0530
Message-ID: <20260507055352.61017-1-adhikari.resume@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 07 May 2026 12:16:34 +0000
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

The xe_vm_bind_ioctl function accepts user-controlled num_binds without
bounds checking, allowing arbitrarily large memory allocations. This
follows the same vulnerability pattern that was fixed for num_syncs in
commit 8e461304009d ("drm/xe: Limit num_syncs to prevent huge allocations").

Add DRM_XE_MAX_BINDS (2048) limit and validate num_binds before allocation.

v2: Increased limit from 1024 to 2048 based on Mesa source analysis:
    - Mesa's maximum usage: 960 binds (conformance test dEQP-VK)
    - Confirmed by Intel Mesa developer in commit ba6bbdc
    - 2048 provides 2.13x safety margin while limiting allocation to 64KB
    - Prevents unbounded allocation (attacker could send 268M binds = 18.8GB)

Cc: stable@vger.kernel.org

Signed-off-by: Ramesh <adhikari.resume@gmail.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 5 +++++
 include/uapi/drm/xe_drm.h  | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a717a2b8dea..1ff66874f43 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3841,6 +3841,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		return -EINVAL;
 
 	err = vm_bind_ioctl_check_args(xe, vm, args, &bind_ops);
+
+	if (XE_IOCTL_DBG(xe, args->num_binds > DRM_XE_MAX_BINDS)) {
+		err = -EINVAL;
+		goto put_vm;
+	}
 	if (err)
 		goto put_vm;
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ae2fda23ce7..e666b73c81d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1606,6 +1606,7 @@ struct drm_xe_exec {
 	__u32 exec_queue_id;
 
 #define DRM_XE_MAX_SYNCS 1024
+#define DRM_XE_MAX_BINDS 2048
 	/** @num_syncs: Amount of struct drm_xe_sync in array. */
 	__u32 num_syncs;
 
-- 
2.43.0

