Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E6FC369A1
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 07:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDA710E7AC;
	Wed, 25 Sep 2024 07:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0f1pz1K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9E410E7A9
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 07:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727248483; x=1758784483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q81qC6r7AaXclO8Ri+YnWvqv/kHO2AsGZ7GZO+dymyU=;
 b=L0f1pz1Kv8O4USGgaxeoE+dEz3iH9Q9xDN+PTIjL4CwxbFWbQp/ZPmci
 J8kAMUy1Dz9b1H2m/6omNeLlGPQmHqwVIiUHfjazlZJEiGdmL0FF5Xg8q
 n0dXpjWoLB/Axw7ur/LX1pH7/sJ2mPJA/nMVsay5MSZDBFyuyqMwdRzPo
 F1SeEOPZYMw07yPZjDrjVEFjq+7ko/s+eeM3U76YVGEAxk99jnrmD+sKM
 uQv2gGlSESfQXgBJf7gI38RgGqea1/93iRaneYRNFm2b4IOE1bUixjYvu
 khfEYQfQYyI0H3rbCb+8O/fnbulV5DuXx6QNIL+dAOoTZ29qAl3PhbE80 A==;
X-CSE-ConnectionGUID: LuhggK1qRWiSdcjEr+SLUA==
X-CSE-MsgGUID: +Tj5Mm7dSB6W8rNIhidAEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="43799269"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="43799269"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 00:14:43 -0700
X-CSE-ConnectionGUID: 69o3S+GmRQW66eUH0Sf4dg==
X-CSE-MsgGUID: tRJ4RzNrT2+5p85hRpOW8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="76185442"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.236])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 00:14:42 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 2/2] drm/xe/queue: move xa_alloc to prevent UAF
Date: Wed, 25 Sep 2024 08:14:28 +0100
Message-ID: <20240925071426.144015-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240925071426.144015-3-matthew.auld@intel.com>
References: <20240925071426.144015-3-matthew.auld@intel.com>
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

Evil user can guess the next id of the queue before the ioctl completes
and then call queue destroy ioctl to trigger UAF since create ioctl is
still referencing the same queue. Move the xa_alloc all the way to the end
to prevent this.

v2:
 - Rebase

Fixes: 2149ded63079 ("drm/xe: Fix use after free when client stats are captured")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 7743ebdcbf4b..d098d2dd1b2d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -635,12 +635,14 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
+	q->xef = xe_file_get(xef);
+
+	/* user id alloc must always be last in ioctl to prevent UAF */
 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
 	if (err)
 		goto kill_exec_queue;
 
 	args->exec_queue_id = id;
-	q->xef = xe_file_get(xef);
 
 	return 0;
 
-- 
2.46.1

