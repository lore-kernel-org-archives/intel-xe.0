Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D8FD715EC
	for <intel-xe@archiver.kernel.org>; Sat, 24 Jan 2026 14:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E5F10E23E;
	Sat, 24 Jan 2026 14:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Rkrf+Zdf";
	dkim-atps=neutral
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3412110E28A
 for <intel-xe@lists.freedesktop.org>; Sat, 24 Jan 2026 14:54:36 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-42fbc544b09so2325951f8f.1
 for <intel-xe@lists.freedesktop.org>; Sat, 24 Jan 2026 06:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1769266474; x=1769871274; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Aljt7hRWjvdGdfI17i0Kx5ImMNfHVYhoQpQMGch3H1g=;
 b=Rkrf+ZdfXZtqX+KLdbF1Oluge9KUqycfOAZZIl/MMiZZeO/YKisn2ruvT8kOwiepa1
 ap8Mb8Coad3eedmjmbfWLgRqcrgDDHKOyMPgYxlOF0ZysH9ZR+b+ewGad9+CAvhcBOy0
 yeMAKKPB0XzWd1xL5XOkDVS3c9AoikHNKfk2oNrRBtBGwol+n7xCN49/73skASH+Y5i1
 aQKEY1wKNrHArcIjmWddVxm91NkWrL/egkdAWRyxUB+PHh9HY2X970LDWoSLBjyR5k8f
 f+l1mjHGmpVVEuuq6jG2OUzhe8Oy032PqzYf0/RIIW42dlvswrzDBNf9tnXBGgXUKYTi
 CgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769266474; x=1769871274;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aljt7hRWjvdGdfI17i0Kx5ImMNfHVYhoQpQMGch3H1g=;
 b=ZNtUWaNGI96BfVGnRcCKeIMwyFIowT6BcHv9SWoyLyjSDDFJGXHFMGGYDQX4CfoWse
 fJtiCZxjhGkU6r6KSKAlmLDaUyxbRhsooa0b1wLKVnJ81Y+Duzc/lYR+GvVCz9LYt88y
 6jW/dN4OcPr4oVoZpFY/IfNx86WzEI0kMsLjw9Vp0NhfTYC6F0fVlo+9t9GHhAQVWktk
 U3K4KBPTMp+9QHgNa6AqPQVuPeCY4zHSnUoUkPrb6SDtwuA5lLzq+gtc5sITUmBlrTNC
 Oqy9RZhGqodFyX42A3O1soSPadf4evAQP42VEomc6ttS48yc9Nx9uGTDKGyuklLi9ZUS
 N0WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7HGfvJcjEHH89Ic6kqjE4EKdZVGgaNhJMeYW/1giVL3g7v6XLnNdTVwTQ1ahgAzVtOur/UAWlRw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaMAlOdu9D/8qwmOhXs1mtp7VoS1LpDETnHuay17dPui68elXp
 UCXNndV6YqOChg8mQRRztI42e4UGnAVCJxcdFxgD/HWnTpcO7zikDWudbZkhllc6BX4=
X-Gm-Gg: AZuq6aJZ+1zUns3Glqbc3TeRuXPm1FLf/GaxpqPxlMhISZh0KNere34lxrf5FGClr87
 W2h5h3mKJYOb7epoR2HRalK7ws2OOP50KAdotdHZBfz0UApTNBy8o4CcYL1SvgjOvoo0DborGgH
 2EGjpMUlbSEY+iz++xZQePIeQXaIadj7/MH0R33l8AFiFXQpLG5q5qsyVPlj+vpCRigJ9K8oC6Y
 R5X++MFoogDKOyVIM4JzmkSmP/4nDHYq4Fzf2bMqXDWr8uikRZ5Sft405xX2EtAy1For11z/R3w
 qlRppf1tb20e7UtebO0RnrYq/8A+TC9oic7votOnyiBTU7S+y64qCWDPoRjQtH/80y1V3qBlRtr
 KWSe4d/Lk+/9M/lMk7Dli4ujghIi8YZOMH9s+ZQV9MCoGHrHKwUvDL38TMUqNI+50fIMsPamPHm
 t2H7YTFOn+Fk6Q7dJpZcMVypMf
X-Received: by 2002:a05:6000:4026:b0:431:8bf:f081 with SMTP id
 ffacd0b85a97d-435b15941e6mr10267693f8f.23.1769266474472; 
 Sat, 24 Jan 2026 06:54:34 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1f73855sm14846241f8f.29.2026.01.24.06.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 06:54:34 -0800 (PST)
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
Subject: [PATCH v3 0/2] replace system_unbound_wq,
 add WQ_PERCPU to alloc_workqueue
Date: Sat, 24 Jan 2026 15:53:59 +0100
Message-ID: <20260124145401.44992-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
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

Hi,

=== Current situation: problems ===

Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.

This leads to different scenarios if a work item is scheduled on an
isolated CPU where "delay" value is 0 or greater then 0:
        schedule_delayed_work(, 0);

This will be handled by __queue_work() that will queue the work item on the
current local (isolated) CPU, while:

        schedule_delayed_work(, 1);

Will move the timer on an housekeeping CPU, and schedule the work there.

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

=== Recent changes to the WQ API ===

The following, address the recent changes in the Workqueue API:

- commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
- commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The old workqueues will be removed in a future release cycle.

=== Introduced Changes by this series ===

1) [P 1]  Replace uses of system_unbound_wq

    system_unbound_wq is to be used when locality is not required.

    Because of that, system_unbound_wq has been replaced with
    system_dfl_wq, to make sure this would be the default choice
    when locality is not important.

    system_dfl_wq behave like system_unbound_wq.

2) [P 2] add WQ_PERCPU to alloc_workqueue()

    This change adds a new WQ_PERCPU flag to explicitly request
    alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

    The behavior is the same.

Thanks!

---
Changes in v3:
- rebased on v6.19-rc6 (on master specifically)

- commit logs improved

Changes in v2:
- rebased on v6.18-rc4.

- commit logs integrated with the appropriate workqueue API commit hash.


Marco Crivellari (2):
  drm/xe: replace use of system_unbound_wq with system_dfl_wq
  drm/xe: add WQ_PERCPU to alloc_workqueue users

 drivers/gpu/drm/xe/xe_devcoredump.c     | 2 +-
 drivers/gpu/drm/xe/xe_device.c          | 4 ++--
 drivers/gpu/drm/xe/xe_execlist.c        | 2 +-
 drivers/gpu/drm/xe/xe_ggtt.c            | 2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c          | 4 ++--
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 3 ++-
 drivers/gpu/drm/xe/xe_oa.c              | 2 +-
 drivers/gpu/drm/xe/xe_sriov.c           | 2 +-
 drivers/gpu/drm/xe/xe_vm.c              | 4 ++--
 9 files changed, 13 insertions(+), 12 deletions(-)

-- 
2.52.0

