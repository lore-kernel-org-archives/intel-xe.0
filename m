Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1987BE77184
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 06:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFD210E291;
	Thu, 19 Dec 2024 06:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aI1JsXs5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D543310E291
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 06:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734590174; x=1766126174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qfg3Z2Uu15UCddhIi/4U2VuNKfb3x1yllpBsUQSXLac=;
 b=aI1JsXs5frMTml60B+ughIfQzI1uJ+dRGSS8KOXxqgX2N5Pn9fgAtNGp
 Yx//xAviALXbi3E96sAwom5iT9H3Rc3IhF715CgpYqOX2e3Ekgmpdu/3y
 ToaVRgx24uN3IDFjJGgKAY++PM0jW8IjN6WvcU86Fp4rFcw/ZbpOoefro
 JV5RnpR+DsCX0+JBfz6StpkxZXIaEN0ToUzRHeGCd53H7aDADzMgaKpXi
 XqJxh1eONmSp98k3pItl0+U+IlGoQ3sA9os8/81cvjPz0TfTdt4RAC9wk
 sZaavCnVZpf3RAD64ty628lFU6dzFl1WPYoFKbmMD+TKYGzPBSJMhtOa8 A==;
X-CSE-ConnectionGUID: XW8XMJAZSTGi1n7gY7xpZw==
X-CSE-MsgGUID: yb186v/RSYy5G15D8kpmjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34412906"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="34412906"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 22:36:07 -0800
X-CSE-ConnectionGUID: cervVpY4TWmEEkk2uRkW9Q==
X-CSE-MsgGUID: 4nmkcwJgQf2lKXUYAPs+QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="97935992"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa007.fm.intel.com with ESMTP; 18 Dec 2024 22:36:06 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH 2/2] drm/xe: Introduce fault injection for guc CTB send/recv
Date: Thu, 19 Dec 2024 12:19:32 +0530
Message-Id: <20241219064932.25145-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20241219064932.25145-1-satyanarayana.k.v.p@intel.com>
References: <20241219064932.25145-1-satyanarayana.k.v.p@intel.com>
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
FAILFUNC=xe_guc_ct_send_recv

echo > /sys/kernel/debug/$FAILTYPE/inject
echo $FAILFUNC > /sys/kernel/debug/$FAILTYPE/inject
printf %#x -19 > /sys/kernel/debug/$FAILTYPE/$FAILFUNC/retval

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
 drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 7d33f3a11e61..d9cf83e74e2f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1088,6 +1088,7 @@ int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	KUNIT_STATIC_STUB_REDIRECT(xe_guc_ct_send_recv, ct, action, len, response_buffer);
 	return guc_ct_send_recv(ct, action, len, response_buffer, false);
 }
+ALLOW_ERROR_INJECTION(xe_guc_ct_send_recv, ERRNO);
 
 int xe_guc_ct_send_recv_no_fail(struct xe_guc_ct *ct, const u32 *action,
 				u32 len, u32 *response_buffer)
-- 
2.35.3

