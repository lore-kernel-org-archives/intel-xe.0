Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B4CC54FB9
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 14:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0645810E5F2;
	Thu, 16 Nov 2023 14:17:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2B610E5EF
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 14:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700144233; x=1731680233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uSuigpahqbvSFC6e+hO/78osV2twvjZ2oqQ/ZrNbacE=;
 b=e6mPHlQy26EfR4Z4C+2NIQrXR3Hu0e93IhSjxmahVbEFw4Baw23pvuBg
 ak9WwCjlUSYnc3+EGfAXH6HUDhP3+cSXPOPcYIwr8519dhttOQ7ggwxzO
 bVwnG9d+d3Aw/qDe0k6bcCQ4S/onlKKKS0p2n5VJuT2+O4LOUD+jpzU/s
 WXyZif7ah89XQ7QnNk58qAWuk92gd2W3aVyrnrZHGTM0jWV0zK3lWaddd
 CqHtqX92Lvp8EGsinZVZkBpg2ehqUDKmSH0iSJ+hemYnr3mmaNJK3k2v8
 kTaygwagBUrcSRzjAE5597U09UknBAAp/OCAcO0Lqf/3tIN/lean6FE81 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="12643377"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="12643377"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 06:17:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="715230482"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="715230482"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga003.jf.intel.com with ESMTP; 16 Nov 2023 06:17:11 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 20:00:41 +0530
Message-Id: <20231116143043.908412-3-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
References: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 2/4] drm/xe: Add memory directory for vram
 attributes
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 vivi.rodrigo@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Adding a new "memory" directory under for vram attributes
under the exisiting tile<n> directory.

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_tile_sysfs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index 16376607c68f..d61c6fb1df40 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -46,6 +46,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 	struct xe_device *xe = tile_to_xe(tile);
 	struct device *dev = xe->drm.dev;
 	struct kobj_tile *kt;
+	struct kobject *kobj;
 	int err;
 
 	kt = kzalloc(sizeof(*kt), GFP_KERNEL);
@@ -64,8 +65,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 
 	tile->sysfs = &kt->base;
 
+	kobj = kobject_create_and_add("memory", tile->sysfs);
+	if (!kobj) {
+		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
+		return;
+	}
+
 	if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
-	    sysfs_create_file(tile->sysfs, physical_memsize_attr))
+	    sysfs_create_file(kobj, physical_memsize_attr))
 		drm_warn(&xe->drm,
 			 "Sysfs creation to read addr_range per tile failed\n");
 
-- 
2.25.1

