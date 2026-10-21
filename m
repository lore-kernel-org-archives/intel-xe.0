Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E208560A382A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 06:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ixwS69wP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A921910F917;
	Wed, 21 Oct 2026 06:05:40 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4882110F8EE
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 06:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792562731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h/j5EYytItjUwk1/CqHyOHSfaQ3+6rA1AecV+p7hbPA=;
 b=ixwS69wPq4AIEooGIEyG6e351Sh+GO6eBycTqUd5ly1KfR8yn5Cl+zzFZCFMYMAX+gBcOi
 ZchvomH4/mydnXgXHont8ZUOCyEiYO808iMk153IwPJjPQ8b2A5URZriKY3Qbgo4ESR8xy
 eL0aFvYE+hRCGw0laeTIEERr3ieSqVI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-7KYC-Pw1M_SbxBAkXw8h5w-1; Wed, 21 Oct 2026 06:05:23 +0000
X-MC-Unique: 7KYC-Pw1M_SbxBAkXw8h5w-1
X-Mimecast-MFC-AGG-ID: 7KYC-Pw1M_SbxBAkXw8h5w_1792562722
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-48df5b058ddso229825f8f.0
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 23:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792562722; x=1793167522;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=h/j5EYytItjUwk1/CqHyOHSfaQ3+6rA1AecV+p7hbPA=;
 b=g5raZLm7+qWm2Ae2jc6Cnk1IrCBTxr6NWviOCqW++lHpKVVUTRuzfKRLzfxCgONQgI
 x0AiahbTp/aatSsidylyfK2ImGYavs7ODp4KXXsUsEd/HWe79XwJ6UaI6fxL8ke2DV07
 VXWN3VRRWxIVuQzTyn7aPoxb9fX9NKlS4P8yeC8qmGpcMRfPOwOwoEjjg6aC80GEWohA
 Li4o4XRbzRfjt/rIlmbTDqKa78D4nXy7p1Ri2smCTg4M4usBidhX+V0HF3Xp59TWQe45
 sJDI6YrpoHnZZEjkKz6YYQim/NhvInVuOFDcb+GswcAShDgoojlu6dA/Zvau80BhJErG
 lssQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzidJVcz+lv2qGIa/euWwG8JdP1X/zBYDMtLGUR4g6RJvILxt4VUn/KMrGmGxorwuTGukrGYY1noA==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJrrUnK1xK0P1hhkQpUVsLoQ3Kyygartw/+phLiO/w9ySbP4Xt6
 K5cqdzM0Bryo4a9oDFscr576Aus5e33XtanVJNTJI2mpj2NMn0semnVcLgzYpxoZIR/8hFP2pdn
 9Eym5eY2PH5wcQTpNw8ip/XQJK32vNDRyhSYEwNggBGKxELw0NOkzSdn/DnTWSdEdUNw=
X-Gm-Gg: AYBFou2qbO8tFnLbJNUeVoRZLr1tX3vlbHSCGV2HNJ4jbArv9linyPZLrCJ/trgR4EZ
 i5rsL1YwC/Yszw63nr94xjWQDioFeuBWcUHYT/R/eoQTJ+K3ucsR2e+J10Ew+xCmP5WnICWiRJe
 OHEpHN1q3W2vMopuFi8ruqasI4UhmATOUrKKKzmAJRvDIIS3Sj6DQbSeczwwskNZI/Fzvs6Fwpk
 ZhIQ93K+CMl/2WXNgnBHnbyaY+h502uRUD3OXihLb4Lxxu7rASfoS5l0gImuwVIXxgn3bFnkvCS
 89JLJZZoH0ObMd81YTx/UuegdE83fdMjTm64Gj7ahuEa7BjXSuq40+94Z0zK1oovRpnFx8Dh7Xh
 O5dPK9m5MsxVPCyzyML1c3aFtnYg2FVXiz0hk
X-Received: by 2002:a05:6000:2a02:b0:48d:bfd5:79c with SMTP id
 ffacd0b85a97d-48e264d9d19mr1041963f8f.42.1792562721663; 
 Tue, 20 Oct 2026 23:05:21 -0700 (PDT)
X-Received: by 2002:a05:6000:2a02:b0:48d:bfd5:79c with SMTP id
 ffacd0b85a97d-48e264d9d19mr1041925f8f.42.1792562721270; 
 Tue, 20 Oct 2026 23:05:21 -0700 (PDT)
Received: from fedora.redhat.corp (89-27-86-246.bb.dnainternet.fi.
 [89.27.86.246]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e254f02f1sm3413741f8f.3.2026.10.20.23.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 23:05:20 -0700 (PDT)
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
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v16 01/12] mm/Kconfig: changes for migrate on fault for device
 pages
Date: Wed, 21 Oct 2026 09:04:55 +0300
Message-ID: <20261021060506.2377545-2-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021060506.2377545-1-mpenttil@redhat.com>
References: <20261021060506.2377545-1-mpenttil@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UAuZIP9zXNkCgzIhdWQzD3XLVE5vzbqu5vHB7yMrjwM_1792562722
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

