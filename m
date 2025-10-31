Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DBDCCF9FE
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 12:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0D610E3C9;
	Mon,  3 Nov 2025 12:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="SORa6qx4";
	dkim-atps=neutral
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883BC10EB35
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 10:59:54 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-429c48e05aeso154261f8f.1
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 03:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761908393; x=1762513193; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b6vAaaeToiu5B9u+qUVaFIcSktlAlQtEv6NbG1yx7d0=;
 b=SORa6qx4McwZuNyw3g047Rf8BLmL+tVcWSJdgPqRKrm/pmVIoE4tngcef+9OSdUf+D
 33O0sUmqilkoo2yU+ocTXMxH3Aqet8dJtO6xlSpzlK0XgjpKFOePYGmWmu5M0tnUA4ef
 GxRBODoQn+96jYoQstO2S0EEAhWQX2lH3MiB+A4dNqMCYBLohRZU4m24ZK/ic7o4QMYU
 gUfnmMOVdxySIGaGf5YEby6ZTaXhPEsWjYS5npTURVybNVY6K3vGjBs1wCr3x3YWHLkT
 iB9NBLb0GgLH6u4YGoPUAo12TMO+8lHwKWbrxKAeD5nUgPMIAanU6mr1FIN5dc3npAws
 hJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761908393; x=1762513193;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b6vAaaeToiu5B9u+qUVaFIcSktlAlQtEv6NbG1yx7d0=;
 b=DUdQX26HT+9j09IeoMV95Kfs2RfloqSO7m3s4zgwDKuO/bhbI8ybLjMaerszfJxyfj
 yEI00Tb3x8HVTrHpnHVigZ5EARjNloKA9nSpDPIxT8YfOGUrSIRMHf5gMKh6Zv/1J1VF
 hmPRC03HvUfotGLFKQsnxz5AsAeQtQoA8XElf41YWrvembfKDBEjFhSBKFXNshg/Fnvn
 b8I54WTnr6wXhS3JPLZH3u1T9zGf910CpXsv3x7r7Sa2pHt8DpUOa1aKf7qEkkbNAE+4
 NSOSk0dM20T9ATvlIPna90YQQmFokWt0NR/ur/ed2WgUnYmcvw+4Gb+ZXxhOCPbAEKlJ
 eC2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRSQHj2ORMsrULKbDOwfjxVnuM9MVthEubg0SebS3YmcFk4N9XL2ArdZSj8em4iJsbTaTreaELYA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz59aoXBcsBG92zGbRO4oVtV+CqiDNxteSi/LfEB58/AKptZLMn
 11t9duyKhIvolja8Ov0WhXisOmqvzk8TzzYPCOtJpF2CCj1kL1Lk7o/T+Qcz02jQi9M=
X-Gm-Gg: ASbGncsdRos4d6ykoN1ZAL4vWq7ck5fmspf5kOhtjVYw2vQvWTYok6x++CqlFuH919L
 LhVnESEUR/8MNbhfZvvKzXbXXPi0h1Je4KfvGBNpvXzPKgOfylstv6Msh43bm+DnDY8qh4cHE2u
 Fi3QXxL+WMvFmB5HY4nr3LDfqFa6tdImWoTq60k/B2nPEQ41WlIdrJUbc8eQ5vMvIcrKWjsBICu
 QEpjFijAJGjX1sXFDISewSk51oBmVOb3lvV17XAEr8GRAjy7Hb+RZvxTXAdgTZYZ38kdJNinRuX
 s/XS+NTKh0rwhikh9jTO3FcQi3Z+0LvcZWDFLp1ldDt8MjS2/MWcsXBMolRtCKvkrtVfybx39lp
 wmWHv2szILMBpkvvRMl7h6cL0imkTw7iEc27eJr/9pp23FsJcYWkHrX/pqQiGO6Wp910bkfHXtJ
 oGeHJgZZ9RDf9XKQQ44+RX6fzkD15hOF3r5b4=
X-Google-Smtp-Source: AGHT+IGyVj6dXJdOX2Hhg+vEPmOzJtfUWoV+ITI3sQ78WwjXbOn3KG8ZVtyP7HvSgwbXFsTDPGRjmA==
X-Received: by 2002:a05:6000:25c2:b0:429:b8c7:1848 with SMTP id
 ffacd0b85a97d-429bcd5c6ccmr2789802f8f.19.1761908393047; 
 Fri, 31 Oct 2025 03:59:53 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c110035esm2965528f8f.6.2025.10.31.03.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:59:52 -0700 (PDT)
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
Subject: [PATCH 0/2] replace system_unbound_wq,
 added WQ_PERCPU to alloc_workqueue
Date: Fri, 31 Oct 2025 11:59:37 +0100
Message-ID: <20251031105939.129200-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 03 Nov 2025 12:45:22 +0000
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

2) [P 2] WQ_PERCPU added to alloc_workqueue()

    This change adds a new WQ_PERCPU flag to explicitly request
    alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

	The behavior is the same.

Thanks!


Marco Crivellari (2):
  drm/xe: replace use of system_unbound_wq with system_dfl_wq
  drm/xe: WQ_PERCPU added to alloc_workqueue users

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
2.51.0

