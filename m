Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4512FEB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 11:25:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCFC10E035;
	Mon, 17 Jul 2023 11:25:41 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E2110E035
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 11:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689593139; x=1721129139;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RKwx/wLNwKFB7wv5kb9L0f2GnhZzooa185F+Z2s9+/Y=;
 b=amU8Wqs95GnaCIwd86fkDi3CTPJoMgbVltf4bvSXG+MKhoU8J1kyITcd
 b8L4CLKfV+baLJEtVDbK2OcBvp8eNl8tRl6DwJrfegCNzFY3d+hZjDoDv
 wGKy148jdWUjJW3tBRn87HRUBS4zMMNssxAD2xp9c4DezS7zb99zqx5RC
 GZAKNTPIPhoyTKWZYS2FZuE8SikrmHjC0Y0fdHVWUi0p9l67lveXCktcZ
 Wjm36VpaV1yx3JDcQjjy3MyGSY8lUwzZuIWVQoNtU3NUXXVAiDw4W2csA
 OhP8gETgFkE+a6RyG0hZCovG7qpr0PPEV3h4wZb74Cmz8i6hMPKVyv4eI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="365948456"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="365948456"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 04:25:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="897174812"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="897174812"
Received: from kprutko-mobl3.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.13.224])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 04:25:37 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 17 Jul 2023 12:25:03 +0100
Message-ID: <20230717112502.32379-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v14 00/10] xe_device_mem_access fixes and related
 bits
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

 Main goal is to fix the races in xe_device_mem_access_get(). With that fixed we
can clean up some hacks and also start rolling it out to more places that need
it, including now asserting it around every mmio access. We also add lockdep
annotations for xe_device_mem_access_get() and fix the remaining lockdep
fallout.

v11 -> v12:
  - freq_rpe_show also needs the device to be awake
  - Improvements to the lockdep annotation patch
v13:
  - Simply the first patch (Anshuman), also drop three patches which can be
    dealt with later.
v14:
  - Missed also updating the fast CT path which recently changed.

-- 
2.41.0

