Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE35C61DA4
	for <intel-xe@archiver.kernel.org>; Sat,  4 Mar 2023 00:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0899C10E790;
	Sat,  4 Mar 2023 00:14:12 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5854110E78B
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Mar 2023 00:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677888850; x=1709424850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YSINgA/I1lOLyAKBydzGvgzWqNLIEj71LJuPwC59d0Y=;
 b=LQt/6my/oWbE0NaVNPwul6kGKgLigAuJGGFLQH428SXhWEmpYrXFDBPF
 wczd8OYsxHjsx0xy/08rY1kO3Hlm2iwjMjIo9/RbjxWMikJj0g8iAexlK
 uxy/2SLKn0M9JAXfaMz5KOa6hnOi4NQguWsxzrGofzJ3+30Kwqaep2RsD
 5qfpTeZrSurUwZaFwTkpF50sJWO+sgs4LoDUmjmP0yEVbfZ7n2a+rYG9Q
 Yw2PkeBeS6rhsixGzcJIrxDsfo99Ry51aHrY+NmgZbKg/7RD/5sVUgbYG
 01H699WwFbrmM/tSXPheXEl8jhKU6uMkaKergpcxMsTuCaG7LAoPKlerY Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="336710239"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="336710239"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 16:14:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="799389754"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="799389754"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 16:14:09 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Mar 2023 16:14:03 -0800
Message-Id: <20230304001403.11761-5-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230304001403.11761-1-niranjana.vishwanathapura@intel.com>
References: <20230304001403.11761-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 4/4] drm/xe/migrate: Fix chunk size calculation
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
Cc: dev@mblankhorst.nl, thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In write_pgtable(), use correct size.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index a922f90f0627..2943f46cb6da 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -940,7 +940,7 @@ static void write_pgtable(struct xe_gt *gt, struct xe_bb *bb, u64 ppgtt_ofs,
 
 	do {
 		u64 addr = ppgtt_ofs + ofs * 8;
-		chunk = min(update->qwords, 0x1ffU);
+		chunk = min(size, 0x1ffU);
 
 		/* Ensure populatefn can do memset64 by aligning bb->cs */
 		if (!(bb->len & 1))
-- 
2.21.0.rc0.32.g243a4c7e27

