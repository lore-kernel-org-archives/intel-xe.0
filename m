Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E079AC7EE2D
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 00:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA7210E47E;
	Tue,  2 May 2023 00:17:31 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8521F10E34B
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 00:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682986649; x=1714522649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aY/uu5mYmmcvSeTMw/oBdB7UZoL45qbGM9nYWxNT/Fs=;
 b=njmYSluOkTgcQw61as40G4d7MnFcO/PSl54cQN3BhwlV9k9jN+b0o17h
 jwGHUjIzisYZiwuhULsAkql3ZQazOl48W5NUR8h9xbQZM7LyN3CQElsB9
 j0lZMx5afFiMsASOQrPOh9bQ/aI+HqqX+HGgDVNe0rpeSu778NnAAAjQH
 A0sNKOPBGSqnD2bExfucehtCuZVEL5U3TYkV3gDMOKokLwIlEEC8/tl4F
 qL6tBbUUC56KeJDhf3SvLpPnVXRktEfd9ngqQZQRzeGDh4z5tRvrDcuLA
 d2MhhwqRR2q0YImB/l7A9K1vfQ8W1XIJa7ZOp3qn+i+uwtAJE1LByHt6V Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="332619576"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="332619576"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="765541702"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="765541702"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 17:17:10 -0700
Message-Id: <20230502001727.3211096-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502001727.3211096-1-matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 14/31] maple_tree: Export mas_preallocate
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

