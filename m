Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C937C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 22:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E622610F3DC;
	Tue, 16 Apr 2024 22:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WObv4zxw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255A310F3D9
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 22:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713306130; x=1744842130;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=61AJRNIFzYeWPNiJHXWLrpW9xyJDJMTZpys7rIOXAFU=;
 b=WObv4zxwN/VDWJCct1Bnt5jQPxd0lVxeHgA535N9QaQ1JoK6Fanj5mGs
 DkWBuH+93kMLWlv6LRCUhZskQInTMx9U/525N8OaRhHh7hsE4LbSEQr2g
 hdVV/v8qXtVi0eNvyjdhokTMcBgI7TlXXxLzcdP7RyALc+CkaUwRka26i
 7jLXG6hw28rIweqRh0U4eokXT4zTSr21PMebLsdblxY4Z5o1cu9TqYxRY
 fp5rqJ0TsTRdszyPOElBMfolYBE7nQPnbMnV6mxjwu3hRwbPrJMvb8717
 AbymMOb1h9dWmcwDqTr5QpOqUg55nseDibMzdjENNTr14a22N/fjpzzuD g==;
X-CSE-ConnectionGUID: CjrL6y/7SJ6Nlz0wBHpn7w==
X-CSE-MsgGUID: n5Rb1dizT9KLlfI4M/gAXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="11719782"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="11719782"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 15:22:08 -0700
X-CSE-ConnectionGUID: 3kr7nQQmRee9k4oPL38qBg==
X-CSE-MsgGUID: SilCwDviRfKvDQ9TBCkAjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="22463200"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 15:22:08 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 0/3] LNL GSC FW support
Date: Tue, 16 Apr 2024 15:21:56 -0700
Message-ID: <20240416222159.1332619-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

The flow is the same as MTL, so the only things we need to add are the
GSCCS and FW definitions. 
Due to the FW not being in its final state yet, we can't push it to
linux-firmware yet so it needs to be in the xe-for-ci branch. Also, due
to lack of mei support, a second patch for xe-for-ci has been added to
avoid attempting to use the GSC proxy until the mei patch is there.

I haven't yet added the gitlab links for the xe-for-ci patches because
the mei patch is expected to be published soon and therefore the patch
to skip the GSC proxy init might end up unneeded. I'll add the links in
if we decide to go with the series as-is.

v2: rebase

Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Daniele Ceraolo Spurio (3):
  drm/xe/gsc: define GSCCS for LNL
  drm/xe/gsc: Skip GSC proxy init
  drm/xe/gsc: define GSC FW for LNL

 drivers/gpu/drm/xe/xe_gsc_proxy.c | 9 +++++++++
 drivers/gpu/drm/xe/xe_pci.c       | 3 ++-
 drivers/gpu/drm/xe/xe_uc_fw.c     | 1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.43.0

