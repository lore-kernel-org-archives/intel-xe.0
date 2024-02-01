Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F346C47258
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 00:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950CB10FE04;
	Thu,  1 Feb 2024 00:48:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F286010FE05
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 00:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706748489; x=1738284489;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oGzamu9iEnSB3B9IAVA674y8q+981O0dIfGrtzZ0y6E=;
 b=X0Ccwy5+7zT6VbVuD4RxWS7+5a4dMPHWpAEjuwzLRY9wgoPp+hBA/yyX
 4kM6HVRxrQYg5SdcMAvO1cZflOtIYQEJ7VHwCMHdwJZP1EYoNrBY7Zdri
 4/K7PGdwhKgsXgYdsrbsljEvuSpqyWpEACeyOIdbAoEgFvUWZ05Mq6HMI
 Ifyt8tXvCG89ZYRMSdlRbYQ5XaK/4RUWs8ke9ddWlHhwwMY8SCNdRHA+/
 MbqHLVSe4peQ53KnG3IXtwcX6JtpcVCylM1hUcpOa3w3W7/TZHYwcYmOv
 RQ7hTd52b3ejkApM4in1JdAWcjtLxphheMLB1FYiYHK11prQNWG1gBapc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10424072"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="10424072"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 16:48:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="878961973"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="878961973"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 16:48:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 0/2] A couple of VM bind fixes
Date: Wed, 31 Jan 2024 16:48:47 -0800
Message-Id: <20240201004849.2219558-1-matthew.brost@intel.com>
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

While rebasing [1] noticed a few instabilities in VM bind code. Fix these.

[1] https://patchwork.freedesktop.org/series/125608/

Matthew Brost (2):
  drm/xe: Take a reference in xe_exec_queue_last_fence_get()
  drm/xe: Pick correct userptr VMA to repin on REMAP op failure

 drivers/gpu/drm/xe/xe_exec_queue.c |  8 ++++++--
 drivers/gpu/drm/xe/xe_migrate.c    |  5 ++++-
 drivers/gpu/drm/xe/xe_sched_job.c  |  1 -
 drivers/gpu/drm/xe/xe_sync.c       |  2 --
 drivers/gpu/drm/xe/xe_vm.c         | 23 ++++++++++++++++++-----
 5 files changed, 28 insertions(+), 11 deletions(-)

-- 
2.34.1

