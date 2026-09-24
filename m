Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BFDC98316
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 06:53:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865FA10F30E;
	Thu, 24 Sep 2026 06:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cg0AAlg+";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB6F10F30E
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 06:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790232815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h/j5EYytItjUwk1/CqHyOHSfaQ3+6rA1AecV+p7hbPA=;
 b=cg0AAlg+T4e8SoiFKy7kbgHE4WwhHAIOPh7rQw79WqiqJnp+HXkWJ1xhCtBw02dOPuFOfI
 gt1H/3J6aybmE+59zcaSuGMQ6dE/Ylt3oyc32/svFZWWGrcbUvzAS52ZmPUx7K2wFdt1T5
 f5D+21IHnYeqnUJG4AiC+6S3uNl0aLo=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-RBK0zHtDM-KjwjjTgYsulA-1; Thu, 24 Sep 2026 02:53:33 -0400
X-MC-Unique: RBK0zHtDM-KjwjjTgYsulA-1
X-Mimecast-MFC-AGG-ID: RBK0zHtDM-KjwjjTgYsulA_1790232812
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-3a5b062d0dbso3515001fa.0
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 23:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790232812; x=1790837612;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=h/j5EYytItjUwk1/CqHyOHSfaQ3+6rA1AecV+p7hbPA=;
 b=reKA/hv7SFgvBgdk7NkmsHAuKLrxTqjMr6ZPNAukoiehx0A/SnJ8kMSiHbcBzKole4
 M9RbkbsiPoCggNSxwy3c6xSkkUTGV+/YMlKmTdBm/CmUHb6I8E+TV3y5O1KW8T2WNTc1
 8tnSxM8u9zssCCncwlyhupp1WW105O09SJ/VcRR1eUztINFABJuUwd4yYRfa+iZ5jNCc
 C/hQ371q3UhHEvCcapEM3XKBsKJT6APLZXbwKxj3ZH/j7ZogLzqHP0LzWULjnb4G9WtI
 JMX2cTogKlq92tizlUUxGcCv7wef1O87JI4ZYWia0uKjYQvlXf/QGgM6ZjITXAbP0323
 Quzw==
X-Forwarded-Encrypted: i=1;
 AKwUvBw74rhmF1RPpOY/zGhfRbS4vNw3a+zjiaeM2c5i16uvolBwsXf0korWA6rzz1NBXTXHH8JIQJyjWA==@lists.freedesktop.org
X-Gm-Message-State: AFuF++kyXjNgbouhW2AjB1z+RVldIWJ+MavcLDwMFprrMa9i5S5sJERp
 F3mTvfc2aXrdZlLhij0EKxCDQa8rHAviV9ukKlnSBGfqPBlAWvLrZAoDcIL8QbGPK92YqPJXzC5
 Zm7co4g3Uriibga5hsebjBFlFqpqSNcJGYzCLwQAURY4Chky01JEYZjAN4McjZ9TsaOw=
X-Gm-Gg: AYBFou3nVepZueYqoFu9CAPgf57K65JKoCTHKl28L+cDYtJ9MchOxNi9910jNCQ4MtB
 4Sq2AYVv6N/+d29BnxNX+G6bXZWWhFh6cercoFD4HNmiUsYFcESTlhYvTPnJBmrZp7Is+U8M7EP
 TbvAVd+BMRcfJwUclmSqtDvFGfqS2fNx/BarZBV5bGottYkSfmeqcLkW2zAy2pJaqya7I/XoxkI
 t5InWHnYqi38d3fv1xYnqKibDpsSNCPVMJy5grwzwIfZrQm4Y1toqkzZp8PH12pDy/v90gynk/d
 l7l3+tI7GSdTxwsa+MMW3P0FI35WZanFenN8T9qfkDJDDWPCU7UcgwMfxCg3Rji3dZXhebVAWV9
 3dkHRIFX8OWmPoKVZs+M5
X-Received: by 2002:a2e:a593:0:b0:3a6:d50:e26e with SMTP id
 38308e7fff4ca-3a63bf1c44fmr3484661fa.2.1790232812382; 
 Wed, 23 Sep 2026 23:53:32 -0700 (PDT)
X-Received: by 2002:a2e:a593:0:b0:3a6:d50:e26e with SMTP id
 38308e7fff4ca-3a63bf1c44fmr3484571fa.2.1790232811952; 
 Wed, 23 Sep 2026 23:53:31 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a63bf57909sm4803141fa.29.2026.09.23.23.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 23:53:31 -0700 (PDT)
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
Subject: [PATCH v15 01/11] mm/Kconfig: changes for migrate on fault for device
 pages
Date: Thu, 24 Sep 2026 09:53:03 +0300
Message-ID: <20260924065313.899730-2-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924065313.899730-1-mpenttil@redhat.com>
References: <20260924065313.899730-1-mpenttil@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O0RJ3_Z6_smRXuGJuBiTaDXaPhyFWucCbW2HR_rpDHI_1790232812
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
Acked-by: Balbir Singh <balbirs@nvidia.com>
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

