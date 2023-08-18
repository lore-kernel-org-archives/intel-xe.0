Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56659C7115A
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 15:09:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BDF10E536;
	Fri, 18 Aug 2023 15:09:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D431810E536;
 Fri, 18 Aug 2023 15:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692371386; x=1723907386;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NLeI15Qt6b8bg6Xs9dAY3BUx3bHOsvhIDAUANVp7BqU=;
 b=mZm+ie43Ug2rXUKv6RBz+ncIdz/JbK4wZBEuaDFLPTHXSFQmos2TsBfq
 uQ/AyCifEWpSzxHogG4rZGgl0mTOHeiRZH2rAp7LVOJrFbBTolWvm+y4v
 N6satSk0dkAMPH6BzORPhZkeW6xg2W0OnYOl7pB1KEiGb074dQCKB+Ncq
 iiXDUDqZuwVmFfaaWDUWIqtBMfHzb1fo14nRFkUI8I8+4VZiEwHkdDmjM
 XjqiL03RZgyHUtk6UAGaw5DXLUkztcoe4TMO1OHakVf08ekhUqFNSgB3I
 Rf5OZF73ZlnD4ITPKBPHk548ncWp6gH+F7E7LWZ0emXHe4NJU6xO4PTw3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="363276709"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="363276709"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 08:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="1065774114"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="1065774114"
Received: from kjeldbeg-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.202])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 08:09:11 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 18 Aug 2023 17:08:41 +0200
Message-ID: <20230818150845.96679-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] drm/xe: Support optional pinning of userptr
 pages
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series add a flag at VM_BIND time to pin the memory backing a VMA.
Initially this is needed for long-running workloads on hardware that
neither support mid-thread preemption nor pagefaults, since without it
the userptr MMU notifier will wait for preemption until preemption times
out.

Moving forward this could be supported also for bo-backed VMAs given
a proper accounting takes place. A sysadmin could then optionally configure
a system to be optimized for dealing with a single GPU application
at a time.

The series will be followed up with an igt series to exercise the uAPI.

Thomas Hellström (4):
  drm/xe/vm: Use onion unwind for xe_vma_userptr_pin_pages()
  drm/xe/vm: Implement userptr page pinning
  drm/xe/vm: Perform accounting of userptr pinned pages
  drm/xe/uapi: Support pinning of userptr vmas

 drivers/gpu/drm/xe/xe_vm.c       | 181 +++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_vm.h       |   9 ++
 drivers/gpu/drm/xe/xe_vm_types.h |  14 +++
 include/uapi/drm/xe_drm.h        |  18 +++
 4 files changed, 176 insertions(+), 46 deletions(-)

-- 
2.41.0

