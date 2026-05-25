Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA64BCD5BD2
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 08:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B6710E5FB;
	Mon, 25 May 2026 08:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OAoZvNWg";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846E610E5FB
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 08:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779698747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xl5SeCFAdc6WoqyWBYEluyvHLd+oZ4wSvK+mq+H5Z7o=;
 b=OAoZvNWgwZXIthU3YhT+TGsY82owpOJfHHPJdpIjzEXiOMDikXD2wHtMoqZDzVGLgEommI
 HdvUre6R8DWaF1/FWDNhMhAU2RlCN8a+/99EEDomRX3KUqlurAWot9K2KqjoZzq2MI2U7+
 OHORL2812JxdyJkHi4Mdw18Dg3Cgltc=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-lqUwkRH6OfWAd1AA9sPKcA-1; Mon, 25 May 2026 04:45:45 -0400
X-MC-Unique: lqUwkRH6OfWAd1AA9sPKcA-1
X-Mimecast-MFC-AGG-ID: lqUwkRH6OfWAd1AA9sPKcA_1779698744
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-3952f7eb1e6so44378141fa.0
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 01:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779698744; x=1780303544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Xl5SeCFAdc6WoqyWBYEluyvHLd+oZ4wSvK+mq+H5Z7o=;
 b=stl245Rs15c5sFQLvkFsHiovc5qfC201UDzocz2TRivW8j5nOMZY+8OLawb7Atch8A
 3tOrOT23HpvVWUQHgJqpdLpHVKNzTl2HCMThHEehDfhnJW89bn+gaFETO5TQKXaPeWbR
 pgJ/R8eg8GQXyfb1RRbvdGYb98uUZnvZBYb0iY4EK1mj70JxDWOaprAwX5/o86DWTsuq
 YZOvUQIMvaaeuEs9K/4wrU1I6mrP7mDowE+/9JRB4NotfLpcIFhlFtVFIiZ2TMYtDKq2
 Upx1+dmTqPuSVxKhKVZPEe30S6CAIy3SusAWUtKj3LBuoFSGKx2wQTg9Q/TPNIwGYArN
 7KrA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9t6jxkvAYS6MLnus3rQbqNIQyihXLiycly2ZZHazZEC6Z6scZ4npZaZVuB7beoOtrGALLNDD0bmA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5e9XJLb0HhlLWirmg9ERkoGkcNJRRzOiDklX1/aTaLYHEhUqM
 42ZA/Tk0SayDwM/sPUfcov1GTNitqdyxlJA99TV9gEJ7B6fhRf02paLz4w6vRiWBReV4dKEp4Qz
 PgNqyqVP00UzxCqOM7SrxTSwxlzjzaovx3qvTFRfWwgTKCTHi+5RF1qhfPiZyMnD6iaQ=
X-Gm-Gg: Acq92OFTPs9aNZSPvek2MemVd3H43PEsqR+Hq6OrN+sA+kBOr1Oj/JYCvwh4yBHNCvb
 o6qEuecN7vSi6+Q0It63hUQtQN8f5lHsWBK1EvbZraRUZOzOjPNN6GQgKr94NvD6b7DlKnfamo+
 4HClH0miWPPB/tF/T9lP+zP2viF11MixoGNgtG8kbLl27NQjMHfZuWUAfwxEfoCt9avc2lI1kUQ
 oafymhOmgGJbRJv2220nLNrx+TfBr/66gq9S7bI+wfmujeCvrA46cXvg7XE8oPjh1FaWR4D3zBD
 +of5sYuNlX+0fuGG9XAvSOjIgGp/FuF88QiyGfPudIDM5kODrxvihYBgxz7hKrkC522SrUdjPlz
 mc+XpLchZAcxJQZApID0F0+r6Pm/4mqrdOre0
X-Received: by 2002:a2e:93c9:0:b0:38e:4810:4f36 with SMTP id
 38308e7fff4ca-395d8c93098mr29703721fa.9.1779698744240; 
 Mon, 25 May 2026 01:45:44 -0700 (PDT)
X-Received: by 2002:a2e:93c9:0:b0:38e:4810:4f36 with SMTP id
 38308e7fff4ca-395d8c93098mr29703571fa.9.1779698743730; 
 Mon, 25 May 2026 01:45:43 -0700 (PDT)
Received: from fedora (85-23-51-1.bb.dnainternet.fi. [85.23.51.1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-395dca7bcddsm21679061fa.16.2026.05.25.01.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 01:45:43 -0700 (PDT)
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
Subject: [PATCH v12 1/5] mm/Kconfig: changes for migrate on fault for device
 pages
Date: Mon, 25 May 2026 11:45:20 +0300
Message-ID: <20260525084524.139868-2-mpenttil@redhat.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20260525084524.139868-1-mpenttil@redhat.com>
References: <20260525084524.139868-1-mpenttil@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b4NXZFp5LVUWt8Nr0Y297MeiFAT3CsGtiKPpeF70KRM_1779698744
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

