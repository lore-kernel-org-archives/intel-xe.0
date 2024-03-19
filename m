Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F06C54E71
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 17:49:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7589310FC2F;
	Tue, 19 Mar 2024 17:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IbK3M7YA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8EF10FC2D
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 17:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710870566; x=1742406566;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1P7UxPyvgtDTcdwX2P+k3xor4OBJHO2HelCdd3Pysxg=;
 b=IbK3M7YAN45twbSX31E0jlEoGAX3Pp4dYVTu5jqtg1AyEymOUlvXeQMm
 NQzyXww+XV1mYVEJiQm0VWiNI4yfxaUEzH//mBYMJMtVa6ZWxX9fH2T3h
 Uxt9lADJQ/cLino0QfQYKsx6VX3Iu9AyyvfxI5gU072alvbOPKHNeGSID
 CINmki0JCpnhKs1lhEjznh+ely9SEnTtsOVjbg9L0t6z63KY8yPGgolVi
 L7V/aBnUAjPGAO0Lvs2speeESoMvdfKwxjsUQZMbP7+jfjkq3ciISNR+7
 Lgub+4ZT2eFFnVXsZwOAgmhtzi1vWB1fPSaxuS/sGiMXXNiWW98QEVWsR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="17211224"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="17211224"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 10:49:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="13886339"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 10:49:25 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
	stuart.summers@intel.com
Subject: [PATCH] drm/xe: Use correct function pointer type
Date: Tue, 19 Mar 2024 10:49:19 -0700
Message-ID: <20240319174919.1847-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

Use xe_exec_queue_user_extension_fn type for
exec_queue_user_extension_funcs.`

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 2016c1af9633..dd10188e8f4d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -388,7 +388,7 @@ typedef int (*xe_exec_queue_user_extension_fn)(struct xe_device *xe,
 					       struct xe_exec_queue *q,
 					       u64 extension);
 
-static const xe_exec_queue_set_property_fn exec_queue_user_extension_funcs[] = {
+static const xe_exec_queue_user_extension_fn exec_queue_user_extension_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = exec_queue_user_ext_set_property,
 };
 
-- 
2.43.0

