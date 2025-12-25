Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3209BCFD64F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 14:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFE810E5F7;
	Wed,  7 Jan 2026 14:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJw5gG+S";
	dkim-atps=neutral
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FF512B8DC
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Dec 2025 15:14:26 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-598f81d090cso7136906e87.2
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Dec 2025 07:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766675665; x=1767280465; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CRsUoCK6ChAGV/EtS0TA3rEDcBe8J8WItk/OJdEL24A=;
 b=NJw5gG+Sl2ZDiGbWy+/SaHIVfip1VuclM9OqU3V90Cnb6tZ5fuesydrEP2nddwO+rp
 6o+cJXdJuqocVEKXfJN3TwTcfjCp2b88z0lwiGOVOnm0re4y1Q+304ysNAYPOPzJhmtW
 skdB+wM5IHMPtvtzXsB+kZD5aCZlORwqWscV0nMBlsC/hwTmzHvcaRhwNXjs/QgxvK7/
 BaMBtaiFbh9my6e1LJ6bxTFkfiCQhY4NXqAL2l1ChfXdZaKSnJKiLOAVl8WUw01JI1A0
 nDWuJw9OOxZg0kSmzZNUbQVLgN9ngu/CJ3dd0XbNELHjq2p0TIZ35q3PH81c8QHOkB66
 OHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766675665; x=1767280465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CRsUoCK6ChAGV/EtS0TA3rEDcBe8J8WItk/OJdEL24A=;
 b=H+Q2X1U7sGEjZGcxvV1zhHdcUyhBpgkOzR+Tb2BzLfKLBw5sssRyyCa0NG+xQYbfqM
 6QtP03ENUSJF55cDUq6bQeZvFBFJnYnc/9PeOJj/J1YWjuXTv+U+fRmDDRwbgEMG7Jl6
 dH9o/m+UtP922fCzGo+dEqbRyYTqNRRP0VFnWZdsnm6Y5lhF10m7xG4Sud9tfpv8GBpJ
 Oal+RU9KOwY/1pa6nVBl/5JxtdEK3GjUrlFucJ/rp/J50rMqyxuMVr6pA/qAxpvNI5mp
 +jUGQwzc+asSc3BJmE/b6QKzujf7hn3gZQVdBAUiYinP57s9GQ5o1Nj2ass5awyRyh/h
 lATQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4SpsNr/FToi9Kl5avfnCv4DPPbnf3QHS+UHPECc1h6z7SFWXFEIDS518TMAmKyxjmEAsWLSZqbQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXqX8DdqdhJyE98pCN8Ht801DwFEAKHXWEv8I/l7E+dlbQDlEn
 U82CObrGnFiyMYzPN3wj5Lfvv4zxEMEsPxm5wPxTYUmpbL3nGVGYQcr1gR1SJA==
X-Gm-Gg: AY/fxX4D+WfQ/zPK1eMi31NIE0eBh9YrVD0+459EoTfvGWuRtEG0h4gNhCxPTsQPKGa
 Gzeg34d17LFyrYWwseRln3rKtdNNqoPnkhfWYsODGLFOn5ndSYtPGj+g/TMLh+u/ct+4Jnvivj1
 X+iLxMAvG4YS1DBtNfMTBTGSXeleCtruqu9beBBFllxFKYQjE0H85e0e8WzKuqttxGhq7CNTg8z
 3Ayh8bnFJJnA7taagIXR58P5+3h+8eGoLaCBNWNhTKCypPJAlSKOpE1ghY6w/8Bfa99ZPPQpkDY
 NvcM+0+ux3kPQUlTBq99ENJ8OxG9tE4c2kZw8jjE5uowWdH5iJRrvpS2mInpH2Fvp2UKT/5R20v
 5qyWUZPY/IVUrLzMO0/vMwfuxcJBB0MaPZTP2VCB2B5xrwPfxaz0MwxAiGuPjoAizTHKTOmfA0c
 ji17090bhQcGzPb2jMmxrvZxsCCJeOTYhOcJYR
X-Google-Smtp-Source: AGHT+IG3fUB1OsaIHa7q7zKQFUnyBJ8l/j3vz64gfQ66ecODeQkSk6h74hXbYooIM/aC2AokrIX88g==
X-Received: by 2002:ac2:4e0a:0:b0:594:2db8:312b with SMTP id
 2adb3069b0e04-59a17cff3c1mr6593946e87.7.1766675664468; 
 Thu, 25 Dec 2025 07:14:24 -0800 (PST)
Received: from localhost.localdomain ([176.33.67.19])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a186203eesm5866402e87.77.2025.12.25.07.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Dec 2025 07:14:23 -0800 (PST)
From: Alper Ak <alperyasinak1@gmail.com>
To: michal.winiarski@intel.com
Cc: Alper Ak <alperyasinak1@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, kvm@vger.kernel.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] vfio/xe: Fix use-after-free in xe_vfio_pci_alloc_file()
Date: Thu, 25 Dec 2025 18:13:49 +0300
Message-ID: <20251225151349.360870-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 07 Jan 2026 14:19:15 +0000
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

migf->filp is accessed after migf has been freed. Save the error
value before calling kfree() to prevent use-after-free.

Fixes: 1f5556ec8b9e ("vfio/xe: Add device specific vfio_pci driver variant for Intel graphics")
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 drivers/vfio/pci/xe/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/pci/xe/main.c b/drivers/vfio/pci/xe/main.c
index 0156b53c678b..8e1595e00e18 100644
--- a/drivers/vfio/pci/xe/main.c
+++ b/drivers/vfio/pci/xe/main.c
@@ -250,6 +250,7 @@ xe_vfio_pci_alloc_file(struct xe_vfio_pci_core_device *xe_vdev,
 	struct xe_vfio_pci_migration_file *migf;
 	const struct file_operations *fops;
 	int flags;
+	int ret;
 
 	migf = kzalloc(sizeof(*migf), GFP_KERNEL_ACCOUNT);
 	if (!migf)
@@ -259,8 +260,9 @@ xe_vfio_pci_alloc_file(struct xe_vfio_pci_core_device *xe_vdev,
 	flags = type == XE_VFIO_FILE_SAVE ? O_RDONLY : O_WRONLY;
 	migf->filp = anon_inode_getfile("xe_vfio_mig", fops, migf, flags);
 	if (IS_ERR(migf->filp)) {
+		ret = PTR_ERR(migf->filp);
 		kfree(migf);
-		return ERR_CAST(migf->filp);
+		return ERR_PTR(ret);
 	}
 
 	mutex_init(&migf->lock);
-- 
2.43.0

