Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F37EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 09:55:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6311C10E05A;
	Fri, 16 Jun 2023 09:55:41 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757D110E58F
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 09:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686909339; x=1718445339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ddn251F+TAp9VNTCGQgoiiV35vulF1AOFUnOGQtUYm4=;
 b=StABT8oKEAc/ZnkFmoNNePuo/Nntc/IXJHnh9pkfXkekPXPKUhRwPK+j
 XK3G9lAc5OyDQKdDIt5luvKKnjhFQbjiqRSokHCJye/M8aiRq7Dd2ZXw9
 EAF7wjR35d0OXmlq14W7s5shRAn03enmCItbhv2fxAahWPJHK1a5WCYvT
 hpQtrJkmmnXowbCKCyu6DZkesltphU/odkXGzOHRV/OeihdLGgtBTJZDV
 3GBLf/ASQ7WHXcN0lbQ52Uw8k/MIntew+6vA21PkV4fX5Og9n+USPtUhN
 058j5E3NJl0uTwn5UvPjN1Tx6vJvf0ZqzJEejdyrvVZZmrStHYV/ljQHs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="343916554"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="343916554"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 02:55:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="959557805"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="959557805"
Received: from nurha65x-mobl2.gar.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.148])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 02:55:37 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 16 Jun 2023 11:54:59 +0200
Message-Id: <20230616095504.17084-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
References: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/6] drm/xe/bo: Don't limit the TT manager to
 half of system memory
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

TTM enforces this limit a page-allocation time, swapping out TT memory
if needed.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index 3e1fa0c832ca..961bbc29dcdf 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -106,8 +106,6 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
 
 	si_meminfo(&si);
 	gtt_size = (u64)si.totalram * si.mem_unit;
-	/* TTM limits allocation of all TTM devices by 50% of system memory */
-	gtt_size /= 2;
 
 	man->use_tt = true;
 	man->func = &xe_ttm_sys_mgr_func;
-- 
2.40.1

