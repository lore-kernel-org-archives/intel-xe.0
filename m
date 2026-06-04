Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FC1CD6E75
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 20:53:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4DC1135AD;
	Thu,  4 Jun 2026 20:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WlyO40XT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CA61129C1
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 20:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780606419; x=1812142419;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pNwlfqqMVs9XulE4KFHHEyrUVZjVoKY0/+K4AKRyRiM=;
 b=WlyO40XTruw8DRB6mg+zrA113K1BnlyASbgn4kYNSH9THlpYvc7ppPEO
 Ls95HForuiObm6sCzIYdF+WjkJJqzvimzx2e3qls5PEeIzR2b1HpNLYkV
 +eqd3rhe2EAH28Bg2QOy+P/UplsTcsR/28t1z/3dPQY8J+h6rqIOT4Wg8
 HdbUNOeHa0RTp2IzdRV7TYqO7Vn49nqRU4FH4V+T9lKYxyB6gYX4zywfI
 lczAFnqcVtZbrneHd0iTG4ww5LwdVpKpILk8sRrvUyl7M0HO5Vpc7ySTT
 VjSnAKY71RZmzSLwWcu5dBaATG+b+fH17I0hmuoWqWj4r0zPXvAPzKdsc A==;
X-CSE-ConnectionGUID: 7aFn4pN7SuWMwrOczAVyHg==
X-CSE-MsgGUID: fn2xy2kFQ2atPNjO4HyhJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81186591"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="81186591"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 13:53:39 -0700
X-CSE-ConnectionGUID: nMJ67KPBTQarmlipo4NWdQ==
X-CSE-MsgGUID: lvhZpVCUQQakAk6hceVneg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="242162816"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 13:53:38 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 0/3] [drm-xe:topic/xe-for-CI] Use GuC firmware 70.68.0 for
 pre-release platforms.
Date: Thu,  4 Jun 2026 13:51:35 -0700
Message-ID: <20260604205325.1977872-5-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
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

Use GuC version 70.68.0 for NVL-S, CRI, NVL-P.

Patches are intended to be merged into drm-xe:/topic/xe-for-CI branch.

Platforms NVL-S, CRI, NVL-P are not merged to upstream at present. The
GuC definitions for those only exist in the for-ci topic branch
drm-xe:topic/xe-for-ci. This patch set provides fixup commits to bump
the versions.

Julia INTEL (3):
  fixup! topic/xe-for-CI: Define GuC firmware for NVL-S
  fixup! topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI
  fixup! topic/xe-for-CI: Define GuC firmware for NVL-P

 drivers/gpu/drm/xe/xe_uc_fw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.51.0

