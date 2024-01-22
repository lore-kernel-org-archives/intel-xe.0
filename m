Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E2FC48260
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 21:01:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0E910EF94;
	Mon, 22 Jan 2024 21:01:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE74A10EF61
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 21:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705957286; x=1737493286;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xxdmus6fsGvXKSq/L6AbIQyOLYuuvvSYqcfGyTRZ0GE=;
 b=Lc3N9nlnVYfU6zh0wj0+SEshGMmuDU+MGhQQFaszDzSt9E1ueuJSe7fl
 +mYXByO+xsqy9qJxKA9GjDFkjHUMXUULA0LxBDe0lS4npK+EmChCMJOhw
 8GskfxupF4mNR67w9qXvugTEfTUUka7sXaJvB+IvJlHPdWia/lpxS2b4k
 zTDVvnfSmm3D4kSJKoQnSVPqzK9xiZDfyXtNV1k/+36cFqy+oCod8nXPX
 dmI9RaefKvLDITMWjVFXKindYXShWZXV1WTYXR4+C/YTPHOBtKRrchcnh
 2rb+G8A1KPntJloKnV27BWANJrDFbauqOBlI26Hf4xKSg0e8fQICEgJOK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8000768"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="8000768"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:01:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1338105"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:01:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v5 0/3] GuC CT tweaks
Date: Mon, 22 Jan 2024 13:01:53 -0800
Message-Id: <20240122210156.1517444-1-matthew.brost@intel.com>
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
v5: Fix CI

[1] https://patchwork.freedesktop.org/patch/572566/?series=127982&rev=1

Matthew Brost (3):
  drm/xe/guc: Add more GuC CT states
  drm/xe: Move TLB invalidation reset before HW reset
  drm/xe/guc: Flush G2H handler when turning off CTs

 drivers/gpu/drm/xe/xe_gt.c           |  4 +-
 drivers/gpu/drm/xe/xe_guc.c          |  4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       | 89 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_guc_ct.h       |  8 ++-
 drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 +++++-
 5 files changed, 99 insertions(+), 24 deletions(-)

-- 
2.34.1

