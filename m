Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A632CD5BB3
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 17:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0B310E25D;
	Fri, 22 May 2026 17:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PrgvE7NG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9593010E25D
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 17:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779470815; x=1811006815;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jP0buArgGLqUU0lxJg4MIA4sR45k3HjjkDTAdFUKuFs=;
 b=PrgvE7NGt46xdpupKfvEXPTl4UHnrBKcVXsB/M+8s7koeVeFtqxkMT0k
 hc4CFYmd4pndkqDxb6/tUPzxUSNsGxbxmVhT1uLxNwoS2jQqc0qWvaTaY
 jhr1K9lo6sZMp1wwzUA/Gy2Ft41XZtATFv0fhbu9Daoanmbs5kGTbfxOO
 Se80TBgrk75WbtMNjgW3sPfmi1O1BNZso4imdc/pKKBeLC1BSsBHHi9wR
 ySV5gUrPXk9pPkkeWglpEE2VhX5beBdPFznGi0wQg29sxcui81XKDwvxF
 jQ979CgtnIoNb6HLbIIjKbX2kIzy5DFWxa2IETX8oqrXPxCq9J0oh0BhA g==;
X-CSE-ConnectionGUID: GAEZKQi5RPCKm0aqOcGjyg==
X-CSE-MsgGUID: aL7orR5uSH6ydfNp3sI62Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80436564"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="80436564"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 10:26:55 -0700
X-CSE-ConnectionGUID: PftU3o+lQei/kwfMVAu6cw==
X-CSE-MsgGUID: TRta+PKvQJy2UJRp1TNkcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="246044069"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 10:26:54 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com
Subject: [PATCH 0/2] RFC: drm/xe/pagefault: Add SRCID to pagefault reporting
Date: Sat, 23 May 2026 01:26:43 +0800
Message-ID: <20260522172645.3503927-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
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

Add SRCID to the xe_pagefault struct, which reports the ID of the
faulting hardware unit.  This will be passed on to the
xe_vm_get_property_ioctl for reading per-vm faults.

RFC: Will add missing contributors/Ccs later.  Just want to confirm this
is what is being asked for.

Jonathan Cavitt (2):
  drm/xe/pagefault: Add SRCID to pagefault struct
  drm/xe/vm: Add srcid to xe_vm_get_property_ioctl fault report

 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  1 +
 drivers/gpu/drm/xe/xe_pagefault.c       |  6 ++++--
 drivers/gpu/drm/xe/xe_pagefault_types.h |  4 +++-
 drivers/gpu/drm/xe/xe_vm.c              | 11 +++++++++--
 drivers/gpu/drm/xe/xe_vm_types.h        |  2 ++
 include/uapi/drm/xe_drm.h               |  4 ++--
 6 files changed, 21 insertions(+), 7 deletions(-)

-- 
2.53.0

