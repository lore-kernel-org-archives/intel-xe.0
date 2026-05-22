Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23576CD5BB3
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 17:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D7310E4E0;
	Fri, 22 May 2026 17:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H69LWCzO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0F010E2D3
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 17:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779470817; x=1811006817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qYRTA3sJbcaDOEv+LU0u2ka7Jkzz8Fn9+1eIPBlqQTU=;
 b=H69LWCzOpkdE5VBS2Xn4ApnOQi2uZH0ouYXCGjpp00pdniIXbPh8M9b1
 EcNakbS6kJLGw2qjl/mS9ozL36LWaOAFEfziALLT/J7IbYwXpsfvoZSrp
 o75l8svB2X3wHzMjhd3iis1LEOhdN50OS7D3BosiuPGyHwP3JAfd+QwsB
 HKsrqsy0JVky8hqewO8x/824i1xakHW85/68GCV+nDUVYvrYl4kk3Tkt8
 /uNCEXCihTMYJv5lkXYJ/3N4W/atNybZlKjKX0mj77JPAm36t8fHXGBsa
 6kyVHNtwGnbXgIQFWyG/68JpGIVeBLat33J1sWEoFAik9bOxmI9kPhTby w==;
X-CSE-ConnectionGUID: aaj1laKuRNuUnnSdL72N2Q==
X-CSE-MsgGUID: 85mDbsM4TuK3UDt1KS1XPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80436569"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="80436569"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 10:26:57 -0700
X-CSE-ConnectionGUID: +dHuAKyjR3+m6pahOnTMyg==
X-CSE-MsgGUID: 8SI0G+ozT9agoL5SSSr8iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="246044086"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 10:26:56 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com
Subject: [PATCH 2/2] drm/xe/vm: Add srcid to xe_vm_get_property_ioctl fault
 report
Date: Sat, 23 May 2026 01:26:45 +0800
Message-ID: <20260522172645.3503927-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522172645.3503927-1-jonathan.cavitt@intel.com>
References: <20260522172645.3503927-1-jonathan.cavitt@intel.com>
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

Add the SRCID of the faulting hardware unit to the return of the
xe_vm_get_property_ioctl fault report.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 11 +++++++++--
 drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
 include/uapi/drm/xe_drm.h        |  4 ++--
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b01f31ed4417..8688e283d53d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -637,6 +637,7 @@ void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault *pf)
 				  pf->consumer.fault_type_level);
 	e->fault_level = FIELD_GET(XE_PAGEFAULT_LEVEL_MASK,
 				   pf->consumer.fault_type_level);
+	e->srcid = pf->consumer.srcid;
 
 	list_add_tail(&e->list, &vm->faults.list);
 	vm->faults.len++;
@@ -4109,6 +4110,11 @@ static u8 xe_to_user_fault_level(u8 fault_level)
 	return fault_level;
 }
 
+static u8 xe_to_user_srcid(u8 srcid)
+{
+	return srcid;
+}
+
 static int fill_faults(struct xe_vm *vm,
 		       struct drm_xe_vm_get_property *args)
 {
@@ -4136,6 +4142,8 @@ static int fill_faults(struct xe_vm *vm,
 		fault_entry.fault_type = xe_to_user_fault_type(entry->fault_type);
 		fault_entry.fault_level = xe_to_user_fault_level(entry->fault_level);
 
+		fault_entry.srcid = xe_to_user_srcid(entry->srcid);
+
 		memcpy(&fault_list[i], &fault_entry, entry_size);
 
 		i++;
@@ -4191,8 +4199,7 @@ int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
 	int ret = 0;
 
 	if (XE_IOCTL_DBG(xe, (args->reserved[0] || args->reserved[1] ||
-			      args->reserved[2] || args->extensions ||
-			      args->pad)))
+			      args->reserved[2] || args->extensions)))
 		return -EINVAL;
 
 	vm = xe_vm_lookup(xef, args->vm_id);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 635ed29b9a69..e8aea75341cc 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -196,6 +196,7 @@ struct xe_device;
  * @access_type: type of address access that resulted in fault
  * @fault_type: type of fault reported
  * @fault_level: fault level of the fault
+ * @srcid: ID of the faulting hardware unit
  */
 struct xe_vm_fault_entry {
 	struct list_head list;
@@ -204,6 +205,7 @@ struct xe_vm_fault_entry {
 	u8 access_type;
 	u8 fault_type;
 	u8 fault_level;
+	u8 srcid;
 };
 
 struct xe_vm {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 48e9f1fdb78d..2b45b691a032 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1294,8 +1294,8 @@ struct xe_vm_fault {
 #define FAULT_LEVEL_PML4	3
 #define FAULT_LEVEL_PML5	4
 	__u8 fault_level;
-	/** @pad: MBZ */
-	__u8 pad;
+	/** @srcid: ID of the faulting hardware unit */
+	__u8 srcid;
 	/** @reserved: MBZ */
 	__u64 reserved[4];
 };
-- 
2.53.0

