Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA1DC531DB
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 19:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28FF10E9E7;
	Fri,  9 Aug 2024 19:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vnjjl6/h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F89E10E9E2
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 19:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723231120; x=1754767120;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a2nOtq+9hEqqXPiFnJQUzm0EZHHF2ZUKjzolI1fLlkE=;
 b=Vnjjl6/h6Z15lncehbD1+cD5ez9igRxEnUzdih44xYMRAmSQ6HeNh73O
 lTnt6Rs4SX7RgfIhShKr3n8luR8V5RH6rotFOnWI3A49a+8bGtsb/gvWM
 qvWCMuvtUb7QvqZhDdBAz87dJoz1DeXlmAFSk3LFIA9LuTAbTYA56h1X4
 0cRJnj59VJnzKOFzArCpr4Fecnxmf5zjEHiMEliefnuvcLU/P/d4Lqvty
 V2/vtQvT9xw4ORmZeg49os1bsj0mVXmnFfSzGY2ec4vbydcayaMfXhuGn
 684zYuGzVdX7TN8fXEWtJwjg2F47t3xE+6r6+BtabWW/9OqumqijsUjbe Q==;
X-CSE-ConnectionGUID: DRk4UKtlT5WPgqrVPwCWcQ==
X-CSE-MsgGUID: AowjQqNuRcW7dUHE6hP6qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32566810"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="32566810"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 12:18:38 -0700
X-CSE-ConnectionGUID: 95RcNmNNRgOfBJSXfQcyOw==
X-CSE-MsgGUID: 32Bscd23R6ymg11JZonH1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="88294747"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 12:18:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com
Subject: [PATCH 0/5] Allow exec queue backend ops which issue message to be
 called multiple times
Date: Fri,  9 Aug 2024 12:19:24 -0700
Message-Id: <20240809191929.3138956-1-matthew.brost@intel.com>
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

With [1] it is possible for suspend / resume exec queue backend op to be
called multiple times when error occur (e.g. user interrupts), make this
safe.

Matt 

[1] https://patchwork.freedesktop.org/series/136192/

Matthew Brost (5):
  drm/xe: Add xe_sched_msg_lock/unlock helper
  drm/xe: Reinit msg link when processing a message
  drm/xe: Add xe_sched_add_msg_locked helper
  drm/xe: Only enable scheduling upon resume if needed
  drm/xe: Allow suspend / resume to be safely called multiple times

 drivers/gpu/drm/xe/xe_gpu_scheduler.c | 23 +++++++++-----
 drivers/gpu/drm/xe/xe_gpu_scheduler.h | 12 +++++++
 drivers/gpu/drm/xe/xe_guc_submit.c    | 46 +++++++++++++++++++++------
 3 files changed, 64 insertions(+), 17 deletions(-)

-- 
2.34.1

