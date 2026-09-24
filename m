Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4497C98316
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 06:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C6010F310;
	Thu, 24 Sep 2026 06:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QlOlxhim";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB9E10F310
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 06:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790232818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XHN2LiOQU7r0d0fe1KkDFs3khSrbeSD24b1q7hC8HmQ=;
 b=QlOlxhimajsjWWcWqWyw17Wtiaq1cUJmGLrnaWDDpXfZGlumGLQ+ejEtaKH0IHOIQVf37f
 X7unWH329T/dFwsv7gjc5hR6V7jfNTeXWNvXimHAwSpkSe0s4ONb0Ab1pcDYBY24Fo6JGl
 4FAKmfM1zCt36k0Uj9xEJa2mc6fWqBc=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-GzAnE4g_OOKlbKaVcdBgKw-1; Thu, 24 Sep 2026 02:53:37 -0400
X-MC-Unique: GzAnE4g_OOKlbKaVcdBgKw-1
X-Mimecast-MFC-AGG-ID: GzAnE4g_OOKlbKaVcdBgKw_1790232816
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-3a59a300bfdso8053501fa.1
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 23:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790232815; x=1790837615;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XHN2LiOQU7r0d0fe1KkDFs3khSrbeSD24b1q7hC8HmQ=;
 b=MzbkXz/H9aRHn46Ki5gciZi2NAhkRlU1oz/CCCFdrQOUOJEE8ck8H6tcFZ+1xCDvlh
 4+nx5uaHM07N+Iqj6dKp8LbdQcRen/BEGZRdVgM4TJzAtwBAHJzIK5S8tNnloTmxFDaw
 BAqLLaOoJwvrG6BL4TNwBWdRFYbSDLPXzwxPiqoJs9m90/UF9nSPQl+7/TN0WHnoI1ZO
 C3ey0ev2OPmh2pe1kf1ywu+LF/jyz6mxJprutSGglud0EMw9iLAo0APUQjnjlVGBNWJh
 q9aRSTnHoceOH1clJa/526zeLuZADRyAXx+8MZE+Z811Lp0lnLxbbvw4HvZcovWTzIb8
 /j3A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwsT5ag2nL2Idnpa3C3jArqnswGKcMazskm7FgU1cC2qksHzjjra6WUcatj8pRC8D9k8XAnpjWuUQ==@lists.freedesktop.org
X-Gm-Message-State: AFuF++klCV10B05hAQinPqYgI6ZAFaB49py9WqY4ntUD5oSZoBSF3A73
 YNHm/eElUyaIyu2Lnj9Z7xaW91nVSZoeYOp/F5xkQWQgm/lNRhdf9H7RCldk2XZcZJosD9bdqey
 3BxIPpAmRRXljFJD2AD2gMXKxP0LyWzfhyJl9s9NChf3FA2nEHnKCi47LmOrTWHECAKg=
X-Gm-Gg: AYBFou3gQdcWxv8P/LvgoXRj34dhWSMRh4lYVRAwKZ8VaTJ1tmYO+6Ztfh2q4tP6TSH
 YOtRfSkPbVvLPEY0nTWZSwQSGpE7Cq3OWxWVQEAz2dz3mSS+/HkOooE3owVrDCfEt2DtyGB2qJN
 GLo2W7fBD8pOkmZ+q5IghYM0OptuU6YlObzyv8JCayXQaZEFhssJvQgazFIE9SqFNlV4UDII5ai
 1aZR3ec7BZDD7XFGBUVFM5EzmR25IFq3hpOxONRmT92GpiYlDt3UUFrvBRX8UYsnqkGotXE8MKD
 MG5li9e4LXBSVIXVNyXZIP9FTrHo8gdPQJaxIPeW+GzthonKaYLeerG7Eccc9YWksQ8329sruwv
 pT8oPYMfa2OBKL26YMyBN
X-Received: by 2002:a05:651c:211b:b0:3a1:980f:5907 with SMTP id
 38308e7fff4ca-3a63c086e9bmr3379451fa.8.1790232815521; 
 Wed, 23 Sep 2026 23:53:35 -0700 (PDT)
