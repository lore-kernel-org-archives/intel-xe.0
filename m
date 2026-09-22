Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8862C98308
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 05:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB56410E6C3;
	Tue, 22 Sep 2026 05:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="g60ONGKw";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C9810E41B
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 05:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790055291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RZqncuA8V9KN45lL/iPHOVqmTI1CzmtLR7XQjhWRrog=;
 b=g60ONGKwQnfPvuIhnY36UaV6SiNgi6wrGkB2+iWMVYESe8d6dS+7ehwmZ4BGTyVPtbgVLZ
 eKOZxOZC1C0MvfhImah92737iSyq+to6QErAEoZkG6BOaVPM/B352LhHhokrPHbRX0j5Rh
 J/oJ3cEXf1pRTLyuPCgHe6E5mRgmDmk=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-t5sOSvdgPqy5GvqHEAsQdA-1; Tue, 22 Sep 2026 01:34:45 -0400
X-MC-Unique: t5sOSvdgPqy5GvqHEAsQdA-1
X-Mimecast-MFC-AGG-ID: t5sOSvdgPqy5GvqHEAsQdA_1790055284
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-3a4b6a1f50eso5312511fa.3
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 22:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790055283; x=1790660083;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=RZqncuA8V9KN45lL/iPHOVqmTI1CzmtLR7XQjhWRrog=;
 b=x1KqR/gVl1ok3bIJyMGmGyIdjZaMqPoxZLRY3f4VueP0W5o5hLcdexiKicJVapKri0
 5oWZvIAlMAEMjY7DwY/OzVozWtuYf4W4EAOQFiyRHwWKwShRZgnDbSL49Wm/YJwFbt8q
 40ERS1zCRnd86pr3RYH7P/Ir92q4bUbjDhBS95Uq/d8PEfBO9eJHb+kT8CaWHCphNh7H
 i4NGu10iEEAvGx3PVkUuml9GtnH1Lzb7F4Q0CYtslRZIE3AeTZVjNhIefjlGIKZcDQKa
 utydfgYNAzquMNIyqXNtX7maUJk9BsI/tyUc8rJHq/aC0AmuRP/eMIT7gEoEx9efN3ul
 GrNA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxSWKrotetd+3awDULbZdrh0X5IAvtjTI12X+9SYltXUi9Z73XwpOhJVexsKZ517EgsHC/R9fYXUQ==@lists.freedesktop.org
X-Gm-Message-State: AFuF++l1nvLvvfRKebg/ZP/yegdjSsLWO6L+pXPI6n1g18Wy87r/XjgR
 p7ulzSJPX1yC/deubfNuVnm5vMsJo06oXHdw73EdZLOM6dPfaDs9pndizdol2b4noA3uZ6urwMB
 zs63TzoOX3Nyj/HcjPgy11s0L6egiB5DKI//eI4LOFPF8g/zfekD7Mi8OyGRL9KIpZrNHbltjcI
 qPWA==
X-Gm-Gg: AYBFou3O+j0coOcfc17gw/b0JeQc01KiJOItI7C12Xcyo3ZBx+Ub+UehlI/EaIJMsNH
 /IY2qHD2OKW0hB0YFOcpMKM8ExtUzfRK4iKrh9RcWgvquaFM3nZI9/tFgGH1/euUhcvaHbP/hMc
 3HX90Ml5PBi6sT715XNkEtVXhxYhZPM8txKp3cvhJ6m7hCoQv+s+jPvdxMTHuxL72f5qBeuiSbz
 xIQU/Fo3HJ/QM2clLU/iN0MhevK7vcKunJENKZb9mshr9Hmjvxf0og1lQrfGV/pElcJBh3vY7lF
 en8tNG0hjNzl3nagkcq6Id5wmBrH02gs98NNoLk86bheYu9PLiB8J/dfOw6tuH7Z3DILlr/ZkVP
 sQpOHehh8Ax8qRvF+mHig
X-Received: by 2002:a05:6512:3402:b0:5b8:b3e0:74af with SMTP id
 2adb3069b0e04-5b8c195ea85mr3626245e87.59.1790055283572; 
 Mon, 21 Sep 2026 22:34:43 -0700 (PDT)
X-Received: by 2002:a05:6512:3402:b0:5b8:b3e0:74af with SMTP id
 2adb3069b0e04-5b8c195ea85mr3626231e87.59.1790055283051; 
 Mon, 21 Sep 2026 22:34:43 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b8d46e0966sm191742e87.55.2026.09.21.22.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 22:34:42 -0700 (PDT)
From: mpenttil@redhat.com
To: linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Subject: [PATCH v14 01/12] mm/Kconfig: changes for migrate on fault for device
 pages
Date: Tue, 22 Sep 2026 08:34:10 +0300
Message-ID: <20260922053421.4092027-2-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922053421.4092027-1-mpenttil@redhat.com>
References: <20260922053421.4092027-1-mpenttil@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NTtQcCVh3eHUlppfxOwKfQrZkVRRT0S7xxKkuwU1rIU_1790055284
X-Mimecast-Originator: redhat.com
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

From: Mika Penttilä <mpenttil@redhat.com>

HMM depends on MMU notifiers. With the unified HMM/migrate_device
page table walk migrate_device needs HMM enabled.
Enable them explicitly to avoid breaking random configs.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index 604c58199acb..b7a485beb9a7 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -687,6 +687,7 @@ config MIGRATION
 
 config DEVICE_MIGRATION
 	def_bool MIGRATION && ZONE_DEVICE
+	select HMM_MIRROR
 
 config ARCH_ENABLE_HUGEPAGE_MIGRATION
 	bool
-- 
2.55.0

