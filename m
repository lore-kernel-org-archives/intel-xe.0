Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9F360A4AF5
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 06:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bNNPD+2y
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A1510F917;
	Wed, 21 Oct 2026 06:05:59 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C24F10F90B
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 06:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792562751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uJkX/xjNUMT8lfIvEdgG314iYnxdnOBpym4KTOp3llE=;
 b=bNNPD+2ySwUsDKEKsizHHebKmAAmw4soB3/FM5iZVepS7YIGyS1zJWr6YO516dMiIcc+B0
 iT0DhlcDfueJ3fz9pES/ByaleftLkh/TCZouN6qslNw0C2asfqMz+N2Guk5DxRKdzNe+jk
 FjPNeVMJbROUUgUqtGKMkkhokLT/H8w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-HzwP4fNMNuymkQbZxgurWQ-1; Wed, 21 Oct 2026 06:05:48 +0000
X-MC-Unique: HzwP4fNMNuymkQbZxgurWQ-1
X-Mimecast-MFC-AGG-ID: HzwP4fNMNuymkQbZxgurWQ_1792562748
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4a1dc95bd3bso2124235e9.2
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 23:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792562747; x=1793167547;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=uJkX/xjNUMT8lfIvEdgG314iYnxdnOBpym4KTOp3llE=;
 b=zSt3Ltr6/I4ipx2wU8MF0/neUrgEA6pYKWIsa9lEYyi6uGSvJN6mZUlvXJepkYzC4v
 Jq8QRwnED7InVpAJBLFllGSbMl2wd/kreCWL8GhUGYYiPk9EwXUja2furNVIlJrTHdfn
 ST1a+8qqN9HUVBYG4ObrmR6kNuJmlfG86VZmUN2HjCgkh6zJ1bShIqCHaW/7jThjnDyE
 z+Xme6C9XC3MlY6mNTFV2UZhVyWaFj7c04qQ5xXLO3WpXSRaZJ96ElNHkkv7Rr5N7iFC
 2dKNti7XLpQun4prSI0WWGg2cPUmQOedFTz2PbJMWNuFr9ZgPa6+0KYKzVGi0RLpNI+f
 QKHA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxrX86NNSETYLK349WlcJt9MfN2EL66jmDXG1hHwG9ca21aUQggYITiErgGpcM9Xvu7dK1AMyp9Fw==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIyu145rC6ZT/BS8krPKqr8zXenSkOV4ETLfOQl4HB182h97ZEs
 2GAfMAFGovZ38k1RY35KsbOrsV0S5rbIanaZsDcubXx/v6nNdZSiBBOWX4QBYmshITwc5f3bOZb
 S4SHHnGAlzWiMV/MqgWxK/X5wWjue7qvVzJk1uA2FlIMsnYeKZMQVs6pPLfq7xUMKaF8=
X-Gm-Gg: AYBFou2wM7SsJQdX6WN5nNdu1Km4jfKsvUDBvome8fXEV8xkX+gjP8s0qhKC7/q474v
 VeBlUDhHCoRfsE2ipM2uGIfrsMBHifFW2qBt5ZsNqZ2SiABjz45QAnPPwilx4d9G2FyRr55XGG2
 R1Yrp+Cxkied8itMiE8VWjNmufe9Ins/8FPbQs0GghnC9K703oprWAbpGRkh+TlJLsfErTT6Ppt
 sqIqw5fzUTSkupp9GrpX2bEE2w5Nske2yGv+737COzUFl8hEbYjwRnZdDgWcgiUv0PVsbSXCrKp
 7KomgI5k6lsZMcPEo+qC/glq0BveT2T59R7hualILR+nUDfwDA7OfCQ9Mglh5iumiYa1tJaFvhl
 DEx4b2VOL5Y01RVfMT4fCEGWWakDm34fclU8g
X-Received: by 2002:a05:600c:8012:b0:4a1:ef1f:a27a with SMTP id
 5b1f17b1804b1-4a1fdd396ccmr15655875e9.27.1792562747398; 
 Tue, 20 Oct 2026 23:05:47 -0700 (PDT)
X-Received: by 2002:a05:600c:8012:b0:4a1:ef1f:a27a with SMTP id
 5b1f17b1804b1-4a1fdd396ccmr15655265e9.27.1792562746857; 
 Tue, 20 Oct 2026 23:05:46 -0700 (PDT)