X-Received: by 2002:a05:651c:211b:b0:3a1:980f:5907 with SMTP id
 38308e7fff4ca-3a63c086e9bmr3379231fa.8.1790232815017; 
 Wed, 23 Sep 2026 23:53:35 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a63bf57909sm4803141fa.29.2026.09.23.23.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 23:53:34 -0700 (PDT)
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
Subject: [PATCH v15 02/11] mm: add helper to convert HMM pfn to migrate pfn
Date: Thu, 24 Sep 2026 09:53:04 +0300
Message-ID: <20260924065313.899730-3-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924065313.899730-1-mpenttil@redhat.com>
References: <20260924065313.899730-1-mpenttil@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZBOVe7vlYV2UB9KftTrVhgKRBj5VdcZOdtYY67BPKGg_1790232816
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

The unified HMM/migrate_device pagewalk does the "collecting"
on the HMM side, so we need a helper to transfer pfns to the
migrate_vma world.

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
 include/linux/hmm.h     | 29 +++++++++++++++++-----
 include/linux/migrate.h |  3 ++-
 mm/migrate_device.c     | 55 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+), 7 deletions(-)

diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 6f04e3932f5b..4f56f3419cb4 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -13,6 +13,8 @@
 
 struct mmu_interval_notifier;
 
