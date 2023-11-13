Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF986C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 08:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A177310E166;
	Mon, 13 Nov 2023 08:47:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5A510E166
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 08:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699865249; x=1731401249;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O2sqtIenZzyLWb41yFsK4IMmSwlRPVYxnLP8O6JiMX4=;
 b=AA1qkh4uNPkWF5fravXJg/6iOm/ubOyni5bChjh6o5kB3f2qh/meFF0V
 1gE2InORwsdqfRJl+MdCeCz4DlXcVIEwJ4PR13yxOZdsfDsJBF9bQJkPm
 fl+11he8CJSn0DQ69puc4mWkm7F8o4BwzxJ082tRXhX5bCYSjQhEnTedc
 iY+3pCTEZpNt+WsYmalk0NAIuVvmdYs3HjOuli8xYZc6y+rpXTwWH+o1y
 vRKUmTubzrcA/IEolwdO+npJyfDjLpbpVqfGolNOkEzL1VZpLBu8HKbSU
 csqq2/HZf5QMbwhFHpuy/GbrtdU3F8DtRHU11Q9hNDb6SQZI8m9vQHlRb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="9043951"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="9043951"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 00:47:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="937686837"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="937686837"
Received: from tshpongi-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.54.226])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 00:47:26 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Nov 2023 08:47:12 +0000
Message-Id: <20231113084712.6-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] amend! drm/xe/xe_exec_queue: Add check for
 access counter granularity
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
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

drm/xe/xe_exec_queue: Add check for access counter granularity

Add conditional check for access counter granularity.
This check will return -EINVAL if granularity is beyond 64M
which is a hardware limitation.

v2: Defined
XE_ACC_GRANULARITY_128K 0
XE_ACC_GRANULARITY_2M 1
XE_ACC_GRANULARITY_16M 2
XE_ACC_GRANULARITY_64M 3
as part of uAPI.
So, that user can also use it.(Oak)

v3: Move uAPI to proper location and give proper
documentation.(Brian, Oak)

Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Oak Zeng <oak.zeng@intel.com>
-- 
2.42.1

