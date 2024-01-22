Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF5EC47DD9
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 16:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E459110F53E;
	Mon, 22 Jan 2024 16:16:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43EC10F524
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 16:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705940205; x=1737476205;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h+gLLVcs6SNNEGz2XcT9CN1Cu08xNU5ybSrk015S/MU=;
 b=iGJ0ecspLBzkQdqRl9zAqrK2FdXPyOuGwtmOoCMVPV/so7utQLAKqswv
 Hy4+ENhVUsphpbpp08Jiu/p9YdEI/F5Bu7pRxkA6F0M+lcVTtfpivXRq+
 Rxtt6G4icTi0tqcRjzlxxwJUE9LwJgkZsXRHo49LKONcVG3Q+Q6hYk07D
 GkErBZWjEm3NXbuissYFrGU8MkyKaHQP+sf1C+l1gNxhQl3t44aLlXq99
 mGARsS0hR0bS2hqMwYXA8AYaoibnqWlSNBOjsKstaFKWUpbEDpTyckd13
 EKPufRUKTQvDL9Qo3OxJSzhDWPg0p+x4zk3zyriUZGrw8MY+JwkcLaSU1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="400902481"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="400902481"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 08:16:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="929035041"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="929035041"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 08:16:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v4 0/3] GuC CT tweaks
Date: Mon, 22 Jan 2024 08:17:13 -0800
Message-Id: <20240122161716.1503064-1-matthew.brost@intel.com>
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

Address some the issues discussed in [1].

v2: Rebase, address Michal's comments
v3: Rebase, address Michal's comments
v4: Rebase, address Michal's comments

[1] https://patchwork.freedesktop.org/patch/572566/?series=127982&rev=1

Matthew Brost (3):
  drm/xe/guc: Add more GuC CT states
  drm/xe: Move TLB invalidation reset before HW reset
  drm/xe/guc: Flush G2H handler when turning off CTs

 drivers/gpu/drm/xe/xe_gt.c           |  4 +-
 drivers/gpu/drm/xe/xe_guc.c          |  4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       | 83 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_guc_ct.h       |  8 ++-
 drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 +++++-
 5 files changed, 93 insertions(+), 24 deletions(-)

-- 
2.34.1

