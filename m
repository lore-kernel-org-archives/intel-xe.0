Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27686606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 17:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CtURjpNi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB68A10EC4B;
	Mon, 23 Nov 2026 17:12:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388A510EC4B
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 17:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795453968; x=1826989968;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O9bRzKA/88Pc9aK7qkd5nzdcXCiDFRQeFKMtnY2sauk=;
 b=CtURjpNinjYRKmc2LpdwrdqVaFyF/E8NPd8+FJ28T3TiQOrwMrQj5OOj
 OvjlVXKqxKrDGOdUwU4NIJEEiShpbYn3sg2BYuVglDYeRDkyrg42+eBsr
 6vvLbF06fjpU6Bguh/u3AnnCWbUsjSBga/gqEDo2pOhKGgSUt0VPF7UPJ
 9Gmn96Ax6kQ+cVgYiVZnbMcvYtGx5OmU0QnXIrnjS4MWFX6+FilNvL1eP
 EH4XLP0tveKjTrdMHXohGjEUCOU/2UBHVsuJKcJP0lW7/BH2kaK8dARWT
 blGQzWR+o9fg1xfyR9FNXXy4/V0SnJb24Oi4q2UfZSZaAI2kh70Zgx0Aq w==;
X-CSE-ConnectionGUID: yOvy1mX1Q2OY5eNppGDOQw==
X-CSE-MsgGUID: lzltlAYoSayXQPewA1m2uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4110301"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4110301"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 09:12:47 -0800
X-CSE-ConnectionGUID: cyJKXyKqTvGx2WxoTM8C7g==
X-CSE-MsgGUID: oBR2ZtIyQ9OzbJY6Mj4Bng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11119863"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 09:12:45 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH v1] drm/xe/cper: Add GUIDs for device IDs 6753-6756
Date: Mon, 23 Nov 2026 22:42:42 +0530
Message-ID: <20261123171241.526322-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the GUID mappings required for device IDs 0x6753 through 0x6756.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_cper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 1b80b365fc73..64bbb149e4e3 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -48,6 +48,14 @@ static const struct xe_device_guid_entry xe_device_guids[] = {
 			    0x99, 0xc8, 0x9b, 0x45, 0x51, 0x3b, 0x67, 0xe3) },
 	{ 0x6752, GUID_INIT(0xb778ead8, 0x0009, 0x59a7,
 			    0xa1, 0x3a, 0x78, 0xce, 0x4d, 0xdd, 0xae, 0xf5) },
+	{ 0x6753, GUID_INIT(0x7fcd80a7, 0xca5a, 0x5d21,
+			    0x97, 0x0f, 0xe7, 0x6a, 0xc0, 0x27, 0xbb, 0x76) },
+	{ 0x6754, GUID_INIT(0xf87c6f75, 0x96c1, 0x5ce4,
+			    0x86, 0x75, 0xc7, 0xaa, 0x04, 0xbc, 0xc6, 0xd8) },
+	{ 0x6755, GUID_INIT(0x839514b4, 0xf269, 0x5e61,
+			    0xba, 0x2f, 0x79, 0x08, 0xa7, 0x59, 0x06, 0x5f) },
+	{ 0x6756, GUID_INIT(0x5003ffda, 0xab3f, 0x5ae1,
+			    0xb3, 0xbd, 0x19, 0x60, 0x0e, 0x0d, 0x4c, 0xc2) },
 };
 
 static const guid_t *lookup_device_guid(struct xe_device *xe)
-- 
2.56.0

