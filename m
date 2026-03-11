Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC0D103E2E6
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 21:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1FE10E0E3;
	Wed, 11 Mar 2026 21:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cpd45hNs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3834F10E0E3
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 21:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773262871; x=1804798871;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GVuSx/vvfMF0B9wxkf7RTSGarHNIAe8cwfRKHAnprm8=;
 b=Cpd45hNs1pGNqczm0EQixHTDg66osozCHV+mwNdufLQXvxnAU2LKpfcV
 7N4gQ04W+brMrsykOxIpQTkvnJ+vPv6+471+nSOvZ0oT65Ex66z5BKdnC
 p3U9jMnulHwvEJQlzYgAkP/hkOGenk1/7ECnYxQ7+idlmqbg364WC1nk2
 Na8Fw6m2ROBrlpXd/JTFOfeATfwYjG5TW88QN5l66GW3lR1TvcrV1RLYS
 N4RnhsalVJK78WbMaYmyEAh/twmTiht/KwzbzhUxmJvqP+WZlLpFGcAJL
 TJwy9aBsBtI22fA+Fqx1EHMeatXhvxG+HOz8z8JgOYVh5ewgOQcRlHAcO Q==;
X-CSE-ConnectionGUID: ZmjYEyOES7KW7jwrHFgLDA==
X-CSE-MsgGUID: vY5sx0ZpQ52QuGDhD9v2Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85048452"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="85048452"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 14:01:10 -0700
X-CSE-ConnectionGUID: CX07bejVTyCV5fCCqu3zaQ==
X-CSE-MsgGUID: r9leoTMjTD6afwdrbWuOvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="219849783"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 14:01:10 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH] drm/xe/oa: Allow reading after disabling OA stream
Date: Wed, 11 Mar 2026 14:01:07 -0700
Message-ID: <20260311210107.3112353-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

Some OA data might be present in the OA buffer when OA stream is
disabled. Allow UMD's to retrieve this data, so that all data till the
point when OA stream is disabled can be retrieved.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 72fc4424017bf..f840827960eab 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -543,8 +543,7 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
 	size_t offset = 0;
 	int ret;
 
-	/* Can't read from disabled streams */
-	if (!stream->enabled || !stream->sample)
+	if (!stream->sample)
 		return -EINVAL;
 
 	if (!(file->f_flags & O_NONBLOCK)) {
-- 
2.48.1

