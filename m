Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289B0E73156
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 10:38:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A7B10E410;
	Mon,  2 Feb 2026 10:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="ewbOTWDX";
	dkim-atps=neutral
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DCE10E410
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 10:38:06 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43601e96f72so782452f8f.2
 for <intel-xe@lists.freedesktop.org>; Mon, 02 Feb 2026 02:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770028685; x=1770633485; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jxwZvnhF3oQwannNLGicFGTT7cRyzihZn9lUXOj4q18=;
 b=ewbOTWDXL9tDLDMpB5xRrWlvXbTJOBPKZN5JNgcHwhSJM5EPf9LvYKgoWCD+MgGoaE
 8ZIeeFK9TjpfDkpiOB5biRnof/IA6wudmRqAheNayXCVKbg8rRfrKIL9Wl5Xy72nLo9c
 WSb4yJLti/rkdr+khnxSrcgxlT/yUOTDVhnW+pjuwlWdo34YQslMh0a9AHeD2q0PMyfo
 SlvdHDEeKNYWsp9o4AFo34OgCPy3DVbCTRH0L6V+fSXF2ORnbh9BLOVXg1R73cUOwm+T
 GSVtNx71xwwWL6S8Oc/mdYumWYbonGQ0dREc6TKD4WCPV9esIF2VZIZlZhtjeWDtxTFa
 qGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770028685; x=1770633485;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jxwZvnhF3oQwannNLGicFGTT7cRyzihZn9lUXOj4q18=;
 b=qnvvt3sOESaF/y215wfNlT3+StHUIPHl9Z+rBvUsVd8iHXrKYiBPzP5d9DW2DYhThE
 oKeHGnhKbTcpjudmDYSx9MOg/YluWBvA3XiQ43Oz8v3Bubck5iNCYCQtZs7HTzS8eZsP
 1oXUahBStnlY+NuTNIDAXipkW5mV1wMz7Iy+P8Sy0IO98Ty3pspIwz0xsd+40iPXHOni
 1Y/h7kieMa14/plycfmM4E0B2HIYvIt/g4JooJa8yAhuTyi5SvoK/9IR2oox8P/73opd
 TRXnVpbMAi+MNajJLRFNgchANPfj7id/nZZ5BwJVkCJrI8jBVKgpse2ecEG4Z3QWwB0b
 OfmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvl3cSK3m0KvTOKozqh28VjP8n5P0MJMEiWYeEKrZXkEtlsdChqfv/KYqZ5es3DEB6wXC3ylGihQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuzZJeHpArmnxuJS2WYwBYCCINkQrqpmtnj9Cd76pr+Mut3MZl
 WfpNeTwGMQqmLwaL6WyfAqjamBfF5XYZftaM6ZUURMZv89rN6wfp5CVeVFA6nGyl4OE=
X-Gm-Gg: AZuq6aIIEvYjmWrfz5a+cIjXT1ICSLiubR2Qr0497uCpVuFPipd1ZCgLyXzGL6SLoNd
 pcYneFgBoMx2dfsNyNTO11dgQQtzOXUxwAKhQZ64jlqdvJ69MAmPklqsOFYDz108I8mCxWcjiw0
 /iTp03LpvH1bbyv/mzBKX2ppTrbnDT84r7KXg3RgBF3cea7V+PWNFnHwPnQF64+Dhu6T5mx8mck
 2lpa/P5CzDlqQYaeDIOAtnedA3nxvgYd9G80ZOoMpSRNYfgXZGhjh3eMxDH9R14HG9uQYGtSjwj
 OW7uY/qkTEwNKkd9/6ho567w28ik5UHTcWt2bi8o+FmIvBPp16gy4UdILzXheyH5MUn0HA881rN
 KX+aXPlRXd7CS1bOqrQtO0tm3EoQHVZL5q62qTJMTZP1KhB9fLUxAkP7tOPYwoRFCpLo3f6lvUy
 5FYyl1T567mk/6Jg==
X-Received: by 2002:a05:6000:1a8f:b0:435:ad52:31d9 with SMTP id
 ffacd0b85a97d-435f3a824d2mr15416371f8f.28.1770028685377; 
 Mon, 02 Feb 2026 02:38:05 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1354d43sm47020132f8f.43.2026.02.02.02.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 02:38:05 -0800 (PST)
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
Subject: [PATCH v4 0/2] replace system_unbound_wq,
 add WQ_PERCPU to alloc_workqueue
Date: Mon,  2 Feb 2026 11:37:54 +0100
Message-ID: <20260202103756.62138-1-marco.crivellari@suse.com>
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
Changes in v4:
- rebased on drm-xe

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

