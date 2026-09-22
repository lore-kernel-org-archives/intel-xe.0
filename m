Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2A3C982FE
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 05:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C404010EB12;
	Tue, 22 Sep 2026 05:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ccXPWX4u";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFEE10E3E1
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 05:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790055303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Dwb+61ZiIhZrjnlVPFK1XZrDSM5l5u6qowPzm9WLF0=;
 b=ccXPWX4uvzF6Wa1aba6tsfuJuT0R0Yz+PeoDGBs9Yd3nMnEJWn5g9gXx8wtoK5pLaMzs8C
 IgidwsNpXmtHeNSh3iTId1THLd4OxgJyoL6vzyx0wQoQoUhXoZ/4t7Rny4shBfBWgX8U4l
 4JhrROQypMpzi4FqbG98+fN2Pq422jI=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-6eR1itVRPBGFsTTrYYT1_w-1; Tue, 22 Sep 2026 01:35:02 -0400
X-MC-Unique: 6eR1itVRPBGFsTTrYYT1_w-1
X-Mimecast-MFC-AGG-ID: 6eR1itVRPBGFsTTrYYT1_w_1790055300
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5b4b009f0e7so2587742e87.3
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 22:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790055300; x=1790660100;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4Dwb+61ZiIhZrjnlVPFK1XZrDSM5l5u6qowPzm9WLF0=;
 b=h4xNQ9TD9DCCY2VG2cR2H4bZnZjrCSi0MOdXxTeMyz7gPoWvFBMDa1J6Zt44bnLaak
 IzUVUfYmLRkdoWq+P1VZjW6GlEN1kNULTu1xNWG6x7UnkpnvItH6rr42r9hMK6okn1VV
 /Q0g/pG1Mp4JCnXKYlSZPoycnu8+J5W9ludqrfvVn3DS8Tud6EjvnN2jUDw/qtxiVRrF
 E7Ol0Ec2j9W2hoSn7t3uUimjwx7nz6FUcWhh8MHusv/YyDef9qaUe2YIgqYN1m5gs+0e
 QF5hrOo7j8Xmt5jUflJ5v2zUcdQXrWAkm1X4PHJxXwZuA8VLOuQpz7fPfi04JrulagS6
 8mJg==
X-Forwarded-Encrypted: i=1;
 AKwUvBySazZrQj54Sfkw2keFwbszTDmoS+982uuRh5QtCHsNy5XXZDBuTsVug51LXRHkUz4lHCPtL3jKog==@lists.freedesktop.org
X-Gm-Message-State: AFuF++kQ/a7meFp39U27T2xmHQcuXzS9S5yNb7s/AXA3tCnO+ve9QUBc
 fJj38mGFX/cNRlkA8gEnmpbbJftVnhcI1pULA7ElgindL3WKPuxdFNhOhGyWvhDLHWOVuYKl5IH
 vSE/kl0DDluV308W8XVEhpY2+ltb2ta8VhLTCmoFD/OXvtR24pigNznJMmV9S229NOy8=
X-Gm-Gg: AYBFou3ZMeGgCYXIwcOtEherx4jUJ4mit2ksi5sZs8Qnu512AfkM1fUyS3YWH9pPRqd
 LZ6YK6AvSoX4tyWEdKdlhwZ1VnWbeIIW7p7PzeMk223Ztd43IG8bL/H6aDNDPJPBEnHod2ZcWIf
 fuzzqyp5GUhZpZ+LGWdbXfYQSpHuy68e9Mnh9IwQDfrSTNakUwFrZ9Epz8W1/exhhPD5reLVkuk
 EeVEpRmOHyvf2UK4h06J1mYGf0LxEtTv94h7Kgy7ch1gJ9lTsFkiZ6ftDu09lurhdak2e+mErw4
 wHLBgeSOOsleQjB5xucKNsEAT39Hv0bSorhkOfKymxRSe3mCDbDqdVZJDxbPRR5nYDIEcOpuWGc
 foYxurebIYrrVNbudWDKS
X-Received: by 2002:a05:6512:3a85:b0:5b6:186e:b79d with SMTP id
 2adb3069b0e04-5b8c194df51mr4033232e87.57.1790055300376; 
 Mon, 21 Sep 2026 22:35:00 -0700 (PDT)
X-Received: by 2002:a05:6512:3a85:b0:5b6:186e:b79d with SMTP id
 2adb3069b0e04-5b8c194df51mr4033212e87.57.1790055299969; 
 Mon, 21 Sep 2026 22:34:59 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b8d46e0966sm191742e87.55.2026.09.21.22.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 22:34:58 -0700 (PDT)
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
Subject: [PATCH v14 07/12] mm/hmm: migrate collection in HMM pagewalk - pmd
 level
Date: Tue, 22 Sep 2026 08:34:16 +0300
Message-ID: <20260922053421.4092027-8-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922053421.4092027-1-mpenttil@redhat.com>
References: <20260922053421.4092027-1-mpenttil@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lLKeYTdk2fqQ1oKzxsK6RUhekl221cJHDhsJ6DgwmZI_1790055300
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

Implement the needed hmm_vma_handle_migrate_prepare_pmd() function
which is mostly carried over from migrate_device.c's
migrate_vma_collect_huge_pmd() function.

With HMM pagewalk based migration, the idea is that
hmm_vma_handle_*() are responsible for faulting,
and the pfn collecting part. hmm_vma_handle_migrate_prepare*()
do the migration decisions (with HMM_PFN_MIGRATE), possibly split
folios, and insert migration ptes/pmds.

HMM pagewalk based migration is enabled in later commit, for now
now hmm_select_migrate() returns 0.

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
 mm/hmm.c | 96 ++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index b3b79d13c797..a1459bd34c04 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -552,8 +552,100 @@ static int hmm_vma_handle_migrate_prepare_pmd(const struct mm_walk *walk,
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
+			r = -ENOENT;  // fallback
+			goto unlock_out;
+		}
+		for (i = 1, start += PAGE_SIZE; start < end; start += PAGE_SIZE, i++)
+			hmm_pfn[i] &= HMM_PFN_INOUT_FLAGS;
+
+	} else {
+		r = -ENOENT;  // fallback
+		goto unlock_out;
+	}
+
+out:
+	return r;
+
+unlock_out:
+	if (folio != fault_folio)
+		folio_unlock(folio);
+	folio_put(folio);
+	goto out;
 }
 
 /*
-- 
2.55.0

