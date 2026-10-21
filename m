Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A4160A4AD0
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 06:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hv398Jdk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD99610F90A;
	Wed, 21 Oct 2026 06:05:49 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC38210F8F5
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 06:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792562742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p/7lyMAdO8fpbuawopvTUkUgysPqZTh82lxmIkmlslk=;
 b=Hv398JdkaivMdNbIkFYLQlLP2GluPez2sNWPUMtfioGdX6fGvKMw+zMMgyuSVEdCsT3f7H
 QsyM3yPQD3JVlOwp8UYOhAdP3h2jBT5CsmJ7puSAAEnT+4OCCCL1XNZxPrHP+XLTjIoShp
 X4+Yp0/hMRKFUYRuZ+1eGDPrkrqHk8s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-9o5KwBoRNISq3_mqw6rPOA-1; Wed, 21 Oct 2026 02:05:41 -0400
X-MC-Unique: 9o5KwBoRNISq3_mqw6rPOA-1
X-Mimecast-MFC-AGG-ID: 9o5KwBoRNISq3_mqw6rPOA_1792562740
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-48df730c035so224502f8f.0
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 23:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792562740; x=1793167540;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=p/7lyMAdO8fpbuawopvTUkUgysPqZTh82lxmIkmlslk=;
 b=WaViS8Sb1uYu6edpzt8z2OFCHlbGBcf3P70rKpIaijp8UGTt+cNi20sy/auXCj/zJk
 RfwSmQpFm3JwLIqjrTszGgmk6QzKJI89yNXOyQmYUJietGMvRXxcSHiLAu1La6xgU5Ip
 LKJIBIgpR2+033j9HEr9fw6g3AJz9oziAIN3u+nE1xlG8s0ipflFNKwWmemHIZf79n/+
 x1OKrwBRnYCcfiA1uZSVg5mAexBrEDtkuxV7Bm6kzXu4+2Vk3LBCdoAf0peynRjaB8RA
 kU9p08g4iXXI0Y8ykFZUWcFACcN50XrWLUGWr1gQOTP6T2ndjb45Ei8cPO74kKw43Ych
 z9eg==
X-Forwarded-Encrypted: i=1;
 AKwUvBy9livFrk15FMZ7285DjcV4eXGMPEZc2l5UN15xQnfg3c6+SGuMTJHteM1u3faSR0iQRDOHVtcl9A==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLQ19RS5aX7WktGnldljP6Wwbp/tnxKZpfKC067sV1Z2arguAUf
 08kLVWhQqx60aftM/78CZt2kPJHK+WmZtrBiqdwtVLyT+RrLixerpPqtJ4iF2tfCB9KD6jz8f8Q
 XLjfew5xKNgt/Py+zSFh3BZtcGUSr0/i/Mrk/BqF03kUjNeaDPHdbFmxGgjNTWt32ftc=
X-Gm-Gg: AYBFou06WQdW7iHTUyL2F2meQNMdKkRjT26iWz7l1l07VmgAiSd+FWrHImrIrt7JN79
 L758dIyY64cmLFahiaUIN3ZH4GFeOclKb15WVCy2MUr6hktG0Bzu0MRkd1qBW0kiMHHIIfGOmP7
 4qjp6DyS4qNcl3jpcxgLcCpCipxk1SVkPS1NHa4GuttIuIlHVKT3thQgfFkZqF3MyDTwwuGDW26
 NrMiao8X3HhEtxbQhcU4Ci3lAPDHBlZgtPTyMy2dKixd/roEsr2TNacKJvW8qYKT+DuESWIpU7r
 JdpXfi0UWTJJLPPVtLQHeZCeabyDDbQEz2TM/8d7fJOxVfk78MSLicLVJwCIrmO8ksHd0N2yx5u
 MQ8zDTfalUdJRhVV6ctaxYyEvF1YIKegSx9yg
X-Received: by 2002:a05:600c:4e03:b0:49f:fe39:5bc8 with SMTP id
 5b1f17b1804b1-4a1fdd14200mr14867795e9.12.1792562740243; 
 Tue, 20 Oct 2026 23:05:40 -0700 (PDT)
X-Received: by 2002:a05:600c:4e03:b0:49f:fe39:5bc8 with SMTP id
 5b1f17b1804b1-4a1fdd14200mr14867095e9.12.1792562739786; 
 Tue, 20 Oct 2026 23:05:39 -0700 (PDT)
