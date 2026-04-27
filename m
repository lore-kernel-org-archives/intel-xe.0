Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D59FF8861
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 10:35:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FB110E693;
	Mon, 27 Apr 2026 10:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X/tB59pd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B5710E693
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 10:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777286156; x=1808822156;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V8Omf1BCEwp9Lq315j6KjBJnKwAXB6E/0iqdcrGrfJE=;
 b=X/tB59pd6somKIU5oWu62jzADG9R1MhM6nMaiNzamEF0nEzV7jyJLume
 3Zju1ln7oBSmkDpWeScyeDmc5Xm6ouCgmdiBlQJWrfJWVcxeP5s5ZRbBj
 x44BG6EMLYPmTP3+FgqL6XsxBUQyzXP4aB2UOChsk8EuDb8+dR5tqqbMo
 hJmU89D09pIYB+k4aGtaXZDGzuvFnUpDF9A7xMmqyZpxS6h6XNHHN5Uqf
 YCiw0oRzysLOU/T7Q8y61RxAHnCaP4tNhULInsmP6jZsWUYdKhdvrAoJO
 IMwCKQz8/sDAARmD3BLaV6e167PapvqKTv3uZwTIr4EVwwuFI5B4IatAD A==;
X-CSE-ConnectionGUID: X6zf72LqTm6tQ7YNZGuzmw==
X-CSE-MsgGUID: qYRxSXJ1QQOevFEhBi2gog==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="100826037"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="100826037"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 03:35:55 -0700
X-CSE-ConnectionGUID: x0J3iKZQS0Kd9ijvLEpTBg==
X-CSE-MsgGUID: haAKQJ1ZSueUDO0iE/PuBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="264017003"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.36])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 03:35:52 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>,
 Qi Zheng <zhengqi.arch@bytedance.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 Brian Geffon <bgeffon@google.com>, Steven Barrett <steven@liquorix.net>,
 Oleksandr Natalenko <oleksandr@natalenko.name>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] Fix halted scanning of swap-cache folios
Date: Mon, 27 Apr 2026 12:35:31 +0200
Message-ID: <20260427103532.5623-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

While experimenting with an interface for inserting isolated dirty
GPU folios directly into the swap-cache for backup, I noticed that
when the number of swap entries were almost exhausted, scanning
and freeing of these pages already inserted into the swapc-cache
stopped.

Apparently there are guards that stop LRU scanning of anonymous
pages when the number of free swap entries are low. However that
also blocks pages already present in the swap cache from being
scanned and freed.

Not sure whether that is intentional, but anyway I'm sending
a patch that implements one (crude) way of fixing the problem.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Axel Rasmussen <axelrasmussen@google.com>
Cc: Yuanchu Xie <yuanchu@google.com>
Cc: Wei Xu <weixugc@google.com>
Cc: Brian Geffon <bgeffon@google.com>
Cc: Steven Barrett <steven@liquorix.net>
Cc: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org

Thomas Hellström (1):
  mm: vmscan: keep anon scanning enabled when swapcache folios are
    present

 mm/vmscan.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

-- 
2.53.0

