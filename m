Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB80CCD0422
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 23:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E65E10E43F;
	Mon,  5 Jan 2026 23:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRwzk1cs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E35710E43F
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 23:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767656035; x=1799192035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XIUi1AdkrRALWLSQKLozvck8Q4n/Ps4ZzdRwJqlRpVY=;
 b=SRwzk1cstE5P75CyQZY4Z9pmoPlLJFarysDAGifXlJxPz3Ef2/0ZJOWn
 OectVKtTdh5TIXfmlGItQLxBrHcsPLKk4EG8HtuQHswWoo17vZlVVQdGG
 nvEdix6A7RhDB8BRyEX3khVerrTLNqBkEoZaI4uyLeLMQYmrpaZeK8dHp
 aOVns9nMd+Q2Nz0k/TDBKAYvd8hlpTPt48lg70WnVHEdQy+b1dXRLYH5J
 D3Ndsjr7txFaUCQwuVofGb1eQpY0eTl76IdY6fRChay2Fk8DoCksMGolh
 QD6xRlEXHcm9pwDNs3VVSXxZsXGsJUWP/yru3wOQO1R3hFJjFE4ENgwH5 A==;
X-CSE-ConnectionGUID: PaMoEsrDQ4K9VNYGSRUR4A==
X-CSE-MsgGUID: U9UC+pPQR6aBY5GEWH/LwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69066959"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69066959"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 15:33:55 -0800
X-CSE-ConnectionGUID: J6GNZ2cdQSy6rGNIooVlOg==
X-CSE-MsgGUID: bEyK0b6lQyeNJQSkutwVVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="233199124"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa002.jf.intel.com with ESMTP; 05 Jan 2026 15:33:55 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH 1/4] drm/xe: Remove debug comment in page reclaim
Date: Tue,  6 Jan 2026 07:33:53 +0800
Message-ID: <20260105233351.3753716-7-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105233351.3753716-6-brian3.nguyen@intel.com>
References: <20260105233351.3753716-6-brian3.nguyen@intel.com>
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

Drop debug comment erronenously added in patch commit.

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
---
 drivers/gpu/drm/xe/xe_page_reclaim.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
index fd8c33761127..94d4608ebd74 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.c
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
@@ -108,7 +108,6 @@ void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl)
  */
 void xe_page_reclaim_list_init(struct xe_page_reclaim_list *prl)
 {
-	// xe_page_reclaim_list_invalidate(prl);
 	prl->entries = NULL;
 	prl->num_entries = 0;
 }
-- 
2.52.0

