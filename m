Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9FCC76195
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 01:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1365410E285;
	Tue, 28 Mar 2023 01:54:51 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0486810E424
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 01:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679968487; x=1711504487;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4QnJD4tF98ATrIl5kWclNuF3q/9mVrsLR0KFOE9qcrU=;
 b=XViKbpsZzZBj4hfWEFILLjpws7XATG6oAU7RJp9z/Q2VzP0CGeP3qxpm
 mGeNRg8y+zsGJthvqIUJCq5meTKRoY4sMkLdm+r8jD2QMd28Z9BSC3gml
 Kd6LoZ3GGpTgRgpYS2znwq05po3jCi1qdTSlTmmM4/eWqF2yUaDXG1Wq8
 JDdF8yifnekE/TbynswfMarAHbSGoete3IXr+wRzn3ylwM0J5Qsi/MY+6
 fVjquQBXpG5EnJ0U9q5xLbX2zTGpNoTfarTbfqdVndtJQROT+A88ENE0C
 NeDLRKOHDwlW1D885xDbPcf5wcZKL0Z9+JcuaGdcARjY+a25ULHdeZ/Hn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="328889387"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="328889387"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 18:54:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="677173385"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="677173385"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 18:54:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 27 Mar 2023 18:54:48 -0700
Message-Id: <20230328015450.1731183-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] VM LRU bulk move
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

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/75

Matthew Brost (2):
  drm/xe: Only try to lock external BOs in VM bind
  drm/xe: VM LRU bulk move

 drivers/gpu/drm/xe/xe_bo.c       | 32 ++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_bo.h       |  4 ++--
 drivers/gpu/drm/xe/xe_dma_buf.c  |  2 +-
 drivers/gpu/drm/xe/xe_exec.c     |  6 ++++++
 drivers/gpu/drm/xe/xe_vm.c       |  8 +++++---
 drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
 6 files changed, 45 insertions(+), 10 deletions(-)

-- 
2.34.1

