Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785C8C55822
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 04:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3137D10E6CC;
	Tue,  4 Aug 2026 04:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="g8LWdfFI";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1088D10E65D
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 04:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1785817608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NA4GkWrTTacC5SlKbIYSTdyMjm/Le+vBS1p2iRoL4e4=;
 b=g8LWdfFIVQz8pVSe926hI/CKXDSh6WYYmVr5ZvaCRBn3gZV9V5qZXOUvqi/4TAGzo/oKnU
 J5FGSlLl/Erev8Z+6dcfZjNpX1a7fpN/Tx872EjkW4RRiZF26xZzPpxJ9hrs8ZR5U6j/Kv
 1+PNyCVxikeNgVRnQcmyW8tBDFHIW+I=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-vqt0SYzOMdeYjTNtFJoyNA-1; Tue, 04 Aug 2026 00:26:46 -0400
X-MC-Unique: vqt0SYzOMdeYjTNtFJoyNA-1
X-Mimecast-MFC-AGG-ID: vqt0SYzOMdeYjTNtFJoyNA_1785817605
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5aebb33d6b8so2747778e87.0
 for <intel-xe@lists.freedesktop.org>; Mon, 03 Aug 2026 21:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785817605; x=1786422405;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NA4GkWrTTacC5SlKbIYSTdyMjm/Le+vBS1p2iRoL4e4=;
 b=c/uAzUTykSRHrpSl0UCMYKKaL+/uYcSK1b5kwRFgQ2EwAwCc8IbNL4OR2zyAhYBG14
 SPcP/+3M0dmFUortoQpEWJFtz2WW0AviFHMfktz9IwoLwVOfqmMXjSj9QWSLIj4HKa9Y
 hRzoYU+nB9T10XyvOTSkoMbMB7Z4ObhoPXCgstGf8I2RLerT7rBmDxV6xKXwNhNevKgA
 fAU7d9ynWE2/FzP34fPP4toeYbmT9dCVIFBg7gsDn7cMRaZq8orBKrhnIZ8njQstdMoA
 N9uiPE0Ad7qHw8V7FR7mwXo4CB+Gk8ZwrmJm5Dsq8pcCQ++UJqco6/Ngsu3LMygASq9k
 kzBg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpt7j3K97bFom8xJ63tgfxfASJVb3liJaVV7yjlNbw7yIPZtyxOus26kbsdpISfGq82K2xVIg/ZnA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3sJPw/83sD+gwg1PEdAfCLob8f2aBOttKpqr3KGBrXtxMzAgV
 ONI3BhEHfXmwfmzCMPesBzYgSMTcjNTkiqOAXWZPKEv9cZNbqeQRTOiskq6TM2dmo4hrruX8ARN
 /q8nK3tGTXAV5Da+DuzO4P3salSN1S6aum2Dgio1wkgeJWjqrp+xweU0ytGIqPQPEcvc=
X-Gm-Gg: AR+sD13p9p7bUjONmCnB8Li01xsxEBEsBUK1CFdebVG7Q59SPD8AZBi8I4D0vpSFyMP
 UoBGP47TTiRbv928or/Fts5h4w5ACntEzck7cMG7MhgLQz+lesQF19+mBTDyb4dpRU6of8yBgG8
 5B33RH17oZGeltHzJGtwrjnHk1roE95Hm3rUpXqD8t7lrdwSYfX7Ix0rnu78oHEuuDvDs4/cWpR
 ifDKo35phlB0k/MLJ3+4Z4mapKG5/ItldrHlNDS09h1iF7M7QwJaxVHiJk+UYukXbzq01C5ILA5
 wl88WoMdBVzixBsr8SNQ2GjaqXbfOasHXPPVyOXWBX9SFjgS9IAWiL9yRFva7elXRF7klRzFPJS
 9SdsGKOdpCcFdwKzG
X-Received: by 2002:a05:6512:31d4:b0:5b2:ebd0:8d10 with SMTP id
 2adb3069b0e04-5b2ebd08e4bmr1109590e87.42.1785817604857; 
 Mon, 03 Aug 2026 21:26:44 -0700 (PDT)
X-Received: by 2002:a05:6512:31d4:b0:5b2:ebd0:8d10 with SMTP id
 2adb3069b0e04-5b2ebd08e4bmr1109576e87.42.1785817604342; 
 Mon, 03 Aug 2026 21:26:44 -0700 (PDT)
Received: from fedora (85-23-51-1.bb.dnainternet.fi. [85.23.51.1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b2e23c46c4sm2311351e87.17.2026.08.03.21.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 21:26:42 -0700 (PDT)
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
Subject: [PATCH v13 00/11] migrate on fault for device pages
Date: Tue,  4 Aug 2026 07:26:20 +0300
Message-ID: <20260804042631.2175585-1-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MzeErq526w_btiWd1-JKnFVY-FkEze7th2nIitf5Obw_1785817605
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

Currently, the way device page faulting and migration works
is not optimal, if you want to do both fault handling and
migration at once.

Being able to migrate not present pages (or pages mapped with incorrect
permissions, eg. COW) to the GPU requires doing either of the
following sequences:

1. hmm_range_fault() - fault in non-present pages with correct permissions, etc.
2. migrate_vma_*() - migrate the pages

Or:

1. migrate_vma_*() - migrate present pages
2. If non-present pages detected by migrate_vma_*():
   a) call hmm_range_fault() to fault pages in
   b) call migrate_vma_*() again to migrate now present pages

