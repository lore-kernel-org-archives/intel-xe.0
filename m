Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9772BEEB560
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 18:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3831510E0F5;
	Fri,  8 Sep 2023 18:49:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CD410E0FF
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 18:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694198982; x=1725734982;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=unmlaOpOGRG9LhnAPBFddNNm56zu99bzypEtho3Fa0E=;
 b=BFv6yzosI2QtzQ2RxcRxQ+ZQZiDnWuYonBaIF5wFJRjZ4UN8di6Uixhn
 739+b6gc+ooZ4ldpuq0T2i+MFqnrnlVrfAY5bVDo4PoXXQXEG2y3pWJmv
 V1YUXrO0ab5VYHaz2GZKskTB3YNJHcO+s1vj7pFBp5X5QgudQ7P/PMAzi
 yt//45XuUUv8psW+T0B90Cnp8CCnBorjBVjNXSJxNKIvxmFhlC2WPNpee
 QZoD2dwLb0HJYnAhtsnwIrPlFYUA8+mU99pRI5pipYUbHDrjZDs9tbYOX
 2OvHSmh44E87Bk8JHb5TXWjpTVdofVGPJZv8imkWn1ydVGkLSDXEKsDQa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="367985551"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="367985551"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 11:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="742600208"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="742600208"
Received: from dinahclx-mobl1.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.213.169.125])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 11:49:40 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  8 Sep 2023 15:49:27 -0300
Message-ID: <20230908184928.65815-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/1] Remove redundant call to
 intel_init_display_hooks()
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

In Xe initialization path, the function intel_init_display_hooks() is
being called twice, which is redundant. To remove redundancy, let's
remove one of the calls.

That function sets up hooks that are called from: (i) later in the
initialization path (i.e. intel_display_driver_probe_nogem()), (ii)
resume, or (iii) mode set commits.

In both call sites, none of the scenarios above are reached yet, so it
would be safe to remove the redundant call from either of the two.
However, since intel_display_driver_early_probe() is shared by both i915
and Xe, prefer to remove the call done from xe_display_init_nommio().

Gustavo Sousa (1):
  fixup! drm/xe/display: Implement display support

 drivers/gpu/drm/xe/xe_display.c | 2 --
 1 file changed, 2 deletions(-)

-- 
2.41.0

