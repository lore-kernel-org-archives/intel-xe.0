Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20AEC021A4
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 14:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B8A10E8B5;
	Wed, 12 Feb 2025 14:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel-corp-partner-google-com.20230601.gappssmtp.com header.i=@intel-corp-partner-google-com.20230601.gappssmtp.com header.b="B19pmthB";
	dkim-atps=neutral
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F8910E0F7
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 02:20:40 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e5b638d3f83so1460737276.2
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 18:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1739240439; x=1739845239; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kS/KbNClhw8/vSmfpHGR6Ftc/z5h+dh7Eir6GSecYYA=;
 b=B19pmthBu7+90PeM0mGWatX7eG8tDsvHNTQLqIYo0QETKg4J0PlddikB95klanMaNz
 sX+zpFZi0EfADBq4fbOr7kkhdeh9dNfcG9MEmm21SydC6U/eGQyBxFTBwWr+5KgBUb8+
 u52GJRN0bbRRu/x5llha57Co7k8lU+/OyJW2tDv1BkPXjMh759hvePx7XbBNoN5qdNsg
 WwEmv/ls9NVzVyN9JQZIrL69w7a4PJiV5h4pr8FUuGafUapJzKkg/JM8cDkuV4EGFq18
 FrhTRu7kDj8aqftO3XjibDBl79Hawv61XvFjhyE7fnqg7SGS/Ui9LkHBbcP96mXG9rWx
 dN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739240439; x=1739845239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kS/KbNClhw8/vSmfpHGR6Ftc/z5h+dh7Eir6GSecYYA=;
 b=dovSun79Mh7qPB2R8LBA8X1yQHgu6rMFbQjsivtMnqsqlHxiP0y7JOwiBookzBbnZH
 FIYo2kkAbVB4xHJW1OjXCtG2J2Jf+D/h/CXJKesExKogcY3yoGqdRf1HeUzXd5a1x4pV
 1EtMo54pczDvQEFWlKxaS2jGAntOFiHSRn0KduSZOICRlOIs5Wuf7hBxV5ascbGBvJ0e
 I7hGRs7ElT7dw7UooLrk2vAD9onCbnHF8O/qtVKi5sOOVOCLQ1+s7Nxcdp3EjlzXMR3C
 b375Dw4+uuBdsc+/xtgHrw1OFhuqyYdWNajYaAcbUGgFPBUm3Wxc+ONB1mCoIZMIcH9l
 4H1w==
X-Gm-Message-State: AOJu0YxOyVrwOdwWia9wzBqKDuFdUUllEjlUOm+CvbZ5Aeff+NiMcwcB
 rufa6xvDxpViNZg8TWCVU0YE5dA+gUWoXQjreL4d52yrtb2lKieWgNNbiLolcFaR0CFQo1DTTtr
 irrs=
X-Gm-Gg: ASbGncsaf3p//L1Jf1jWQiTLxPY5GYt8BjMfdlIzSn23NCBJZRFgvmM2uYEaCoEj6Su
 QzxaNKuD8EAinmn6Civxd1YRwNnYGBPBzJtPsGAOUbsDE7JLhj92WylD21cuY/SZzZWGjneKV9z
 Z1rPHp4o+BpErES9qAjt0tHDjSfOYc1lMbfG77/Ql2NY+IOOQ+3sNRLnqWf9SscDc3srK68cGDb
 GERbSHlefZ1pI/JomPBSqiOxeE4rV5x4QlM7GPiXh397lSqaB4UDORQtQPfdAlw37mkCaXPZPL8
 KfrGDknC4sXO8ZH4C7X+bFRSqZJU/YqjR6MWwlZX3QRmE1Y7
X-Google-Smtp-Source: AGHT+IHlK2WLCUMm4OdUx0urUFOc505cEvOxSLqJwGyBgo3ODe7IUk+M+Jl34RM+cyQbQSBE0YRSYQ==
X-Received: by 2002:a05:6902:102a:b0:e57:fc0a:fae8 with SMTP id
 3f1490d57ef6-e5d93d30565mr2680112276.42.1739240438936; 
 Mon, 10 Feb 2025 18:20:38 -0800 (PST)
Received: from nucskully.lan ([192.254.97.188])
 by smtp.googlemail.com with ESMTPSA id
 3f1490d57ef6-e5b3a203ef8sm2860928276.13.2025.02.10.18.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 18:20:38 -0800 (PST)
From: Carlos Santa <carlos.santa@intel.corp-partner.google.com>
X-Google-Original-From: Carlos Santa
 <carlos.santa@intel-corp-partner.google.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, lionel.g.landwerlin@intel.com,
 rodrigo.vivi@intel.com, carlos.santa@intel.com,
 Matthew Brost <matthew.brost@intel.com>
Subject: [RFC v2 2/6] drm/xe: Add "null_sparse" type to VM snap properties
Date: Mon, 10 Feb 2025 18:20:02 -0800
Message-ID: <20250211022006.23234-3-carlos.santa@intel-corp-partner.google.com>
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

Add "null_sparse" type to VM snap properties indicating the VMA reads
zero and writes are droppped. This is useful information for debug and
will help build a robust GPU hang replay tool.

The current format is:

[<vma address>]: <permissions>|<type>

Permissions has two options, either "read_only" or "read_write".

Type has three options, either "userptr", "null_sparse", or "bo".

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 130c31775787..75904637e1dd 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3381,6 +3381,7 @@ struct xe_vm_snapshot {
 		unsigned long len;
 #define XE_VM_SNAP_FLAG_USERPTR		BIT(0)
 #define XE_VM_SNAP_FLAG_READ_ONLY	BIT(1)
+#define XE_VM_SNAP_FLAG_IS_NULL		BIT(2)
 		unsigned long flags;
 		struct xe_bo *bo;
 		void *data;
@@ -3438,6 +3439,8 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 
 			snap->snap[i].bo_ofs = xe_vma_userptr(vma);
 			snap->snap[i].flags |= XE_VM_SNAP_FLAG_USERPTR;
+		} else if (xe_vma_is_null(vma)) {
+			snap->snap[i].flags |= XE_VM_SNAP_FLAG_IS_NULL;
 		} else {
 			snap->snap[i].data = ERR_PTR(-ENOENT);
 		}
@@ -3458,7 +3461,8 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
 		struct xe_bo *bo = snap->snap[i].bo;
 		int err;
 
-		if (IS_ERR(snap->snap[i].data))
+		if (IS_ERR(snap->snap[i].data) ||
+		    snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL)
 			continue;
 
 		snap->snap[i].data = kvmalloc(snap->snap[i].len, GFP_USER);
@@ -3510,6 +3514,8 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 		drm_printf(p, "[%llx].properties: %s|%s\n", snap->snap[i].ofs,
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
 			   "read_only" : "read_write",
+			   snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL ?
+			   "null_sparse" :
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_USERPTR ?
 			   "userptr" : "bo");
 
@@ -3519,6 +3525,9 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 			continue;
 		}
 
+		if (snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL)
+			continue;
+
 		drm_printf(p, "[%llx].data: ", snap->snap[i].ofs);
 
 		for (j = 0; j < snap->snap[i].len; j += sizeof(u32)) {
-- 
2.43.0

