Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE81CD5BBF
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 05:08:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887D810E3C6;
	Mon, 25 May 2026 05:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XmLvDBHR";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA3110E3C6
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 05:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779685733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xl5SeCFAdc6WoqyWBYEluyvHLd+oZ4wSvK+mq+H5Z7o=;
 b=XmLvDBHR/zsit6zUuGL6nwEBXiSXEoI9VekizHO+8HgJhHe9n1BzP+j9sRr6j41RulcEnM
 CP/ox932TGvfq1yO4NxqnKUBu2KbiA6iLgUmms6TwWVrhLn35V/63HFolYhdmq2sEiMBle
 XYefYvcbcv6vUxa73j0w7Cy9RkFvvf0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-Lo4-uVWoN9SQ130YsAOMug-1; Mon, 25 May 2026 01:08:51 -0400
X-MC-Unique: Lo4-uVWoN9SQ130YsAOMug-1
X-Mimecast-MFC-AGG-ID: Lo4-uVWoN9SQ130YsAOMug_1779685730
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-38eeb467db3so35502171fa.0
 for <intel-xe@lists.freedesktop.org>; Sun, 24 May 2026 22:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779685730; x=1780290530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Xl5SeCFAdc6WoqyWBYEluyvHLd+oZ4wSvK+mq+H5Z7o=;
 b=c7N8gIhF+53hLPRAbNCGN3Zd5VdRU1hc4BQL14jM1qi4pE/XbXBQejTPbdysDbApzZ
 e9dq0rpcdOhqccTA+PLXbMBWz30GVRYmNH37acCWq6Neznhc2NDFiiCW6hoSRrfd+mmx
 0tvjXb51Wsd3Q4eWrW1eU1eahrQTGE6ZAkGGRL7/zkw/bLWbVJ6KlN8p7c9Qn8xnZCqt
 9qkcAfTRTSqBYlmtpvnMLcHXfaLy/jvZZ/vfVtHDAvi3ciyzX7ui1nOdmliGo7cfkP/Z
 8gTNWD67zv0DT73b4OYadUcL0nBnjdX9Iv8WpOKbez+9QaiQNfIZopB9chTzdYBVJbkI
 kkkA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9e30hLoO0XCgqICc5ck5V9k/O0tGHTJBbg060es1hohbp/uaWmLf/0NA2HhIsJbGUeSifqa5ZNCw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2BV8xXseMcEiUHdiLWR5TpOnSBlr3K+iNAr1Cu5WfYQSBdWsq
 nTDRaDH02vkl3JnvHwYWl46eK4mZLCsVqDmmsomWBkBfQwxjvPGoHz5xOj8Mv1hpTGcz1zntzd9
 1A/ntHFfBvkrgpLdMwxlx0mFoNQLM07ztZsR3aJvFhV0wJdSR4c8RMijtq/9gTVgEKmE=
X-Gm-Gg: Acq92OEnXJ14SEqKuyK2c+yQvtKT6n0dgfbi5xArHjMGBS+aPGXEftA/fgj7bDC1ztM
 x8n5wn/a1npV8T3Ln65+LJ/4QKVWr7c6pJITY0NTmgxrfz2vcnrh6y6P3+xXG0IQrKQgPi66jIM
 WQx7Y2SE0D2Qzgcrrly0iHNfOPsqnU9rRKm5tfBWHVVCoC6B/MB6eQXgDYWZQ1HfOLg8XfnOrkV
 uNHoqgeL3givBfT24FxLTjsBSktugOHCmSHgdAHFB1as6tQp7nu0QwflFyBdQGhKmFurIUfjKQX
 zZW8Jm4qg05sD7cSMce0RgAPDdeaJ8V3aE7SBUR12eMcHO+PGnTpKmnVvBWHvtNd2fzCwA7xl1q
 DlhJzSCEfwhxc7DL3laCP3gOMAzMntVa/Kv1K
X-Received: by 2002:a2e:bd06:0:b0:38e:a00e:2bb5 with SMTP id
 38308e7fff4ca-395d8d1d1e5mr38101331fa.19.1779685729721; 
 Sun, 24 May 2026 22:08:49 -0700 (PDT)
X-Received: by 2002:a2e:bd06:0:b0:38e:a00e:2bb5 with SMTP id
 38308e7fff4ca-395d8d1d1e5mr38101271fa.19.1779685729251; 
 Sun, 24 May 2026 22:08:49 -0700 (PDT)
Received: from fedora (85-23-51-1.bb.dnainternet.fi. [85.23.51.1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-395dca7bcddsm20698161fa.16.2026.05.24.22.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2026 22:08:48 -0700 (PDT)
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
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Subject: [PATCH v11 1/5] mm/Kconfig: changes for migrate on fault for device
 pages
Date: Mon, 25 May 2026 08:08:26 +0300
Message-ID: <20260525050830.100254-2-mpenttil@redhat.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20260525050830.100254-1-mpenttil@redhat.com>
References: <20260525050830.100254-1-mpenttil@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K9l4tLpVWStGj4inAepPzxRQqn_7thyZFzjFaKxW66U_1779685730
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

HMM depends on MMU notifiers. With the unified HMM/migrate_device
page table walk migrate_device needs HMM enabled.
Enable them explicitly to avoid breaking random configs.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index e8bf1e9e6ad9..0d8db75ffc23 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -646,6 +646,7 @@ config MIGRATION
 
 config DEVICE_MIGRATION
 	def_bool MIGRATION && ZONE_DEVICE
+	select HMM_MIRROR
 
 config ARCH_ENABLE_HUGEPAGE_MIGRATION
 	bool
@@ -1221,6 +1222,7 @@ config ZONE_DEVICE
 config HMM_MIRROR
 	bool
 	depends on MMU
+	select MMU_NOTIFIER
 
 config GET_FREE_REGION
 	bool
-- 
2.50.0

