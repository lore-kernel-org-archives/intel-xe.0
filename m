Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B45FC19776
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 22:56:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436DA10E9F5;
	Wed, 26 Feb 2025 22:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OcrktRIN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D76610E0A0;
 Wed, 26 Feb 2025 22:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740610559; x=1772146559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kdx43vBPxQuJgAnPefatV3H8gKQrTpuV5MOzEF/ZEe8=;
 b=OcrktRINKDZS7Xo53QQtgAceMaP9Q1X2R5D1TPqJaX4PAItgdw6NV58d
 ZL+ootVcmm2fMO8P7349COjxMoQapPWSd0Q2fTHleU3fMP8k50VlsEb9p
 QL/jroXjaDVfVuIqsafeOYFGvG7cVJ9yrhKNm3VDZw7xfTc+X+rg7JOHX
 a1pkW94tOspdySUFKm+PgVEh5BRuTDmo7Qt5HGjTjWnH5LCmw72pAvgkW
 m4phfpenJRHRet46cj9cV/4QD9K5AC4Cv+HjJddMrjMHwjSd1TeyZJbKh
 97P/BnLjoPEf26M3+BDN2IJ/KIrejiryPuaoNlnVeyUJehSflSNT9RMsu A==;
X-CSE-ConnectionGUID: 3jo/C26ITm2wdvigbpZySQ==
X-CSE-MsgGUID: R3h0h6pMT+iDoLTx8OtFmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="44308774"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="44308774"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 14:55:58 -0800
X-CSE-ConnectionGUID: /MHf7KCRQmW8kBBfRDB3Aw==
X-CSE-MsgGUID: HFXa9Di7Sb2w4CJZkSPSpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="117326770"
Received: from dut4025lnl.fm.intel.com ([10.105.10.92])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 14:55:58 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm/xe/xe_exec_queue: Add ID param to exec queue struct
Date: Wed, 26 Feb 2025 22:55:52 +0000
Message-ID: <20250226225557.133076-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226225557.133076-1-jonathan.cavitt@intel.com>
References: <20250226225557.133076-1-jonathan.cavitt@intel.com>
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

Add the exec queue id to the exec queue struct.  This is useful for
performing a reverse lookup into the xef->exec_queue xarray.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 23a9f519ce1c..4a98a5d0e405 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -709,6 +709,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (err)
 		goto kill_exec_queue;
 
+	q->id = id;
 	args->exec_queue_id = id;
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 6eb7ff091534..088d838218e9 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -55,6 +55,8 @@ struct xe_exec_queue {
 	struct xe_vm *vm;
 	/** @class: class of this exec queue */
 	enum xe_engine_class class;
+	/** @id: exec queue ID as reported during create ioctl */
+	u32 id;
 	/**
 	 * @logical_mask: logical mask of where job submitted to exec queue can run
 	 */
-- 
2.43.0

