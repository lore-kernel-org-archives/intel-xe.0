Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9027CC001DC
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 14:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517F010E68F;
	Fri, 21 Jul 2023 14:08:02 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B346410E692
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 14:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689948480; x=1721484480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=taAYlgrfwD3n9O4bkiI9p78YE/i22PoC5WVgn1ONoRo=;
 b=BTki+kFeadU9SQVaw9Q37heKf3cEusUHz0fbpQAtmMzdogJLG9xCZuOn
 W4Yx2lI1u4CCYIu2e49UFDBV9+AtqbgN+PvbRxagcE4sO3umniw8nBrgf
 WC+T4ueoaWP/Vr5cuM/a1ZUNObq4eCdMT+750ZTspaKYhlfwDdm4UxOYx
 LXbGriQTGgp6EdCAz8lLaTYv+LeJakOHcgQGqwjsAt693KuT+jbmYblk0
 Z5W0edNO2HrdaAIkEisZwxNKoJTlHu+OsFkDtKT97XqdWwE2Ca7W7XkZ6
 SnwbQ8OY1mZDpFTa2w15jdcLqnyYruxgFx4UwaM/fPiybMIMqCai1qES8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="365923992"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="365923992"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 07:08:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="702061094"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="702061094"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 07:07:58 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Jul 2023 16:07:45 +0200
Message-Id: <20230721140745.16187-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230721140745.16187-1-nirmoy.das@intel.com>
References: <20230721140745.16187-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Enable device scope atomics with vm
 madvise
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
Cc: joonas.lahtinen@intel.com, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Set XE_VMA_ATOMIC_PTE_BIT if user hints about device
scoped atomics for a vma which will in turn set AE pte
bit if atomics supported by the HW on the vma.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index b4e661576d08..3a710a080e76 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -154,6 +154,7 @@ static int madvise_device_atomic(struct xe_device *xe, struct xe_vm *vm,
 		if (err)
 			return err;
 		bo->props.device_atomic = !!value;
+		vmas[i]->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 		xe_bo_unlock(bo, &ww);
 	}
 
-- 
2.39.0

