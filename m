Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBB8EB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 13:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F0310E253;
	Mon, 17 Jul 2023 13:32:16 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CA110E253
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 13:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689600735; x=1721136735;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4m2P23a/5DlOKXggMU15kc2WtLDtXu2KyEI6Vx10Ab8=;
 b=GW/CGQskY/N8n0AcNDRnL2HASjW9Fvg/aW4M2IVEXKHP9kzelJEf2zbY
 Y7FkNNJnDbMhCgQX7aqoZFmeRcgr3Cf9w6bIBR3oXg7fPBTNZ3BgUV2eT
 xZn11Jz7Jvg9mJLBUNhMNzPa6/RUO+3TsHitqNH3S6+KNE0wjzRJ49qoq
 X8AsLVxmvMpWxZOd4Wzgh3quX8H/6fwSIAZV2lM7/WBSWVG4tLFSfM13X
 FwQGXY+iBxXu83d26hQq97U4If9FAH2h1BrS9TajEWtupshAy12sm62NS
 K33Jl1rr4D8fVE6swNebilnoegIDJUtsn+hY8o69TJfPCeDWXSHiW5uHD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="355867835"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="355867835"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 06:32:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="836881058"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="836881058"
Received: from kprutko-mobl3.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.13.224])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 06:32:13 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 17 Jul 2023 14:32:00 +0100
Message-ID: <20230717133159.47980-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/4] xe_bo selftest fixes
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

Series attempts to get the xe_bo selftest passing.

v2 (Nirmoy): Minor tweak to patch 4

-- 
2.41.0

