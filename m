Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D9DC52D7B
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 16:24:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357A910E58C;
	Wed,  7 Aug 2024 16:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j23kpz3J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A6010E58A
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 16:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723047895; x=1754583895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=44GGyaUZalkTpr3NIpj9FY6qxpz8TB2jru6RnOC6nag=;
 b=j23kpz3JXEsrfdHhd+qdw3+9y+3INj2yD6pQ2MDjKMEyf1wHyWVZ4MkS
 iHmatVe0qelVWWw5wrZYuh/WdceTZJEFiBka/6gnLjAjjTEw1BG4TJ4Pw
 HQBIn8hujxnrLtOjtt4ikhnf4E/F0Ajb74nKgt+dXUF14smM3qOvMZNGL
 y4XI9U+wi3XdejOb08+0Kts125KB3C6YTUYttlHzaorS9BxmZsetihAQZ
 np14CXQDB02qKz2jnHvxQVqLo20xRc1v7bZqD3Lx8+M84lEPN+R10Pypo
 Pf2SuCZyR5dHKN0psKSZwu9J8ZEGdcXildHlDXtqbGfgiOsKDb1xIdzhX w==;
X-CSE-ConnectionGUID: niq8y0TGROKUuHC9cVqfLA==
X-CSE-MsgGUID: 4slaNBxUR92zQcVzxjFapA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="24040462"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="24040462"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 09:24:55 -0700
X-CSE-ConnectionGUID: 2sAnAVEgSG6dlUoFFrLa1g==
X-CSE-MsgGUID: JjXRUUZDTEOSpZo8/WBlYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="61791064"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.120])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 09:24:54 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v7 12/13] drm/xe/vm: Remove restriction that all VMs must be
 faulting if one is
Date: Wed,  7 Aug 2024 18:23:41 +0200
Message-ID: <20240807162416.1307061-13-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807162416.1307061-1-francois.dugast@intel.com>
References: <20240807162416.1307061-1-francois.dugast@intel.com>
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

With this restriction, all VMs on the device must be faulting VMs if there
is already one faulting VM, in which case the device is considered in
fault mode. This prevents for example an application from running 3D jobs
for the compositor while submitting a SVM compute job on the same device.

Now that mutual exclusion of faulting LR jobs and dma fence jobs is
ensured on the hw engine group, remove this restriction to allow running
faulting and non-faulting VMs on the same device.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b715883f40d8..7a88c65759c9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1769,14 +1769,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
-			 xe_device_in_non_fault_mode(xe)))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) &&
-			 xe_device_in_fault_mode(xe)))
-		return -EINVAL;
-
 	if (XE_IOCTL_DBG(xe, args->extensions))
 		return -EINVAL;
 
-- 
2.43.0

