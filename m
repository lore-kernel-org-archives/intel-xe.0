Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E643CCFA0C
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 17:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9E510E1FC;
	Mon,  3 Nov 2025 17:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Ta4X/m5e";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED73E10E44F
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 17:06:19 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-47721743fd0so25029465e9.2
 for <intel-xe@lists.freedesktop.org>; Mon, 03 Nov 2025 09:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762189578; x=1762794378; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W/E+yekLZHoYnEpR/iQ6pLhaCNwhnBlrdLlxkEXpohE=;
 b=Ta4X/m5exPkiXH9QdU9aAi18kNKTUk4MdhnFrB8Rh0xD19cDIGNaNCo/Om/3QqKZYh
 2lACY96ivUJcYz85OPCG9QHcE2u+sRtM+AAY5OqfpuzjCX/VPFdMZHQUpffrKQpdpKAO
 TrtHLqI0ZPzhnxdsHXh1zf24ioRUGp8MnGZW8WercIKCrDdKmQ9Yyi8aBNjfzs/RwAEr
 ffcyLJAM3QihRnHVPelS5/bflNuXzbHW3AVNOeUh0vxROj1Ii9eewCkZ64kxZ7suZJfd
 bZCf7za21GwLkgHOfvx2P4SiOQlplYVIywqkDyC7Otgq7XsLEerGZvDoCUjfwi6D7Fh4
 NcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762189578; x=1762794378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W/E+yekLZHoYnEpR/iQ6pLhaCNwhnBlrdLlxkEXpohE=;
 b=PnwqtCmd/Rg6C5ZxMhKxoB7pGU+1mNtVxt2vkBLGSWgXEgT4ySAgxBMz0GH7uMISdm
 Gt95PCE+hJrv72yX0wsidfp/2iXQsFkdgjBOYiO33see2iw4kEgEYBt25ZvZOd/He2x0
 Gjd4i79ifnBvA0C2f6p059WWMRECcLYbXoTnLGlFQv8WGbArODnNZKzqm2lWeSB9rjf/
 8NB5WlJJZdk+0+qRJlr8H8MgygoTqaAuY2sJN8YQlpK01k6rFvVQhxrCmbCsQ3sDYBXA
 LhMxFa36zjYSUmn7S85bN9dPUoXGenh3YLARJ1mrrUROlzxG097PDW/RVNFEk4KIWkNH
 MXBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb+VDmKvVvJXyR+rTEcSNuC/H/SRD2Kn/rIyq7QyyxhFc4+IOnuExO8C7uOh4KkNksqKKPM2d1aA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuaSAVNBL6fKKrWytxdaRIcyKedLE45fkJMGrfB5DhE4zUMcfw
 q7aRWtCSeSum74hUPRVtGN8CDZXNUOU1XblpVhAbyOZgiZWd+kDXy9/5RQRV5OYo8Us=
X-Gm-Gg: ASbGnculsezdRnFbZK7yDsJIA76e5sGpWO6HEyIHnPAUSvekLhy/G+sAMK+KfJL4u6E
 33UBlkPqJzWF3NZvwPRKGxsaw4guHo0Zmf9PA1qJLUpgMBm6citPD/4Z/g1IpL2KUKIEDBWjRNa
 JxpXqt4mDu4yThpBClHqIkAJ8BjWP5B4C/2Xb47iJc/ugyD0Ezdxy71DJrPt3Y17HVDgooymFrU
 f9Bk0VgO7hBiJv4B8noISpd67cz5/qaFg9cmo3pGfvI/0nkrELw0A18DBzR3SF26p4q7pWhp2YO
 UjdFmW1+e7pbtnV53ficR7kc+mlAta/eV84qk/eXPEJ3L53v3kNTPxt8ZtQaL6nF/mApCVDYV7W
 qhdIBqAwk4PtsGDLx9eZXX/jxZTfFqOD8wmjThaHiP2COQt7f/y3padyvyC+tk8sKVShRDoWBdV
 rAsPmbJwYeVuprwU5fZLvvFVCN
X-Google-Smtp-Source: AGHT+IHro/MP9UonungEHxvhQ8/oFTI0hKO0Ea28MQuK8I5sRHzjmtcpIky3vjVN1zF4UT9So2PeAQ==
X-Received: by 2002:a05:600d:6352:b0:46e:38f7:625f with SMTP id
 5b1f17b1804b1-477316381f2mr63094595e9.10.1762189578380; 
 Mon, 03 Nov 2025 09:06:18 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fc524ddsm89799895e9.7.2025.11.03.09.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 09:06:17 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 2/2] drm/xe: add WQ_PERCPU to alloc_workqueue users
Date: Mon,  3 Nov 2025 18:06:04 +0100
Message-ID: <20251103170604.310895-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251103170604.310895-1-marco.crivellari@suse.com>
References: <20251103170604.310895-1-marco.crivellari@suse.com>
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

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.
This lack of consistentcy cannot be addressed without refactoring the API.

The above change to the Workqueue API has been introduced by:

commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

alloc_workqueue() treats all queues as per-CPU by default, while unbound
workqueues must opt-in via WQ_UNBOUND.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they’re needed and
reducing noise when CPUs are isolated.

This change adds a new WQ_PERCPU flag to explicitly request
alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU.

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/xe/xe_device.c          | 4 ++--
 drivers/gpu/drm/xe/xe_ggtt.c            | 2 +-
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 3 ++-
 drivers/gpu/drm/xe/xe_sriov.c           | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 34d33965eac2..38b42d4f930f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -486,8 +486,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
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
index 5edc0cad47e2..566163ab96ae 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -291,7 +291,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
 
-	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);
+	ggtt->wq = alloc_workqueue("xe-ggtt-wq", WQ_PERCPU, WQ_MEM_RECLAIM);
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
index 7d2d6de2aabf..5c36da17f745 100644
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
2.51.1

