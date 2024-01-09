Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFF4C4706C
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 23:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4016C10E53E;
	Tue,  9 Jan 2024 23:01:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11D010E53D
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 23:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704841293; x=1736377293;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kht8+miqUdjRLvs70VTzZfaeqXnPElxTmSlrDbUR/I8=;
 b=nnnUodI/EYGMdifZNPuUw9STtstPjgcvs7ONGtyPSLul3nCgest4qm1K
 xlOk/aD6luRxx5Nw9yDxHR0fvj1oRkxQnxEI6ysMrFSI9xZOst+1Z2iv3
 JZzFj3dY67QixarnSeQlCwHv7K2+kJk6FhkqsX8QuEHqGS/A3amryFqsb
 wAF7f/y5UgarszmZrZ4kgrDjXZlGSYxle72AS5GXv3l3LeRVqEEkHd3b+
 gOhX/JlULhf2Tec0B4VunJmU37e7YK2c5FAlTqMnmsl2xvZlgUsRH7PWC
 49sjWK8xTI61w1Jza2uhQ+xViaoHh50lIECwWSbv5TC/1OFGxWkBG5vjW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5715496"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5715496"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 15:01:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="852344949"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="852344949"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 15:01:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2 0/3] GuC CT tweaks
Date: Tue,  9 Jan 2024 15:01:46 -0800
Message-Id: <20240109230149.1399302-1-matthew.brost@intel.com>
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

[1] https://patchwork.freedesktop.org/patch/572566/?series=127982&rev=1

Matthew Brost (3):
  drm/xe/guc: Add more GuC CT states
  drm/xe: Move TLB invalidation reset before HW reset
  drm/xe/guc: Flush G2H handler when turning off CTs

 drivers/gpu/drm/xe/xe_gt.c           |  4 +-
 drivers/gpu/drm/xe/xe_guc.c          |  4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       | 63 +++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_guc_ct.h       |  8 +++-
 drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 +++++++-
 5 files changed, 74 insertions(+), 23 deletions(-)

-- 
2.34.1