Received: from fedora.redhat.corp (89-27-86-246.bb.dnainternet.fi.
 [89.27.86.246]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e254f02f1sm3413741f8f.3.2026.10.20.23.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 23:05:45 -0700 (PDT)
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
Subject: [PATCH v16 08/12] mm/hmm: implement rollback for device page
 migration in HMM pagewalk
Date: Wed, 21 Oct 2026 09:05:02 +0300
Message-ID: <20261021060506.2377545-9-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021060506.2377545-1-mpenttil@redhat.com>
References: <20261021060506.2377545-1-mpenttil@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NIjDRl8ayk96MCIgIweVJD9sMpsECsdzcpu8_RVVg5Q_1792562748
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

During the migration pagewalk, the PTE table could be cleared and/or
changed into PMD leaf or even another PTE table while dropped locks.

In these cases the possibly inserted migration ptes are gone. We have
to however undo the collecting done so far, so unlock the folios and
drop reference taken.

During the pagewalk we notice such scenarios if going to recollect a pfn
but have already committed to migrate the entry with HMM_PFN_MIGRATE, in
which case do rollback. Rollback clears (HMM_PFN_VALID | HMM_PFN_MIGRATE)
which is safe, as migration is entirely driven by default_flags.

If we encounter migration ptes they are just skipped to allow for restart
own walks.

Cc: David Hildenbrand <david@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Balbir Singh <balbirs@nvidia.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
---
 include/linux/hmm.h | 22 +++++++++++++
 mm/hmm.c            | 79 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 4f56f3419cb4..b08ebc1343dd 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -111,6 +111,28 @@ static inline unsigned int hmm_pfn_to_map_order(unsigned long hmm_pfn)
 	return (hmm_pfn >> HMM_PFN_ORDER_SHIFT) & 0x1F;
 }
 
