Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC830C369D3
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 19:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10CF10E9AE;
	Fri, 25 Apr 2025 19:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="JIChhbBM";
	dkim-atps=neutral
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id B449210E719;
 Thu, 24 Apr 2025 03:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=/qHdb
 A/SsKmSVbxALImyuT2U+gPSzBFsItLJqVnqFQg=; b=JIChhbBMKSrqIerR2Oeca
 jdo9HRpJJaxmUw9/1RAwwKy5G0POQdMWz70jyU8dxsxJHdedT8R4Zryoi8lHQ+Qn
 JRLjr2QBpwWMD8RgoGRFnaT7J8pHp8P+vI5I5jB/no+OJIT2MxAQKrigCTc3w+ZC
 A0Zk8PPOvNTAHTT2F0eyMk=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
 by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id
 _____wBXvlQBowlogHeXCA--.20626S4; 
 Thu, 24 Apr 2025 10:33:39 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch,
 badal.nilawar@intel.com, himal.prasad.ghimiray@intel.com,
 matthew.brost@intel.com
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Haoxiang Li <haoxiang_li2024@163.com>,
 stable@vger.kernel.org
Subject: [PATCH RESEND] drm/xe: Add check for alloc_ordered_workqueue()
Date: Thu, 24 Apr 2025 10:33:35 +0800
Message-Id: <20250424023335.3497842-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBXvlQBowlogHeXCA--.20626S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr18tr4kAr4DArWfGryUJrb_yoWfZFc_CF
 WxXrn7XFs8CF1qvF1SkrWfZFyayryrua97uF15K3s3try7WrW2v39Fvr98ZFyxXa17uFnr
 Z3W8W3ZIvwnrWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNyxRDUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbBkA05bmgJnX3o1QAAs2
X-Mailman-Approved-At: Fri, 25 Apr 2025 19:08:24 +0000
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

Add check for the return value of alloc_ordered_workqueue()
in xe_gt_alloc() to catch potential exception.

Fixes: e2d84e5b2205 ("drm/xe: Mark GT work queue with WQ_MEM_RECLAIM")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 10a9e3c72b36..1f50f26fb657 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -81,6 +81,8 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 	gt->tile = tile;
 	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq",
 						 WQ_MEM_RECLAIM);
+	if (!gt->ordered_wq)
+		return ERR_PTR(-ENOMEM);
 
 	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
 	if (err)
-- 
2.25.1

