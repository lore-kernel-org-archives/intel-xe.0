Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE636C021A9
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 14:10:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFF510E8B9;
	Wed, 12 Feb 2025 14:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel-corp-partner-google-com.20230601.gappssmtp.com header.i=@intel-corp-partner-google-com.20230601.gappssmtp.com header.b="Jjj/TMbS";
	dkim-atps=neutral
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9686510E0F7
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 02:20:36 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e3983426f80so3865979276.1
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 18:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1739240435; x=1739845235; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=20FdfRDmaMCBxBSiRUEEU1NZEiwEhpnUNG3KvJ2cQK4=;
 b=Jjj/TMbSBY/aq2dCJ/vLcdy7pqkkIhAB+UuqK5V7IqJ6UC3sWVUxTMC8gRNy78HDYQ
 uF8ONtBUspdxeKAGSZTWM4bIqfQlyGICx3/izA6/YBOWjMrWFqHpbc70BfcOzHbXs2lN
 f5E/+0dUDv0D45qY58v/6od3j0yBfc13fWiimv+VyBbxABkQ0lUpC+Ycqw2FCMcddECp
 RY06adKCgx7ckTA3RMBhpquQtwZdzsady2sOD97Pvo2xlkCP2QdWWFvwIGT630WDZbsP
 2M294D+K2ONqXIpMTdniM/MwNc0WkmVIfjqzbqtYc/r9PziiAOricxjWSuh0s2svdC6C
 dE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739240435; x=1739845235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=20FdfRDmaMCBxBSiRUEEU1NZEiwEhpnUNG3KvJ2cQK4=;
 b=IAOnozkM71ipb5v17rZK5bocMBldanmmLMup3S3ttAEHPBRJ+HZD1GNG28n99siI3v
 MCM6ohhsgnL3vN2vmXxjZmBQ2q0aG/YYccRW6M/UIY+yZs8K8KpF54Jph3N/OffUan64
 M9Vm6bsy6NpYqmn2E6djcOvWMGaCiJ54mpg/4dKcxa4tNN635qDlthIk8bnM1ngILQRY
 Rfqo3z0vE+1ZrbRYiD225F+bCxpGRfiOWvkTx7DMOCJflTc5xjkau9wZubIbhVKQjNQc
 XDuqlOu38xWJnMLWpqb4rapwvqVYD6NrqXli2il/S311ZW+dEmMVRp7cAFYAcdsdTjVO
 Am0Q==
X-Gm-Message-State: AOJu0YxLBwAH4EBdtDof9lN8RZh3lf5EejrNFuPiDfrEaMG6q9XEBhUd
 l5hQwe15LFh8kNrlC7KzguOh2UV5USgPCwpMbFqar0x1Cp+OriDAPtl+pBzTSJ64wxtKKz9Vlk8
 ZDoc=
X-Gm-Gg: ASbGncv47u8hlC/vWsMSnIEKMONDec1eKzCNeH2J9zYJOBLpktZuQDESMX+tdfbPHhY
 GvUnDQcAHiIas6hfcErY4tBuz31mB8Xa8KhsJdARH78u/TGDcMeD+TgYunVL07pKYc9QPtluGZu
 jhrToPt5qJ5b5rB9BY+6Sw3Hi1VJyaVNPbqZc4oMyWVb6aAnUTEqNbim3Ir+L97c2vhsoqOTcz/
 fzpvWIe4du4rHwAZnrHQzy4G2TDn6dTYi/t1+vD3xBnqhataWJp5qVWsDcN5Wp/c+ouO2QX1tbQ
 /PxmmSw05fGaONDq+Re476f2hDF6dlaph0dmTzENx+e8llBS
X-Google-Smtp-Source: AGHT+IFcZlOIKTGp0hCQXmNPOv35BtC7RyRFuIsEfcKxDJeXKL0/Egj5fnt1TwBLXNM3gy+ZyhR7VQ==
X-Received: by 2002:a05:6902:2e11:b0:e44:82ef:395b with SMTP id
 3f1490d57ef6-e5b4624e989mr15040584276.32.1739240435407; 
 Mon, 10 Feb 2025 18:20:35 -0800 (PST)
Received: from nucskully.lan ([192.254.97.188])
 by smtp.googlemail.com with ESMTPSA id
 3f1490d57ef6-e5b3a203ef8sm2860928276.13.2025.02.10.18.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 18:20:34 -0800 (PST)
From: Carlos Santa <carlos.santa@intel.corp-partner.google.com>
X-Google-Original-From: Carlos Santa
 <carlos.santa@intel-corp-partner.google.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, lionel.g.landwerlin@intel.com,
 rodrigo.vivi@intel.com, carlos.santa@intel.com,
 Matthew Brost <matthew.brost@intel.com>
Subject: [RFC v2 1/6] drm/xe: Add properties line to VM snapshot capture
Date: Mon, 10 Feb 2025 18:20:01 -0800
Message-ID: <20250211022006.23234-2-carlos.santa@intel-corp-partner.google.com>
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

Add properties line to VM snapshot capture which includes additional
information about VMA being dumped. This is helpful for debug purposes
but also to build a robust GPU hang replay tool.

The current format is:

[<vma address>]: <permissions>|<type>

Permissions has two options, either "read_only" or "read_write".

Type has two options, either "userptr" or "bo".

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d664f2e418b2..130c31775787 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3379,6 +3379,9 @@ struct xe_vm_snapshot {
 	struct {
 		u64 ofs, bo_ofs;
 		unsigned long len;
+#define XE_VM_SNAP_FLAG_USERPTR		BIT(0)
+#define XE_VM_SNAP_FLAG_READ_ONLY	BIT(1)
+		unsigned long flags;
 		struct xe_bo *bo;
 		void *data;
 		struct mm_struct *mm;
@@ -3419,6 +3422,8 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 
 		snap->snap[i].ofs = xe_vma_start(vma);
 		snap->snap[i].len = xe_vma_size(vma);
+		snap->snap[i].flags = xe_vma_read_only(vma) ?
+			XE_VM_SNAP_FLAG_READ_ONLY : 0;
 		if (bo) {
 			snap->snap[i].bo = xe_bo_get(bo);
 			snap->snap[i].bo_ofs = xe_vma_bo_offset(vma);
@@ -3432,6 +3437,7 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 				snap->snap[i].data = ERR_PTR(-EFAULT);
 
 			snap->snap[i].bo_ofs = xe_vma_userptr(vma);
+			snap->snap[i].flags |= XE_VM_SNAP_FLAG_USERPTR;
 		} else {
 			snap->snap[i].data = ERR_PTR(-ENOENT);
 		}
@@ -3501,6 +3507,12 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 	for (i = 0; i < snap->num_snaps; i++) {
 		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[i].len);
 
+		drm_printf(p, "[%llx].properties: %s|%s\n", snap->snap[i].ofs,
+			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
+			   "read_only" : "read_write",
+			   snap->snap[i].flags & XE_VM_SNAP_FLAG_USERPTR ?
+			   "userptr" : "bo");
+
 		if (IS_ERR(snap->snap[i].data)) {
 			drm_printf(p, "[%llx].error: %li\n", snap->snap[i].ofs,
 				   PTR_ERR(snap->snap[i].data));
-- 
2.43.0

