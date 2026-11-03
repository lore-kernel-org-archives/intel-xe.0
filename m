Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA09606A333
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 06:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vpz2pNxY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699A910F37E;
	Tue,  3 Nov 2026 06:17:34 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEBD10F38C
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 06:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793686644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TVuWgoTT0NSjTET4nXrhDaEgg40Gfb3itKSJW0X7/Jo=;
 b=Vpz2pNxYWELn+/j32NfSsjYeG/AtFHjj7GTCfAPyjF9u2ORAH2fzhzekQk3PJE8rVR8ymt
 kg2bBI00A3hUs6cQxtozsvqrAYvRGEE01cFHuW+AMk9RFMOvbAtxSFgLpivWzIhcpb7th6
 Ov8UcEVMdHX7hQdqvOYYIHORFxrOJIk=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-PH4fVtH9O1WwPUe9DGGK_Q-1; Tue, 03 Nov 2026 01:17:23 -0500
X-MC-Unique: PH4fVtH9O1WwPUe9DGGK_Q-1
X-Mimecast-MFC-AGG-ID: PH4fVtH9O1WwPUe9DGGK_Q_1793686641
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5bfd01da578so152526e87.0
 for <intel-xe@lists.freedesktop.org>; Mon, 02 Nov 2026 22:17:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793686641; x=1794291441;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TVuWgoTT0NSjTET4nXrhDaEgg40Gfb3itKSJW0X7/Jo=;
 b=Y0y6NHiHmMzC0MVtuGTvbjp1xxaK0GkQajOdG4DTcGARldAWVQxy5PXjqjdLhbtu3a
 WWWJWRsRZCMt139Gy/cRYw5Z1KrermzX6/F+21PwNBBVXF9PL7sQ2E1P5ko4DnP0atf9
 cWwqW+xuOMWVc/ywYzRj2bTrxSq7tWWQOsw/V2yOYnfHz+zL82CQUKutLlLhEeJGJR34
 9NVZv6LkgAFKTBtOmJ7IuOirfaR+KiTXz1/hNBnQlKcgtQPqoV3wOLdDC6Ozu2cDhjKj
 y/Xsa/nupCsUrIW8xSth4ef056pQ+NQUt7+tUkrPDpro+vQGwio0XLLtVDDvwRW5znHM
 Hm1Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBya4ugn82e54P3zVCeR2/CdX5JFfPB4KcvSuvA5JRwZWKVXp7Z5g28vTk3n8/bpWviy2v3OWCMORw==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9yKzyg1Ww8IHjGIGVf2/1bAHLH+0U99MIWZAJJ5u8gOIWXXy9s
 udct0QxRx3337DmYGrKhoUab82JT0LAyeXQLc66F3AUeA7NQZmWc09k6/8cAzDRiRvaBAh+20Y9
 bZGjaMdEMWi0jDywcePYHVbGitqSHwT4tIEeNCSiOb7xKnOjEBIiqFRXkXyLUeNysvqA=
X-Gm-Gg: AYBFou2GK7jZhVX1IfA5/P1rSkBm3zwI4HBFNIFxPTMiVriFXXW7Vh4ZP6Q2RkLWS3p
 JjkYceb1iGDh7NNdiposSYUrnNQLOFtP9Pihq/ZVhJKUEqTP2zkourPPOfl1wcStanBBjdm/L0a
 DR+USEdfZvG2vy34MhBQyZIyAoQwVHA/EGWA60Z8eQM6D9F///ZxnadEuyFPSZ3kcQaNa4Xoep3
 ER9tGDO/Wnn0hyOBwTPw0T0qOPHOiARfwl71zws3nK3r48/GC+NrNulofX73yjrOR6Pgimigg7z
 8RSFFe7jxGJr8xQ88gX1Ql/MeF5uxFUZ/oZO4QIW6z4QkzKpK+FrPlDempXdYCar0yxAgQbH6yN
 IgcPms0aA27JlnevgXXU6uJts2maMayaux/wFBy9oyBZuPxTRDkyRnKonZAI7QGjelu+kaA==
X-Received: by 2002:a05:6512:a83:b0:5ba:3e27:6a32 with SMTP id
 2adb3069b0e04-5bfd12073cfmr4453058e87.29.1793686641418; 
 Mon, 02 Nov 2026 22:17:21 -0800 (PST)
X-Received: by 2002:a05:6512:a83:b0:5ba:3e27:6a32 with SMTP id
 2adb3069b0e04-5bfd12073cfmr4453033e87.29.1793686640906; 
 Mon, 02 Nov 2026 22:17:20 -0800 (PST)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5bfe073e0f9sm1964634e87.54.2026.11.02.22.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 22:17:19 -0800 (PST)
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
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v17 11/12] Documentation/mm/hmm: document migration through
 hmm_range_fault()
Date: Tue,  3 Nov 2026 08:16:28 +0200
Message-ID: <20261103061629.972669-12-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103061629.972669-1-mpenttil@redhat.com>
References: <20261103061629.972669-1-mpenttil@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -Du2fxqabgzn4S1GWusvzt790moJrwP32dP4vY3gt-g_1793686641
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
 Documentation/mm/hmm.rst | 45 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
index fc1b8dc19825..914ef6bfe848 100644
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
@@ -427,6 +434,44 @@ between device driver specific code and shared common code:
 
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
+Migration requests come only from ``range->default_flags``:
+``range->pfn_flags_mask`` must be 0 and ``range->dev_private_owner`` must
+equal ``migrate->pgmap_owner``. ``range->hmm_pfns`` is cleared at the start of
+hmm_range_fault(), so per-pfn input, including ``HMM_PFN_INOUT_FLAGS`` such as
+``HMM_PFN_DMA_MAPPED``, is not preserved across a migrating call.
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