+/*
+ * hmm_pfn_collected() - is this pfn entry prepared for migration ?
+ * If collected the folio's refcount is increased and the folio
+ * is locked.
+ */
+static inline bool hmm_pfn_collected(unsigned long hmm_pfn)
+{
+	return (hmm_pfn & (HMM_PFN_VALID | HMM_PFN_MIGRATE)) ==
+		(HMM_PFN_VALID | HMM_PFN_MIGRATE);
+}
+
+/*
+ * hmm_pfn_rollback_collected() - undoes the collection of hmm_pfn
+ *
+ * Note for total rollback the folio's refcount has to be put
+ * and folio has to be unlocked.
+ */
+static inline unsigned long hmm_pfn_rollback_collected(unsigned long hmm_pfn)
+{
+	return hmm_pfn & ~(HMM_PFN_VALID | HMM_PFN_MIGRATE | HMM_PFN_COMPOUND);
+}
+
 /*
  * struct hmm_range - track invalidation lock on virtual address range
  *
diff --git a/mm/hmm.c b/mm/hmm.c
index 36a4edde9823..5a1471fd5d28 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -95,6 +95,11 @@ enum {
 			      HMM_PFN_P2PDMA_BUS,
 };
 
+static void hmm_vma_handle_migrate_prepare_rollback(const struct hmm_vma_walk *hmm_vma_walk,
+						    unsigned long start,
+						    unsigned long end,
+						    unsigned long *hmm_pfn);
+
 static int hmm_pfns_fill(unsigned long addr, unsigned long end,
 			 struct hmm_vma_walk *hmm_vma_walk, unsigned long cpu_flags)
 {
@@ -111,6 +116,8 @@ static int hmm_pfns_fill(unsigned long addr, unsigned long end,
 		}
 	}
 
+	hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk, addr, end, &range->hmm_pfns[i]);
+
 	if (migrate && thp_migration_supported() &&
 	    (minfo & MIGRATE_VMA_SELECT_COMPOUND) &&
 	    IS_ALIGNED(addr, HPAGE_PMD_SIZE) &&
@@ -282,6 +289,8 @@ static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
 		return hmm_record_fault(addr, end, required_fault, walk);
 	}
 
+	hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk, addr,
+						end, hmm_pfns);
 	pfn = pmd_pfn(pmd) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
 	for (i = 0; addr < end; addr += PAGE_SIZE, i++, pfn++) {
 		hmm_pfns[i] &= HMM_PFN_INOUT_FLAGS;
@@ -412,6 +421,9 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 
 	new_pfn_flags = pte_pfn(pte) | cpu_flags;
 out:
+	hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk, addr,
+						addr + PAGE_SIZE,
+						hmm_pfn);
 	*hmm_pfn = (*hmm_pfn & HMM_PFN_INOUT_FLAGS) | new_pfn_flags;
 	return 0;
 
@@ -450,6 +462,9 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 		if (softleaf_is_device_private_write(entry))
 			cpu_flags |= HMM_PFN_WRITE;
 
+		hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk,
+							start, end,
+							hmm_pfns);
 		/*
 		 * Fully populate the PFN list though subsequent PFNs could be
 		 * inferred, because drivers which are not yet aware of large
@@ -568,6 +583,51 @@ static int migrate_vma_split_folio(struct folio *folio,
 	return __migrate_vma_split_folio(folio, fault_page);
 }
 
+/*
+ * Due to dropping ptl locks for splitting for instance, would we
+ * overwrite already collected pfns? This could happen when pmd
+ * pointing to a page table has vanished and been replaced with
+ * a leaf pmd, or another page table. In that case unref and unlock
+ * the folios, the pfns of which were collected from the disappeared
+ * page tables.
+ *
+ * Migrate mode drives fault/migration requests only via range->default_flags.
+ * (HMM_PFN_VALID | HMM_PFN_MIGRATE) denotes a collected entry and can safely
+ * be cleared from hmm_pfn[].
+ */
+static void hmm_vma_handle_migrate_prepare_rollback(const struct hmm_vma_walk *hmm_vma_walk,
+						    unsigned long start,
+						    unsigned long end,
+						    unsigned long *hmm_pfn)
+{
+	struct hmm_range *range = hmm_vma_walk->range;
+	struct migrate_vma *migrate = range->migrate;
+	struct folio *fault_folio = NULL;
+	enum migrate_vma_info minfo;
+	struct folio *folio;
+	unsigned long i;
+
+	minfo = hmm_select_migrate(range);
+	if (!minfo)
+		return;
+
+	WARN_ON_ONCE(!migrate);
+
+	fault_folio = migrate->fault_page ?
+		page_folio(migrate->fault_page) : NULL;
+
+	for (i = 0; start < end; start += PAGE_SIZE, i++) {
+		if (hmm_pfn_collected(hmm_pfn[i])) {
+			folio = page_folio(hmm_pfn_to_page(hmm_pfn[i]));
+			if (folio != fault_folio)
+				folio_unlock(folio);
+			folio_put(folio);
+			hmm_pfn[i] = hmm_pfn_rollback_collected(hmm_pfn[i]);
+
+		}
+	}
+}
+
 static int hmm_vma_handle_migrate_prepare_pmd(const struct mm_walk *walk,
 					      pmd_t *pmdp,
 					      unsigned long start,
@@ -722,6 +782,11 @@ static int hmm_vma_handle_migrate_prepare(const struct mm_walk *walk,
 	pte = ptep_get(ptep);
 
 	if (pte_none(pte)) {
+		hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk,
+							addr,
+							addr + PAGE_SIZE,
+							hmm_pfn);
+
 		if (vma_is_anonymous(walk->vma)) {
 			*hmm_pfn &= HMM_PFN_INOUT_FLAGS;
 			*hmm_pfn |= HMM_PFN_MIGRATE;
@@ -769,6 +834,10 @@ static int hmm_vma_handle_migrate_prepare(const struct mm_walk *walk,
 		pfn = pte_pfn(pte);
 		if (is_zero_pfn(pfn) &&
 		    (minfo & MIGRATE_VMA_SELECT_SYSTEM)) {
+			hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk,
+								addr,
+								addr + PAGE_SIZE,
+								hmm_pfn);
 			*hmm_pfn = HMM_PFN_MIGRATE;
 			goto out;
 		}
@@ -897,6 +966,13 @@ static int hmm_vma_handle_migrate_prepare(const struct mm_walk *walk,
 }
 
 #else
+static void hmm_vma_handle_migrate_prepare_rollback(const struct hmm_vma_walk *hmm_vma_walk,
+						    unsigned long start,
+						    unsigned long end,
+						    unsigned long *hmm_pfn)
+{
+}
+
 static int hmm_vma_handle_migrate_prepare_pmd(const struct mm_walk *walk,
 					      pmd_t *pmdp,
 					      unsigned long start,
@@ -1117,6 +1193,9 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 		if (ptep) {
 			lazy_mmu_mode_enable();
 			hmm_vma_walk->ptelocked = true;
+		} else {
+			/* The pte table is gone */
+			hmm_vma_handle_migrate_prepare_rollback(walk->private, addr, end, hmm_pfns);
 		}
 	} else {
 		ptep = pte_offset_map(pmdp, addr);
-- 
2.55.0

