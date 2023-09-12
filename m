Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF3BEE3F3F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 23:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF7010E0A3;
	Tue, 12 Sep 2023 23:52:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50B810E09F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 23:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694562722; x=1726098722;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=keBPFIMHvgRQpSttu2aTZD5Smm5jj5QFjTO0vfWoLow=;
 b=MnbEFErdlq8Ldg1Vhuz7dRcOQuE9LeGR3xaNyZFdkNfyWJNqd0IGPqDe
 uwk4WGBIsAJD403uNF07+IeWmrJkmJL1lvDfbXEhHXVqPOSKV/MbRAJkz
 VEH5y2itY+EI9hHZZDA/7vybfFFjHTTQDfDhkn32/q3OR1NOLHSCeAkje
 jwUnzcVxkdtZgC4c2fwRzfER7oSSGessrGQuITi+bHZVzeZwbVrzZi9Nq
 +QgiM14xNz9KclpWqQqdQ1dDilpF5YPjB+0B8ItrTDLMTkExC2JnmLqBP
 J/TkB6XAmIqLL13o299JoF1GR+aYpc2jvwjMmdFONwQRpP9pudJpwAlEZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="381224952"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; d="scan'208";a="381224952"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 16:51:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="720608403"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; d="scan'208";a="720608403"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 16:51:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 12 Sep 2023 16:51:57 -0700
Message-Id: <20230912235159.2111118-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Remove
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
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

Backwards backing uAPI changes, getting on the list.

First patch already on the list [1] and free to merge as soon as it gets
an RB.

The required IGT changes are also on the list [2].

Matt

[1] https://patchwork.freedesktop.org/series/123613/
[2] https://patchwork.freedesktop.org/series/123619/

Matthew Brost (2):
  drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
    implementation
  drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI

 drivers/gpu/drm/xe/xe_exec_queue.c       | 64 ++++++------------------
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 +--
 include/uapi/drm/xe_drm.h                | 19 +++----
 3 files changed, 22 insertions(+), 67 deletions(-)

-- 
2.34.1

