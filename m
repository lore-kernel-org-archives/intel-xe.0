Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C50CC02192
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 09:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B9A10EA87;
	Fri,  7 Feb 2025 09:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZw+NXzB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A8A10EA81
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 09:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738920236; x=1770456236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ig+OZ1emW+ikmL2jV4nd+ebDoAtO6Pdu+uyk1BS3g2s=;
 b=HZw+NXzBfuTcvNoWsRV+bHauPEqrnh0qEwC8Tz9Jk8AYNsIAGKMrpenb
 mDcpKLw1gx5f4KPxnB4iZv8yvMDA75WBSmqDnxx2tuSWH3VO19WJ5/ITc
 MZ1v6vDetPuBTE0sHwM8jKxBJnzqchGJf3OxUriXhIvVThYqokprM0Bs9
 R91wTBWKzjN5JWKKcYC/pXdKtHxj5s0PsOvd7yGJuVXioUaUk5EUZdVk5
 y39LIxj7CAnr5ed2vfXUkkY+IWQG769KlC0shP0VKVl2II+17+uuen/CX
 gXu3zMhBvBK51QZmmRjrAZv90hivF+K1ERneGEIM+q3X6uMGonq6sfGTq g==;
X-CSE-ConnectionGUID: GYaTX9JwRSOqIKLvTPk8Hg==
X-CSE-MsgGUID: KAMCaT5GSaiMsWTMZKju9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39686324"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="39686324"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 01:23:56 -0800
X-CSE-ConnectionGUID: oW2Th7MnTSyf1TdPXyA3Jg==
X-CSE-MsgGUID: 6oKMrHEUSMqdWeDzXjf4ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="111995243"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa010.fm.intel.com with ESMTP; 07 Feb 2025 01:23:54 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH 2/2] drm/xe: Introduce fault injection for guc CTB send/recv
Date: Fri,  7 Feb 2025 15:09:16 +0530
Message-Id: <20250207093916.20509-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250207093916.20509-1-satyanarayana.k.v.p@intel.com>
References: <20250207093916.20509-1-satyanarayana.k.v.p@intel.com>
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
index 72ad576fc18e..5a020fea997f 100644
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

