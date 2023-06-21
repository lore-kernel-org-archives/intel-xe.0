Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DFCEB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jun 2023 08:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B5F10E0B0;
	Wed, 21 Jun 2023 08:53:33 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E1C10E0B0
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jun 2023 08:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687337611; x=1718873611;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uxg3a4Jn378B7Wodc04OFHDqqdZoD5YxBO7sIqvHeVI=;
 b=IUvqStaTD8VFRCWMASpzJ61D0VP0VJZHV2ktoL5l0p5YG5fvFLPkyBVr
 DNRY4fIqWDzptU/8ceb4pov3CXVza1yxoF+seD6YtHv9fz6BtAFTG/fWQ
 ad5MHNwb+LxDZjZtxP51sAonBJUkvcvGsX8jTY25cCU+oWXxlbRu+VCrh
 qImhKSxOvciwkQf0rALvFN/k+wZu4KD1YS2LaVaGQ3uOlH/gyisnA9rG0
 1hygZyqoIgaQDiBJ3B28k0eqOFjtPjRQwExqlDSIveRNgQtOlp7eG02D1
 YOV8Wfzh3tcOtoH7z5cwcjwAhiIMczD5hPe/dNQ52JuqYbNWtPktiRQs1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="363532635"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; d="scan'208";a="363532635"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 01:53:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="691767685"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; d="scan'208";a="691767685"
Received: from tklimkie-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.213.24.216])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 01:53:29 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 21 Jun 2023 10:53:18 +0200
Message-Id: <20230621085319.165730-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/1] User fence wait uAPI change to nanoseconds
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
Cc: Luis Strano <luis.strano@intel.com>,
 Filip Hazubski <filip.hazubski@intel.com>, Effie Yu <effie.yu@intel.com>,
 Carl Zhang <carl.zhang@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

I'm planning to merge this change on the beginning of next week.
At the moment I got Mesa + Media confirmation it won't break their tests.

Cc: Filip Hazubski <filip.hazubski@intel.com>
Cc: Jose Souza <jose.souza@intel.com>
Cc: Effie Yu <effie.yu@intel.com>
Cc: Carl Zhang <carl.zhang@intel.com>

Zbigniew Kempczyński (1):
  drm/xe: Use nanoseconds instead of jiffies in uapi for user fence

 drivers/gpu/drm/xe/xe_wait_user_fence.c | 40 ++++++++++++++++++-------
 include/uapi/drm/xe_drm.h               | 14 ++++++++-
 2 files changed, 43 insertions(+), 11 deletions(-)

-- 
2.34.1

