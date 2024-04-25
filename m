Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1087FC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 23:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6932112787;
	Thu, 25 Apr 2024 23:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lluw5hYA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA79410F1E6
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 23:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714087530; x=1745623530;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z2fUmqpS+L+p2pFI8RqRcuRqLVQK0eGqkXRiazh9qd0=;
 b=Lluw5hYAL5rEDUKac892UsX9NF4wnOKLgy7dyAD1VYn4L5AuxeMqEwo0
 RhEwLL971TzvbJ8nbJYs/HiBIjtRMeirKorURZO3/z/phOrS6NK5Yy5yI
 +dYZQ/izCMAtJ7ugRYAjEeIjnG1S7CyJEFO/AbcqMgW8bhqDJ9ZJU90Wt
 cg3pR2kRQsPCgqmV3uPRHI27Aw7EZkHvJ19/GB5tqms5BFbUg7D5xsvyZ
 ZzcCy+LdWUoSM+7qF+JXzpW/WMre5diG+Y/Dbw83tgj9FBHd6yQ0HJshy
 NY5VqxjiidO0buhcpBo2BFjS6jPqwugRO15o5Nr2Yp6zSLsIDnQpA7pDV A==;
X-CSE-ConnectionGUID: LcyzCzehQcWk/InzMIz0Cg==
X-CSE-MsgGUID: CYTlfm53RGiYCV2G5fCxZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9970871"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9970871"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 16:25:15 -0700
X-CSE-ConnectionGUID: GCp9pwS0S6ydqABtiu8yDw==
X-CSE-MsgGUID: zTNDgQwOQ6qPFuRW2A/zAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="56411976"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 16:25:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 0/5] xe_guc_submit style cleanups
Date: Thu, 25 Apr 2024 16:25:39 -0700
Message-Id: <20240425232544.1935578-1-matthew.brost@intel.com>
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

Resend for CI

Matthew Brost (5):
  drm/xe: s/ENGINE_STATE_ENABLED/EXEC_QUEUE_STATE_ENABLED
  drm/xe: s/ENGINE_STATE_SUSPENDED/EXEC_QUEUE_STATE_SUSPENDED
  drm/xe: s/ENGINE_STATE_KILLED/EXEC_QUEUE_STATE_KILLED
  drm/xe: Fix alignment in GuC exec queue state defines
  drm/xe: Replace engine references with exec queue in xe_guc_submit.c

 drivers/gpu/drm/xe/xe_guc_submit.c | 50 +++++++++++++++---------------
 1 file changed, 25 insertions(+), 25 deletions(-)

-- 
2.34.1

