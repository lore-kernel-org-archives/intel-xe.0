Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83090C55184
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 04:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B9210E855;
	Tue,  4 Aug 2026 04:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UZ01bw0e";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464CE10E848
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 04:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1785817654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lxWvLz6f1rN1o4scxqJnXGGSQRdc4CCCHPneXFEhe/4=;
 b=UZ01bw0eHGMxkXVXkINW/6ooOf+WI4WGvM2PvJ67kqrRwe+OdQYtO33KtdmtCsx5DYMCzL
 lpOKY/HWN4Rx/89bxFF+54UkmXxL1Ni9W3kw+EkR5rKeQHlcaBxeewc849C4e/1WJwpKDb
 JQiiY68qNqk12fk+cq6D+6PKGCtn0bc=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-ZrrZsebMN_OQ9CQuIapDTA-1; Tue, 04 Aug 2026 00:27:30 -0400
X-MC-Unique: ZrrZsebMN_OQ9CQuIapDTA-1
X-Mimecast-MFC-AGG-ID: ZrrZsebMN_OQ9CQuIapDTA_1785817649
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5aebd5e989cso2670926e87.3
 for <intel-xe@lists.freedesktop.org>; Mon, 03 Aug 2026 21:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785817648; x=1786422448;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=lxWvLz6f1rN1o4scxqJnXGGSQRdc4CCCHPneXFEhe/4=;
 b=UjPqC5tmJuS8fYkUbW+7/mJG/zFkS6rPZwkt+F6JWMsBubjZDo7T/bsgQb0LS6NWhQ
 gN/W637ZMZqu6L7IbEi+ZTmUdZVNVbYvAiw0YaQkz3tHN8eSPxyh3MHw2FJVmjvdbYJA
 MqYbBe92SBho56jc6xJXUFAu3rSbl9DcZeYFYSsMHDWWlp4P5oA6z7tOejc9s1qvIg74
 NWb6kn0dxCeQUU4s93aFLnyaCMt9/pxcxuwVZv8uiQ3vlEjLlwSs4xyb2wKxw0ObIzEj
 cJfMmtcxezCdJlkgZtvZ6D78aPdbFDN70POWf/fzjN5vCIenZ9ZL4I3Or1MpLVutrbji
 CzMA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpnPrprgodLzwmVvk0IV9rTyRg3uqf1jFGNzM6AtmORhXFlT6Ka/hpgPtC3Qa5zU9nmyVr+E9hWWA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1yVAvCX6KUc4k8SuiHb2jOHlIElWLe8ObDgo4yq5RADcUOM5O
 YJkpQbBGEVaaPB78W1bHbIFhTHpq4Up0RGGnRwh3F5te6PZZ1e8aCDYsVZ38oKa7qpKedSklwxS
 wLhhH7oI64GZt7yxIUC9aBiJ3GDIdQZQHl+m/8Td9bOSSQof4fCOt2+M4DDuZ0yr6rhI=
X-Gm-Gg: AR+sD122fg8nQVaVlSR+Ahp9vMfvU0MJXLHJ9zWqcQ6nAeuSGZteCgWUkY81oQi4s3C
 gHweeYiKb8+Azln3cfCj8sgNdSWG74uiG7ju+Q4Qos8uomtCgso2AkGKeiI25pcsDHg/QT+jYc6
 SCYFsuNwjChZtNmJ7D9j6WMBj2ZpRiEtzcyXcSJnqy9DksHYNZbKvI+6CaXZKcuV5ZtC1VixJ5Z
 2e2NwN77Prdw87OBTRUz+a2MZ8BMgoIFc5zkSAMP6caSQO7U+X8H77b8pwj/QJ353vYSb5Bn0Eg
 1Dhsr5ct7FMAkdBvkyOfLxIKOYys8YISc4ajRn9ezduEK66rpq6D2DfVwS8C0EEHd2D6tNAsbXg
 eMq/nClaHz3mvkug4
X-Received: by 2002:a05:6512:8051:b0:5ae:b86b:71ee with SMTP id
 2adb3069b0e04-5b2e4f6d5c4mr1858473e87.38.1785817648612; 
 Mon, 03 Aug 2026 21:27:28 -0700 (PDT)
X-Received: by 2002:a05:6512:8051:b0:5ae:b86b:71ee with SMTP id
 2adb3069b0e04-5b2e4f6d5c4mr1858457e87.38.1785817648175; 
 Mon, 03 Aug 2026 21:27:28 -0700 (PDT)
Received: from fedora (85-23-51-1.bb.dnainternet.fi. [85.23.51.1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b2e23c46c4sm2311351e87.17.2026.08.03.21.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 21:27:26 -0700 (PDT)
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
Subject: [PATCH v13 08/11] mm/hmm: add lazy MMU mode support for migration in
 HMM pagewalk
Date: Tue,  4 Aug 2026 07:26:28 +0300
Message-ID: <20260804042631.2175585-9-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804042631.2175585-1-mpenttil@redhat.com>
References: <20260804042631.2175585-1-mpenttil@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZzyK9F0mdICcKIcsu4YpC4C5JegwI6exQPE4_sW9Hag_1785817649
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

Add calls to lazy_mmu_mode_enable() and lazy_mmu_mode_disable()
while doing migration.

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
 mm/hmm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 61b9147fd8ed..631f6b4d52fc 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -368,6 +368,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		/* Report error for everything else */
 
 		if (hmm_vma_walk->ptelocked) {
+			lazy_mmu_mode_disable();
 			pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
 			hmm_vma_walk->ptelocked = false;
 		} else {
@@ -391,6 +392,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	    !is_zero_pfn(pte_pfn(pte))) {
 		if (hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0)) {
 			if (hmm_vma_walk->ptelocked) {
+				lazy_mmu_mode_disable();
 				pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
 				hmm_vma_walk->ptelocked = false;
 			} else {
@@ -410,6 +412,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 
 fault:
 	if (hmm_vma_walk->ptelocked) {
+		lazy_mmu_mode_disable();
 		pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
 		hmm_vma_walk->ptelocked = false;
 	} else {
@@ -507,6 +510,7 @@ static int migrate_vma_split_folio(struct folio *folio,
 	if (folio != fault_folio)
 		folio_get(folio);
 
+	lazy_mmu_mode_disable();
 	pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
 	hmm_vma_walk->ptelocked = false;
 
@@ -1132,8 +1136,10 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 
 	if (minfo) {
 		ptep = pte_offset_map_lock(mm, pmdp, addr, &hmm_vma_walk->ptl);
-		if (ptep)
+		if (ptep) {
+			lazy_mmu_mode_enable();
 			hmm_vma_walk->ptelocked = true;
+		}
 	} else {
 		ptep = pte_offset_map(pmdp, addr);
 	}
@@ -1169,6 +1175,7 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 		flush_tlb_range(walk->vma, start, addr);
 
 	if (hmm_vma_walk->ptelocked) {
+		lazy_mmu_mode_disable();
 		pte_unmap_unlock(ptep - 1, hmm_vma_walk->ptl);
 		hmm_vma_walk->ptelocked = false;
 	} else {
-- 
2.55.0

