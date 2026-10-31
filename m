Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E6A606A32E
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 12:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hPXcceYC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F1110EDAD;
	Mon,  2 Nov 2026 12:42:14 +0000 (UTC)
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D0D10E24E
 for <intel-xe@lists.freedesktop.org>; Sat, 31 Oct 2026 05:11:56 +0000 (UTC)
Received: by mail-pj2-f2.google.com with SMTP id
 d9443c01a7336-2e651c30dcbso6955605ad.0
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 22:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793423515; x=1794028315; darn=lists.freedesktop.org;
 h=mime-version:content-transfer-encoding:content-type:subject
 :message-id:date:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=/Im04bCfxuC5NnQopVhNmYOL00IemUlIAdwN2EaZ0DE=;
 b=hPXcceYCcAvGxqW/bRNzqB0Adho4QbsrLkFLs89jwV/ffmCeHEU/8cJKYkiqq/T1+b
 aI1ZtYBQaMgeEhK4isR72K9oco3L/1w7dYTWaGjeVsWa01ZU7D1ahgQB8eUG7SjjXOHT
 zHAP4X0aweGC82A7iaKsKwsUOXpAyq/bajCAkLST2YlnIM/Z95tgtoElZK/Trl5mFt7g
 AhTwDsRHY3ztQjlyMPKyGE9Ppkza502F1IM+s0FmogcORDn6P2gqjr/h2eRSwF2jkjuZ
 pNhWhvEgu5KxwV4U6Tr2KcNul2QDGK0+rLW8IKl6KIqJ6D7Gl9FnY4u5tJa/+mpLXRpt
 i9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793423515; x=1794028315;
 h=mime-version:content-transfer-encoding:content-type:subject
 :message-id:date:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=/Im04bCfxuC5NnQopVhNmYOL00IemUlIAdwN2EaZ0DE=;
 b=rgI94DZ03si7PhW+ELtuu833+dXNdZix+/vG1B/HaXq3MlQJmlQVDoGhPqrsoPQfPv
 IdfA4Wc7mnBfxEN+TqfvA9eJ6TD1+xZWsyvUO91IvNJebALLYohEjPUOUY0cnBYHrsdc
 OwDmDL3hyMuWAnqyP21Hg6TeG5IrPPqk+hpgFX07bEkD2aahUB7nZl1XgkFjSu4FCgCG
 EvPgUuFjmIq5qlftW7Ia/IVXhE0XnlGc4h2TyzWJ5jU51CqzdmfGm12hP2izgfclYHba
 TJv0E4jGYqyes3zYG1ZdlCL4qN1wrQ+oqvYk3pkQJZlKAuC5oZwanXjY/dA6g1sXVXjY
 h8lQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBz+rRqYVj+pGRr4aawY7ywDoz9rPHf9Nw08Frjo2uBTcfWFVRXDfU/dTrcLVLbApSNLUy8uyjvsrA==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKFjkDm4OD9HdY9VP+qGM7umnQmWE1qxIw5gujAKazbbIa8qcs4
 JMeplT28CC5MxKVUIxCWsPdawmbOieqBNSqXusJXZ2d098TqM53X1/m8
X-Gm-Gg: AYBFou1s0CgJiyX1OhR6LIyHre7Xm2sa9uW08p+uhhBfWvotN9xmxojb1TCcwbDuiri
 fzGjHcIv5XaZ+KRbtJ15EWjzzS04iwzDYyRx9gRS2LL4q02W8JyiOW+gzjoQWfrDlX7/txMeqbx
 8jTKP5Sh4B01LLRiKAsEt/A8db+JzwQXaHRJmBFNrso9W2ceRfkhplJhizdUPTXi9q1pBMPnSjg
 aXPwgyz3bEXXoil4ZptcBxpbyC9+JCT+mKWRt1g1bKv2eqAh1UWhbOaYKRZV1ZDivBbMM8Hok8C
 U/aBUtDYYgvcgG3UwmHAv596nU63xUc+bmYd74geQVXtVIO4aQOPaSLhBEX9M+8Nr6/N7dePqUl
 DaXatUjxbwEtBpIm0uy9Ixx6mgaNI2ImHY/yMF3XN44K7c80RDmC7BeVmGAEbvgvSzApl+D4sRD
 /F9/ye7wXQs1W57EPN/xI2CnKvLZrRt2delzQ5cXO+BRpGsjCuDLMsuyuE7slfzTayH86myiE87
 ZdWTCVumja8ib/3HgGgOkPYvedfsBFMwa4UpDqPHABdraJVA6FokIHNkAHo2wfxKKP7QPUA06VH
 90dsVWyHRi4i5Pe7sKOi591XpAmexVKO0MiBJuLeXGVaBRnyw0uVfDhA7tegwjnml/MCF/1/LlQ
 rJLhxXrHq3dkwFgO6+4r7jTuYrHrBSjtY
X-Received: by 2002:a17:903:1ae8:b0:2e9:7e90:8a3 with SMTP id
 d9443c01a7336-2eb364de7c6mr42312675ad.39.1793423515453; 
 Fri, 30 Oct 2026 22:11:55 -0700 (PDT)
Received: from [10.208.43.86] (n106-71-19-159.sun21.vic.optusnet.com.au.
 [106.71.19.159]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2eb39052bcbsm12905375ad.10.2026.10.30.22.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 22:11:55 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: jgg@nvidia.com, leonro@nvidia.com, akpm@linux-foundation.org
Cc: airlied@gmail.com, apopple@nvidia.com, balbirs@nvidia.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 jgg@ziepe.ca, leon@kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Brost <matthew.brost@intel.com>, mm-commits@vger.kernel.org,
 mpenttil@redhat.com, Patchwork <patchwork@emeril.freedesktop.org>,
 SeongJae Park <sj@kernel.org>, thomas.hellstrom@linux.intel.com,
 Vlastimil Babka <vbabka@suse.cz>, ziy@nvidia.com
Date: Sat, 31 Oct 2026 15:07:58 +1100
Message-ID: <179342234355.4.16705453209886955762@gmail.com>
Subject: [PATCH] mm/hmm: account for subpage offsets in device-private PMDs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Nov 2026 12:42:13 +0000
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When a query starts inside a device-private PMD owned by
range->dev_private_owner, hmm_vma_handle_absent_pmd() still fills the PFN
array from the folio's first page. The returned PFNs therefore refer to
earlier pages rather than the requested subrange.

Add the query's PMD-relative page offset to the initial PFN, as the
present PMD path already does.

Fixes: 10b9feee2d0d ("mm/hmm: populate PFNs from PMD swap entry")
Signed-off-by: Aveline Noir <jm5905938@gmail.com>

---
Found during a synthetic test_hmm check of device-private THP handling.
Tested PMD-aligned and non-aligned subranges, PMD boundaries, split
PTEs and fake-device data accesses with test_hmm in QEMU TCG; all
executed tests passed with the fix. No real GPU testing was performed.
---
 mm/hmm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 2f1e98c6b644..e89f140d3e5c 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -355,7 +355,8 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 	    range->dev_private_owner) {
 		unsigned long cpu_flags = HMM_PFN_VALID |
 			hmm_pfn_flags_order(PMD_SHIFT - PAGE_SHIFT);
-		unsigned long pfn = softleaf_to_pfn(entry);
+		unsigned long pfn = softleaf_to_pfn(entry) +
+			((start & ~PMD_MASK) >> PAGE_SHIFT);
 		unsigned long i;
 
 		if (softleaf_is_device_private_write(entry))

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0

