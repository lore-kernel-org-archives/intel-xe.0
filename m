Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7908C001DC
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 08:39:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B188B10E42C;
	Wed, 19 Jul 2023 08:39:08 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB76F10E432
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 08:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689755943; x=1721291943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M7noFOpzR1Tk0Q4Z0zwi186VOgziMK2arb6I5n6Q8BM=;
 b=S1kDthubGC7YsiHA7efzD+52bpaLj8Nndz1z45zi0ArRTZXP02vDRueT
 q1oBkWq+juFXRgngaIhSuOyStpAuwINAWPdapkbITY7zXktFSXIf9oSQy
 CAH6608+ufacHjIQydGjuLmx7WLw6V2Qm3pZX5XtX/9fbwab28hM5d7ks
 XcvDxTTiyDvZ2lH4fOefKLrgZ9ZWvR88t5lOUIrfSsV4Bw5T3KbVHYFu5
 tOjrcXRehwy6rslOLiJJugGu9Q/OE1xXOolONq6KU6+xLL9wBy6pEXBcY
 eiWLQq+umhktsysNsuxAQt4iNZXFysHGVJ4WsskSD26MvY8KB4VcFlKnT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="345999050"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="345999050"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 01:39:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="837603358"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="837603358"
Received: from gtroy-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.29.95])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 01:39:02 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Jul 2023 09:38:09 +0100
Message-ID: <20230719083801.182123-19-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230719083801.182123-12-matthew.auld@intel.com>
References: <20230719083801.182123-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v15 07/10] drm/xe: drop
 xe_device_mem_access_get() from guc_ct_send
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The callers should already be holding the mem_access reference, before
calling into this.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 5d9ed5de5dbb..cb75db30800c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -625,14 +625,10 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 	XE_BUG_ON(g2h_len && g2h_fence);
 
-	xe_device_mem_access_get(ct_to_xe(ct));
-
 	mutex_lock(&ct->lock);
 	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
 	mutex_unlock(&ct->lock);
 
-	xe_device_mem_access_put(ct_to_xe(ct));
-
 	return ret;
 }
 
-- 
2.41.0

