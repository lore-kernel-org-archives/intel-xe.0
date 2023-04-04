Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924A8C76188
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 01:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFF310E2BE;
	Tue,  4 Apr 2023 01:42:32 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C50010E2A8
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Apr 2023 01:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680572551; x=1712108551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aY/uu5mYmmcvSeTMw/oBdB7UZoL45qbGM9nYWxNT/Fs=;
 b=E/n8nbsISFtnFFSegA87AY67eB6qTTkqBkI6uYCe8gV3PvRXLEyb6y3H
 6uUCxhu8fVYeDOjtBLZEfkJCmEs5H6vw2xmO/Mxtom+wIzS2VdFP//pED
 tlTsS1jEKzm2ayeixXhYdqozDzP3Kshy70IscienDJ9rXzYbkwjuJxkoG
 oPq82WLIPILknIDrcjk/bpCC0JB/HoYvMn3nH+9xqTZTozl+kH5kDM5LM
 lIgYk/5S7W1lR0VM2HktxB/J/bRViuGOgxHuAQ770RSTYSdK/zLO9xRoF
 5tGmRodScAEhqYsXPTACP9OMmeySa4t9q5Bjj5Y2US7hs83nzPs/pV+OS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="322456419"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="322456419"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 18:42:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="755470824"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="755470824"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 18:42:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  3 Apr 2023 18:42:22 -0700
Message-Id: <20230404014228.3738347-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404014228.3738347-1-matthew.brost@intel.com>
References: <20230404014228.3738347-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 2/8] maple_tree: Export mas_preallocate
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

The DRM GPUVA implementation needs this function.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/maple_tree.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 9e2735cbc2b4..ae37a167e25d 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -5726,6 +5726,7 @@ int mas_preallocate(struct ma_state *mas, gfp_t gfp)
 	mas_reset(mas);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(mas_preallocate);
 
 /*
  * mas_destroy() - destroy a maple state.
-- 
2.34.1

