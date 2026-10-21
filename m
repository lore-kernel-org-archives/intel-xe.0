Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FF260A2600
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 06:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cu5UxCGA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADA410F8EE;
	Wed, 21 Oct 2026 06:06:14 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558C710F8FE
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 06:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792562761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xEEzUKmwPcuLDb8KHUBfxekosp3Yw5qO1BP0yTFVDsQ=;
 b=cu5UxCGACGg9MKTvK86OkGYVINzLDW4YTdmOUjyeQiSC39UtFP43LG9gE/JXtL0so8wdGv
 324vNEwtCRqqiFy7+FiPXMNCtxv2sZ0qs/VmpbeckQEfWBFnaVV+HPFzxnb3v9IzYuin6Q
 TCnozGvlavjJlndKwS1E5h8Xi7T1wow=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-rQR6-mQzNiCzwz4hs0LS5Q-1; Wed, 21 Oct 2026 02:06:00 -0400
X-MC-Unique: rQR6-mQzNiCzwz4hs0LS5Q-1
X-Mimecast-MFC-AGG-ID: rQR6-mQzNiCzwz4hs0LS5Q_1792562759
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-48b01a74792so227144f8f.0
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 23:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792562759; x=1793167559;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xEEzUKmwPcuLDb8KHUBfxekosp3Yw5qO1BP0yTFVDsQ=;
 b=vxh82Ow4T51vGTlnrNkEuGKw8ri5sgazR+0iF/zyj7enXvlCRqZCvSYu0b4xYY0ExO
 GXwJbY9+r/4v7pMlxcgVvTNR/LTu4gstO3bHPNplFobElxEw0HR4b8YPPcInscCx0X9l
 IDgHkXOcXEHsd3gPoAaS5Jsrv0WxQDDWFJ6YB/Q9wBANz1zJAnw8RRa6kBva73C4ZCSw
 qGnTMQzgbvuNo1QWTG1cD1wHKDuFb31pcItNuVK5o1/H0Lye9hYcQTdRhiUl7XN5VTyW
 m4U8blxlcU7V+Qc+wS6byAUBXWnAOkELWyw/R6w1SlFihN7TbYWdWV8vFQHeRT5vQ8yR
 t3cQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw9BjAk+xMglw6J3pMMTPetuCB5ojGm5D5i89lT1TyHwpwEZYnZ7D5JeiZT4Cd+N4WQ1shj0N8c4Q==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYL1JMlpAAkPZzYynz3dXKUryBtlZLRp2McsKjPahnEyfGDx1i7f
 MHz/VXBGQTikh/SOob7Vvq2Es8PblHVFdtiGhrw/UjjqCB+oijdKItm8KS9EjqSeXZzp0Xnm7Nh
 8djw/++3xqeObA9X0MgCZU9s/XT++x4XX/odKLvjff9MMkSNItIk85CtvpO0s6wLARNY=
X-Gm-Gg: AYBFou1uJz8q8HOTrlNIK/E+OPsWJ6d3tFTqIIq5O22b9Ss3P8pzzThZyxL3D3gj0Hp
 8wCp3pxguUUTHVJF5h03GmEl7znEbvcby60Ck2rNBNp/9zfjB3YV+inpSD7QEQzQ5ySksKkDmlt
 ajMWb8YsmaL/jLpB2luLKfzc8//vz34kaB6tR9dvb+a0TEjaH1E2maoaiIfjyfoSsPVNYBx5+VN
 DQgcYDWQeWFnesQOrgbf06vmbAT4hcuPwWt/d+j0qqlv2JjrkrbXq3wpDE8WzA0mxAeigWkJ7mq
 MXbpUcfr5szBXHa2q1OqlGmyuq1RRbhsKjYeKTDbdV+JX/Pnb1yKgbq4lSjMV2O9xuHEX0SeyfH
 20u83Si08ZwFlrSc5v5fxYb8x7CjY7RvAYVLP
X-Received: by 2002:a5d:5d03:0:b0:48b:69d4:bb35 with SMTP id
 ffacd0b85a97d-48e26493dfamr1855069f8f.12.1792562758629; 
 Tue, 20 Oct 2026 23:05:58 -0700 (PDT)
