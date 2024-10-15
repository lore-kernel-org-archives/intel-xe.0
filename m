Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EA0CFC27F
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 09:48:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A6310E55B;
	Tue, 15 Oct 2024 09:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXbEqah/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80B710E092
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 09:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728985679; x=1760521679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Uenwm3pZIpRxTypodU6j4tEVC8IHJWExsC28kPLcUHs=;
 b=HXbEqah/Ay9ZJlLMKgrfmtlEndIvjNZxVvxcNgtwLCrVo0qvnatrvyW1
 Mz2rt0JNE8CF1Zt7b8PzcN0saFUxWent5owbXSaZJ7rsVy6dn5NKV1uZU
 855zsSNOGlD0NCeLgGqC6gfIkwDRS2Wy2vws01T7UZL4JGpDWkwmN5k9i
 c2AAl2Kc+Hzq3RmUmdzGyTIC1aXgpeyDYnOQHTRkiptbLhZqnt8VtE8Ok
 ENLUpTj/utP6CKn39lZckXv9YM8P0s9ESbEzYGFsxq/BjukC1CrL0GTzh
 4eW7zUhVkxKus/lDTtbXpbn3GDXBzOJ6gZvLYbKPeta0ceslbUU2CZBgw w==;
X-CSE-ConnectionGUID: nz1L0hTTQDqlm6+Xzw3fBw==
X-CSE-MsgGUID: J8zVjM91SCexIuPSBpf3oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27850222"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; d="scan'208";a="27850222"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 02:47:58 -0700
X-CSE-ConnectionGUID: xg7TbPJESjOlaU5coBlP9Q==
X-CSE-MsgGUID: 8x3Nm1jGQEGb2Tvr82twcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; d="scan'208";a="82888586"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 02:47:57 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH 2/2] drm/xe/ufence: Warn if mmget_not_zero() fails
Date: Tue, 15 Oct 2024 11:05:46 +0200
Message-ID: <20241015090546.3082719-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241015090546.3082719-1-nirmoy.das@intel.com>
References: <20241015090546.3082719-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

This shouldn't happen but seen this while debugging ufence timeout
issue time to time so log it to isolate this particular case.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 2e72c06fd40d..22f72df36ab2 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -83,6 +83,8 @@ static void user_fence_worker(struct work_struct *w)
 			XE_WARN_ON("Copy to user failed");
 		kthread_unuse_mm(ufence->mm);
 		mmput(ufence->mm);
+	} else {
+		XE_WARN_ON("mmget_not_zero() failed");
 	}
 
 	wake_up_all(&ufence->xe->ufence_wq);
-- 
2.46.0

