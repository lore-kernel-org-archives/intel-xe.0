Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D324DEB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 14:42:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B5910E214;
	Mon, 26 Jun 2023 14:42:46 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F1010E214
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 14:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687790565; x=1719326565;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fTZ8dxcz/QN2EWom6szdKNdR3agv51N8R5JWJ/jDlJs=;
 b=kiPZ6oxwJFIN88ZsfouqKt0AQM1FASJFjVviOyUPLao4ygLT3Oiv3SZh
 YbIdLl8gF2EUQqrfw0ePTRWXbccrXBBScHBIsaIV1HJqz7g1ffpKlhU7l
 rvGpMfskxX5zv495/gDuRQOFyjWjnxj0F67y3D+mB5DSXnrc93xwRSw9F
 fxyd0MxjnTwDQSmpyLnpPrRUePeOqMkf0jaJn6TrI3rpREPz+JjGjIuTj
 Gcl1bj9oJU7r/EjB98Qq+7v8/nSpHw3ObzV8cjmFJnDdMOF8vgYl5tubv
 ff/YT0Z4vVKxQEqOYMRhhkhfqtvV/p85zkN+XIR55wyqzH5tnQgQ245FR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="340875139"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="340875139"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 07:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="860717708"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="860717708"
Received: from ashlykov-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.0.92])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 07:42:43 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 16:42:39 +0200
Message-Id: <20230626144239.158345-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3] drm/xe/bo: Return object bo size on create
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

Driver may alter bo size requested by the user. Return real object
size to make userspace aware how to arrange vm bindings.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 71a14e1f25be..55dbb374a787 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1744,6 +1744,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		return err;
 
 	args->handle = handle;
+	args->size = bo->size;
 
 	return 0;
 }
-- 
2.34.1

