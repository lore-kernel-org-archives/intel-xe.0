Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F09E7718F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Dec 2024 11:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDE810E230;
	Mon, 30 Dec 2024 11:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ThNSIdxH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0325810E10A
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Dec 2024 11:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735558112; x=1767094112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yOwplO36G20GgT55C/IHzPVi76QjgRO8d7KA33zs3b0=;
 b=ThNSIdxHBphI36j5fFX1DYtTgT43MocUCSOnWfIxEt2P99ZpBKUrExCl
 U9jGzqtO8+HylwAETlcMM/4HumCP3qoRJmLDjSu0Xqmjs5R5kQkgJs9di
 x7Yman2I+qYJy9MEx49Gjh5ka94DLqfnWysCc1rlV96j7l40/lXvksyuZ
 69VuvqcOVHYklqRQTQsdW6LYXQW/0LJsdzLAEjcFHuihxm62FyDqwFvUk
 /iksSF9QEgpn3cWVrPkkmPz2jAnw7rNNNM5D+hpS41C05rw+VEPkBloHu
 9HF71ad4JyTPRMrWJCgyUHY+DsITY17j5HzpSSIzbj5ZUDSjtng9YeTJ5 A==;
X-CSE-ConnectionGUID: WiRkQI0+Swmro1Z/Wo2dQg==
X-CSE-MsgGUID: ZhzdNKkTQ8G2IoZ6oV/wlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="61215167"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; d="scan'208";a="61215167"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 03:28:32 -0800
X-CSE-ConnectionGUID: AmIiv3f9THKR/hxsjLyACw==
X-CSE-MsgGUID: VZND5BrrT0Wt/5ATw/lA6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100614427"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa010.jf.intel.com with ESMTP; 30 Dec 2024 03:28:31 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH 1/2] drm/xe: Introduce fault injection for guc mmio send/recv.
Date: Mon, 30 Dec 2024 17:13:46 +0530
Message-Id: <20241230114347.2534-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20241230114347.2534-1-satyanarayana.k.v.p@intel.com>
References: <20241230114347.2534-1-satyanarayana.k.v.p@intel.com>
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

Fault can be injected with below steps.

FAILTYPE=fail_function
FAILFUNC=xe_guc_mmio_send_recv

echo > /sys/kernel/debug/$FAILTYPE/inject
echo $FAILFUNC > /sys/kernel/debug/$FAILTYPE/inject
printf %#x -5 > /sys/kernel/debug/$FAILTYPE/$FAILFUNC/retval

echo N > /sys/kernel/debug/$FAILTYPE/task-filter
echo 10 > /sys/kernel/debug/$FAILTYPE/probability
echo 0 > /sys/kernel/debug/$FAILTYPE/interval
echo -1 > /sys/kernel/debug/$FAILTYPE/times
echo 0 > /sys/kernel/debug/$FAILTYPE/space
echo 1 > /sys/kernel/debug/$FAILTYPE/verbose

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 408365dfe4ee..f9d5c4932ae8 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1383,6 +1383,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	/* Use data from the GuC response as our return value */
 	return FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, header);
 }
+ALLOW_ERROR_INJECTION(xe_guc_mmio_send_recv, ERRNO);
 
 int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len)
 {
-- 
2.35.3

