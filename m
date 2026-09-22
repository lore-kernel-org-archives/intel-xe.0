Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F83C98305
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 05:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266F810E6C7;
	Tue, 22 Sep 2026 05:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GM/9UKo0";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F24210E6C3
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 05:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790055299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qu0BSxnttTs+uKLg/qx0GDVYgMyi2m2Up9fDq2tLMMQ=;
 b=GM/9UKo0N9f0F3rUki0kXndNdJXlI0S7qvJr/fBCHU65gU8KuTEOGslj1fWfTc+FiKmPqM
 RWQuF6ylKdeplXy02EXhenZicHFRH+e8NFwSy/cTq12QdTzP6ROoBwgHKEzfvJipMsNuQH
 mVaBn5hJz7+ifRttyMn19ZnqtICGtLU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-PB-ZjNRsMzq6LQB3WZBZrA-1; Tue, 22 Sep 2026 01:34:55 -0400
X-MC-Unique: PB-ZjNRsMzq6LQB3WZBZrA-1
X-Mimecast-MFC-AGG-ID: PB-ZjNRsMzq6LQB3WZBZrA_1790055294
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5b767214d60so283477e87.1
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 22:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790055294; x=1790660094;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Qu0BSxnttTs+uKLg/qx0GDVYgMyi2m2Up9fDq2tLMMQ=;
 b=e2lmc3+ELn/C2VZnrgc6gBI9nfhaF4qnklNYnSOT7M6Fdis4cAvgxnVvUdf0cOvqC2
 QMXOfnfSh//j4Qm729oBqlG/N9KmxHDGSimqs6aNRvGEUUs1MnZkHWKt70lyarGQHgCU
 aoTt1sIqIL77XEcY2GNVOcz9hRqWZ7qjpkQwg9cr9Dywkbw/TZv20XfWwpoD0OXU15Ia
 +z7GY3HAuIomByt4b16JsMsxCdNunGi0IWMuXMCB0LbNPgHNunDT0njGOUeV7c5vWSQo
 WHkUHZPwMw1uJzAWWkOTBGHx/n6HNc64L5ZX8CZn7/1cdkkM0MsnfO0d5l5oGw1gdJOS
 Haxw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxYiNLMPrKxNofk9cFFeR/E9MZ3s0kG9iEwZ0zwrnQRgU+gDRkDofEVKO3V+XyJWubs3HrpmiGBfg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++nTP6nyJEucFqIwfRKYvNLwbluypnR7YfE9qSq2oHXuonBHfj+/
 H9QGs7HMYuauUMKyELVCvv4F2YHuXOGmPOpiywRQxuvFGofxnd2g2lseu2qu5dR83vUGeYtbtlA
 3LfJmm//jrFNuBxH/GeXMymSwmkGDbC/qeeuAqBlMMAWY7GNuPy/3o2fYVdqaXMI6yeg=
X-Gm-Gg: AYBFou3Q72FSXhX2/4xOwXmIxByfh2j/i9Q2T10cBRgphA/S5S9QJBvi5Km5cAt9XKW
 gdVsFHti2tiWp1MTuOFfJVFaLE+FqjQCF81Wq9SXbV3WZFMgtilJSPbtZ3Ba2kimah0BJjMKx5I
 dBmhFsbR1+2BiawHkuzcsLTvdSJrEoUwSqJMj7owuog7kiDNas5qNUxhNjYYPv4GOVj36nd52o6
 vOo52nK5H+/weaZBTf6XYGZHajZEjiqo8yPF4Ru1HOAibTGg3iuw7mPviu+LEaNxRbJYH03XP8P
 4C0rQN8bUUgspqmJy06GmE/4Krbeq1Hg2Yk1TBYicezdtbQPJRIKwMB9A2QG2tEaXANTkVohR9m
 RzOKAcGqP2kQWFtlbckCf
X-Received: by 2002:a05:6512:aca:b0:5ae:b7c7:5334 with SMTP id
 2adb3069b0e04-5b8d28fbc51mr474021e87.17.1790055294098; 
 Mon, 21 Sep 2026 22:34:54 -0700 (PDT)
X-Received: by 2002:a05:6512:aca:b0:5ae:b7c7:5334 with SMTP id
 2adb3069b0e04-5b8d28fbc51mr474009e87.17.1790055293609; 
 Mon, 21 Sep 2026 22:34:53 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b8d46e0966sm191742e87.55.2026.09.21.22.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 22:34:52 -0700 (PDT)
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
Subject: [PATCH v14 05/12] mm/hmm: implement folio split for migrate needs in
 HMM pagewalk
Date: Tue, 22 Sep 2026 08:34:14 +0300
Message-ID: <20260922053421.4092027-6-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922053421.4092027-1-mpenttil@redhat.com>
References: <20260922053421.4092027-1-mpenttil@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HID4wuwF_2hEmJMxtS6efecqrRFYVB2B5mpn7SB7Lsk_1790055294
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

Implement the helper to split PMD size folios during pagewalk.
Splitting is needed if the start and end addresses are
not PMD aligned, or setting up pmd migration entry fails.

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
 mm/hmm.c | 47 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 4805c88347e6..e6469ef4ae6a 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -514,10 +514,51 @@ static int hmm_vma_walk_split(pmd_t *pmdp,
 			      unsigned long addr,
 			      struct mm_walk *walk)
 {
-	// TODO : implement split
-	return 0;
-}
+	struct hmm_vma_walk *hmm_vma_walk = walk->private;
+	struct hmm_range *range = hmm_vma_walk->range;
+	struct migrate_vma *migrate = range->migrate;
+	struct folio *folio, *fault_folio;
+	spinlock_t *ptl;
+	int ret = 0;
+
+	HMM_ASSERT_UNLOCKED(hmm_vma_walk);
+
+	fault_folio = (migrate && migrate->fault_page) ?
+		page_folio(migrate->fault_page) : NULL;
+
+	ptl = pmd_lock(walk->mm, pmdp);
+	if (unlikely(!pmd_trans_huge(*pmdp))) {
+		spin_unlock(ptl);
+		goto out;
+	}
 
+	folio = pmd_folio(*pmdp);
+	if (is_huge_zero_folio(folio)) {
+		spin_unlock(ptl);
+		split_huge_pmd(walk->vma, pmdp, addr);
+	} else {
+		folio_get(folio);
+		spin_unlock(ptl);
+
+		if (folio != fault_folio) {
+			if (unlikely(!folio_trylock(folio))) {
+				folio_put(folio);
+				ret = -EBUSY;
+				goto out;
+			}
+		}  else {
+			folio_put(folio);
+		}
+
+		ret = split_folio(folio);
+		if (fault_folio != folio) {
+			folio_unlock(folio);
+			folio_put(folio);
+		}
+	}
+out:
+	return ret;
+}
 #else
 static int hmm_vma_handle_migrate_prepare_pmd(const struct mm_walk *walk,
 					      pmd_t *pmdp,
-- 
2.55.0

