Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398F2C5B552
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 20:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E990310E84C;
	Wed,  4 Jun 2025 20:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GtV/3K4I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1AD10E85C
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 20:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749068960; x=1780604960;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RTIBsx25jutq3iZpwGjECSL3a6hL5n2iLhMpRPxIGgE=;
 b=GtV/3K4IXfDV4iV63LWRz5Thw8wuSPxD5ptiEYj6F7tjH8Pr7ttH77Hn
 R1SmW7fen1rZ7jp4eDRHsIwzCxJiESj4nQK8HmWeKPFgtA6VUPcBzrGMK
 rtNUGYmzl63Yz97OgF2v0VDq+6m7nrGJxeKPagkD8bhY12u+Yq4CGL68l
 pswwriWUd8Ia3DN3Wiw447dhCkoXvsvV0ql/CfS9eYah/nC4XpYN9QlHR
 K1EEJX9ylUvDjd1bEt06XSABJbjv2UYz/X7Ei8jNk/SIanK0M3PibdhIg
 LVy7/6x4HRb3pM7l4EocLYxKbzLkFyYSI1QduMRKPQdIB1LDNDNlEQzZc w==;
X-CSE-ConnectionGUID: TgAojBggQBOwZSHtXI8YTQ==
X-CSE-MsgGUID: Cyu76i2eQwu0Qxyd8s3OPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51039063"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="51039063"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 13:29:18 -0700
X-CSE-ConnectionGUID: H5cUyoBZRr+FGjZe/ssOyg==
X-CSE-MsgGUID: Gh7PL6U7TVaNmsnULZlotw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="145257205"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.253.198])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 13:29:16 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/3] Small improvements in topology code
Date: Wed,  4 Jun 2025 22:29:05 +0200
Message-Id: <20250604202908.769-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (3):
  drm/xe/topology: Simplify code for loading DSS mask
  drm/xe/topology: Use register array size instead magic number
  drm/xe/topology: Stop trying to fix programming mistakes

 drivers/gpu/drm/xe/xe_gt_topology.c | 42 +++++++++++++++--------------
 1 file changed, 22 insertions(+), 20 deletions(-)

-- 
2.47.1

