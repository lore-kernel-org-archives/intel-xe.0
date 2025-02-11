Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C73C021A7
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 14:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE4210E8B6;
	Wed, 12 Feb 2025 14:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel-corp-partner-google-com.20230601.gappssmtp.com header.i=@intel-corp-partner-google-com.20230601.gappssmtp.com header.b="p/unXLkv";
	dkim-atps=neutral
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A1D10E0F7
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 02:20:43 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e5b1837d182so4971679276.0
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 18:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1739240442; x=1739845242; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FLJB8LRniXEOdqgv3SK6ZU3py/CxmMQorKiGE7vW2/g=;
 b=p/unXLkvQK1+2GJxFyk46wow5TuUHeD0ZB19zvN8tmSP5nQR1JN/j24sPlGC6KV8W+
 iRNpv8TX7a9z0iYnrZScATA68dU+h2ZMY+YeIt5hXsqHswKoeTyoTlKQgN7Q4hrwDInR
 0gz2PwOeCyF9JhYQg1bKYJNdSWD90IIx85QI1bib16eJ2gLGd1/5TBP3QrCkHtYd7dkt
 mZkEUNp2JsQAWfwYwTnoDb9pdOJ8GmdQkyaYvek0tLldHmYP5fWf1dG1SlnkJrux3c5j
 DJ6HWfB8+FY1FE8LWasLIL+idkAvoMwOctJwPgksD8Nfmpjuv0HhQts70ltqNQCgVkSr
 g5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739240442; x=1739845242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FLJB8LRniXEOdqgv3SK6ZU3py/CxmMQorKiGE7vW2/g=;
 b=LSvP/Rxn0Mqq7zRucATnMwhrGLIMu2+fkHVs620rPyuz8emibthTZcMFFEbSEwpZ25
 0YESiNcYxERhD1S3NSVsXW+ZkEgq4F2tUWaxlOvZIX+Ubb/JT9oGCPp2hgtF5E0taCLX
 aar11HbofYOsNdNrEbn5UCI+vjhS/Rt2M64t4A52WIAuZT47hQLnmFRjDuw04viz7aJD
 5MOpqJn8PZgoNXVyonpeo1Aa4CZI+5JTq4FDjG5ZwlcEISYnU8PAhdHyw+inZajlsvfj
 egB+/oFtwD2yMStKA+cbfMSUqgK50b4KlRArdQ8z+d6qc52C3rzEo1jz5l30xFPbZY6B
 cNzA==
X-Gm-Message-State: AOJu0YylhABMk2RmDZw6iolF1JA3nsfrmKW293Ci+zBrZDE7YQQJYG6M
 q0OjBZ9phTPQ6d6aVMQJvT1jGtT8C7D70lT40GHY00wJYsm5bkQNLMB7xOoemCsP7RI96CE7yMS
 BDGA=
X-Gm-Gg: ASbGncshQKk9pxDc1V3bNe2+gAF+vtANfjFuk4t6ahIAOteGZjJMYzrW36lRPkd2VZy
 LQqfoJDytNUiCN0rLL3FaIPggWE/s/ANunSTPxAG1AhSEU+G9rxmlXbAuIpdBkKjcAn7aEpqvc/
 h7DBNHNoCUCZulqUdrClq/wvpeCuKndz/U4+RC/e/kWIsJVjUZESffAjLaiOIywUljUXgCRyTUf
 O7q3FsT3rj3moolxeYVskkFZ3tA7wVdy62OENolDILzdMsXFbD8U4iXZaZcj9Dz9wnKWbMv1Vmc
 oK/BmNuytzDfqSarjFBGge45WERKonXAB9sW0bjw/v8Vvso0
X-Google-Smtp-Source: AGHT+IFWlqs842uCQqfJBgrPOzbH5uWC7yqt1AItEOxLaUsf4f/MNB+rD9iKl31Aa+KWq6z5JqiL5g==
X-Received: by 2002:a05:6902:2744:b0:e38:d040:eeed with SMTP id
 3f1490d57ef6-e5d944d2c30mr1828921276.15.1739240442314; 
 Mon, 10 Feb 2025 18:20:42 -0800 (PST)
