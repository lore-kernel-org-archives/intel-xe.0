Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823CED0D786
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 12:39:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4227710EAD6;
	Fri, 11 Oct 2024 12:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPxpz2wd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7B210EAD6
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 12:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728650363; x=1760186363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=alHwx7mmO0joOceqanuMKEODFlpZ7+5rO5ZW+razv7Q=;
 b=GPxpz2wdNisM2zRMYtEOPFLsZbNKssPWmaK9ZhmhczKu6roW3DLz/zr0
 RBbrIOHV6XzCuKjpynDB/RVVnB623kA8dkp8rDmRrFaE1IteQy5PpLATN
 TBjftAEcQCkFPnEKIBvDHcMQGa/PTae3XI0Z1Pj8O3QVXGwgGpp3snsOc
 hEHgDAOS6V/HmE0A6/yqn5sNXte+aWD0vjewGva6b6Z93n5vUKL80OgrK
 +IqJV88LjDjFPF4pph3rReaHqYFrZYS3naKiNoXH4pZgLNiY6slLGwcza
 Z30geD9WGRyTln5+Uy1yFMDjiu4qE3ID0UFWXr6ThoKIyS5DNvAfSjyfF A==;
X-CSE-ConnectionGUID: KrpK7YK/RQCXzp0MnSVQTA==
X-CSE-MsgGUID: gA25vGegQfevV5Q+AyrTyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="50589556"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="50589556"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 05:39:23 -0700
X-CSE-ConnectionGUID: 2p9IGwcFQAGhYWTS3IG74w==
X-CSE-MsgGUID: IyXIG1BSRjSLOxYgpvNQcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="80911077"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 05:39:22 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] drm/xe/ufence: Warn if mmget_not_zero() fails
Date: Fri, 11 Oct 2024 13:57:15 +0200
Message-ID: <20241011115715.3486872-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241011115715.3486872-1-nirmoy.das@intel.com>
References: <20241011115715.3486872-1-nirmoy.das@intel.com>
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
---
 drivers/gpu/drm/xe/xe_sync.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 6a2e4dd41d56..41758f528d7c 100644
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

