Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D853DC54791
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 14:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8553B10E750;
	Wed, 13 Mar 2024 14:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n6UuDJUf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE72A10E70F
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 14:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710341556; x=1741877556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qfCvPljgKUysW28A1g77wvjgTufEf1xNZgRGj3cVMD0=;
 b=n6UuDJUfp1RWRCF7LWl4MIy0RIYiYz9gosGFZIxtjxWx1+GOj2LiBfe9
 AEZkHv4BAGV5urUB57oPNeJ36fs4FWywGs0mJwZI0hb46zjhWd0g3bFFp
 p736QdkkIdurIFXtCpQSU3lqu4fZJI5ChM5BHNIVI250DgFXPNVitoVDy
 rqDHAjKTp7KN/14F0jTdJ8t/aKyQ4wE79T/N9MMnUHNsgRLuAfYzonSnx
 qOWkTrvlrldSOnFKdwM5ADiljVIGfd6vtPFEQhxnzr+HmVOuD9/YqMirh
 w90dCZAex+Wa9DjOU1s2mUiX1BoNcCCCPEeyX3DHKbXya++o6Z55YcrOA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22623989"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="22623989"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 07:52:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="16545928"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa004.fm.intel.com with ESMTP; 13 Mar 2024 07:52:34 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Return if kobj creation is failed
Date: Wed, 13 Mar 2024 20:35:44 +0530
Message-Id: <20240313150545.2830408-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240313150545.2830408-1-himal.prasad.ghimiray@intel.com>
References: <20240313150545.2830408-1-himal.prasad.ghimiray@intel.com>
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

Return after warning regarding kobj creation failure.

Fixes: 4ae3aeab32d7 ("drm/xe: Add vram frequency sysfs attributes")
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vram_freq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
index 079cc283a186..c5f6b5a5d117 100644
--- a/drivers/gpu/drm/xe/xe_vram_freq.c
+++ b/drivers/gpu/drm/xe/xe_vram_freq.c
@@ -111,8 +111,10 @@ void xe_vram_freq_sysfs_init(struct xe_tile *tile)
 		return;
 
 	kobj = kobject_create_and_add("memory", tile->sysfs);
-	if (!kobj)
+	if (!kobj) {
 		drm_warn(&xe->drm, "failed to add memory directory, err: %d\n", -ENOMEM);
+		return;
+	}
 
 	err = sysfs_create_group(kobj, &freq_group_attrs);
 	if (err) {
-- 
2.25.1

