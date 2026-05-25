Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC66ECD5BD2
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 12:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8238A10E318;
	Mon, 25 May 2026 12:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mIvnAYmN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F6610E315
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 12:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779713898; x=1811249898;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j1JEF8I+w9DW7SnzwnMwOl+FQoQkoWHVkycM06VpiZg=;
 b=mIvnAYmNOFXyeHh8M03F1OdINkt7TsU/q43K5uSMkHdwQXvU8HlDHbCL
 ff1BbpkqkiNcqVI2PY4+uxBzbnEAh+NMRSo3shpY8LcbOSvBNpPZ7iRjW
 zV2fgvBHIzqcIGVc2LHjT+BDoZxa/4LPto5RHOoRNLbLz8ny04E3Xr2Jg
 hEPcGT2f3MpY6UZ3Y6RQy/DledaKYW3kSli58cqsZNnsGdq6TyaIkdfub
 7foND+rbE3PSXUjWfplpTGgpE/V7DelWe9eKNuHbJMIlZpTvHiQRhRMOW
 23frnXtT7T4Jz2rlmLa8nUKW2rLZlhJKlsPFb6F+Yx7Utq5BWQEAImU2N Q==;
X-CSE-ConnectionGUID: WCFLLMRzRUu4vQI3oY7U3w==
X-CSE-MsgGUID: 2yFOdKouSByIZ4kbP3uQnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91223146"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="91223146"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 05:58:17 -0700
X-CSE-ConnectionGUID: JGW5mnhGR2C/zOYv8L/rkA==
X-CSE-MsgGUID: fGmLJVQITY6Yc56a7jhNiA==
X-ExtLoop1: 1
Received: from ilevi-vm-u24.iil.labsad.intel.com ([10.111.58.213])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 05:58:16 -0700
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, koby.elbaz@intel.com, shuicheng.lin@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH 0/4] drm/xe/mmio_gem: fix fault handler and destroy path
Date: Mon, 25 May 2026 15:58:02 +0300
Message-ID: <20260525125801.975038-6-ilia.levi@intel.com>
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

This series fixes several issues in xe_mmio_gem, introduced by
1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions"):
split VMA fault handling, a rb-tree leak on destroy, dummy page
accumulation, and use-after-free / MMIO access after destroy.

Ilia Levi (3):
  drm/xe/mmio_gem: fix fault handling for split VMA
  drm/xe/mmio_gem: cache the dummy page per object
  drm/xe/mmio_gem: fix destroy flow

Shuicheng Lin (1):
  drm/xe/mmio_gem: Revoke drm_vma_node on xe_mmio_gem destroy

 drivers/gpu/drm/xe/xe_mmio_gem.c | 85 +++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_mmio_gem.h |  2 +-
 2 files changed, 58 insertions(+), 29 deletions(-)

-- 
2.43.0

