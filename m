Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91FAC3DA7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 16:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D2810E2C7;
	Thu, 15 Aug 2024 16:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N2C0m+gU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F36310E0E8
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 16:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723739288; x=1755275288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=48QHlPgA4NOJ0SOYAh5rq9BL62Z6bv5IPNT/DSgHu48=;
 b=N2C0m+gUV9BS/BA+AHoiqLxSZzPVIlJyY3sPdnSB7/HJePcq45N8Ceva
 huJ+77ObvIWmYFzpTGmovwrKQxr25MUUtGl5ELGSkz0Huxgd3YiED/6x4
 Wwmr/9A+gBnrqkayVGwwZdy++Id3IkTADooS6ky7V16jeiU12DrywEfpq
 S7Dqvk7GmrKEDJHIDtMXoNjol4L0f7b1vihk9ydcABtYn+BKxvWZk6OKM
 N9d7YTs/FGJIHZgxO+zL37SrzFpiTTXqF/El305nNhXokewxt+EbLgt5m
 wuCWXtkvGZZPU1vlaRlv80rUJ699RGdP3sKdXCe6FFV6KGGV2cn9Pe0aV A==;
X-CSE-ConnectionGUID: VLwYH4KfT/6ltpytqC55rA==
X-CSE-MsgGUID: zCY/ZvrpS1aVfF/w5cJK0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="25767658"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="25767658"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 09:28:08 -0700
X-CSE-ConnectionGUID: 5LN0ScsqTIuiKehMmuN9Sg==
X-CSE-MsgGUID: m1G6e2zfSFGdJT2iYPMNPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="63815559"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 09:28:07 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 2/3] drm/xe/oa: Remove the drm device reference of oa_stream
 in xe_oa_destroy_locked()
Date: Thu, 15 Aug 2024 09:27:57 -0700
Message-ID: <20240815162758.36495-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815162758.36495-1-jose.souza@intel.com>
References: <20240815162758.36495-1-jose.souza@intel.com>
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

Basically no changes in behavior at this point but a future patch will
add another caller to xe_oa_destroy_locked() so it makes sense to have
the reference removed inside of xe_oa_destroy_locked().

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index d6eec8caf4c51..4be722b92f90b 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1192,6 +1192,9 @@ static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
 	if (stream->enabled)
 		xe_oa_disable_locked(stream);
 
+	/* Release the reference the OA stream kept on the driver */
+	drm_dev_put(&stream->oa->xe->drm);
+
 	xe_oa_stream_destroy(stream);
 
 	if (stream->exec_q)
@@ -1209,9 +1212,6 @@ static int xe_oa_release(struct inode *inode, struct file *file)
 	xe_oa_destroy_locked(stream);
 	mutex_unlock(&gt->tile->xe->oa.streams_lock);
 
-	/* Release the reference the OA stream kept on the driver */
-	drm_dev_put(&gt_to_xe(gt)->drm);
-
 	return 0;
 }
 
-- 
2.46.0

