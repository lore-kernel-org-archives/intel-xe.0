Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807FFEFCBD4
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 07:23:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F70410E2FE;
	Mon, 16 Mar 2026 07:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZDfm4sF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFADB10E303
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 07:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773645797; x=1805181797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=47VKoQYDkWv2tzbnKOFCXxXvAH+nspEI5oRz9Pwv7sg=;
 b=SZDfm4sF3nMI2hK3ZgKw+YKAcHhk5Y5umMUFV3lRETdu0TgvU3tc0AZ1
 GjVpiGLvgWA18eItfJzHkAM7cpG9fAOAuCwIHjrZCHQGFUgY/H97S1UZ8
 snMX/tWr54Zn3scdfZ9JF5n5atOs3SvKaiAFBcrPOGTM7b85vKxKrHE1J
 gz+gpYxZPbY9BHuBLvcfD8hpN8ryOrLZXAjF8xWiVT7MSry3IVgTfoq3w
 ILBPFt2EgAit3z8nhEZEavI3F5WGuvwMftGWagel790Z2CW5K+u5mvtXp
 lvwyqfNfb2HIoWNax/toyLsDpWiEyVzES1O124Xvxy4dnuu+1SutmUtf/ w==;
X-CSE-ConnectionGUID: /5ko2ZukSjyHCXewxkVqqg==
X-CSE-MsgGUID: W0y5KTJETpmu4O4wCtCc6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="92038912"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="92038912"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 00:23:17 -0700
X-CSE-ConnectionGUID: WK5kSOrRTtanKQxoaIpKEg==
X-CSE-MsgGUID: mXNosqZSTniozV8niz3sRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226497585"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.31])
 by fmviesa005.fm.intel.com with ESMTP; 16 Mar 2026 00:23:14 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, stable@vger.kernel.org,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Mathew Alwin <alwin.mathew@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v5 0/2] drm/xe: PAT index validation for CPU_ADDR_MIRROR and
Date: Mon, 16 Mar 2026 07:22:55 +0000
Message-ID: <20260316072257.255372-1-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129000147.339361-1-jia.yao@intel.com>
References: <20260129000147.339361-1-jia.yao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This patch series strengthens PAT index validation to reject unsafe
configurations for CPU cached memory, fixing a potential security issue
where GPU could bypass CPU caches and read stale sensitive data.

The first patch adds validation to the madvise ioctl path, rejecting
XE_COH_NONE PAT indices when applied to CPU cached buffers (including
CPU address mirror and userptr mappings).

The second patch extends this validation to the vm_bind ioctl path,
ensuring DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR is treated the same as
DRM_XE_VM_BIND_OP_MAP_USERPTR with respect to PAT index requirements.

Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")
Cc: stable@vger.kernel.org # v6.18
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Mathew Alwin <alwin.mathew@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

Jia Yao (2):
  drm/xe/uapi: Reject coh_none PAT index for CPU cached memory in
    madvise
  drm/xe: Reject coh_none PAT index for CPU_ADDR_MIRROR

 drivers/gpu/drm/xe/xe_vm.c         |  2 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c | 46 +++++++++++++++++++++++++++++-
 2 files changed, 46 insertions(+), 2 deletions(-)

-- 
2.43.0