The problem with the first sequence is that you always have to do two
page walks even when most of the time the pages are present or zero page
mappings so the common case takes a performance hit.

The second sequence is better for the common case, but far worse if
pages aren't present because now you have to walk the page tables three
times (once to find the page is not present, once so hmm_range_fault()
can find a non-present page to fault in and once again to setup the
migration). It is also tricky to code correctly. One page table walk
could costs over 1000 cpu cycles on X86-64, which is a significant hit.

We should be able to walk the page table once, faulting
pages in as required and replacing them with migration entries if
requested.

Add a new flag to HMM APIs, HMM_PFN_REQ_MIGRATE,
which tells to prepare for migration also during fault handling.
Also, for the migrate_vma_setup() call paths, a flag, MIGRATE_VMA_FAULT,
is added to tell to add fault handling to migrate.

One extra benefit of migrating with hmm_range_fault() path
is the migrate_vma.vma gets populated, so no need to
retrieve that separataly.

Tested in X86-64 VM with HMM test device, passing the selftests.
For performance, the migrate throughput tests from the selftests
show similar numbers (within error margin) as unmodified kernel.
Tested also rebased on the
"Remove device private pages from physical address space" series:
https://lore.kernel.org/linux-mm/20260130111050.53670-1-jniethe@nvidia.com/
plus a small patch to adjust with no problems.

Changes since v12:
  - fixed Lorenzo's mail address
  - made hmm_pfns_fill() check for PMD size region for hole migration
  - added lazy mmu mode for migrate
  - check pte_present() before flush_cache_page() an folio_mark_dirty()
  - allowed the normal migration path to specify write access (fault)
  - split and refactored the series more. Also reduced ifdeffery in hmm.c
    with static inline functions
  - handled rollback for cases where the page table has been cleared and/or
    replaced with something else like PMD leaf

Revisions:
  - RFC https://lore.kernel.org/linux-mm/20250814072045.3637192-1-mpenttil@redhat.com/
  - v1: https://lore.kernel.org/all/20260114091923.3950465-1-mpenttil@redhat.com/
  - v2: https://lore.kernel.org/all/20260119112502.645059-1-mpenttil@redhat.com/
  - v3: https://lore.kernel.org/all/20260126111939.1332983-2-mpenttil@redhat.com/
  - v4: https://lore.kernel.org/all/20260202112622.2104213-1-mpenttil@redhat.com/
  - v5: https://lore.kernel.org/linux-mm/20260211081301.2940672-1-mpenttil@redhat.com/
  - v6: https://lore.kernel.org/linux-mm/20260316062407.3354636-1-mpenttil@redhat.com/
  - v7: https://lore.kernel.org/linux-mm/20260330115611.347988-1-mpenttil@redhat.com/
  - v8: https://lore.kernel.org/linux-mm/20260414041226.1539439-1-mpenttil@redhat.com/
  - v9: https://lore.kernel.org/linux-mm/20260505051658.2219537-1-mpenttil@redhat.com/
  - v10: https://lore.kernel.org/linux-mm/20260505184421.2324798-1-mpenttil@redhat.com/
  - v11: https://lore.kernel.org/linux-mm/20260525050830.100254-1-mpenttil@redhat.com/
  - v12: https://lore.kernel.org/linux-mm/20260525084524.139868-1-mpenttil@redhat.com/

Cc: David Hildenbrand <david@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Balbir Singh <balbirs@nvidia.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>

Mika Penttilä (11):
  mm/Kconfig: changes for migrate on fault for device pages
  mm: add helper to convert HMM pfn to migrate pfn
  mm/hmm: preparations for HMM to participate in migration
  mm/hmm: do the plumbing for HMM to participate in migration
  mm/hmm: implement folio split for migrate needs in HMM pagewalk
  mm/hmm: migrate collection in HMM pagewalk - pte level
  mm/hmm: migrate collection in HMM pagewalk - pmd level
  mm/hmm: add lazy MMU mode support for migration in HMM pagewalk
  mm/hmm: implement rollback for device page migration in HMM pagewalk
  mm: enable device page migration from HMM pagewalk
  lib/test_hmm: add a new testcase for the migrate on fault

 include/linux/hmm.h                    |  41 +-
 include/linux/migrate.h                |  54 +-
 lib/test_hmm.c                         | 132 +++-
 lib/test_hmm_uapi.h                    |  19 +-
 mm/Kconfig                             |   2 +
 mm/hmm.c                               | 950 +++++++++++++++++++++++--
 mm/migrate_device.c                    | 588 +++------------
 tools/testing/selftests/mm/hmm-tests.c |  54 ++
 8 files changed, 1260 insertions(+), 580 deletions(-)

drm-tip
base-commit: c2d24e2eda55d74743f0d99a98805bf0b596beef
-- 
2.55.0

