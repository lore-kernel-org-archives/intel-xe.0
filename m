Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405F0C369A4
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 04:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0167E10E33F;
	Thu, 10 Apr 2025 04:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HpIbmEZJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1646910E02C
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 04:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744257908; x=1775793908;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LyfoRKUQTSSG+uaJrp/3/QbwoY3Cpc1KT6pqvbWfffc=;
 b=HpIbmEZJVH6CnDcFEOfp/A7UopnQJjcCYofVAyhHZulw/gT6DXYclQl5
 vtk6ESJ19fbHgXK//+0VSn5qmYmWdbCEDAFKaoFtUjg1imRrgdJDhfbZz
 7P9FM4xAkexwg0E9wj6QZ9vtaH2+iCRGl1qqKutsOdaWJ+eBS8C+/pay0
 SRR5Uv7ULYMyO/dkWfohhfnzugry3TxfqL9NfoFA7wlJT66MW6pLAX+5X
 7R8L8Yt21PyVxSgtJDPxO3pF+Pyp/x1usyXRg5fUvxCX8VlgzVcalQODL
 TQVPs9AyAOfzeL40YHL62FnxOO5Ub0LsvNlNxfb1HxIZhwa4Ga2+vGWMd w==;
X-CSE-ConnectionGUID: 0A8iuNZCSwynf+ae5ZAMKg==
X-CSE-MsgGUID: F3HFFR/BS7+6k+gSPZQezQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="44999853"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="44999853"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 21:05:07 -0700
X-CSE-ConnectionGUID: l7tJ+cc/RfOf9gzWKo5NLA==
X-CSE-MsgGUID: gPNr8Xs6Qv2cHwS59X8lPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="133642763"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 21:05:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 4/4] drm/xe: Abort printing coredump in VM printer output
 if full
Date: Wed,  9 Apr 2025 21:06:22 -0700
Message-Id: <20250410040622.238389-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410040622.238389-1-matthew.brost@intel.com>
References: <20250410040622.238389-1-matthew.brost@intel.com>
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

Abort printing coredump in VM printer output if full. Helps speedup
large coredumps which need to walked multiple times in
xe_devcoredump_read.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0c69ef6b5ec5..44e2d50c7ce1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3866,6 +3866,9 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 		}
 
 		drm_puts(p, "\n");
+
+		if (drm_printer_is_full(p))
+			return;
 	}
 }
 
-- 
2.34.1

