Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770BCC02183
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 17:20:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3139010E417;
	Tue, 14 Jan 2025 17:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ErPiOni3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F4010E40F;
 Tue, 14 Jan 2025 17:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736875236; x=1768411236;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RjuYI/YFNgQlRIQu1/RCmoTntwpIKMO/lXzD7oq/33w=;
 b=ErPiOni3OPb4mIJetR1i6vUf7MfrvROdSpn/Z+BYjbDmeemTfeXGa7AH
 AH8LMMCSTPUikr5DJVkX3CNKR+Wn7mFwrzBwnrzNiFH0vTlWvCNP+3wKL
 21zPwP+q/lNiOBsdNzAEeVDLB43bw0wNsGHzCk+NlCdfxYfsCIf6jF78Y
 ydKZYuQrjK0rBac7y4H0DpmfTXhHi96xsaoqIv2ZRZB6UiK7NAfWAyQ0N
 +UnRWR+3adF94wFMiOP3xsat5qauXQ3Vh7k+oh/jl1msIZT76qiX64eME
 XvbPBmQ8U55Mim1ina1z/CoONSB/vnCh9LaCDlaGM50ASCWtvGzsfmxES g==;
X-CSE-ConnectionGUID: 4Ka1ZNNYTy2Ytox6eIpPQA==
X-CSE-MsgGUID: 2aUy+jnfS+m5Limzq6kSTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="48569125"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="48569125"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 09:20:35 -0800
X-CSE-ConnectionGUID: f5S7sDJZRWCdUY4vvkAf6w==
X-CSE-MsgGUID: X47Ji3MLTzqFnrBsyRxtkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="105379907"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 09:20:33 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com
Subject: [i-g-t] tests/intel-ci: Fix a syntax err in xe.blocklist.txt
Date: Tue, 14 Jan 2025 12:35:23 -0500
Message-Id: <20250114173523.3267049-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

The syntax in below lines are wrong:

igt@xe_evict@*-multi-vm-cm*
igt@xe_evict@*-threads-*

With above, those xe_evict tests are not blacklisted from xe.ci.full category.

Fix the issue by adding a dot (.) preceding star (*).

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index a9b647c1d..fc270198f 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -93,7 +93,7 @@ igt@sriov_basic@bind-unbind-vf$
 # Exclude xe_evict tests that are not expected to succeed
 # due to missing TTM exhaustive eviction
 ##################################################################
-igt@xe_evict@*-multi-vm-cm*
-igt@xe_evict@*-threads-*
-# igt@xe_evict@*-cm* # Rebind and VM_BIND may race.
+igt@xe_evict@.*-multi-vm-cm.*
+igt@xe_evict@.*-threads-.*
+# igt@xe_evict@.*-cm.* # Rebind and VM_BIND may race.
 ##################################################################
-- 
2.26.3

