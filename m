Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0708EC41513
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 03:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30A610E306;
	Tue,  1 Aug 2023 03:28:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4405210E0CD
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 03:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690860478; x=1722396478;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lWCqszPnR0n0I+r+RR1nKhEq17blfvqwyl1nE3J3Nlw=;
 b=cQozhPn6vu6tnP5VuQShF49CsJY+qyUpCUZGpPzKuCFdKW23o1x0eywV
 l172IIzQPSVLM1tVrWhNQxsTeY6LYLeT+vaTkNvfbwsYPmhzK/ftgenN1
 zaFAqgaLKum+U7dM3TDmGHgBTQvmivtOhFHU47oOheWCgRW+sQ1PHZ7Q/
 FVF39X+7p53q3p8fNOKlHfDFRh6DxpV68A6yzwUVx/V/WtgkE04hYH2W3
 RP+A53M8s5KHpf2LheeD8X+MltkP4RMmAu2dCpTe7YmasKlf4oWnGJeyJ
 NRgYluUaWSppXpQcZ/llNgTqYdxY76NZZ4NEbDMmE3Dht28cZMlR8h/wQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="369182885"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="369182885"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 20:27:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763596184"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="763596184"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 20:27:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 31 Jul 2023 20:27:46 -0700
Message-Id: <20230801032748.434509-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] DRM scheduler changes for upstream
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

Fix the DRM scheduler changed based on feedback from upstream RFC
feedback [1].

First patch addresses Boris's feedback [2] to not make the scheduler
work queue run in a infinite loop, rather have it requeue itself for
fairness.

Second patch addresse Luben's and Boris's feedback [3] to add a job to
the pending list before caling run_job() and kicking the TDR after. This
also includes a bit of restructure of the DRM scheduler helper
functions that will be broken out into a different patch but squashing
this into an earlier patch as fixup for easier repo maintainance.

Matt  

[1] https://patchwork.freedesktop.org/series/116055/
[2] https://patchwork.freedesktop.org/patch/530655/?series=116055&rev=1
[3] https://patchwork.freedesktop.org/patch/530652/?series=116055&rev=1

Matthew Brost (2):
  fixup! drm/sched: Submit job before starting TDR
  fixup! drm/sched: Convert drm scheduler to use a work queue rather
    than kthread

 drivers/gpu/drm/scheduler/sched_main.c | 87 +++++++++++++-------------
 1 file changed, 43 insertions(+), 44 deletions(-)

-- 
2.34.1

