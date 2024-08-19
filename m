Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3ACC5320E
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 14:10:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C152F10E27E;
	Mon, 19 Aug 2024 14:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="TZ+U3ai0";
	dkim-atps=neutral
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E04A10E23F
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 09:58:20 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a7aac70e30dso440209266b.1
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 02:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1724061499; x=1724666299;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z/WM/vbPfsLB9+Ywm21579BeaRCehpr1hL+f09TjRp8=;
 b=TZ+U3ai0DwTUh0SgpiRFQMeGhgraNzA0Ci4g+4Src0W4D3Y6mZgnwYm7seY6cRW2Z6
 VCRX2dbBfOj9HQ1sN+5d9z7MFufLjcaM2O/FFCAIFfR3Fmgc3Ji+e+XRdAhIhQusuNCi
 dalVzERw+oqMymok7Ax+Z4LmTqGLUQHoluwL5zKJ/eTx3sfPJDxIOcas9guSXRCPB1jt
 20g3q2E96QBE4JROxysY5D7we6jT38y6Pkq8EzBpmtd5nWltkDkylZBY3vmbazDhKBVu
 omZ5EfohkdjkuCPFr1byErSio7sMrd+e56JqcHldbyD7BJpu9Dg9vLFC9iT+8PeIFC3O
 ds+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724061499; x=1724666299;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z/WM/vbPfsLB9+Ywm21579BeaRCehpr1hL+f09TjRp8=;
 b=foU5S/pLlogfnR11mZxocDuAGGP0oPa4uwA1fwie59NPu3//vfyC3Obv+F6fkcCrvl
 o2IHQgnnFc+8lEHx2swxZw9T0lW+1r4iyY+BT+3+dgOF7XMCNNbDkwM6vksfEOV7VAVU
 cRuxXhohtpPGKy6WEGB5xnWjiWns63q5JS7VNbcGL6dICC5qt2HQQrGm/PCpC8CTA9OK
 rxbK5VOGb1JYiOUrdFfU7gQ9ejGB1GYUkPOKu9vDGxqdQ70+53u+3sr5QC6y6S2j82Fu
 DX/xM1z+YMwbeRyENQsGw3siXjzbCCK8CBb4wo++fhvqwOqD/5Ewf6Z3KYBLr9kwznHT
 as7w==
X-Gm-Message-State: AOJu0YxjjtYGJe/M6R0wTOMIdhc8yYXiQ1cukwXTCFSc4BqnLOI0mhCx
 9/xogSUOpqvJbUvEocVrrrF4ALflbCjH0kZ+xBLOPS+2dqDvwgSmhIivUC0y3aE=
X-Google-Smtp-Source: AGHT+IE8dujqtNt2QB+POwilgZUwLTFuKQfMnKJC0wL4+RUjvO0qyeyj2M6q5xsQmP85IflYGSB+eQ==
X-Received: by 2002:a17:907:e61d:b0:a7a:a892:8e05 with SMTP id
 a640c23a62f3a-a83929534d8mr738035366b.33.1724061498556; 
 Mon, 19 Aug 2024 02:58:18 -0700 (PDT)
Received: from fedora.fritz.box (aftr-62-216-208-163.dynamic.mnet-online.de.
 [62.216.208.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83839472f4sm612225466b.184.2024.08.19.02.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 02:58:18 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thorsten Blum <thorsten.blum@toblux.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [RESEND PATCH] drm/xe/oa: Use vma_pages() helper function in
 xe_oa_mmap()
Date: Mon, 19 Aug 2024 11:57:52 +0200
Message-ID: <20240819095751.539645-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 19 Aug 2024 14:10:30 +0000
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

Use the vma_pages() helper function and remove the following
Coccinelle/coccicheck warning reported by vma_pages.cocci:

  WARNING: Consider using vma_pages helper on vma

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 6d69f751bf78..133292a9d687 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1244,8 +1244,7 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 	vm_flags_mod(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY,
 		     VM_MAYWRITE | VM_MAYEXEC);
 
-	xe_assert(stream->oa->xe, bo->ttm.ttm->num_pages ==
-		  (vma->vm_end - vma->vm_start) >> PAGE_SHIFT);
+	xe_assert(stream->oa->xe, bo->ttm.ttm->num_pages == vma_pages(vma));
 	for (i = 0; i < bo->ttm.ttm->num_pages; i++) {
 		ret = remap_pfn_range(vma, start, page_to_pfn(bo->ttm.ttm->pages[i]),
 				      PAGE_SIZE, vma->vm_page_prot);
-- 
2.46.0

