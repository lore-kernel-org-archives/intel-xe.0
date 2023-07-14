Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F44EB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 14:48:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C280010E8B0;
	Fri, 14 Jul 2023 14:48:34 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B072C10E8B0
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 14:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689346112; x=1720882112;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VmOw5alShg7Osn24jlJhq4sHSrCc/POniOUhj0xkHlI=;
 b=BOjYodsb8x8hOdIvhH/QyqtsTn0o1QibqbKJHB/bOEToO19lrrlfaPGo
 jcbSchLavEOsQfi2lYWbf5s2we0WI8SoulFCg3Nss7EpHbV0yt3ESQtVs
 6r9nhpKsRrOrDT0q2ws/HPdh/AlKRIPf/mcL8wMWwInocCISWU50C7re/
 FSv5dUXlfNglSozjF5WFF+/M5fdgsRQj9SQ5cduruuug3NfB2xbSd2N/D
 +anzZTgj69BLMmdIOlvkdkMiIB89pGp+TnEVYEEoWWlAYEnNYn9sgKhTe
 c1pS6ahAcovEOGmIxoqwB4LiSJZ1YjjmGYbxfs5lzdwAfRr/GumRQ8tFg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="345086759"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="345086759"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 07:48:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="752064288"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="752064288"
Received: from joejardi-mobl3.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.242])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 07:48:30 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 14 Jul 2023 15:48:15 +0100
Message-ID: <20230714144814.574873-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v7 0/3] uAPI bits for small-bar
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

The remaining small-bar bits. Add support for requesting CPU access for VRAM
buffers. Also expose this to userspace, along with various bits of related
accounting. Finally turn on small-bar support.

IGT:  https://patchwork.freedesktop.org/series/115786/
Mesa: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23781

v2: Various improvements suggested by José
v3: Add some kernel-doc (Gwan-gyeong)
v4: Small kernel-doc fix, also use the correct version of the struct
v5: Rebase on latest xe-next changes
v6: Rebase on the needed PL_TT -> PL_TT move fix, plus fix some other issues
    reported by José when running actual workloads
v7: Rebase on latest xe-next changes

-- 
2.41.0

