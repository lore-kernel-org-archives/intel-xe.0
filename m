Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5016C678D5
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 10:18:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8163310E106;
	Wed,  8 Mar 2023 10:18:27 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EF810E106
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 10:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678270705; x=1709806705;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RdrTtEW1gP0zJdmSZLuEO33FnxRh6TbqbdKyKRyTkNQ=;
 b=QOIM0jokuq2N/9FPvtTyGd4ldH2eDhk+JcAqJi0f7Qp48GrOOu7D7RXF
 pdjRTcJBhY/hxTNTWGRoVLrrsboHNOkMdVUnZfGZ0RUt4zRZ9cnFwQG2O
 3DlRRv8WLhMm37f4cQ89ditjpZRewI5ea5SSFOdoUFMJUX7fHyFd1RyfB
 HE+95CVwPIbM4h6hHvjN77K1msv28KWaqIxzspD+oO+GMe0zx04f5XpyE
 F9RwSxzxmBly11Pyy5GSAt6ucYdt/yC4v6ooF1DswDXeym2gXL1Tf5W4U
 T9jxcatw4yRWK2g/bjxuUW3naHEFE1ngzvm9TYRpNRnjFpc4EGzpt3GZB Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="338444544"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="338444544"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 02:18:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="626861471"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="626861471"
Received: from jlenoir-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.24.168])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 02:18:14 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  8 Mar 2023 10:17:39 +0000
Message-Id: <20230308101745.217120-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/6] Some small-bar prep patches
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

Split from the small-bar series. Plus one extra patch to fix the overloaded
meaning behind xe_ttm_stolen_cpu_inaccessible(), as pointed out by Maarten.

v2: Apply s/lmem/vram/ for the entire driver

-- 
2.39.2

