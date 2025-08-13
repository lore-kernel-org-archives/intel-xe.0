Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06B4CA0EE4
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 10:13:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F5110E6DC;
	Wed, 13 Aug 2025 10:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jawwVRCG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167AB10E6D9
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 10:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755079992; x=1786615992;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=podvS2rae7tg+kLT9SmszwMgF0SaS9+0BPCtjuuBg/k=;
 b=jawwVRCGn8nTraAEiGcU+ZHNrwWAHr3vTa/c4DE9E5AHZawN2BiYFDHc
 5+74TPk5A6pTEsp8J3XCMZB8qrJb2MBZgpfCfzBBHvCFpnFLkaKno2ZqW
 1ffr5NACnYVwuOXpwfb66V0rArm6vj9xZj6i/uCLLc7xhtI2CFlJ+iEmf
 0QtinqS0FJdBFynHtO669aqOFdQYgSjz6rLqYjUbvMe4Lq80mLrnVpCow
 dVu1iU0lJX7K61r4uE8djDT/YIeYEBITxxwP/P8DUlfMyhe+2tfmO0UaX
 KNCy4sXFsr0VtZLoZY2ISMRkrC1aHVvnvJ/DpdKTCX6M1i77LRatv9tC1 g==;
X-CSE-ConnectionGUID: WLjpTSsjS+if7/wREbRN5g==
X-CSE-MsgGUID: yreGJLpoRwyVnI/6vTQ33Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68745119"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="68745119"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:12:43 -0700
X-CSE-ConnectionGUID: QIdbzYfNSkSTyWa+40TV3g==
X-CSE-MsgGUID: dwkTYtteRCuvC8eI4dZ3qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166061871"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:12:42 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH v2 0/2] drm/xe: Untangle vm_bind_ioctl cleanup order and fix
 double free bug
Date: Wed, 13 Aug 2025 12:12:29 +0200
Message-ID: <20250813101231.196632-1-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Hi,

recently I stumbled into a double-free bug for array-binds when the
argument check fails. I've submitted a subtest to expose this issue
here: https://patchwork.freedesktop.org/series/152831/

I took the liberty to change the cleanup order in the main vm_bind
function but if that turns out to be unnecessary/faulty, just setting
the bind_ops to NULL on failure should be enough to fix the bug.

Regards,
Christoph

v2:
 - correctly set the bind_ops pointer (Matt),
 - move the reordering into a separate patch (Matt),
 - adjust commit trailers,

Christoph Manszewski (2):
  drm/xe: Fix vm_bind_ioctl double free bug
  drm/xe: Untangle vm_bind_ioctl cleanup order

 drivers/gpu/drm/xe/xe_vm.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

-- 
2.47.1

