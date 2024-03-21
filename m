Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAADC54E67
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 02:17:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5024010E4C1;
	Thu, 21 Mar 2024 02:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ixH+FfCe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C40010E4C1
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 02:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710987441; x=1742523441;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IkGwneou4HyK3O8e6bJg+DTiI7GDcNw+U1xjNtXEtjM=;
 b=ixH+FfCebgUCmV9x2lqNIx4VJHKiKy5Qib0EHW+qT/NqFDpVaqqJj9OG
 ICvFjQQsIYN1RokXsZaa9FyWPS7ubbe9Qa83lhqakU6sptZbMxJXiGCn2
 7R56jAG98hSrrYk1SMYi7DUgxzZZBnq0kEOryuNgPw1InfomImMYJv50U
 7H7t++5L+LdJZPb5Df86dJXLteyrd5vUObcuyzkJdWILKISEnx2ijLupx
 S+aFzDJqle6FJY3Yf25apYNaOh7Uc3qfsxI6u1go2vYcdMeq9ct3A4M42
 uHRp2uDY23xf+G3kz4JTO58jtoUEr4C44uk1DW0kq9riP3Jr5XoWy1bLb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="28425115"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="28425115"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 19:17:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="14338468"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 19:17:19 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, matthew.brost@intel.com, brian.welty@intel.com,
 himal.prasad.ghimiray@intel.com, lucas.demarchi@intel.com
Subject: [PATCH 0/4] Change userptr so it can be unified with hmmptr
Date: Wed, 20 Mar 2024 22:29:35 -0400
Message-Id: <20240321022939.2279979-1-oak.zeng@intel.com>
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

This is an effort to modify userptr code so it can be unified with
hmmptr.

A helper xe_userptr_populate_range is created to populate a user
page using hmm_range_fault, instead of using get_user_pages_fast.
This helper is then used to replace some userptr codes.

The same help will be used later for hmmptr.

The userptr invalidation code is also changed to match the hmmptr
behavior. We now destroy vma when userptr is munmapped from CPU.

This is part of the hmmptr (system allocator) codes. Since this
part can be merged separately, send it out for CI and review first.
It will be followed by other hmmptr codes.

Oak Zeng (4):
  drm/xe: Introduce helper to populate userptr
  drm/xe: Introduce a helper to free sg table
  drm/xe: Use hmm_range_fault to populate user pages
  drm/xe: destroy userptr vma on UNMAP event

 drivers/gpu/drm/xe/Kconfig  |   1 +
 drivers/gpu/drm/xe/Makefile |   2 +
 drivers/gpu/drm/xe/xe_hmm.c | 254 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hmm.h |  18 +++
 drivers/gpu/drm/xe/xe_vm.c  | 130 +++---------------
 5 files changed, 294 insertions(+), 111 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.h

-- 
2.26.3

