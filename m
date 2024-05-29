Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B10C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 18:33:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D55810FB59;
	Wed, 29 May 2024 18:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FhQt6GEQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DAE10F5D7
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 18:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717007605; x=1748543605;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YHTUWsDVGpc3eoZjk4JBUk/53mAA2wbeyCtAK80hvHA=;
 b=FhQt6GEQwsPiTt5+SU64v4KCY04fwHNkd0yoY46Epe8huVviMGB//kZX
 GKO6VzYbDyUQmpn8zEc6OnlsxQvqaYWgygU77APPZrVuaNc8dKrXxdjbC
 C4lsfKzW24Nl02pJegqNRWCREHibn06VqwFpeW3ZVmOHjoC1F4w1LwFIJ
 lUyhCKLmFUqnOQcGLntfo2cDIll3vKKNr2/CrP6CUObZdBuI6cELoxhs/
 fLsbVrdCSx/ouSFoDgx+Y16B3zOhs+Il6nlJjzbV9nbFmHjxcgeChj8YV
 p14mCnW+K2h84nyH9D0CP7A/ZRW6vGuRi3oAAJOyFVShJLk4Ws4wD7Yzj A==;
X-CSE-ConnectionGUID: /7jV4XHNTV2AmkSxe4E/qw==
X-CSE-MsgGUID: v8ekdloJQIqF5dYUzLmy9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="16384378"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="16384378"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 11:33:25 -0700
X-CSE-ConnectionGUID: dIGph2MTQquRwiSqAnflrQ==
X-CSE-MsgGUID: J8UbPQfmT+m4wnKIcp9Rvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="66401451"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 11:33:24 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v2] drm/xe: Remove unwanted mutex locking
Date: Wed, 29 May 2024 11:33:19 -0700
Message-ID: <20240529183319.19731-1-niranjana.vishwanathapura@intel.com>
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

Do not hold xef->exec_queue.lock mutex while parsing the xarray
xef->exec_queue.xa in xe_file_close() as it is not needed and
will cause an unwanted dependency between this lock and the vm->lock.

This lock protects the exec queue lookup and reference taking which
doesn't apply to this code path. When FD is closing, IOCTLs presumably
can't be modifying the xarray.

v2: Update commit text

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f04b11e45c2d..4cca16f2d4ed 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -96,12 +96,11 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	struct xe_exec_queue *q;
 	unsigned long idx;
 
-	mutex_lock(&xef->exec_queue.lock);
+	/* No locking needed here */
 	xa_for_each(&xef->exec_queue.xa, idx, q) {
 		xe_exec_queue_kill(q);
 		xe_exec_queue_put(q);
 	}
-	mutex_unlock(&xef->exec_queue.lock);
 	xa_destroy(&xef->exec_queue.xa);
 	mutex_destroy(&xef->exec_queue.lock);
 	mutex_lock(&xef->vm.lock);
-- 
2.43.0

