Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950EE606A6B2
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 20:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I9/CbLnq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454E610E492;
	Fri, 20 Nov 2026 20:56:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7776E10E360
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 20:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795208158; x=1826744158;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=rayEZ0+oT/Iyk+FY8Hj0Rn8qFu76Ec9MdIYQCC7fDsI=;
 b=I9/CbLnqlIv4rJ55fILRpVN4lHEk89zD9Rk5deRl7e8Csm4ni5oUoUPR
 88lknlsVahPGbsN3T77PIJhBOhTehJJ+e6DTVkVhhq/+QLmTeJ7trFo9f
 CkjrY4CiWa9d0Hqw2H5+jn3Fuf7FLMA4OVvOjJe+C2E7QWaHKqcvGl1gu
 t7JvM22fVFt3bmL5BcoS7wVwRK4GMTBcaYqH/1WgU6nupmWEe8DRLuRg8
 QguZgRQO6GGJXE6SnuHZOOKd5xtZAJnioc5UMXAmAU4lIvMbksdhpNxoI
 UQWlwWyLXCLNwIAMV0TdTcdiBemalSF0q6lgjUW9uNogIF1qkbzTec8Bs g==;
X-CSE-ConnectionGUID: lmU3wrxqTs2HbW2INO58Rw==
X-CSE-MsgGUID: g27bVHp+QZSWFukU++5Rlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4136362"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4136362"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 12:55:50 -0800
X-CSE-ConnectionGUID: UuUu6CFPQgm3GyhD8Zxj3w==
X-CSE-MsgGUID: AA+irwd6TOS0HZBEd5+M9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10908703"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 12:55:48 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH v21 05/19] drm/xe/vsec: Correct locking order
Date: Fri, 20 Nov 2026 12:55:45 -0800
Message-ID: <20261120205540.1220643-26-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
References: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Xe locking order is power state first, and then local locks.

Reorder locking for correct usage.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 178f22db4046..d93c042cf25b 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -157,16 +157,17 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	telem_addr += offset + user_offset;
 
-	guard(mutex)(&xe->pmt.lock);
-
 	/* indicate that we are not at an appropriate power level */
 	if (!xe_pm_runtime_get_if_active(xe))
 		return -ENODATA;
 
-	/* set SoC re-mapper index register based on GUID memory region */
-	xe->soc_remapper.set_telem_region(xe, mem_region);
+	scoped_guard(mutex, &xe->pmt.lock) {
+		/* set SoC re-mapper index register based on GUID memory region */
+		xe->soc_remapper.set_telem_region(xe, mem_region);
+
+		memcpy_fromio(data, telem_addr, count);
+	}
 
-	memcpy_fromio(data, telem_addr, count);
 	xe_pm_runtime_put(xe);
 
 	return count;
-- 
2.43.0