Received: from nucskully.lan ([192.254.97.188])
 by smtp.googlemail.com with ESMTPSA id
 3f1490d57ef6-e5b3a203ef8sm2860928276.13.2025.02.10.18.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 18:20:41 -0800 (PST)
From: Carlos Santa <carlos.santa@intel.corp-partner.google.com>
X-Google-Original-From: Carlos Santa
 <carlos.santa@intel-corp-partner.google.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, lionel.g.landwerlin@intel.com,
 rodrigo.vivi@intel.com, carlos.santa@intel.com,
 Matthew Brost <matthew.brost@intel.com>
Subject: [RFC v2 3/6] drm/xe: Add mem_region to properties line in VM snapshot
 capture
Date: Mon, 10 Feb 2025 18:20:03 -0800
Message-ID: <20250211022006.23234-4-carlos.santa@intel-corp-partner.google.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250211022006.23234-1-carlos.santa@intel-corp-partner.google.com>
References: <20250211022006.23234-1-carlos.santa@intel-corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Feb 2025 14:09:49 +0000
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

From: Matthew Brost <matthew.brost@intel.com>

Add memory region to properties line in VM snapshot capture indicating
where the memory is located. The memory region corresponds to regions in
the uAPI. This is useful information for debug and will help build a
robust GPU hang replay tool.

The current format is:

[<vma address>]: <permissions>|<type>|mem_region=0x%x

Permissions has two options, either "read_only" or "read_write".

Type has three options, either "userptr", "null_sparse", or "bo".

Memory region is a bit mask of where the memory is located.

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 75904637e1dd..9151c9cc3785 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3383,6 +3383,7 @@ struct xe_vm_snapshot {
 #define XE_VM_SNAP_FLAG_READ_ONLY	BIT(1)
 #define XE_VM_SNAP_FLAG_IS_NULL		BIT(2)
 		unsigned long flags;
+		int uapi_mem_region;
 		struct xe_bo *bo;
 		void *data;
 		struct mm_struct *mm;
@@ -3428,6 +3429,18 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 		if (bo) {
 			snap->snap[i].bo = xe_bo_get(bo);
 			snap->snap[i].bo_ofs = xe_vma_bo_offset(vma);
+			switch (bo->ttm.resource->mem_type) {
+			case XE_PL_SYSTEM:
+			case XE_PL_TT:
+				snap->snap[i].uapi_mem_region = 0;
+				break;
+			case XE_PL_VRAM0:
+				snap->snap[i].uapi_mem_region = 1;
+				break;
+			case XE_PL_VRAM1:
+				snap->snap[i].uapi_mem_region = 2;
+				break;
+			}
 		} else if (xe_vma_is_userptr(vma)) {
 			struct mm_struct *mm =
 				to_userptr_vma(vma)->userptr.notifier.mm;
@@ -3439,10 +3452,13 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 
 			snap->snap[i].bo_ofs = xe_vma_userptr(vma);
 			snap->snap[i].flags |= XE_VM_SNAP_FLAG_USERPTR;
+			snap->snap[i].uapi_mem_region = 0;
 		} else if (xe_vma_is_null(vma)) {
 			snap->snap[i].flags |= XE_VM_SNAP_FLAG_IS_NULL;
+			snap->snap[i].uapi_mem_region = -1;
 		} else {
 			snap->snap[i].data = ERR_PTR(-ENOENT);
+			snap->snap[i].uapi_mem_region = -1;
 		}
 		i++;
 	}
@@ -3511,13 +3527,16 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 	for (i = 0; i < snap->num_snaps; i++) {
 		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[i].len);
 
-		drm_printf(p, "[%llx].properties: %s|%s\n", snap->snap[i].ofs,
+		drm_printf(p, "[%llx].properties: %s|%s|mem_region=0x%lx\n",
+			   snap->snap[i].ofs,
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
 			   "read_only" : "read_write",
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL ?
 			   "null_sparse" :
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_USERPTR ?
-			   "userptr" : "bo");
+			   "userptr" : "bo",
+			   snap->snap[i].uapi_mem_region == -1 ? 0 :
+			   BIT(snap->snap[i].uapi_mem_region));
 
 		if (IS_ERR(snap->snap[i].data)) {
 			drm_printf(p, "[%llx].error: %li\n", snap->snap[i].ofs,
-- 
2.43.0

