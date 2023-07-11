Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17D5EB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jul 2023 09:21:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C29710E349;
	Tue, 11 Jul 2023 09:21:41 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012CB10E347
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jul 2023 09:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689067300; x=1720603300;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eGte+HwcaOZ4W8qZdbpWG5RJchhHLWJpLGxqmRW/6+E=;
 b=LE7RgHgoJASKTQ4/BYc2VNnGd6bkhlQqYeKuvNxlXQAYVdAqGd9ttFGc
 +h6gXWLfwOOWNp5ayGheTYCVMJD0KHU0HPO4e62C2pUs1nZJVSENeJkET
 ml1nzNOVK7hLeqW+9G6dJX/mw5ogMCZGmvTJJ7668USgtL6uqmWqaAtDL
 Myodk7zQkaJqQUjFAeC5FBsyjItNm29adqQH1Et7IJpnTOF9HCR9I1xjR
 bgLowW1bUaf4MyHGqX+iqXcaWIEIz0qeQ88oEwWJHOklsBv4Jl0qSUiVw
 qSiMHjJsO7mOdi7g7/cxL+mUt6UO71C7JJYK5MxoF7OYAPrsI5uqobhGu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="450932469"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="450932469"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 02:21:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="750689314"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="750689314"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.34.172])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 02:21:37 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 11 Jul 2023 09:21:21 +0000
Message-Id: <20230711092122.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/1] Prevent flooding the kernel log with
 XE_IOCTL_ERR
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
Cc: matthew.d.roper@intel.com, Francois Dugast <francois.dugast@intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Following earlier discussion and proposals, a first attempt for v2 was made by
replacing XE_IOCTL_ERR with this new macro:

    #define XE_IOCTL_CHECK(xe__, expected_cond__, retcode__)                    \
        if (unlikely(!(expected_cond__))) {                                     \
                drm_dbg(&(xe__)->drm, "Ioctl argument check failed: %s",        \
                        #expected_cond__);                                      \
        return retcode__;                                                       \
    }

A message is logged by XE_IOCTL_ERR if the condition is true, whereas a message
is logged by XE_IOCTL_CHECK if the condition is false (expected condition), so
the condition has to be inversed. This was done easily with coccinelle for the
vast majority of uses of this macro, but this also showed more than 60 uses of
XE_IOCTL_ERR different from just a return statement. Fixing this would require
more refactoring but the priority of this patch is to address potential
flooding of the kernel log, so sending a v2 without the new macro but fixing
the name to prevent the inconsistency with error and debug.

Francois Dugast (1):
  drm/xe: Prevent flooding the kernel log with XE_IOCTL_ERR

 drivers/gpu/drm/xe/xe_bo.c              |  26 ++--
 drivers/gpu/drm/xe/xe_engine.c          | 112 +++++++++---------
 drivers/gpu/drm/xe/xe_exec.c            |  14 +--
 drivers/gpu/drm/xe/xe_macros.h          |   8 +-
 drivers/gpu/drm/xe/xe_mmio.c            |  14 +--
 drivers/gpu/drm/xe/xe_query.c           |  30 ++---
 drivers/gpu/drm/xe/xe_sync.c            |  32 ++---
 drivers/gpu/drm/xe/xe_vm.c              | 150 ++++++++++++------------
 drivers/gpu/drm/xe/xe_vm_madvise.c      |  40 +++----
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  30 ++---
 10 files changed, 228 insertions(+), 228 deletions(-)

-- 
2.34.1

