Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA04DC001DC
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 07:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8835510E42F;
	Wed, 26 Jul 2023 07:43:12 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7F810E42F
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 07:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690357390; x=1721893390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=taAYlgrfwD3n9O4bkiI9p78YE/i22PoC5WVgn1ONoRo=;
 b=OUAsoiOLHI+QJE3hD72fV1XyCS1dNGbxecbZ4rf40aS3lCU17Czx80tU
 hTnUlIuTg5we/eIAfJSqTxSIVVfbh43CcgPyOoQFgMZ2hb161UxmwVJQE
 aaG8QEbsen9jV2sRRReJtanRpAXOoV+TRw7VYiBhbr+HIXA7En9+quuZ8
 GYqdGYF9EI14i54ri6485hShYdO5smZdYXit4nPXEqsTj6op+W2lpvYlU
 QRc06hjYHyzs4f1favq9QozcJ46+mFFAJ+UxeJOII9uaWbZOwx/1Txk9G
 IeSP8hupdexp0m3e33Pq8Ss1dP0D/PMSyVWMqIrToDz2/bieFTQSFMetD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="357946527"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="357946527"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 00:43:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="900314554"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="900314554"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 00:43:08 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jul 2023 09:43:00 +0200
Message-Id: <20230726074300.13066-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230726074300.13066-1-nirmoy.das@intel.com>
References: <20230726074300.13066-1-nirmoy.das@intel.com>
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
Cc: joonas.lahtinen@linux.intel.com, lucas.demarchi@intel.com,
 Nirmoy Das <nirmoy.das@intel.com>
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

