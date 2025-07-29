Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362C0C88CB9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 14:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C934710E6B6;
	Wed, 30 Jul 2025 14:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m+oB710m";
	dkim-atps=neutral
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97DB10E061
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 11:05:53 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id
 d9443c01a7336-240418cbb8bso11927275ad.2
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 04:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753787153; x=1754391953; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Abt8vstZAPNZDXKA1xlNOuo3fzYB7imYoFribfPOwfM=;
 b=m+oB710mewyUpc/4RGe+hzDO7ofAqM7639ou4+P+LsubgVzL/DuTMWJVzz4KtuJt0l
 mz+0dGhqjWW2mBUVXKTv6+lpLmXtcYc0Dzl+vFLIiaIlatX46u8y1Aernlsch6eazu5k
 RGuEe38yBrpSgvMmXC+iuAe69mBOyxsdXr9ZHuqzi7bF7ILD46PzBo/FbJdNsM5/biBO
 deRGeB4+DeAhAOzD3GZb2ikwe5jLA3YFUjj/GRHyUGAK6KiXMVDf2zlsQW3rzF0dijkR
 eoDy6JJYkoqh2hh2DhRf8Lbyyo7uONTyDdQDZVQTRMHGyWdF461R/gyYP7adC32j56ac
 mdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753787153; x=1754391953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Abt8vstZAPNZDXKA1xlNOuo3fzYB7imYoFribfPOwfM=;
 b=WgO7/bcGL6qD+OD68esX8RO1cjdnklCCx77pGzGSt8zNNhYtvVMi81O+qlxYlq/2ns
 mk2vgceaQ0fpRffuKb+gG/x7cC++8GvjSz46y0SSuvhCQnn7NvrdzY3lvm5UNx2fU81s
 Gknhhak4biEs5a6Z/dZmWH7qhqjGwd8UrF3E5WNJospjIpaopr+y0gHITnPiDhexBAyh
 vl9cKcuyay72ivTgYsValF4+I2DBrM0In6OeXNzhUAkecUu0dKmVxWHOQdwNF0r9R+gV
 AcfWLPbn45ASZKAgLn6bfmvZeoKyhBySnpENfwkSVs4CmSiBwb4N80GpypBOhOaNIaTU
 AAgQ==
X-Gm-Message-State: AOJu0Yw1HiizYtDec4y+T4SZIjNKRnP4aGK7LfhjSXpm23NigE1jhfvL
 z5m5hljekHPJokOz1GN+YpLS9A6o4qjUGObemhqHcuKXQDwdzSicopI=
X-Gm-Gg: ASbGncvWuJ5sKFEkNTUuga1QavSV5iI8neCslW8pUodSjvnF4a4gUV8dQoFVvl5WXMO
 OaS/742HZjshLDEaEnRfXsxpHCOQT8xqF4zLlBoPhuTqzhQj1C4xLw88SVxga+sGMNTtRbAk8pM
 tinPdAc2SZjayMQV1yPAaTVAdLIcM7MMyXeSow8VtcVpZqaHz6b6r5qiGxpZ/xqVnvjQ+/Gg6Mk
 kx+6QJQ2YJhWwIQ5bCEzn45Ri1uXR2TqD0WIy4gJqpjoo3IfSQnpPVdT3fGMpdApcp8A4/bT/40
 c3f7jGEIebwCZNJxZVz+roKzZusbXfl8KKMBqN1PL+Of/iXYx3H0xhCejpfq7nSEks5yN8jln+k
 5fJ8RcRnNYjre+2fN2ArfDAU2MCN85DrX4NgzBoo=
X-Google-Smtp-Source: AGHT+IHAQn5G/9G5dVp6WunIHeCfG5Ftkh0IQEMUb3fjgxxrqRXsfHaPCtjrK9gLf0XgoJ/tEmN9YQ==
X-Received: by 2002:a17:902:cec7:b0:235:6aa:1675 with SMTP id
 d9443c01a7336-23fb315611bmr180795215ad.52.1753787153068; 
 Tue, 29 Jul 2025 04:05:53 -0700 (PDT)
Received: from git-send-email.moeko.lan ([139.227.17.83])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe30bc1fsm75929025ad.5.2025.07.29.04.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 04:05:52 -0700 (PDT)
From: Tomita Moeko <tomitamoeko@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org,
 Tomita Moeko <tomitamoeko@gmail.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH 6.12 3/4] Revert "drm/xe/devcoredump: Update handling of
 xe_force_wake_get return"
Date: Tue, 29 Jul 2025 19:05:24 +0800
Message-ID: <20250729110525.49838-4-tomitamoeko@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250729110525.49838-1-tomitamoeko@gmail.com>
References: <20250729110525.49838-1-tomitamoeko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 30 Jul 2025 14:02:27 +0000
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

This reverts commit 9ffd6ec2de08ef4ac5f17f6131d1db57613493f9.

The reverted commit updated the handling of xe_force_wake_get to match
the new "return refcounted domain mask" semantics introduced in commit
a7ddcea1f5ac ("drm/xe: Error handling in xe_force_wake_get()"). However,
that API change only exists in 6.13 and later.

In 6.12 stable kernel, xe_force_wake_get still returns a status code.
The update incorrectly treats the return value as a mask, causing the
return value of 0 to be misinterpreted as an error

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Tomita Moeko <tomitamoeko@gmail.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 8050938389b6..e412a70323cc 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -197,7 +197,6 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
 	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
 	struct xe_device *xe = coredump_to_xe(coredump);
-	unsigned int fw_ref;
 
 	/*
 	 * NB: Despite passing a GFP_ flags parameter here, more allocations are done
@@ -211,12 +210,11 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 	xe_pm_runtime_get(xe);
 
 	/* keep going if fw fails as we still want to save the memory and SW data */
-	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
+	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
 		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
 	xe_vm_snapshot_capture_delayed(ss->vm);
 	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
-	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
 
 	xe_pm_runtime_put(xe);
 
@@ -243,9 +241,8 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	u32 width_mask = (0x1 << q->width) - 1;
 	const char *process_name = "no process";
 
-	unsigned int fw_ref;
-	bool cookie;
 	int i;
+	bool cookie;
 
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
@@ -268,7 +265,8 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	}
 
 	/* keep going if fw fails as we still want to save the memory and SW data */
-	fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
+	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
+		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
 
 	ss->ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
 	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
@@ -286,7 +284,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	queue_work(system_unbound_wq, &ss->work);
 
-	xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
 	dma_fence_end_signalling(cookie);
 }
 
-- 
2.47.2

