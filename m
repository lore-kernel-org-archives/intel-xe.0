Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E1BC98304
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 05:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59DB10E6FA;
	Tue, 22 Sep 2026 05:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZBro32l6";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5765B10EB6D
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 05:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790055323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xEEzUKmwPcuLDb8KHUBfxekosp3Yw5qO1BP0yTFVDsQ=;
 b=ZBro32l6J8poTyz85t25dzrI11PXdnMT8+UNrZf1TgOPxPkporgGMqKXGRkdZ6RdIdySyb
 nyVg0RNUjkSt5aB4tCB2yt9sq6nBETmDjphX4kqRaZI/rX/KeAjJoH1owQTHAiNZA0MPzP
 vrsnevcyRTP4FRCKj0qpwTGXzfsJjbo=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-IqeaThDbOBqkd3vixSV5kA-1; Tue, 22 Sep 2026 01:35:20 -0400
X-MC-Unique: IqeaThDbOBqkd3vixSV5kA-1
X-Mimecast-MFC-AGG-ID: IqeaThDbOBqkd3vixSV5kA_1790055319
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-5b8980a1772so1607795e87.3
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 22:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790055318; x=1790660118;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xEEzUKmwPcuLDb8KHUBfxekosp3Yw5qO1BP0yTFVDsQ=;
 b=SyS1jIKqMLEIqySrEOGp5tDa9hCZIjiwSzSrPR3stFsnP+zwJLPczhttuPQvmupOeS
 UpaPob2sk7JFWgjuI8J1vGIfUWs7Mqo8WzdNpw92+wTLqKwVImMBL2e/MSJpdqEyPJov
 AibE/jo6zN1fIRP+NB994QcxRrpiQ3/haOucPxcaGZIUzoawycczVek3KmSpKDpdQg77
 gtNFIuRb4LS88ZVQU3GNL7snVJoBqgzuT4h5z3KRjLo0DLDJWvl/9mIZokw6zGnDhhOa
 icG84r3+AXEqZMoeD6iygGqWWMhm1GV4D4GxLtK56lvkOSxpw9UvHIHhs4mvJzqj30RX
 DlCg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxc/Q9976TErAorNg9b3EU0S8GbjmxQyg6hfBAtMYFeOBOtsZUXHgMOexLmOMbCdM4kUUKI+xdIsw==@lists.freedesktop.org
X-Gm-Message-State: AFuF++mARLZ2myAxvBk/ilv/VCT+ppkkWXhP6RHtDw3AhAkckH/rjXmf
 zTGXNLxQrVyjFmMB+QOAWRcFQS/jHvb8bqFBoTwZt/Pf/1UaaV6JJh1OpDxKlL+J3nwMo9+RQbJ
 yPxa0LvQ39rk/9WHqWGN8zUup2YE0D5Pzs4kORAR2xMPBuVfiY8kuVZqkFNMR1MFPPj4=
X-Gm-Gg: AYBFou20S03uTTj4C/VeFxfnyASAE9Qku8PbigvOi5aupOQsP5lpc/uQBLgS5/1vQdO
 5B9sYtPNtPqdlKSdRFukoW1b494WUJUS8aQHsqTyJzj4KsJreVYo9OsW8uaW0XgII8hd9Dajq9j
 gT5oGIaNv/9SpAHkAxAyfJpvTZCB4H6DO+vlTGd8SR3Tt0rcQeZdbWOqGNA1qQubSyZ9nq+CoxR
 o38UkEqN7PHgpU6jWgbpa0GIMrNIyKjpSC1rqmJ522Pfwc6ZqMVfseMEeL+mGLW/VbhfuarS2GA
 TOLFxULpJnrsvyrCXLFBAcnyNgJeWbfs3aZWTjqjmrHE2nOHf6y7rUbUXAogRAPQEgn+4SmUPjk
 QdA23MlSVNfQF1RfeDZ6t
X-Received: by 2002:ac2:51c3:0:b0:5b5:e86f:3550 with SMTP id
 2adb3069b0e04-5b8c1833648mr3732744e87.9.1790055318588; 
 Mon, 21 Sep 2026 22:35:18 -0700 (PDT)
X-Received: by 2002:ac2:51c3:0:b0:5b5:e86f:3550 with SMTP id
 2adb3069b0e04-5b8c1833648mr3732729e87.9.1790055318145; 
 Mon, 21 Sep 2026 22:35:18 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b8d46e0966sm191742e87.55.2026.09.21.22.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 22:35:15 -0700 (PDT)
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
Subject: [PATCH v14 12/12] Documentation/mm/hmm: document migration through
 hmm_range_fault()
Date: Tue, 22 Sep 2026 08:34:21 +0300
Message-ID: <20260922053421.4092027-13-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922053421.4092027-1-mpenttil@redhat.com>
References: <20260922053421.4092027-1-mpenttil@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yOXAEnhru2Fyn0WOtX5jQ19JoUM14ux8A9ewwLnUcbc_1790055319
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

