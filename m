Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE626C7EE2E
	for <intel-xe@archiver.kernel.org>; Tue, 28 Feb 2023 10:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC19010E687;
	Tue, 28 Feb 2023 10:42:04 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C083610E68C
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Feb 2023 10:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677580922; x=1709116922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RXWeUEjt7SR0/YR9DgGvokmgx1rbFoWPVb+yBnvu5U8=;
 b=WAz2n+BFlsPhdWv49+Qjlcy7zqTM9zejMn539XxAvXUZ/sCJWCs7kndb
 zDXgnV3jQfWCa6iLpgi9AAB2QboX03pOiwYOtxHnwuikANK3v8Yr0XgCk
 zjKL/Beg3tqLDe4UUYZUVBQQ7vM2oNHJQDLa0uP1bh4tIQsG6EDu+Q+Jz
 gOBw+wmKzYN5SY7scUPAj9LlysS2WZP19S+Tk6qn78vSWAWW+awTcg/N3
 ACHa6qD0nKChElFpuofL/g0UtTVaOZuQt8bgrsf1jpQJMlpmMIyDMqeXY
 KdZOUZ3f5GyDcYgK0ruwvVpgFmvy+SuSbMvxJeC54M/BNePxL7LzE8B7P A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="398884688"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="398884688"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 02:42:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="738108956"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="738108956"
Received: from mistoan-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.9.93])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 02:42:01 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Feb 2023 10:41:27 +0000
Message-Id: <20230228104137.80965-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104137.80965-1-matthew.auld@intel.com>
References: <20230228104137.80965-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 04/14] drm/xe/bo: explicitly reject zero sized
 BO
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In the depths of ttm, when allocating the vma node this should result in
-ENOSPC it seems. However we should probably rather reject as part of
our own ioctl sanity checking (and return or more sensible error), and
then treat as programmer error in the lower levels.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index da6df74e71b9..2bfd3f6f2e9a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -961,6 +961,9 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	/* Only kernel objects should set GT */
 	XE_BUG_ON(gt && type != ttm_bo_type_kernel);
 
+	if (XE_WARN_ON(!size))
+		return ERR_PTR(-EINVAL);
+
 	if (!bo) {
 		bo = xe_bo_alloc();
 		if (IS_ERR(bo))
@@ -1515,6 +1518,9 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_ERR(xe, args->handle))
 		return -EINVAL;
 
+	if (XE_IOCTL_ERR(xe, !args->size))
+		return -EINVAL;
+
 	if (XE_IOCTL_ERR(xe, args->size > SIZE_MAX))
 		return -EINVAL;
 
-- 
2.39.2

