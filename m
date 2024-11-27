Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C69CD66B9D
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 00:31:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3187C10E106;
	Wed, 27 Nov 2024 00:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Im7JGFWg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38ED10E106
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Nov 2024 00:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732667494; x=1764203494;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zmQ7pz7qYBIga9jvDK/1FUAvMQ4g+AYY6bJQnywVoYM=;
 b=Im7JGFWgqm4VAs6ez4FWXRi+O5KuEaVUC7fxn0hll9l1ZXdkCP6i5Rxd
 wXbh/15tULqEbWJifZgpw7LD2+UPrgxQ2aCnixNgQ3ZFrwE86Pu6J09Bn
 UzOWmTxc1juL+azjhieEyqzPZ0eS8IwpYIolANpmMYYbVvfcgYF37tWX1
 HItc6wHv+afW9G/kjM5IAvNLtZloifWOWx0Nwejr7nIL+sC/GrTZRxpgR
 ftw03pCBMAfzWj6MVx3qNCMjy2Asy2mP3IXz+9595XiUAfhYQBWBBG0jh
 Ck9wZYThc2zkLPDoDV25f8tlV+VgJw38Mo8wKTP2pcNvRVGeqraNpvz6e A==;
X-CSE-ConnectionGUID: uOVEwtA2T4SloFnCNnn41Q==
X-CSE-MsgGUID: Aw0FUgpeR1mN/4u+HuTe8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36517520"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="36517520"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 16:31:34 -0800
X-CSE-ConnectionGUID: QsZ4K3c+SJmvRH7QzaU7TA==
X-CSE-MsgGUID: a25MviK4TnmE+lAJuIvQjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="91875660"
Received: from dut7231atsm.jf.intel.com ([10.75.202.213])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 16:31:33 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 matthew.brost@intel.com
Subject: [PATCH 0/2] Fixes for MI_REPORT_PERF_COUNT
Date: Tue, 26 Nov 2024 16:31:25 -0800
Message-Id: <20241127003127.42560-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

OA programming sequence for query mode or MI_REPORT_PERF_COUNT requires
modifying some HW registers in the same hw context as the user exec
queue. User passes the exec_queue to the OA interface and OA
implementation submits an MI_LOAD_REGISTER_IMM to this queue to modify
the registers.

The OA implementation submits a batch mapped in GGTT to the user exec
queue and hence, some plumbing is added into relevant code to enable
that (as per suggestions from Matthew Brost).

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (2):
  xe: Allow a GGTT mapped batch to be submitted to user exec queue
  xe/oa: Use MI_LOAD_REGISTER_IMMEDIATE to enable OAR/OAC

 drivers/gpu/drm/xe/xe_oa.c              | 68 ++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_ring_ops.c        |  5 +-
 drivers/gpu/drm/xe/xe_sched_job.c       |  1 +
 drivers/gpu/drm/xe/xe_sched_job_types.h |  2 +
 4 files changed, 57 insertions(+), 19 deletions(-)

-- 
2.34.1

