Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBFAC3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 20:21:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DED10E3FC;
	Mon,  8 Jul 2024 20:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JIP0GaXp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAD810E408
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 20:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720470070; x=1752006070;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NOCv2bTXS1hnV/JoN5+fpPG7Fyo5s5el6lguvfx7sSc=;
 b=JIP0GaXpaRKko8pueOzRGkpAxjPydLlrrOB1Yg+YgxfYO9CrU7JS5q/6
 J+X6oLT73mGbtFHSfBhWUxy3suh3C9eCbrFkkAG+Asp6HpOvZI3GRaE8G
 AUJfmeWDSu34lNM5s//Qea9VEPvpfcgS2/MkF4yaVYabOMYwfR0w9FIub
 g/B/1lR3pX8GxuA/FFF+yEC9aezuM8Aq74479XJa7jhMp67JVYT3TNwh3
 1GmJoPJYPOEt5FSazrfU8pezsb9P0ZnGEZE6FB+oYh+QZ3ElGEZgUx48j
 9FbIkvzfFlu5TKNbRgb+wUUcX2tbJm26NM7Ang0G/DI+nVUkM1tXJDKho w==;
X-CSE-ConnectionGUID: n/rQifa+TPKusYulJyiLYw==
X-CSE-MsgGUID: Y0YNu9PuQiGyfGkkjWch6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="43114141"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="43114141"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 13:21:08 -0700
X-CSE-ConnectionGUID: YuS/teTkSLm9USPQ5N4JJA==
X-CSE-MsgGUID: EjPJHaDLQ4ynWr8YVTenvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="47495002"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 13:21:08 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 lucas.demarchi@intel.com
Subject: [PATCH 3/5] drm/xe: Take a reference to xe file when user creates
 exec_queue
Date: Mon,  8 Jul 2024 13:21:01 -0700
Message-Id: <20240708202103.3347869-4-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
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

Take a reference to xe file object when user creates an exec queue so
that the xe file object is available for the lifetime of the queue.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 6 ++++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 0ba37835849b..b01eccdd75ba 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -37,6 +37,10 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
 {
 	if (q->vm)
 		xe_vm_put(q->vm);
+
+	if (q->xef)
+		xe_file_put(q->xef);
+
 	kfree(q);
 }
 
@@ -640,6 +644,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			if (XE_IOCTL_DBG(xe, err))
 				goto put_exec_queue;
 		}
+
+		q->xef = xe_file_get(xef);
 	}
 
 	mutex_lock(&xef->exec_queue.lock);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index ded9f9396429..f768e48f31e4 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -38,6 +38,9 @@ enum xe_exec_queue_priority {
  * a kernel object.
  */
 struct xe_exec_queue {
+	/** @xef: Back pointer to xe file is this is user created exec queue */
+	struct xe_file *xef;
+
 	/** @gt: graphics tile this exec queue can submit to */
 	struct xe_gt *gt;
 	/**
-- 
2.38.1

