Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7EAD715EE
	for <intel-xe@archiver.kernel.org>; Sat, 24 Jan 2026 14:54:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C010610E28F;
	Sat, 24 Jan 2026 14:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="I8wHhZ1v";
	dkim-atps=neutral
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E0610E33B
 for <intel-xe@lists.freedesktop.org>; Sat, 24 Jan 2026 14:54:38 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-435a11957f6so2584189f8f.0
 for <intel-xe@lists.freedesktop.org>; Sat, 24 Jan 2026 06:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1769266477; x=1769871277; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LHc4Ub/6LqQBr/dlSGg55syvwKsNbB8vfiClU/RuIFk=;
 b=I8wHhZ1vFk6bZvULKD6DEtv8CalgXadwi1o86Jhar4i48zW8WtXceGHvZeXf5+Il8F
 8mJC0kE9+aoFR1C8q+ZKQuyxa3hza1dP/vx7F8uGwnR/iKChSvp5HzjuJpZ+k2PX20Vo
 soNiUxDOT16w3gpwpR4e7Nj7ecxL3dzzKZtDWBVrjL4sBQiaBA5nFCdPbdABdPwk1vig
 AkpsY/6THlu4El5jo+1sQHSLoOEnwOcpexQpFHvhlxzh3pRnY8lb4MY1tIxSLk/TVzq7
 JgHzmh6fifULM+5RrtjD2HAVLFJLRuGqAUPY3bOB12f3Jblo68pTMEx8l/gSVEufMzJY
 efxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769266477; x=1769871277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LHc4Ub/6LqQBr/dlSGg55syvwKsNbB8vfiClU/RuIFk=;
 b=Ec4GdlzGwsekiaOFqU+y30cLCskHEyhlGBjRhbpWMMoUz2uXNLlCr471qser0CXiBe
 yk1aJgdzyFZYJyHKmz5MCUol82nTPGRTTkimKymTsttgD4ExzqkKDAS/xlXPTqOASk8r
 c5a+txZJWNSCH8HtnxeZB2159WL8RpsjC15sNUe03XtFQ3klxo6/Q1dMogKP+q6NgoCd
 A68PXNK/GaJQaiXLmRP3swLecA2RPgn8KKNhQxQ2um0JQ7Hc0cUmaQ/mo1rREG1vVqA0
 x4npSBupK5cjmeG/+2m9BOqUdXay6szbTh+ufZk1kLpjXjii9P23jVDhGw57EJyShh3p
 ROig==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3F6eWaeujoA751CnTUqWRIpDIN8qsMPxzbwOtwhvnkUzq0N8EotqwHQp6kkEv7s4KU+2QjyOxvg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+eN6Bx5OWlMu85kIadh7i9F+V/gK0sR7eR0yg7g1o1nC8N8Z1
 zEWzFz8593SHx6CCz2PgqvtXfujXZyMuJwL/WrVFCP0/VTsWMkHxQKTsoc43cSF8pg0=
X-Gm-Gg: AZuq6aJDHxoSFX60A0Sl25dAdTJZPCPzBzHYJqzGH0k0pOnnESKjypbQUR1v192SO6T
 HqY/kSDjry01VmQ69TStw3Y8tdoc5QbAVTK2tN0nv3iTfVteunmaPBmesqEmM/aNzbHxBda7tmY
 B3bbqrrwAdBytHYqMGrHQpOlSww0pK8/y3g6f3d5vEdvjixk3Jc12PN22iEwsw05aiAutq95LEA
 lDe9uJIEkiCxvEkc24KhsH0R7oJfK1cOsVT219Io2y74VN/4a8g58Lboczt+GiAKo+pZ/Fmukt7
 L0RLZ/ZyM0AkjCJHhsulqq1XQWdbmgLqhoBtdd6OeBGu6taxNsqyhwcJzcWpcS1S5Kz+at/bGpQ
 zVy0KNyFPd9Y6VEpTGAjaWbFlJxj+LlAxAwzt8jXpwDyrN7Kn/sTtCK5OICmBDuCUe1/QR6vmCn
 RLksVlvMmEgPcfnw==
X-Received: by 2002:a05:6000:144a:b0:431:1ae:a3ca with SMTP id
 ffacd0b85a97d-435b1587d00mr12343074f8f.11.1769266477265; 
 Sat, 24 Jan 2026 06:54:37 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1f73855sm14846241f8f.29.2026.01.24.06.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 06:54:36 -0800 (PST)
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
Subject: [PATCH v3 2/2] drm/xe: add WQ_PERCPU to alloc_workqueue users
Date: Sat, 24 Jan 2026 15:54:01 +0100
Message-ID: <20260124145401.44992-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124145401.44992-1-marco.crivellari@suse.com>
References: <20260124145401.44992-1-marco.crivellari@suse.com>
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
index cf29e259861f..1b20ea03a938 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -488,8 +488,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
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
index 793d7324a395..0849917b16c7 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -322,7 +322,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
 
-	ggtt->wq = alloc_workqueue("xe-ggtt-wq", WQ_MEM_RECLAIM, 0);
+	ggtt->wq = alloc_workqueue("xe-ggtt-wq", WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!ggtt->wq)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index fa4db5f23342..8526addcdf42 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -48,7 +48,8 @@ hw_engine_group_alloc(struct xe_device *xe)
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

