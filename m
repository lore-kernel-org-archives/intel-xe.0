Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDA6606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 07:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O7AbQGKJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456D010E858;
	Fri, 30 Oct 2026 07:06:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DD510E858;
 Fri, 30 Oct 2026 07:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793343990; x=1824879990;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=35ju1zQmNAQQh6g5R/Ex0WStl+I426b5pNcbelV+xrw=;
 b=O7AbQGKJgzeklFgV5gKVnGRe5sG9LvJYkNTAyNk0JTyYfCnwLlGZ+EGX
 KwVWokNXbk3QPmGOL6DwfdpdktNvT2WBwhGKZbUg1eMeDUKiVSPtfv3HV
 xQ3HyV1YqTGkHjJwH1bJf52DblGgalDVJIn5RHlvDy/j0etzxhmmsjwLE
 CElR9J3smuZ4UpcZB/OVbWg+cIS4q5Gr0EcWb8ASFFKlC8KNNIuVilvH2
 6I0B6gWIv9tzbOhzfbmOHHxEf/y++9GiWqeTAsSAtMWoyXsk5YW+/CrlY
 guqjiZ5GGloUdiTi8Hd++Hg0Jv5RFk/5Bxjq1gynu+sc41MVouvdg0ZnY g==;
X-CSE-ConnectionGUID: SYwyiON1Q32OiI09oReOOQ==
X-CSE-MsgGUID: hPaxZDO+R0CglLn70fSsUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1985050"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="1985050"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 00:06:30 -0700
X-CSE-ConnectionGUID: 2xc2+KXeRAiWDddF5/kjjg==
X-CSE-MsgGUID: YSYjFMeRSsSgymKmKuIKlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5485186"
Received: from szadworn-mobl.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 00:06:28 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 0/2] Frontbuffer tracking fixes
Date: Fri, 30 Oct 2026 09:06:11 +0200
Message-ID: <20261030070613.181026-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two frontbuffer tracking paths can leave display power saving inactive:
flip flushes may not re-arm PSR, and fbdev updates may leave busy bits set.
Re-arm PSR after every flush and flush fbdev updates once complete.

Jouni Högander (2):
  drm/i915/psr: Re-arm PSR after flush
  drm/i915/display: Flush the fbdev frontbuffer

 drivers/gpu/drm/i915/display/intel_fbdev.c | 13 +++++++------
 drivers/gpu/drm/i915/display/intel_psr.c   | 11 ++++++-----
 2 files changed, 13 insertions(+), 11 deletions(-)

-- 
2.43.0

