Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C59C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 09:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A283010E216;
	Mon, 27 Nov 2023 09:48:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722CA10E216
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 09:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701078521; x=1732614521;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oCbF8IFL+yWz/lrImox+v0yIAhW61bZBPALEacZh9ds=;
 b=iKzovKoePr/cUtqgRXYsYlD0W7PbEBJYvRyjdWDl/bwn2ZlXPZdXLjGR
 ILenSQsTktJiOK2uNeDweN9/NFTmxPQocgJ6L3BPzIGWokCwmJyFPnYh1
 D2lbQRcjdmcGV9Q9CaejeqYroZogai8mxIOCGVSzPwZKbM0obytEmIovZ
 ESnC0OJzupkut10VnchG015shyhQaMJnWEpBwVzIzqwkvwm1/AkeW23iX
 dA3kXPJWzsaTWyCSgfHRnimE0zUaop5UOZTjdY3mfMnzQpeAlzu9ei2R1
 csgcvqX1nw1f4l6rRiO78IEdC+PzfnpdVpqwuY3niSekFX74ojn+BLCQs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="5919278"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="5919278"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 01:48:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="1015493252"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; d="scan'208";a="1015493252"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by fmsmga006.fm.intel.com with ESMTP; 27 Nov 2023 01:48:38 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 15:32:48 +0530
Message-Id: <20231127100249.168117-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/1] Add a freq sub directory for GT frequencies
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reorganize gt frequecies in sysfs by adding a sub directory.
Also make relevant name changes for the attributes to align with
devfreq.

Sujaritha Sundaresan (1):
  drm/xe: Add a new sub directory for gt frequencies

 drivers/gpu/drm/xe/xe_gt_types.h     |   4 +
 drivers/gpu/drm/xe/xe_guc_pc.c       | 125 ++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_guc_pc_types.h |   3 +
 3 files changed, 82 insertions(+), 50 deletions(-)

-- 
2.25.1

