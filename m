Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014B1E77170
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 10:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8BB10E5CB;
	Thu,  5 Dec 2024 10:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jHPSKfz4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CD910E5CB
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 10:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733394321; x=1764930321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WZuxW0hPPT4oluz4f04h4REZ3BhtsxLE+pJKx0C+yjQ=;
 b=jHPSKfz4M9gxCdYWPSQhk7+hXFSdYthsOxK1XRrr+8+g9JnI36wCVcPu
 AZTnk08LfQnKOPRwr3KgeELpN9mZlsgFGSasSUa5hHoAcc2mF8hLFyhbX
 gUHpDqz/WjNld68oHX4kO/6d7MbvUV1HpBj8AejCwlF/kkyRvOKTKh/LP
 pyOyV5VqsxYtvkr0a4NjDUPV86V1UB2jZLc92KnfNgBqW6P6W871za49G
 KCAmkt89a6Cz94S602KyRaXslCbMQgkEB6i+saUc+ABUopGPdalX/pzgq
 d4E/iTWIGM1Q6cqnBC2MN69FERZX6abYCX8ao8qBgd+OWM51NeK7n7oNL g==;
X-CSE-ConnectionGUID: IMjPElvwS+6Jo8fgEN/0+A==
X-CSE-MsgGUID: 8LW9kWdDS8qI+/NITHmRfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="45078812"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="45078812"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 02:25:21 -0800
X-CSE-ConnectionGUID: 5mS+1mK5TL+J8v1tBeoVCw==
X-CSE-MsgGUID: Zfm5MIKaS++AKhUOg90Kyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="131486533"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 05 Dec 2024 02:25:19 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [RFC 2/2] drm/xe: Add flag for consulting madvise hints on prefetch
 memory regions
Date: Thu,  5 Dec 2024 16:16:20 +0530
Message-Id: <20241205104620.456353-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205104620.456353-1-himal.prasad.ghimiray@intel.com>
References: <20241205104620.456353-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 include/uapi/drm/xe_drm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ec51619f76f0..015928531fe5 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1002,6 +1002,7 @@ struct drm_xe_vm_bind_op {
 	/** @flags: Bind flags */
 	__u32 flags;
 
+#define DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC	-1
 	/**
 	 * @prefetch_mem_region_instance: Memory region to prefetch VMA to.
 	 * It is a region instance, not a mask.
-- 
2.34.1