+struct migrate_vma;
+
 /*
  * On output:
  * 0             - The page is faultable and a future call with 
@@ -27,13 +29,22 @@ struct mmu_interval_notifier;
  * HMM_PFN_P2PDMA_BUS - Bus mapped P2P transfer
  * HMM_PFN_DMA_MAPPED - Flag preserved on input-to-output transformation
  *                      to mark that page is already DMA mapped
+ * HMM_PFN_MIGRATE    - The entry is to be migrated. Note, HMM_PFN_MIGRATE
+ *                      alone without HMM_PFN_VALID denotes the
+ *                      empty page.
+ *                      This flag optionally together with HMM_PFN_COMPOUND
+ *                      are indicators for migrate_hmm_range_setup() to
+ *                      setup the migrate pfns.
+ * HMM_PFN_COMPOUND   - The entry represents a > 0 order page
  *
  * On input:
- * 0                 - Return the current state of the page, do not fault it.
- * HMM_PFN_REQ_FAULT - The output must have HMM_PFN_VALID or hmm_range_fault()
- *                     will fail
- * HMM_PFN_REQ_WRITE - The output must have HMM_PFN_WRITE or hmm_range_fault()
- *                     will fail. Must be combined with HMM_PFN_REQ_FAULT.
+ * 0                   - Return the current state of the page, do not fault it.
+ * HMM_PFN_REQ_FAULT   - The output must have HMM_PFN_VALID or hmm_range_fault()
+ *                       will fail
+ * HMM_PFN_REQ_WRITE   - The output must have HMM_PFN_WRITE or hmm_range_fault()
+ *                       will fail. Must be combined with HMM_PFN_REQ_FAULT.
+ * HMM_PFN_REQ_MIGRATE - For default_flags only, request to migrate the range,
+ *                       according to hmm_range.migrate.flags
  */
 enum hmm_pfn_flags {
 	/* Output fields and flags */
@@ -48,11 +59,15 @@ enum hmm_pfn_flags {
 	HMM_PFN_P2PDMA     = 1UL << (BITS_PER_LONG - 5),
 	HMM_PFN_P2PDMA_BUS = 1UL << (BITS_PER_LONG - 6),
 
-	HMM_PFN_ORDER_SHIFT = (BITS_PER_LONG - 11),
+	/* Migrate request */
+	HMM_PFN_MIGRATE    = 1UL << (BITS_PER_LONG - 7),
+	HMM_PFN_COMPOUND   = 1UL << (BITS_PER_LONG - 8),
+	HMM_PFN_ORDER_SHIFT = (BITS_PER_LONG - 13),
 
 	/* Input flags */
 	HMM_PFN_REQ_FAULT = HMM_PFN_VALID,
 	HMM_PFN_REQ_WRITE = HMM_PFN_WRITE,
+	HMM_PFN_REQ_MIGRATE = HMM_PFN_MIGRATE,
 
 	HMM_PFN_FLAGS = ~((1UL << HMM_PFN_ORDER_SHIFT) - 1),
 };
@@ -107,6 +122,7 @@ static inline unsigned int hmm_pfn_to_map_order(unsigned long hmm_pfn)
  * @default_flags: default flags for the range (write, read, ... see hmm doc)
  * @pfn_flags_mask: allows to mask pfn flags so that only default_flags matter
  * @dev_private_owner: owner of device private pages
+ * @migrate: structure for migrating a range of a VMA
  */
 struct hmm_range {
 	struct mmu_interval_notifier *notifier;
@@ -117,6 +133,7 @@ struct hmm_range {
 	unsigned long		default_flags;
 	unsigned long		pfn_flags_mask;
 	void			*dev_private_owner;
+	struct migrate_vma      *migrate;
 };
 
 /*
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 78424b3824c2..280ec9a866c7 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -3,6 +3,7 @@
 #define _LINUX_MIGRATE_H
 
 #include <linux/mm.h>
+#include <linux/hmm.h>
 #include <linux/mempolicy.h>
 #include <linux/migrate_mode.h>
 #include <linux/hugetlb.h>
@@ -202,7 +203,7 @@ void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
 			unsigned long npages);
 void migrate_device_finalize(unsigned long *src_pfns,
 			unsigned long *dst_pfns, unsigned long npages);
-
+void migrate_hmm_range_setup(struct hmm_range *range);
 #endif /* CONFIG_MIGRATION */
 
 #endif /* _LINUX_MIGRATE_H */
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 009bfa8b212d..43e571e82cca 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -1528,3 +1528,58 @@ int migrate_device_coherent_folio(struct folio *folio)
 		return 0;
 	return -EBUSY;
 }
+
+/**
+ * migrate_hmm_range_setup() - prepare to migrate a range of memory
+ * @range: contains pointer to struct migrate_vma to be set up.
+ *
+ * When collecting has been done with hmm_range_fault(), this
+ * should be called next, and completes range->migrate by
+ * populating migrate->src[] and migrate->dst[]
+ * using range->hmm_pfns[].
+ * Also, migrate->cpages and migrate->npages get initialized.
+ * After migrate_hmm_range_setup(), range->migrate is good
+ * for the rest of the migrate_vma_* flow.
+ */
+void migrate_hmm_range_setup(struct hmm_range *range)
+{
+	struct migrate_vma *migrate = range->migrate;
+
+	if (!migrate)
+		return;
+
+	migrate->npages = (migrate->end - migrate->start) >> PAGE_SHIFT;
+	migrate->cpages = 0;
+
+	for (unsigned long i = 0; i < migrate->npages; i++) {
+		unsigned long pfn = range->hmm_pfns[i];
+
+		/*
+		 * We are only interested in entries to be
+		 * migrated.
+		 */
+		if (!(pfn & HMM_PFN_MIGRATE)) {
+			migrate->src[i] = 0;
+			migrate->dst[i] = 0;
+			continue;
+		}
+
+		migrate->cpages++;
+
+		/* HMM_PFN_MIGRATE without HMM_PFN_VALID denotes the special zero page */
+		if (pfn & HMM_PFN_VALID)
+			migrate->src[i] = migrate_pfn(page_to_pfn(hmm_pfn_to_page(pfn)));
+		else
+			migrate->src[i] = 0;
+
+		migrate->src[i] |= MIGRATE_PFN_MIGRATE;
+		migrate->src[i] |= (pfn & HMM_PFN_WRITE) ? MIGRATE_PFN_WRITE : 0;
+		migrate->src[i] |= (pfn & HMM_PFN_COMPOUND) ? MIGRATE_PFN_COMPOUND : 0;
+		migrate->dst[i] = 0;
+	}
+
+	if (migrate->cpages)
+		migrate_vma_unmap(migrate);
+
+}
+EXPORT_SYMBOL(migrate_hmm_range_setup);
-- 
2.55.0