Received: from fedora.redhat.corp (89-27-86-246.bb.dnainternet.fi.
 [89.27.86.246]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e254f02f1sm3413741f8f.3.2026.10.20.23.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 23:05:38 -0700 (PDT)
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
Subject: [PATCH v16 06/12] mm/hmm: migrate collection in HMM pagewalk - pmd
 level
Date: Wed, 21 Oct 2026 09:05:00 +0300
Message-ID: <20261021060506.2377545-7-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021060506.2377545-1-mpenttil@redhat.com>
References: <20261021060506.2377545-1-mpenttil@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RYx0mFTCZlmxC-ciqHLpjImsFwaTia9C_x8seBg4jQ0_1792562740
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

Implement the needed hmm_vma_handle_migrate_prepare_pmd() function
which is mostly carried over from migrate_device.c's
migrate_vma_collect_huge_pmd() function.

With HMM pagewalk based migration, the idea is that
hmm_vma_handle_*() are responsible for faulting, and the pfn
collecting part. hmm_vma_handle_migrate_prepare*() do the
migration decisions (with HMM_PFN_MIGRATE), possibly split
folios, and insert migration ptes/pmds.

HMM pagewalk based migration is enabled in later commit, for now
now hmm_select_migrate() returns 0.

Also avoid the problems present in the migrate_vma_collect_huge_pmd()
split fallback path this HMM path supersedes:

      - extra refcount for fault_folio makes split_folio() fail
      - wrong folio unlocked after split_folio()

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
 mm/hmm.c | 172 ++++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 151 insertions(+), 21 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 0ce947d0e572..5891efee3e18 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -492,31 +492,19 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 
 #ifdef CONFIG_DEVICE_MIGRATION
 /**
- * migrate_vma_split_folio() - Helper function to split a THP folio
+ * __migrate_vma_split_folio() - split a folio and move the lock/ref to the
+ * order-0 folio backing @fault_page after the split
  * @folio: the folio to split
- * @fault_page: struct page associated with the fault if any
- * @hmm_vma_walk: walk in progress
- * @ptep: pte_t * for unmap and unlock ptl
+ * @fault_page: fault page if any
  *
- * Returns 0 on success
+ * Returns 0 on success.
  */
-static int migrate_vma_split_folio(struct folio *folio,
-				   struct page *fault_page,
-				   struct hmm_vma_walk *hmm_vma_walk,
-				   pte_t *ptep)
+static int __migrate_vma_split_folio(struct folio *folio,
+				     struct page *fault_page)
 {
-	int ret;
 	struct folio *fault_folio = fault_page ? page_folio(fault_page) : NULL;
 	struct folio *new_fault_folio = NULL;
-
-	if (folio != fault_folio)
-		folio_get(folio);
-
-	pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
-	hmm_vma_walk->ptelocked = false;
-
-	if (folio != fault_folio)
-		folio_lock(folio);
+	int ret;
 
 	ret = split_folio(folio);
 	if (ret) {
@@ -548,14 +536,145 @@ static int migrate_vma_split_folio(struct folio *folio,
 	return 0;
 }
 
+/**
+ * migrate_vma_split_folio() - drop the pte lock and split a THP folio
+ * @folio: the folio to split
+ * @fault_page: struct page associated with the fault if any
+ * @hmm_vma_walk: walk in progress
+ * @ptep: pte_t * for unmap and unlock ptl
+ *
+ * Returns 0 on success
+ */
+static int migrate_vma_split_folio(struct folio *folio,
+				   struct page *fault_page,
+				   struct hmm_vma_walk *hmm_vma_walk,
+				   pte_t *ptep)
+{
+	struct folio *fault_folio = fault_page ? page_folio(fault_page) : NULL;
+
+	if (folio != fault_folio)
+		folio_get(folio);
+
+	pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
+	hmm_vma_walk->ptelocked = false;
+
+	if (folio != fault_folio)
+		folio_lock(folio);
+
+	return __migrate_vma_split_folio(folio, fault_page);
+}
+
 static int hmm_vma_handle_migrate_prepare_pmd(const struct mm_walk *walk,
 					      pmd_t *pmdp,
 					      unsigned long start,
 					      unsigned long end,
 					      unsigned long *hmm_pfn)
 {
-	// TODO: implement migration entry insertion
-	return 0;
+	struct hmm_vma_walk *hmm_vma_walk = walk->private;
+	struct hmm_range *range = hmm_vma_walk->range;
+	struct migrate_vma *migrate = range->migrate;
+	struct folio *fault_folio = NULL;
+	enum migrate_vma_info minfo;
+	struct folio *folio;
+	unsigned long i;
+	int r = 0;
+
+	// Do we want to migrate at all?
+	minfo = hmm_select_migrate(range);
+	if (!minfo)
+		return r;
+
+	WARN_ON_ONCE(!migrate);
+	HMM_ASSERT_PMD_LOCKED(hmm_vma_walk, true);
+
+	fault_folio = migrate->fault_page ?
+		page_folio(migrate->fault_page) : NULL;
+
+	if (pmd_none(*pmdp))
+		return hmm_pfns_fill(start, end, hmm_vma_walk, 0);
+
+	if (!(hmm_pfn[0] & HMM_PFN_VALID))
+		goto out;
+
+	if (pmd_trans_huge(*pmdp)) {
+		if (!(minfo & MIGRATE_VMA_SELECT_SYSTEM))
+			goto out;
+
+		folio = pmd_folio(*pmdp);
+		if (is_huge_zero_folio(folio))
+			return hmm_pfns_fill(start, end, hmm_vma_walk, 0);
+
+	} else if (!pmd_present(*pmdp)) {
+		const softleaf_t entry = softleaf_from_pmd(*pmdp);
+
+		if (!softleaf_is_device_private(entry))
+			goto out;
+
+		if (!(minfo & MIGRATE_VMA_SELECT_DEVICE_PRIVATE))
+			goto out;
+
+		folio = softleaf_to_folio(entry);
+		if (folio->pgmap->owner != migrate->pgmap_owner)
+			goto out;
+	} else {
+		hmm_vma_walk->last = start;
+		return -EBUSY;
+	}
+
+	folio_get(folio);
+
+	if (folio != fault_folio && unlikely(!folio_trylock(folio))) {
+		folio_put(folio);
+		hmm_pfns_fill(start, end, hmm_vma_walk, HMM_PFN_ERROR);
+		return 0;
+	}
+
+	if (thp_migration_supported() &&
+	    (migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
+	    (IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
+	     IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
+		struct page_vma_mapped_walk pvmw = {
+			.ptl = hmm_vma_walk->ptl,
+			.address = start,
+			.pmd = pmdp,
+			.vma = walk->vma,
+		};
+
+		hmm_pfn[0] |= HMM_PFN_MIGRATE | HMM_PFN_COMPOUND;
+
+		r = set_pmd_migration_entry(&pvmw, folio_page(folio, 0));
+		if (r) {
+			hmm_pfn[0] &= ~(HMM_PFN_MIGRATE | HMM_PFN_COMPOUND);
+			goto split;	/* fall back to splitting the pmd */
+		}
+		for (i = 1, start += PAGE_SIZE; start < end; start += PAGE_SIZE, i++)
+			hmm_pfn[i] &= HMM_PFN_INOUT_FLAGS;
+
+	} else {
+		goto split;		/* fall back to splitting the pmd */
+	}
+
+out:
+	return r;
+
+split:
+	spin_unlock(hmm_vma_walk->ptl);
+	hmm_vma_walk->pmdlocked = false;
+
+	/*
+	 * folio_get() above took an extra reference. For the fault folio the
+	 * caller still holds a reference and the lock, which is the
+	 * precondition of __migrate_vma_split_folio(), so drop the extra one.
+	 */
+	if (folio == fault_folio)
+		folio_put(folio);
+
+	r = __migrate_vma_split_folio(folio, migrate->fault_page);
+	if (r)
+		return -EFAULT;
+
+	hmm_vma_walk->last = start;
+	return -EBUSY;
 }
 
 /*
@@ -958,6 +1077,17 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 			hmm_vma_walk->pmdlocked = false;
 		}
 
+		/*
+		 * hmm_vma_handle_migrate_prepare_pmd() splits the huge pmd in
+		 * place when needed and returns -EBUSY to re-walk the range as
+		 * PTEs; any other error means the split failed.
+		 */
+		if (r == -EBUSY)
+			return -EBUSY;
+		if (r) {
+			/* Split not successful, skip */
+			return hmm_pfns_fill(start, end, hmm_vma_walk, HMM_PFN_ERROR);
+		}
 		return r;
 	}
 
-- 
2.55.0

