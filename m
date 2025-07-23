Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCADDC87FC5
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 21:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9AD10E077;
	Wed, 23 Jul 2025 21:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wqd8i2yR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A875510E06C
 for <Intel-Xe@lists.freedesktop.org>; Wed, 23 Jul 2025 21:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753305621; x=1784841621;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gzLIFAoPwE/Jeq6+7f1APZQZS1JZC9ZV7MNCKlfHCCc=;
 b=Wqd8i2yRW+rdhZUR0jXxEh6MY9As1sbWAzycsNViQ6Fo8bfL7PUX+fQG
 IF7KZDiFf0C5/v2AlW2wrDgkgc4HGfMR1PyTdZDVZkKGCA16FVl+a2pdi
 dGqKFwHs+xBIVnYmtiI+SNlN29M2eVBMs4A+WTfFBkGNLwOfG8687rU4i
 w/xd3gOhbEDdTEcDE381hVa0q4TlWYg32Gy4ciUvwuRe1N9WW32D/+d2Y
 oyeyzN35FHoIJddBqsZFRrMpp06yDXT64zGgX+KQyf31jQ9hTtj1KLxkM
 LXCRSZG3cUcVAcGmr8J+UUlpLrbTYbqB8EMKjEVO9EQ27asO30YEEq9hF w==;
X-CSE-ConnectionGUID: ibsq2UZ8SJSMeo4pXblBIg==
X-CSE-MsgGUID: Vk5StQDjQE+3cHSKRCZhTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66168647"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="66168647"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 14:20:20 -0700
X-CSE-ConnectionGUID: rH+sooEiQp6VG69nIAJJqQ==
X-CSE-MsgGUID: 1c8xSt/2ScOpQkes91YemA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="159040437"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa010.jf.intel.com with ESMTP; 23 Jul 2025 14:20:20 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/2] Clean up of GuC init data macros & add extra log option
Date: Wed, 23 Jul 2025 14:20:18 -0700
Message-ID: <20250723212020.3678133-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Code cleanups and add support for a debug feature.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/xe/guc: Clean up of GuC 'CTL' defines
  drm/xe/guc: Add support for NPK as a GuC log target

 drivers/gpu/drm/xe/xe_configfs.c | 61 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |  3 ++
 drivers/gpu/drm/xe/xe_guc.c      | 26 ++++++--------
 drivers/gpu/drm/xe/xe_guc_fwif.h | 28 +++++----------
 4 files changed, 84 insertions(+), 34 deletions(-)

-- 
2.49.0

