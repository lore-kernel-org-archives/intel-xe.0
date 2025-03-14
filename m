Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837A0C282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E78C10E98D;
	Fri, 14 Mar 2025 07:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7+a3kS7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E1A10E98D
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 07:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741937943; x=1773473943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BVUwLi9imJ7909JNiT4juYRXBXzGginF4bWn+KFXznI=;
 b=Q7+a3kS7N80tiAyQ7qw+NFIdNx1y80I2MrEvAWXpyW6V1uW/wY6BjG74
 lTX1dc+MDWMwj+Cx9TQkEri4RJNlXX6Mg27zzAGIo6rtfrudJNjF+ISRK
 709IOF19FH+FMTPBmzmMxnWXm0iOSmkR+MsEAPKQXE66mqRmJehqaK7Gh
 h9AqWtpGPhFRNPUGMzA96ChnUzlgi1x9ur7hX4KoMI+iy82M3FUnK84jT
 5zxl1QGeSF7VilJHFZqDPr9BbQd37QNiw8UR0Fn+lCnrile95/DhU0wGb
 t7PoY/JqDHVI10anTVL7TrVQDd89lGsM7iTr0M9sltN3IM96PdSIPwX5c g==;
X-CSE-ConnectionGUID: fea3AyJkSReycvCuran6Pw==
X-CSE-MsgGUID: wbeAhEt6ShuRYQhV6O1fGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68446134"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68446134"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:39:03 -0700
X-CSE-ConnectionGUID: sqeer36bTJSrMxyOHDk75g==
X-CSE-MsgGUID: TqxkGBmhSiyiKyvfl4HKRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152043886"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 00:39:01 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 25/29] drm/xe/uapi: Add flag for consulting madvise hints on svm
 prefetch
Date: Fri, 14 Mar 2025 13:32:22 +0530
Message-Id: <20250314080226.2059819-26-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
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

Introduce flag DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC to ensure prefetching
in madvise-advised memory regions

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 include/uapi/drm/xe_drm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 70e79fe35834..f30d0cb5b054 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1107,6 +1107,7 @@ struct drm_xe_vm_bind_op {
 	/** @flags: Bind flags */
 	__u32 flags;
 
+#define DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC	-1
 	/**
 	 * @prefetch_mem_region_instance: Memory region to prefetch VMA to.
 	 * It is a region instance, not a mask.
-- 
2.34.1

