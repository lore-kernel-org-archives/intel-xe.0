Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C025C36002
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 21:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B86710E6C0;
	Thu, 20 Mar 2025 21:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FI0bR9vx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867C110E6C0
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 21:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742504873; x=1774040873;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CQ0gpI1N3v/UKHuTpbKDw2n9L7GM5Z4oIF2xeVNCH9w=;
 b=FI0bR9vxJNv8CN43Za1wT4poqwwGs7XlewMaubcWWVqp+p1mTGTgBUAu
 vkWgUo23fJoxOXwz+Va0bteO4W6WAm8b3h/fPIsFC2pUNECQh1zXqxzGK
 QaGbWt5e++tgBQ61Nq4yRRAYRpNNRdt08pGJ8Mx2rG0zy6vvlLGK2g6wQ
 lLTCYZ4dE7MSzo6NRhPiNYUjbse6FzKkuCphEfrbCYG6tX5GDGe/g/LQd
 S8HOXCxEz768P/GSBu01n3LEBaUovobEgAB2uyhGsZkLFC6sDdD3Pe7/o
 hvjyobx1f4RFtLTAevoe+Lzag4HaY+AMtyghS9+VyUR2RaINijAWmiMVs Q==;
X-CSE-ConnectionGUID: SfbTS7lhR8WhHSBrXfbdDA==
X-CSE-MsgGUID: SFC9t1bmQIO4VYQ6AZyqDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43875354"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43875354"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 14:07:53 -0700
X-CSE-ConnectionGUID: xw7iClIzT6yyxvEEC0m7/w==
X-CSE-MsgGUID: vRPHVWJYQ86dhDPBRj4l6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="128326100"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.113.30])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 14:07:50 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 0/3] VF: debugfs fixes
Date: Thu, 20 Mar 2025 22:07:35 +0100
Message-Id: <20250320210738.1733-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Some debugfs files exposed under gt0/ or uc/ are not working properly
on VF drivers, so stop showing them if not applicable.

There will be still some bad register accesses done by guc_info, but
this will be fixed by other pending patch [1]

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

[1] https://patchwork.freedesktop.org/patch/640267/?series=145667&rev=1

Michal Wajdeczko (3):
  drm/xe/guc: Refactor GuC debugfs initialization
  drm/xe/guc: Don't expose GuC privileged debugfs files if VF
  drm/xe/vf: Don't expose privileged GT debugfs files if VF

 drivers/gpu/drm/xe/xe_gt_debugfs.c  |  18 +++--
 drivers/gpu/drm/xe/xe_guc_debugfs.c | 102 +++++++++++-----------------
 2 files changed, 52 insertions(+), 68 deletions(-)

-- 
2.47.1

