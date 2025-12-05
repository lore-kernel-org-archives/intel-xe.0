Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B486FD37484
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 19:07:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5885C10EB9E;
	Fri,  5 Dec 2025 19:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5L0gkSJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7C610EB9E
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 19:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764961671; x=1796497671;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u6rf475DfhBiu9I3RdDbPACBnydiWxqqyX9/iwRYYtc=;
 b=J5L0gkSJMbSesgKELajeJZI+lSDeRW069nypNhNQdOOCvyQK4+lkxDwl
 zvCDBvQeTgPVD6PqXENOjnFUY3GMcTVOj2pFOE+VoLAFQpxKMv3tKFPwv
 V+eLfpIyvK1ccKxk+XwsfuxbgEipvxE/WY6H804f7KUd1aIhCtUgb7aDU
 5kyM8aKbyX4wGYBrjcf7DMjxDX2l3bFCHj/vmeSox+1SdfOKgzq0DaGJQ
 FxLG7TnXL/kx6bRCW9hn4pK1mPx3RQ6WGRQ3p3gYEnAMFblf+iFaWkuOp
 rqrvWeY2iEJPS6ewtrN4SxMyZd5wpK2myDNzjcaUEsHWXl+juhEMTAkMf g==;
X-CSE-ConnectionGUID: yAlplbvUQ5aKrFT7HhOGRw==
X-CSE-MsgGUID: 3TzY80vRRHiprNwZoDzUGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66188565"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="66188565"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 11:07:51 -0800
X-CSE-ConnectionGUID: XWTWQkRlQgmzx5AUneXawA==
X-CSE-MsgGUID: Xg3n3TK9S6musRTVSVXKLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="226013703"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa002.jf.intel.com with ESMTP; 05 Dec 2025 11:07:50 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 0/3] Limit num_syncs to prevent oversized allocations
Date: Fri,  5 Dec 2025 19:05:07 +0000
Message-ID: <20251205190506.2426471-5-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

Limit num_syncs to prevent oversized allocations

Shuicheng Lin (3):
  drm/xe/exec: Limit num_syncs to prevent oversized allocations
  drm/xe/vm: Limit num_syncs to prevent oversized allocations
  drm/xe/oa: Limit num_syncs to prevent oversized allocations

 drivers/gpu/drm/xe/xe_exec.c |  5 +++++
 drivers/gpu/drm/xe/xe_oa.c   | 11 +++++++++++
 drivers/gpu/drm/xe/xe_vm.c   |  3 +++
 include/uapi/drm/xe_drm.h    |  1 +
 4 files changed, 20 insertions(+)

-- 
2.50.1

