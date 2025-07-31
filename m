Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8777C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 06:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C59810E703;
	Thu, 31 Jul 2025 06:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBwnjcZn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B482810E703
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 06:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753942222; x=1785478222;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SMCsj/ZjA5rAbL4DeY5q9jOPTKgeD/Nnt4Uc+R+irJo=;
 b=FBwnjcZngALE6slxAylai8Xtr6K88+T2eCcZQgjXrGub8XP0by9lrGSr
 rEfgfydt624dhb392s3+Kr5Kz9sWEaaa2Fmv+0Jetkw2Z8O1cdr4tuKir
 EsIOSe/2xjBoZA8BHZHdoLjdUlChDgMvnvQ4L9R09JtsvdVFFyqskOoE0
 POOpyNe+aAw3FqmumPa28eVzJTpV8K8ZZyl3rQlfqV1zDNVeLcnMRzPFR
 mwCt7+65AKIrpvctrjZNsn6dEv+sQRzDHJfMaG4zQNVH1fXgpXmHplfT6
 Y6EN5GLYxXj1rKZ/Cq9Be56Ak7GBJzGJiRbS+wDTHkbeyRadBSEaVJbcw w==;
X-CSE-ConnectionGUID: s5C/rolYSeKkLgBH5Erf4Q==
X-CSE-MsgGUID: eozdyWCpSYCLU/ywl9zLEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="55322620"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="55322620"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 23:10:22 -0700
X-CSE-ConnectionGUID: f8myrep1T9Oh/leP+u3GPg==
X-CSE-MsgGUID: kXWtTb/MTF6CDh+7PplykQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="162445969"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa010.jf.intel.com with ESMTP; 30 Jul 2025 23:10:21 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 0/1] Improve CCS save restore series
Date: Thu, 31 Jul 2025 11:57:09 +0530
Message-ID: <20250731062710.17342-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

Previously, CCS save/restore operations created separate migration
contexts with new VM memory allocations, resulting in significant
overhead.

This series eliminates redundant context creation reusing the default
migration context by registering new execution queues for CCS save and
restore on the existing migrate VM.


Satyanarayana K V P (1):
  drm/xe/vf: Refactor CCS save/restore to use default migration context

 drivers/gpu/drm/xe/xe_migrate.c            | 15 +++----
 drivers/gpu/drm/xe/xe_migrate.h            |  2 +-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 49 ++++++++++++----------
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  2 +
 4 files changed, 37 insertions(+), 31 deletions(-)

-- 
2.43.0