X-Received: by 2002:a5d:5d03:0:b0:48b:69d4:bb35 with SMTP id
 ffacd0b85a97d-48e26493dfamr1855003f8f.12.1792562758183; 
 Tue, 20 Oct 2026 23:05:58 -0700 (PDT)
Received: from fedora.redhat.corp (89-27-86-246.bb.dnainternet.fi.
 [89.27.86.246]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e254f02f1sm3413741f8f.3.2026.10.20.23.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 23:05:56 -0700 (PDT)
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
Subject: [PATCH v16 11/12] Documentation/mm/hmm: document migration through
 hmm_range_fault()
Date: Wed, 21 Oct 2026 09:05:05 +0300
Message-ID: <20261021060506.2377545-12-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021060506.2377545-1-mpenttil@redhat.com>
References: <20261021060506.2377545-1-mpenttil@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5GvtsTXx28YnPanz9xCk6brJYuZ0BpcBVoMh5WxWa04_1792562759
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

Describe the two new MIGRATE_VMA_FAULT / MIGRATE_VMA_WRITE flags of
migrate_vma_setup(), and add a section on driving the migration
collection phase directly from hmm_range_fault() via HMM_PFN_REQ_MIGRATE
and migrate_hmm_range_setup().

Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
---
 Documentation/mm/hmm.rst | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
index fc1b8dc19825..58424e5f5873 100644
--- a/Documentation/mm/hmm.rst
+++ b/Documentation/mm/hmm.rst
@@ -348,6 +348,13 @@ between device driver specific code and shared common code:
    Currently only anonymous private VMA ranges can be migrated to or from
    system memory and device private memory.
 
+   By default only pages already present are collected. Two additional flags
+   ask migrate_vma_setup() to fault in missing pages first:
+
+   * ``MIGRATE_VMA_FAULT`` faults in missing pages with read access.
+   * ``MIGRATE_VMA_WRITE`` faults in missing pages with write access
+     (implies faulting).
+
    One of the first steps migrate_vma_setup() does is to invalidate other
    device's MMUs with the ``mmu_notifier_invalidate_range_start()`` and
    ``mmu_notifier_invalidate_range_end()`` calls around the page table
@@ -427,6 +434,38 @@ between device driver specific code and shared common code:
 
    The lock can now be released.
 
+Migration collection through hmm_range_fault()
+==============================================
+
+The collection phase of migration (steps 1 and 2 above) can also be driven by
+hmm_range_fault() directly, sharing its page table walk. This lets a driver
+fault in and collect a range for migration in one walk, which is useful for
+migrate on fault.
+
+To do so, the driver sets ``HMM_PFN_REQ_MIGRATE`` in ``range->default_flags``
+and points ``range->migrate`` at a ``struct migrate_vma`` it has filled in
+(``flags``, ``src``, ``dst``, ``pgmap_owner``). Usually ``HMM_PFN_REQ_FAULT``
+(and ``HMM_PFN_REQ_WRITE``) is set as well, so missing pages are faulted in
+before being collected. The mmap_read_lock() has to be held for the whole
+migration, since the vma must stay stable.
+
+hmm_range_fault() collects the entries the same way migrate_vma_setup() does,
+taking a folio reference, locking it and installing a migration PTE. Collected
+entries are marked with ``HMM_PFN_VALID | HMM_PFN_MIGRATE`` in
+``range->hmm_pfns``. If the page tables change while locks are dropped the
+partially collected entries are rolled back automatically.
+
+After hmm_range_fault() returns, the driver calls::
+
+    void migrate_hmm_range_setup(struct hmm_range *range);
+
+to translate ``range->hmm_pfns`` into ``migrate->src[]`` (``migrate->dst[]`` is
+zeroed) and initialize ``migrate->cpages`` and ``migrate->npages``. From here on
+the ``range->migrate`` struct is ready for the rest of the flow (steps 3
+onwards), i.e. migrate_vma_pages() and migrate_vma_finalize(). This should be
+called even on error, since hmm_range_fault() may have collected part of the
+range before failing.
+
 Exclusive access memory
 =======================
 
-- 
2.55.0

