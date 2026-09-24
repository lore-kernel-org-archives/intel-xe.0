Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F72C98314
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 06:54:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048C010F32A;
	Thu, 24 Sep 2026 06:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="csuWkobV";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E4910F334
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 06:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790232855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xEEzUKmwPcuLDb8KHUBfxekosp3Yw5qO1BP0yTFVDsQ=;
 b=csuWkobV7AR0/0ikrVcxv1tIMzYCRSkqqESrCJEmsRoxJ1vunVQys8AsTV58pjQO3TcisE
 7PWhTT4tJmsYsueovM36/Riy7vijN8F+NH+BTtF3QOYLOdvNN4kdR8uk1kZCm4mut/7u3v
 juCzlBSW55JL61VAvjFDnrgeSufmd1s=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-f72uFntWM8eRzRroVyyWBg-1; Thu, 24 Sep 2026 02:54:13 -0400
X-MC-Unique: f72uFntWM8eRzRroVyyWBg-1
X-Mimecast-MFC-AGG-ID: f72uFntWM8eRzRroVyyWBg_1790232852
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-3a58fef21b3so6899331fa.0
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 23:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790232852; x=1790837652;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xEEzUKmwPcuLDb8KHUBfxekosp3Yw5qO1BP0yTFVDsQ=;
 b=DSUo/L7WZL695Qi6BukRBXA2XtdlALpm2B1aygbIlkUAD5WwBsr4N+ZD1KLHqaGItz
 wDdwF0y6rVVPsJUeUwpaNnFdgD0nM+mLNnGfRMP9ICKCzxOU2fjpTcNLqDsgyDpvFPPP
 /Y8cxaQBYCL6R54zvJwzJgS+zaiiNsoptwiU4lcEN0gVDEo9uS+HdE0pNU8Up3SYgC8M
 H5k3wCtFDzmczvzxf/hsZ8ozXMK4R+F34NVltKwmoCmLFDuq7XIxKqrCn0nzZKYswlqk
 E2tkh6ac1nP/i7ZU2wnWxZEHVGiTov7QiKuqBYThtUehh05w8LxzHJJ/3vo2VDaiyCYj
 SICw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwASkSFGvXX2tweBavMZkxe3yxdjeQTguWStEE+kp7YmL0Bwd5UzmlxR4RUYIUOeSLSDQx3bgR+/Q==@lists.freedesktop.org
X-Gm-Message-State: AFuF++lQv3PRjoqopObfJy00sOaU/4HWDySkmLxJ/vtWhZCFgO2C5dz4
 8drvoxeIHd+TkwUoqRtrn0UR/Jj89Wzp3H74bCYQuuC5YobAckgfnNJ9/YC5aKaFk1ypnh18qHB
 c5h286LkV9KTZ1JqApxlbLQo4etRFXIp8YcmT29DoDTMX802xN5mkQgoeyNnh5qlRTlo=
X-Gm-Gg: AYBFou1jmJxvXo8O5Vgbu1Rcn+ieDi2Ew4ewYWDaKeDOtsmQaz7k0t0a1vik5GnV9vW
 GhgxaK151A936mKTVb0DzySdmJGqfJLu8e+W/vVKANo7m+dnfeny4o5M84/w0enfXrS6AbmGHj/
 Obk33Zg1fV//tPA4Fg8Me+rPioJ3NoZvKVgkxWHjKHJdKUJhfwDYpwTGH6O3SVRI4u5//aWsUuj
 xPqi1QmAHo63qkqtd6WHvYv+31NltwRLwBDHBW00wAehqo4k2lfAxW2vdeDD+LNtGpt14ordURV
 e/4hQJ6IQB3xOvi2cZoJuXlqI6KmKNIrEdlPNIQQzlkOnj70PoVbV1EyZOpXKvv6Up0u+OH1ykY
 xNmwCspO7t7J0Tr0w/ej7
X-Received: by 2002:a2e:b893:0:b0:3a2:f233:5c6e with SMTP id
 38308e7fff4ca-3a63bf652b3mr3928341fa.6.1790232852070; 
 Wed, 23 Sep 2026 23:54:12 -0700 (PDT)
X-Received: by 2002:a2e:b893:0:b0:3a2:f233:5c6e with SMTP id
 38308e7fff4ca-3a63bf652b3mr3928141fa.6.1790232851558; 
 Wed, 23 Sep 2026 23:54:11 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a63bf57909sm4803141fa.29.2026.09.23.23.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 23:54:08 -0700 (PDT)
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
Subject: [PATCH v15 11/11] Documentation/mm/hmm: document migration through
 hmm_range_fault()
Date: Thu, 24 Sep 2026 09:53:13 +0300
Message-ID: <20260924065313.899730-12-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924065313.899730-1-mpenttil@redhat.com>
References: <20260924065313.899730-1-mpenttil@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9lgulQYLWge2kUxSpCKtlAZNCeBLeRvJDn6S-Cd7voU_1790232852
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

