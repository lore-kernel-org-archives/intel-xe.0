Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70690CA0FE6
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 12:05:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1297210E7A9;
	Fri,  1 Sep 2023 12:05:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A2F10E7A3
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Sep 2023 12:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693569933; x=1725105933;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EnsbmqoMOCPrfU8QBZe/QVDcegXcDNdzqtOxcTeI46U=;
 b=VphkC3vCWQ4GnZ97uix2Dr9aHXTjHPuxkrxKrBHtcUat7OJ9kXCru0PH
 ffaxEaeOAZteZigfm4KnyZxnmbzwk2FxRuDtMCKChVXkTF0XxyBuEigAQ
 XBOKU2vxRxootaOu+G/BZBMjBenv8ecSYNfE2KoWEOQFcmSmNEh3rUojj
 68eD3rqroHJTLnJNAs8bfT450pxXfJOW81ohA/rjt7zF9erUUoKhfbvSN
 SzcpBEeD5eQ2jbBxUbs+3w2Y+sF1EDB6ELuHi/UE5dRnvNOu+664I/xUu
 wGoAMEmckjs4nOX6LyMY0D1gkdY1UayXRLGgozwh/Iqwp2KYU7C3DG1Um w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="379994908"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="379994908"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 05:05:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="913666759"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="913666759"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga005.jf.intel.com with ESMTP; 01 Sep 2023 05:05:31 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Sep 2023 17:45:42 +0530
Message-Id: <20230901121545.361436-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] Add some performance and frequency sysfs
 nodes
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Adding base performace and vram frequency attributes to sysfs.

Sujaritha Sundaresan (3):
  drm/xe: Add a couple of pcode helpers
  drm/xe: Add base performance sysfs attributes
  drm/xe: Sysfs entries to query vram fused min, max frequency

 drivers/gpu/drm/xe/xe_guc_pc.c    | 170 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.c     |  28 +++++
 drivers/gpu/drm/xe/xe_pcode.h     |   3 +
 drivers/gpu/drm/xe/xe_pcode_api.h |  19 ++++
 4 files changed, 220 insertions(+)

-- 
2.25.1

