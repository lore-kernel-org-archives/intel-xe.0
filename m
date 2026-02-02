Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2032EE73153
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 10:38:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5DC10E428;
	Mon,  2 Feb 2026 10:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="akKj7T/u";
	dkim-atps=neutral
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC8510E420
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 10:38:09 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4806f9e61f9so21342695e9.1
 for <intel-xe@lists.freedesktop.org>; Mon, 02 Feb 2026 02:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770028688; x=1770633488; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z1Zr9CZPjcDp+rU0IFgfIbOKfXeqeyWHk38cKV69c90=;
 b=akKj7T/u3vOwD2yndNtyaTjdPdGNwUfAYm+n1I4Ft6zQhNmQWlEt28uoSJ9ccDhjFx
 XIy9EurZwlH3uqR+3Za4sqdR1ke4E5g9eL40yIey5OW6izOs4NvX/Lm+MkIhAz3URdfA
 tOF9zPEyV1Dlth0w5zpdagxkMfpck1q6ZDUclcTk5GqugZPQ2ryXOXm8EpbZpLQWEZvZ
 QhzgjyMQhV4nmKuhrgT4o67zXDBvVXFVKG5zvGgTMln/fAjJ2gk4uiXRtBBc/Qo1F10O
 mrrkvuB4A9cbAHe+LmjoEfLeP3LGuQaubqdsQ4VCvaShZRM2gKaJciAAACaBn2WSTKyn
 m0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770028688; x=1770633488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=z1Zr9CZPjcDp+rU0IFgfIbOKfXeqeyWHk38cKV69c90=;
 b=Mid3HbstmkVPhWpxb5uy4Q2UmDxuCBfUIgjlqGmbxZq20DKfAwp+2JrCsamzlNk0ly
 BeSA+igNp3BZ87v0jbXd0UmZtxcT7Kbddwk7TQ4W+2fltQSF/sFk1iIN88hHBRNfVxn8
 IySW9fau1yFEZ3tfLX88s8BShvpVHEPmrzTmT7WXsI9jJulAfmqHWDlYu0JggCjWOsl6
 8WjFU0Hf3yi79HqAsmJgCCKNL4p4sKzXrTwAbrdobj/CHuUGuN/lsNsOs5Zl8U+csjkE
 JAspBdeDIHkctObYShgedCLQFYJoIR7P9tum4Wao6m3lq1X9qhU1kb3ZiiI/WrptPfo7
 AxrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw8n6CnJEhNV7ebt+4VD4xzpsCMvpLpvgqb9EM2WPfsj4MHc0w8Z9OmedR3/ipZbuSAh89sV8ZQQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAtSTwnZ10yEvanyyVmSA0B8mXFpeqr8WLP9xBctSO9y/H2C23
 Ugbat55eQoDjFmAM+TaNJ8GHCWFoc2YUJ1pY6QGyd9oPnWRNxUCxHZInwYmdJtl41+I=
X-Gm-Gg: AZuq6aKM6q8Y06TVDOrGHQ5cuSomIsDiLKbM0jLLb98QBFqmE3H3W2yZ4ZE8sfbldHg
 q38UY5oDWw5Lz2Exw1F/O9zm0fWuoqZvgZxQ3IpiOKuX9jfdqFcQkHA78AKdUxrungrurAr5S2o
 CBzOfKjN4d2CEZCFAwcpzk0Ul0rKYaIM+Z+Lt4PfpM4yqDSGpurC3TwJ2/WQFO+qYfA7m+1exA6
 H+WMHhI7R2aIZPiG/9AwGYb2R4UUfOzWeNeqsHC2iCzV0Iqbx9/r5WRE1RhvwpGWlty46AujOo7
 9MH45kZbfFKKJCOsyKC8PnZIZKourc4axV3JtdOtV1Lz5KGFYZMFBtmWYj3VZmaYxL6yoNXSAFT
 rybwLAlilkz2Sg1qi6A7IHgiWE69i0p14pfpBgzsyS01CLRhJWRyC2ZurVXnu+6L9dt732mJmI2
 x66ynO3kjXFUeXvQ==
X-Received: by 2002:a05:600c:3148:b0:480:1e9e:f9b with SMTP id
 5b1f17b1804b1-482db45d7eemr147372575e9.16.1770028688023; 
 Mon, 02 Feb 2026 02:38:08 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1354d43sm47020132f8f.43.2026.02.02.02.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 02:38:07 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v4 2/2] drm/xe: add WQ_PERCPU to alloc_workqueue users
Date: Mon,  2 Feb 2026 11:37:56 +0100
Message-ID: <20260202103756.62138-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202103756.62138-1-marco.crivellari@suse.com>
References: <20260202103756.62138-1-marco.crivellari@suse.com>
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

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
   commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The refactoring is going to alter the default behavior of
alloc_workqueue() to be unbound by default.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU. For more details see the Link tag below.

In order to keep alloc_workqueue() behavior identical, explicitly request
WQ_PERCPU.

Link: https://lore.kernel.org/all/20250221112
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/xe/xe_device.c          | 4 ++--
 drivers/gpu/drm/xe/xe_ggtt.c            | 2 +-
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 3 ++-
 drivers/gpu/drm/xe/xe_sriov.c           | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9cf82bde36c4..9e5fb0d4b8e7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -508,8 +508,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
 						       WQ_MEM_RECLAIM);
 	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
-	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", 0, 0);
-	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", 0, 0);
+	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", WQ_PERCPU, 0);
+	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU, 0);
 	if (!xe->ordered_wq || !xe->unordered_wq ||
 	    !xe->preempt_fence_wq || !xe->destroy_wq) {
 		/*
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 60665ad1415b..8b9d7c0bbe90 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -367,7 +367,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
 
-	ggtt->wq = alloc_workqueue("xe-ggtt-wq", WQ_MEM_RECLAIM, 0);
+	ggtt->wq = alloc_workqueue("xe-ggtt-wq", WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!ggtt->wq)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 2ef33dfbe3a2..4c2b113364d3 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -51,7 +51,8 @@ hw_engine_group_alloc(struct xe_device *xe)
 	if (!group)
 		return ERR_PTR(-ENOMEM);
 
-	group->resume_wq = alloc_workqueue("xe-resume-lr-jobs-wq", 0, 0);
+	group->resume_wq = alloc_workqueue("xe-resume-lr-jobs-wq", WQ_PERCPU,
+					   0);
 	if (!group->resume_wq)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index ea411944609b..f3835867fce5 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -120,7 +120,7 @@ int xe_sriov_init(struct xe_device *xe)
 		xe_sriov_vf_init_early(xe);
 
 	xe_assert(xe, !xe->sriov.wq);
-	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
+	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", WQ_PERCPU, 0);
 	if (!xe->sriov.wq)
 		return -ENOMEM;
 
-- 
2.52.0

